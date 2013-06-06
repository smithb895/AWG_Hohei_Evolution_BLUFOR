#include "setup.sqf"
private ["_startLocation","_uh60p","_vec","_obj_jump","_jump_helo"];

_startLocation = _this select 0;
#ifdef __BLUE__
switch (true) do {
	case (__Takistan) : {_jump_helo = "MH6J_EP1"};
	case (__Chernarus) : {_jump_helo = "UH1Y"};
};
#else
switch (true) do {
	case (__Takistan) : {_jump_helo = "UH1H_TK_EP1"};
	case (__Chernarus) : {_jump_helo = "Mi17_rockets_RU"};
};
#endif

titleText ["","Plain"];
_uh60p = createVehicle [_jump_helo, _startLocation, [], 0, "FLY"];
_uh60p setpos [_startLocation select 0,_startLocation select 1, 2000];
_uh60p engineon true;
player moveincargo _uh60p;
_obj_jump = player;
if (vehicle player == player) exitWith {};

_obj_jump setvelocity [0,0,0];
#ifndef __ACE__
_obj_jump action ["EJECT",vehicle _obj_jump];
if (vehicle _obj_jump isKindOf "ParachuteBase") then {
	_vec = vehicle _obj_jump;
	_obj_jump action["EJECT",vehicle _obj_jump];
	deleteVehicle _vec;
};
disableUserInput false;
[player, player call XfGetHeight] spawn bis_fnc_halo;
#else
[_uh60p, player] execVM "x\ace\addons\sys_eject\jumpout.sqf";
#endif
_accdist = viewDistance;
if (viewDistance < 3000) then {setViewDistance 3000};

sleep 5;
deleteVehicle _uh60p;

waituntil {((position vehicle player select 2) < 2) || !alive player};
setViewDistance _accdist;