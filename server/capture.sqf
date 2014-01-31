//by psycho
#include "setup.sqf"
private ["_pic","_body","_head","_usergrp","_user","_id"];
prisoner = _this select 0;
_user = _this select 1;
_id = _this select 2;

["captive",[prisoner,false]] call XNetCallEvent;
__sleep;
prisoner removeAction _id;
_usergrp = group _user;
prisoner switchMove "AmovPercMstpSsurWnonDnon";

if (prisoner isKindOf EVO_officer) then {
	deleteMarker "mt_officer";
	[prisoner] joinSilent _usergrp;
	_status = X_JIPH getVariable "mt_officer_status";
	if (_status == 0) then {
		["mt_officer_status",1] call XNetSetJIP;
		["p_add_score",[_user,EVO_officer_score]] call XNetCallEvent;
		_head = localize "STR_i_ofc_cap";
		_body = localize "STR_i_ofc_pris";
		[EVO_brown,_head,_body,"ok"] call EVO_Message;
	};
	prisoner removeallEventhandlers "killed";
	_user commandchat "Execute your captive. Another team will recover his corpse later.";
	};
	[EVO_brown,_head,_body,_pic] call EVO_Message;
} else {
	[prisoner] join grpNull;
	_head = localize "STR_i_capt";
	[EVO_brown,_head,_body,_head,"",""] call EVO_Message;
	["p_add_score",[_user,EVO_soldier_score]] call XNetCallEvent;
	_user commandchat "Execute your captive. Your bounty has been claimed.";
};