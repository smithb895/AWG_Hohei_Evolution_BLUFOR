// by Xeno, edited by Grimes 
#include "setup.sqf"
private ["_vec", "_state"];
_vec = _this select 0;
_state = _this select 3;

switch (_state) do {
	case 0: {
		d_chophud_on = false;
		_vec removeAction __pGetVar(d_hud_id);
		__pSetVar ["d_hud_id", _vec addAction ["Turn On Hud" call XGreyText, "dialogs\DomiLift\x_sethud.sqf",1,-1,false]];
	};
	case 1: {
		d_chophud_on = true;
		_vec removeAction __pGetVar(d_hud_id);
		__pSetVar ["d_hud_id", _vec addAction ["Turn Off Hud" call XGreyText, "dialogs\DomiLift\x_sethud.sqf",0,-1,false]];
	};
};