#include "setup.sqf"
private ["_target","_display","_textctrl","_text","_end_pos"];

_target = _this select 0;

disableSerialization;

_display = __uiGetVar(X_TELE_DIALOG);
_textctrl = _display displayCtrl 100110;

if (x_loop_end) exitWith {};

_text = "";
_text2 = "";
_end_pos = position player;

switch (_target) do {
	case 0: {
		switch (tele_dialog) do {
			case 0: {
				_text = "Respawn at Base";
				d_beam_target = 0;
				_end_pos = position Evo_Baseflag_MHQ;
			};
			case 1: {
				_text = "Teleport to MHQ";
				d_beam_target = 1;
				_end_pos = position MHQ;
			};
			case 2: {
				_text = "Teleport to Base";
				d_beam_target = 0;
				_end_pos = position Evo_Baseflag_MHQ;
			};
		};
	};
	case 1: {
		_text = switch (tele_dialog) do {
			case 0: {"Respawn at MHQ"};
			case 1: {"Teleport to MHQ"};
			case 2: {"Teleport to MHQ"};
		};
		d_beam_target = 1;
		_end_pos = position MHQ;
	};
	case 2: {
		_text = switch (tele_dialog) do {
			case 0: {"Respawn at AHQ"};
			case 1: {"Teleport to AHQ"};
			case 2: {"Teleport to AHQ"};
		};
		d_beam_target = 2;
		_end_pos = position AHQ;
	};
};

_textctrl ctrlSetText _text;

_ctrlmap = _display displayCtrl 100104;
ctrlMapAnimClear _ctrlmap;

_start_pos = position player;
_ctrlmap ctrlmapanimadd [0.0, 1.00, _start_pos];
_ctrlmap ctrlmapanimadd [1.2, 1.00, _end_pos];
_ctrlmap ctrlmapanimadd [0.5, 0.30, _end_pos];
ctrlmapanimcommit _ctrlmap;