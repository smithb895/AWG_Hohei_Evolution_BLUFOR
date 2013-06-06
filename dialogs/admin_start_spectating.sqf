// by psycho
disableSerialization;
_dialog = findDisplay 72000;
_info = _dialog displayCtrl 72001;

_bool = if (player getVariable "e_p_isadmin" || isServer) then {true} else {false};
if (!_bool) exitWith {
	closeDialog 0;
	_txt = localize "STR_d_noadmin";
	_txt call XfGlobalChat;
};
_info ctrlSetText localize "STR_d_adminhint";


KEGs_target = EVO_plist select (group_index max 0);

closeDialog 0;
[] call EVO_spectating;