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
	waitUntil {!alive prisoner || (prisoner distance _user) > 40 || (prisoner distance EVO_jail) < 60};
	switch (true) do {
		case ((prisoner distance _user) > 40) : {
			[prisoner] join grpNull;
			prisoner setVehicleInit "offi_id = acc_offi addaction ['Capture' call XYellowText,'server\capture.sqf',0,1, true, true];";
			processInitCommands;
			_grp = [EVO_enemy_side] call EVO_createGroup;
			[prisoner] join _grp;
			_grp addWaypoint [[100,100,0],100];
			_head = localize "STR_i_ofc_fle";
			_body = localize "STR_i_ofc_fleb";
			_pic = "info";
		};
		case ((prisoner distance EVO_jail) < 60) : {
			if ((vehicle prisoner != prisoner) and (speed vehicle prisoner <= 4)) then {moveOut prisoner};
			[prisoner] join grpNull;
			["mt_officer_status",2] call XNetSetJIP;
			["p_add_score",[_user,EVO_officer_score]] call XNetCallEvent;
			_head = localize "STR_i_ofc_cap";
			_body = localize "STR_i_ofc_pris2";
			_pic = "ok";
			[] spawn {sleep 60; deleteVehicle prisoner};
		};
		case (!alive prisoner) : {
			if (vehicle prisoner != prisoner) then {moveOut prisoner};
			[prisoner] join grpNull;
			deleteMarker "mt_officer";
			_head = localize "STR_i_ofc_dead";
			_body = localize "STR_i_ofc_deadb";
			_pic = "stop";
		};
		default {};
	};
	[EVO_brown,_head,_body,_pic] call EVO_Message;
} else {
	[prisoner] join grpNull;
	_head = localize "STR_i_capt";
	[EVO_brown,_head,_body,_head,"",""] call EVO_Message;
	["p_add_score",[_user,EVO_soldier_score]] call XNetCallEvent;
};