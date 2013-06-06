//by psycho
#include "setup.sqf"
if (!isServer) exitWith {};
private ["_name","_uid","_cp","_p_name_old"];
_name = _this select 0;
_uid = _this select 1;

if (_name == "__SERVER__") exitWith {};

/*
definition:
0 = players name
1 = players uid
2 = number of TK's
3 = number of destroyed MHQ/AHQ
*/

_cp = EVO_client_event_holder getVariable _uid;
uid_JIP_store = _uid;

if (isNil "_cp") then {
	EVO_client_event_holder setVariable [_uid, [_name, _uid, 0, 0]];
	X_JIPH setVariable [uid_JIP_store, [false, 0], true];
} else {
	_p_name_old = _cp select 0;
	if (_name != _p_name_old) then {
		_head = localize "STR_i_info";
		_body = format [localize "STR_i_pn_chnaged" ,_name,_p_name_old];
		["evo_message_global",[EVO_blue,_head,_body,"achtung"]] call XNetCallEvent;
	};
};