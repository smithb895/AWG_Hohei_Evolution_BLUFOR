//by psycho
// create at mines along the road
#include "setup.sqf"
if (!isServer) exitWith {};
private ["_road","_current_target_pos","_current_target_radius","_mine_array","_soldier","_dummy","_num2"];

_current_target = EVO_all_possible_towns select __XJIPGetVar(current_target_index);
_current_target_pos = _current_target select 0;
_current_target_radius = _current_target select 2;
_num2 = (round random 3) + 1;

_soldier =
#ifdef __Takistan__
if __isBlue then {"TK_Soldier_EP1"} else {"US_Soldier_EP1"};
#else
if __isBlue then {"RU_Soldier"} else {"USMC_Soldier"};
#endif

_grp = [EVO_enemy_side] call EVO_createGroup;
_dummy = _grp createUnit [_soldier, _current_target_pos, [], 20,"NONE"];
__sleep;
removeAllWeapons _dummy;
for "_i" from 0 to 5 do {_dummy addMagazine "Mine"};
__addDead(_dummy);

for "j" from 1 to _num2 do {
	_num = 0;
	while {_num == 0} do {
		_point = [_current_target_pos, _current_target_radius + (random 100)] call XfGetRanPointCircleOuter;
		_list = _point nearRoads 100;
		_num = count _list;
		if (_num > 0) exitWith {_road = position (_list select 0)};
		__sleep;
	};
	_dummy setPos _road;
	__sleep;
	_dummy Fire ["MineMuzzle","MineMuzzle","Mine"];
	//(createMarker [str round random 999999,position _dummy]) setMarkerType "dot";	//debug
	sleep 6;
	if (!alive _dummy) exitWith {};
};

_dummy setDammage 1;
deleteVehicle _dummy;