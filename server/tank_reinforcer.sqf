//by psycho
#include "setup.sqf"
private ["_road"];
_current_target = EVO_all_possible_towns select __XJIPGetVar(current_target_index);
_current_target_pos = _current_target select 0;
_current_target_radius = _current_target select 2;
_num = 0;

//random vehicle type -- give a 1:2 chance for a heavy armored vec
_type = [EVO_e_wheeled,EVO_e_tracked,EVO_e_wheeled] call XfRandomArrayVal;

_tracked_grp = [EVO_enemy_side] call EVO_createGroup;
_unit = _type call XfRandomArrayVal;
while {_num == 0} do {
	_point = [_current_target_pos, 1000] call XfGetRanPointCircleOuter;
	_list = _point nearRoads 100;
	_num = count _list;
	if (_num > 0) exitWith {_road = position (_list select 0)};
	__sleep;
};
_dir = [_road, _current_target_pos] call XfDirTo;
_vec = [_road,_dir,_unit,_tracked_grp] call EVO_spawn_vehicle;
_point2 = [_current_target_pos, _current_target_radius+200] call XfGetRanPointCircle;

[_tracked_grp,_point2,[_current_target_pos,_current_target_radius+200]] call XMakePatrolWPX;
(_vec select 0) addEventHandler ["killed",{["enemy_mobile_presence_num",[-1]] call XNetCallEvent}];
["enemy_mobile_presence_num",[1]] call XNetCallEvent;