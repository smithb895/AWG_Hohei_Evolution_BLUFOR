//by psycho
#include "setup.sqf"
private ["_grp", "_lead", "_leader", "_svec", "_isFlat"];
_officer_position = _this select 0;
_grp = [EVO_enemy_side] call EVO_createGroup;
_enemy_list = [];

_lead = EVO_e_leader select (round random (count EVO_e_leader - 1));
for "_i" from 0 to 6 do {
	_lucky_one = EVO_e_specops select (round random (count EVO_e_specops - 1));
	_enemy_list set [count _enemy_list, _lucky_one];
};
_leader = _grp createUnit [_lead, _officer_position, [], 20,"NONE"];
_grp selectLeader _leader;
__addDead(_leader)

{
	_one_unit = _grp createUnit [_x, _officer_position, [], 20,"NONE"];
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

[_grp, _officer_position] spawn EVO_taskDefend;