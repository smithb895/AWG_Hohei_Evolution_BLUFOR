//by psycho
#include "setup.sqf"
private ["_road","_paras","_pos","_enemy_list","_truck"];
_current_target = EVO_all_possible_towns select __XJIPGetVar(current_target_index);
_current_target_pos = _current_target select 0;
_current_target_radius = _current_target select 2;

_pos = [(0 + random 10),(0 + random 10),0];
_paras = [EVO_enemy_side] call EVO_createGroup;
_enemy_list = [];
_lead = EVO_e_leader call XfRandomArrayVal;
_unit = EVO_e_transport call XfRandomArrayVal;
_num = 0;

_space = _unit call PsyfCargoSeats;

for "_i" from 1 to _space do {
	_lucky_one = EVO_e_soldiers call XfRandomArrayVal;
	_enemy_list set [count _enemy_list, _lucky_one];
};
_leader = _paras createUnit [_lead, _pos, [], 20,"NONE"];
_paras selectLeader _leader;
(leader _paras) setRank "SERGEANT";
(leader _paras) setUnitAbility 1.0;
__addDead(_leader)

while {_num == 0} do {
	_point = [_current_target_pos, 1000] call XfGetRanPointCircleOuter;
	_list = _point nearRoads 100;
	_num = count _list;
	if (_num > 0) exitWith {_road = position (_list select 0)};
	__sleep;
};
_dir = [_road, _current_target_pos] call XfDirTo;
_truck = createVehicle [_unit, _road, [], 0, "NONE"];
_truck setDir _dir;
__addDead(_truck)
__sleep;

_leader MoveInDriver _truck;
_leader assignAsDriver _truck;
{
	_one_unit = _paras createUnit [_x, _pos, [], 20,"NONE"];__sleep;
	_one_unit MoveInCargo _truck;
	_one_unit assignAsCargo _truck;
	__aiSetVar(_one_unit) ["BIS_noCoreConversations", true];
	__setEvoSkill(_one_unit);
	__addDead(_one_unit)
} foreach _enemy_list;

_wp_pos = [_current_target_pos, 200] call XfGetRanPointCircleOuter;
_wp = _paras addWayPoint [_wp_pos,100];
[_paras, 1] setWaypointType "GETOUT";

waitUntil {((_truck distance _current_target_pos) < (random _current_target_radius)) || !canMove _truck || !alive _truck || !alive (driver _truck)};

sleep 5;
_pos = position _truck;
[_paras,_pos,[_current_target_pos,_current_target_radius]] call XMakePatrolWPX;
{_x setBehaviour "AWARE"} forEach (units _paras);
_truck call EVO_Lock;