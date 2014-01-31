//by psycho
#include "setup.sqf"
if (!isServer) exitWith {};
private ["_name","_uid","_dp","_p_name_old","_p","_isAdmin"];
_name = _this select 0;
_UID = getPlayerUID player;

if (_name == "__SERVER__") exitWith {};

if (_UID in Evo_Admins) then {
	diag_log format ["Admin %1 has logged out - ArmA 2 Key: %2", name player, _uid];
};

//add here all checks for objects, ai, locked vehicles and markers from disconected player and remove them

_dp = EVO_client_event_holder getVariable _uid;
if (!isNil "_dp") then {
	_this_uid = _dp select 1;
	_st_a = X_JIPH getVariable uid_JIP_store;
	_isAdmin = _st_a select 0;
	//diag_log format ["disconnect isadmin: %1",_isAdmin];
	if (isNil "_isAdmin") then {_isAdmin = false};
	['get_disconnect_p_a', EVO_disconnected_players + [_this_uid]] call XNetSetJIP;
	if (_isAdmin) then {
		if (X_JIPH getVariable "MHQ_is_locked") then {
			["lock_it", [MHQ,false]] call XNetCallEvent;
			["MHQ_is_locked",false] call XNetSetJIP;
		};
		if (X_JIPH getVariable "AHQ_is_locked") then {
			["lock_it", [AHQ,false]] call XNetCallEvent;
			["AHQ_is_locked",false] call XNetSetJIP;
		};
	};
};