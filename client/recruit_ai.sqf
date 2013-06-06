//by psycho
#include "setup.sqf"
private ["_p"];
_type = _this select 0;
_player = player;
_grp = group _player;
_pos = position player;

_paraclass = EVO_own_side call XfGetParachuteSide;
_unit = _grp createUnit [_type, [0,0,0], [], 0, "NONE"]; __sleep;
_unit setskill (EVO_PlayerSkill - 0.05);
__addDead(_unit);
__aiSetVar(_unit) ["BIS_noCoreConversations", true];
//if (E_spawn == 1) then {[_unit] execVM "common\bon_ais\init_ais.sqf"};

#ifndef __A2__
_unit addMPEventHandler ["MPkilled",{if (isServer) then {_this call checkTK}}];
#else
_unit addEventHandler ["killed", {["checkTK", _this] call XNetCallEvent}];
#endif

_dist = [Evo_Baseflag_MHQ, _player] call BIS_fnc_distance2D;

if (_dist > 300) then {
	_vec = createVehicle [_paraclass, _pos, [], 20, 'NONE'];
	_vec setpos [_pos select 0,_pos select 1,(_pos select 2)+ 100];
	_unit MoveInDriver _vec;
} else {
	_unit setpos getMarkerPos "base";
};
[_unit] joinSilent _grp;
if (!isPlayer (leader _grp)) then {
	hint format ["leader is %1",leader _grp];
	_grp selectLeader _player;
};

disableSerialization;
_dialog = findDisplay 69000;
_accgroup = _dialog displayCtrl 69009;
_grpzise = (count units _grp) - 1;	//-1 player self
_accgroup ctrlSetText str (_grpzise);

WaitUntil {vehicle _unit == _unit};
_vecprotect = [_unit] execVM "server\ai_vec_check.sqf";
_lone = [_unit] execVM "server\destroy_pgroup.sqf";