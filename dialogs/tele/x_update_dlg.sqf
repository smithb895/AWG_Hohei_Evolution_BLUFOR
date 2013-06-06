#include "setup.sqf"
private ["_display","_mr1text","_mr2text","_mr1_available","_mr2_available"];

if (x_loop_end) exitWith {};

disableSerialization;

_display = __uiGetVar(X_TELE_DIALOG);

_mr1text = _display displayCtrl 100105;
_mr2text = _display displayCtrl 100106;

_mr1_available = true;
_mr2_available = true;

_mr1text ctrlSetText "";
_mr2text ctrlSetText "";


switch (true) do {
	case (__XJIPGetVar(mr1_in_air)): {
		_mr1text ctrlSetText "MHQ gets transported by airlift...";
		_mr1_available = false;
	};
	case (speed MHQ > 4): {
		_mr1text ctrlSetText "MHQ currently driving...";
		_mr1_available = false;
	};
	case (surfaceIsWater [(position MHQ) select 0,(position MHQ) select 1]): {
		_mr1text ctrlSetText "MHQ is currently in water...";
		_mr1_available = false;
	};
	case (!(if (!isNil {MHQ getVariable "ace_canmove"}) then {MHQ call ace_v_alive} else {alive MHQ})): {
		_mr1text ctrlSetText "MHQ destroyed...";
		_mr1_available = false;
	};
};
switch (true) do {
	case (surfaceIsWater [(position AHQ) select 0,(position AHQ) select 1]): {
		_mr2text ctrlSetText "AHQ is currently in water...";
		_mr2_available = false;
	};
	case (!(if (!isNil {AHQ getVariable "ace_canmove"}) then {AHQ call ace_v_alive} else {alive AHQ})): {
		_mr2text ctrlSetText "AHQ destroyed...";
		_mr2_available = false;
	};
};


if (x_loop_end) exitWith {};

if (!_mr1_available) then {
	_button = _display displayCtrl 100108;
	_button ctrlEnable false;
	if (d_beam_target == 1) then {
		d_beam_target = -1;
		_textctrl = _display displayCtrl 100110;
		_textctrl ctrlSetText "";
	};
} else {
	_button = _display displayCtrl 100108;
	_button ctrlEnable true;
};

if (!_mr2_available) then {
	_button = _display displayCtrl 100109;
	_button ctrlEnable false;
	if (d_beam_target == 2) then {
		d_beam_target = -1;
		_textctrl = _display displayCtrl 100110;
		_textctrl ctrlSetText "";
	};
} else {
	_button = _display displayCtrl 100109;
	_button ctrlEnable true;
};
