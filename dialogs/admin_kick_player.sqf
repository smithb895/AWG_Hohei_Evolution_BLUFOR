//by psycho
#include "setup.sqf"
disableSerialization;
_dialog = findDisplay 72000;
_info = _dialog displayCtrl 72001;

_bool = if (player getVariable "e_p_isadmin" || isServer) then {true} else {false};
if (!_bool) exitWith {
	closeDialog 0;
	"This Button is only usable for a Administrator!" call XfGlobalChat;
};

_selected = EVO_plist select (group_index max 0);
if (_selected getVariable "e_p_isadmin") exitWith {_info ctrlSetText localize "STR_d_no_adminkick";};
if (_selected == player) exitWith {_info ctrlSetText localize "STR_d_no_selfkick";}; //man kann ja nie wissen...

_uid = getPlayerUID _selected;
_p = EVO_client_event_holder getVariable _uid;
_pna = _p select 0;
_numtk = _p select 2;
serverCommand ("#kick " + _uid);

_admin_name = name player;
diag_log format ["Player %1 was kicked by Admin %4, # team kills: %3, ArmA2Key: %2", _pna, _uid, _numtk, _admin_name];
_head = localize "STR_i_adminkick";
_body = format [localize "STR_i_adminkick_reason", _pna,_admin_name];
["evo_message_global",[EVO_brown,_head,_body,"info"]] call XNetCallEvent;

["end_mission", [_selected]] call XNetCallEvent;

[] execVM 'dialogs\admin_update.sqf';