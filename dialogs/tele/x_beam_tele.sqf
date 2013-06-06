#include "setup.sqf"
#define __ctrl(valc) _ctrl = _display displayCtrl valc
private ["_display", "_ctrl", "_typepos", "_nobs"];
if (!X_Client) exitWith {};

if (d_beam_target < 0) exitWith{};

if (x_loop_end) exitWith {};

x_loop_end = true;

if (vehicle player != player) then {unassignVehicle player};

disableSerialization;
_display = __uiGetVar(X_TELE_DIALOG);
__ctrl(100102);
_ctrl ctrlEnable false;
__ctrl(100107);
_ctrl ctrlEnable false;
__ctrl(100108);
_ctrl ctrlEnable false;
__ctrl(100109);
_ctrl ctrlEnable false;
__ctrl(100112);
_ctrl ctrlShow true;

d_last_telepoint = d_beam_target;
_global_pos = [];
_global_dir = 180;
_typepos = 0;
switch (d_beam_target) do {
	case 0: {
#ifndef __REVIVE__
		_global_pos = markerPos format ["respawn_%1", EVO_own_side];
#else
		_global_pos = markerPos "base_spawn_1";
#endif
	};
	case 1: {
		_global_pos = MHQ modelToWorld [0,-5,0];
		_global_dir = direction MHQ;
		_typepos = 1;
	};
	case 2: {
		_global_pos = AHQ modelToWorld [0,-5,0];
		_global_dir = direction AHQ;
		_typepos = 2;
	};
};
d_beam_target = -1;
switch (_typepos) do {
	case 1 : {player setPosATL [_global_pos select 0, _global_pos select 1, 0]; player setDir _global_dir;};
	case 0 : {player setPos _global_pos; player setDir _global_dir;};
	case 2 : {player moveinCargo AHQ};
};

sleep 2;
closeDialog 0;

titletext ["", "BLACK IN"];

#ifndef __A2__
_nobs =	nearestObjects [player, ["USBasicWeapons_EP1","USSpecialWeapons_EP1","TKBasicWeapons_EP1","TKSpecialWeapons_EP1","LocalBasicAmmunitionBox","M1133_MEV_EP1","BMP2_HQ_TK_EP1"], 30];
#else
_nobs =	nearestObjects [player, ["USSpecialWeaponsBox","USBasicWeaponsBox","RUBasicAmmunitionBox","RUSpecialWeaponsBox","LocalBasicAmmunitionBox","LAV25_HQ","BTR90_HQ"], 30];
#endif
{player reveal _x} forEach _nobs;