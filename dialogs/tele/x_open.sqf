#include "setup.sqf"
private ["_ok", "_display", "_ctrl"];

sleep __EVO_respawn_delay__;
if (dialog) then {closeDialog 0};

d_beam_target = -1;
tele_dialog = 0; // 0 = respawn, 1 = teleport

if (isNil "x_teleupdate_dlg") then {__cppfln(x_teleupdate_dlg,dialogs\tele\x_update_dlg.sqf)};

disableSerialization;

_ok = createDialog "TeleportModule";

_display = __uiGetVar(X_TELE_DIALOG);
_ctrl = _display displayCtrl 100102;
_ctrl ctrlSetText "Respawn";
_ctrl = _display displayCtrl 100111;
_ctrl ctrlSetText "Select Respawn Position";
_ctrl = _display displayCtrl 100112;
_ctrl ctrlShow false;
_ctrl = _display displayCtrl 100103;
_ctrl ctrlShow false;

x_loop_end = false;

sleep 0.1;

[d_last_telepoint] execVM "dialogs\tele\x_update_target.sqf";

[] spawn {
	while {!x_loop_end && alive player && dialog} do {
		if (!x_loop_end && alive player) then {[] spawn x_teleupdate_dlg};
		sleep 1.012;
	};
	if (!alive player) then {closeDialog 0};
};
