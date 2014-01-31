//by psycho
#include "setup.sqf"
_current_target = EVO_all_possible_towns select __XJIPGetVar(current_target_index);
_current_target_pos = _current_target select 0;
_current_target_radius = _current_target select 2;

_pilot = [EVO_enemy_side] call EVO_createGroup;
_unit = EVO_e_transporthelis call XfRandomArrayVal;
_point = [_current_target_pos, 1500] call XfGetRanPointCircleOuter;
_dir = [_point, _current_target_pos] call XfDirTo;
_vec = [_point,_dir,_unit,_pilot] call EVO_spawn_vehicle;
__sleep;
_heli = _vec select 0;
_crew = crew _heli;
[_heli, 200] call XfSetHeight;
[_heli] execVM "server\amarker.sqf";
[_vec select 2] execVM "server\flightroute.sqf";
__sleep;
_heli flyInHeight 120;

waitUntil {((_heli distance _current_target_pos) < (random _current_target_radius)) || !canMove _heli || !alive _heli};
if (!canMove _heli) exitWith {
	sleep 90;
	{_x setDamage 1} forEach _crew;
	_heli setDamage 1;
};
if (!alive _heli) exitWith {sleep 90; {if (!isNull _x) then {_x setDamage 1}} forEach _crew;};

_pos = position _heli;
_paras = [EVO_enemy_side] call EVO_createGroup;
_enemy_list = [];
_space = _unit call PsyfCargoSeats;

_paraclass = EVO_enemy_side call XfGetParachuteSide;
_lead = EVO_e_leader call XfRandomArrayVal;
for "_i" from 1 to _space do {
	_lucky_one = EVO_e_pjtroops call XfRandomArrayVal;
	_enemy_list set [count _enemy_list, _lucky_one];
};
_leader = _paras createUnit [_lead, _pos, [], 20,"NONE"];
_paras selectLeader _leader;
_parach = createVehicle [_paraclass, _pos, [], 20, "NONE"];
_parach setPos [_pos select 0,_pos select 1,(_pos select 2)- 12];
_parach setDir random 360;
_leader MoveInDriver _parach;
__addDead(_leader)
{
	_pos = position _heli;
	_one_unit = _paras createUnit [_x, _pos, [], 20,"NONE"];
	_parach = createVehicle [_paraclass, _pos, [], 20, "NONE"];
	_parach setPos [_pos select 0,_pos select 1,(_pos select 2)- 12];
	_parach setDir random 360;
	_one_unit MoveInDriver _parach;
	__aiSetVar(_one_unit) ["BIS_noCoreConversations", true];
	__setEvoSkill(_one_unit);
	__addDead(_one_unit)
	sleep 0.7;
} foreach _enemy_list;

(leader _paras) setRank "SERGEANT";
(leader _paras) setUnitAbility 1.0;
[_paras,_pos,[_current_target_pos,_current_target_radius]] call XMakePatrolWPX;
{_x setBehaviour "COMBAT"} forEach (units _paras);

sleep 60;
{if (!isNull _x) then {_x setDamage 1}} forEach _crew;
if (!isNull _heli) then {_heli setDamage 0.8; sleep 8; _heli setDamage 1;};