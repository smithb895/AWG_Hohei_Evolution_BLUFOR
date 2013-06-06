//by psycho
#include "setup.sqf"
private ["_point", "_grp", "_lead", "_leader", "_svec", "_isFlat", "_center"];
_current_target_pos = _this select 0;
_current_target_radius = _this select 2;
EVO_all_mobiles = 0;

//inf squads
for "_e" from 1 to (EVO_Infantry select 0) do {
	_point = [_current_target_pos, _current_target_radius] call XfGetRanPointCircle;
	_grp = [EVO_enemy_side] call EVO_createGroup;
	_enemy_list = [];

	_lead = EVO_e_leader call XfRandomArrayVal;
	for "_i" from 0 to 6 do {
		_lucky_one = EVO_e_soldiers call XfRandomArrayVal;
		_enemy_list set [count _enemy_list, _lucky_one];
	};
	_leader = _grp createUnit [_lead, _point, [], 20,"NONE"];
	_grp selectLeader _leader;
	__addDead(_leader)

	{
		_one_unit = _grp createUnit [_x, _point, [], 20,"NONE"];
		_svec = sizeOf _x;
		_isFlat = (position _one_unit) isFlatEmpty [_svec / 2, 150, 0.7, _svec, 0, false, _one_unit];
		if (count _isFlat > 1) then {
			_isFlat set [2,0];
			if (_one_unit distance _isFlat < 50) then {
				_one_unit setPos _isFlat;
			};
		};
		__aiSetVar(_one_unit) ["BIS_noCoreConversations", true];
		__setEvoSkill(_one_unit);
		__addDead(_one_unit)
	} foreach _enemy_list;
	(leader _grp) setRank "SERGEANT";
	(leader _grp) setUnitAbility 1.0;

	[_grp,_point,[_current_target_pos,_current_target_radius]] call XMakePatrolWPX;
};

_num = round ((EVO_Mechanized select 0) / 2);
//wheeled
for "_o" from 0 to _num do {
	_mobile_grp = [EVO_enemy_side] call EVO_createGroup;
	_unit = EVO_e_wheeled call XfRandomArrayVal;
	_point = [_current_target_pos, _current_target_radius] call XfGetRanPointCircle;
	_vec = [_point,random 359,_unit,_mobile_grp] call EVO_spawn_vehicle;
	[_mobile_grp,_point,[_current_target_pos,_current_target_radius]] call XMakePatrolWPX;
	(_vec select 0) addEventHandler ["killed",{["enemy_mobile_presence_num",[-1]] call XNetCallEvent}];
	["enemy_mobile_presence_num",[1]] call XNetCallEvent;
};

//tracked
for "_u" from 0 to _num do {
	_tracked_grp = [EVO_enemy_side] call EVO_createGroup;
	_unit = EVO_e_tracked call XfRandomArrayVal;
	_point = [_current_target_pos, _current_target_radius+200] call XfGetRanPointCircle;
	_vec = [_point,random 359,_unit,_tracked_grp] call EVO_spawn_vehicle;
	[_tracked_grp,_point,[_current_target_pos,_current_target_radius+200]] call XMakePatrolWPX;
	(_vec select 0) addEventHandler ["killed",{["enemy_mobile_presence_num",[-1]] call XNetCallEvent}];
	["enemy_mobile_presence_num",[1]] call XNetCallEvent;
};

//statics
for "_a" from 0 to 1 do {
	_static_grp = [EVO_enemy_side] call EVO_createGroup;
	_unit = EVO_e_static call XfRandomArrayVal;
	_point = [_current_target_pos, _current_target_radius] call XfGetRanPointCircle;
	_vec = [_point,random 359,_unit,_static_grp] call EVO_spawn_vehicle;
	//['st_' + str( random 9999999),  position (_vec select 0), 'ELLIPSE', "colorblack", [10,10], "", 0, '', 'Solid', 0.3] call XfCreateMarkerGlobal;
	#ifndef __A2__
	(_vec select 0) addEventHandler ["getOut",{if ((_this select 0) call XfGetVehicleEmpty) then {(_this select 0) setDammage 1}}];
	#endif
};
