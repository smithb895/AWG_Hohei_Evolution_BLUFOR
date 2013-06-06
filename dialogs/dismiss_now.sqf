//by psycho
#include "setup.sqf"
private ["_ranknum","_grpzise","_accgroup"];
disableSerialization;
_dialog = findDisplay 69000;
_description = _dialog displayCtrl 69006;
_accgroup = _dialog displayCtrl 69009;


if (player != leader group player) exitWith {
	_description ctrlSetText localize "STR_d_nolead";
};

_grp = group player;
_grpzise = (count units _grp) - 1;	//-1 player self
if (_grpzise <= 0) exitWith {_description ctrlSetText localize "STR_d_nomembers"};

{
	if ((_x != leader _grp) and !(isPlayer _x)) then {
		if (_x != vehicle _x) then {moveOut vehicle _x};
		[_x] joinSilent grpNull;
		_x setDamage 1;
		deleteVehicle _x;
	};
	if ((_x != leader _grp) and (isPlayer _x)) then {[_x] joinSilent grpNull};
	__sleep
} forEach units _grp;

_grpzise = (count units _grp) - 1;
_accgroup ctrlSetText str (_grpzise);
(localize "STR_i_ai_dimissed") call XfGlobalChat;