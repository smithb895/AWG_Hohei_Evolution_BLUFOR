#include "setup.sqf"
#define __isKind _vec isKindOf

EVO_vecmarker = {
	_vec = _this select 0;
	_markername = format ["%1", _vec];
	_displayname = getText(configFile >> "CfgVehicles" >> format["%1", _class] >> "displayName");
	if((not (_vec in list airportin)) and (not (_vec in list farp1)) and (not (_vec in list farp2)) and (not (_vec in list farp3))) then {
		_mrktype = "";
		#ifdef __BLUE__
			switch (true) do {
				case (__isKind "Car") : {_mrktype = "b_motor_inf"};
				case (__isKind "Tank") : {_mrktype = "b_armor"};
				case (__isKind "Helicopter") : {_mrktype = "b_air"};
				case (__isKind "Plane") : {_mrktype = "b_plane"};
				default {_mrktype = "b_unknown"};
			};
			_color = "ColorBlue";
		#else
			switch (true) do {
				case (__isKind "Car") : {_mrktype = "o_motor_inf"};
				case (__isKind "Tank") : {_mrktype = "o_armor"};
				case (__isKind "Helicopter") : {_mrktype = "o_air"};
				case (__isKind "Plane") : {_mrktype = "o_plane"};
				default {_mrktype = "o_unknown"};
			};
			_color = "ColorRed";
		#endif
		_mrktext = if (fuel _vec <= 0.05) then {format [localize "STR_M04t46", _displayname]} else {_displayname};
		_markerobj = [_markername,  [getpos _vec select 0, getpos _vec select 1], "ICON", _color, [0.5,0.5],_mrktext,0,_mrktype] call XfCreateMarkerGlobal;
	} else {
		_markerobj = "nomarker";
	};
	_markerobj;
};

//create a group of given side
//parameters:
//side (string or side logic)
//example: _grp = [east] call EVO_createGroup;
EVO_createGroup = {
	private ["_grp""_side","_side_str"];
	_side = _this select 0;
	_side_str = if (typeName _side == "STRING") then {_side call EVO_getfunc_Store} else {_side};
	_grp = createGroup _side_str;
	_grp
};

x_getwparray = {
	private["_tc", "_radius","_wp_a","_point"];
	_tc = _this select 0;_radius = _this select 1;_wp_a = [];_wp_a resize 100;
	for "_i" from 0 to 99 do {
		_point = [_tc, _radius] call XfGetRanPointCircle;
		if (count _point == 0) then {
			for "_e" from 0 to 99 do {
				_point = [_pos_center, _radius] call XfGetRanPointCircle;
				if (count _point > 0) exitWith {}
			};
		};
		_wp_a set [_i, _point];
	};
	_wp_a
};

// supports also patrols in square areas, including angle
XMakePatrolWPX = {
	private ["_grp", "_start_pos", "_wp_array", "_i", "_wp_pos", "_counter", "_wp", "_wppos", "_pos", "_cur_pos","_no_pos_found"];
	_grp = _this select 0;
	_start_pos = _this select 1;
	_wp_array = _this select 2;
	if (typeName _wp_array == "OBJECT") then {_wp_array = position _wp_array};
	if (typeName _wp_array != "ARRAY") exitWith {};
	if (typeName _start_pos == "OBJECT") then {_start_pos = position _start_pos};
	if (typeName _start_pos != "ARRAY") exitWith {};
	if (count _start_pos == 0) exitWith {};
	_timeout = if ((count _this) > 3) then {_this select 3} else {[]};
	_grp setBehaviour "SAFE";
	_cur_pos = _start_pos;
	_no_pos_found = false;
	for "_i" from 0 to (2 + (floor (random 3))) do {
		_wp_pos = switch (count _wp_array) do {
			case 2: {[_wp_array select 0, _wp_array select 1] call XfGetRanPointCircle};
			case 4: {[_wp_array select 0, _wp_array select 1, _wp_array select 2, _wp_array select 3] call XfGetRanPointSquare};
		};
		if (count _wp_pos == 0) exitWith {_no_pos_found = true};
		_counter = 0;
		while {_wp_pos distance _cur_pos < ((_wp_array select 1)/6) && _counter < 100} do {
			_wp_pos = switch (count _wp_array) do {
				case 2: {[_wp_array select 0, _wp_array select 1] call XfGetRanPointCircle};
				case 4: {[_wp_array select 0, _wp_array select 1, _wp_array select 2, _wp_array select 3] call XfGetRanPointSquare};
			};
			if (count _wp_pos == 0) exitWith {};
			_counter = _counter + 1;
		};
		if (count _wp_pos == 0) exitWith {_no_pos_found = true};
		_wp_pos = _wp_pos call XfWorldBoundsCheck;
		_cur_pos = _wp_pos;
		_wp = _grp addWaypoint [_wp_pos, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointCompletionRadius (0 + random 10);
		if (count _timeout > 0) then {_wp setWaypointTimeout _timeout};

		if (_i == 0) then {
			_wp setWaypointSpeed "LIMITED";
			_wp setWaypointFormation "STAG COLUMN";
		};
	};
	if (_no_pos_found) exitWith {
		_wp1 = _grp addWaypoint [_start_pos, 0];
		_wp1 setWaypointType "SAD";
	};
	_wp1 = _grp addWaypoint [_start_pos, 0];
	_wp1 setWaypointType "SAD";
	_wp1 setWaypointCompletionRadius (10 + random 10);
	if (count _timeout > 0) then {_wp1 setWaypointTimeout _timeout};
	_wp = _grp addWaypoint [_start_pos, 0];
	_wp setWaypointType "CYCLE";
	_wp setWaypointCompletionRadius (10 + random 10);
};

// get a random point inside a circle
// parameters:
// center position, radius of the circle
// example: _random_point = [position trigger1, 200] call XfGetRanPointCircle;
XfGetRanPointCircle = {
	private ["_center", "_radius", "_co", "_angle", "_x1", "_y1", "_no", "_valid", "_slope"];
	_center = _this select 0;_radius = _this select 1;
	_center_x = _center select 0;_center_y = _center select 1;
	_ret_val = [];
	for "_co" from 0 to 99 do {
		_angle = floor (random 360);
		_x1 = _center_x - ((random _radius) * sin _angle);
		_y1 = _center_y - ((random _radius) * cos _angle);
		if (!(surfaceiswater [_x1, _y1])) then {
			_no = [_x1, _y1, 0] nearestObject "Static";
			_valid = true;
			if (!isNull _no) then {
				if ([_x1, _y1, 0] distance _no < 11) then {_valid = false};
			};
			if (_valid) then {
				_slope = [[_x1, _y1, 0], 5] call XfGetSlope;
				if (_slope < 0.5) then {_ret_val = [_x1, _y1,0]};
			};
		};
		if (count _ret_val != 0) exitWith {};
	};
	_ret_val
};

// no slope check, for patrolling
XfGetRanPointCircleOld = {
	private ["_center", "_radius", "_center_x", "_center_y", "_ret_val", "_co", "_angle", "_x1", "_y1", "_helper"];
	_center = _this select 0;_radius = _this select 1;
	_center_x = _center select 0;_center_y = _center select 1;
	_ret_val = [];
	for "_co" from 0 to 99 do {
		_angle = floor (random 360);
		_x1 = _center_x - ((random _radius) * sin _angle);
		_y1 = _center_y - ((random _radius) * cos _angle);
		if (!(surfaceiswater [_x1, _y1])) then {_ret_val = [_x1, _y1, 0]};
		if (count _ret_val != 0) exitWith {};
	};
	_ret_val
};

// get a random point inside a circle for bigger objects
// parameters:
// center position, radius of the circle
// example: _random_point = [position trigger1, 200] call XfGetRanPointCircleBig;
XfGetRanPointCircleBig = {
	private ["_center", "_radius", "_co", "_angle", "_x1", "_y1", "_no", "_valid", "_slope"];
	_center = _this select 0;_radius = _this select 1;
	_center_x = _center select 0;_center_y = _center select 1;
	_ret_val = [];
	for "_co" from 0 to 99 do {
		_angle = floor (random 360);
		_x1 = _center_x - ((random _radius) * sin _angle);
		_y1 = _center_y - ((random _radius) * cos _angle);
		if (!(surfaceiswater [_x1, _y1])) then {
			_no = [_x1, _y1, 0] nearestObject "Static";
			_valid = true;
			if (!isNull _no) then {
				if ([_x1, _y1, 0] distance _no < 21) then {_valid = false};
			};
			if (_valid) then {
				_slope = [[_x1,_y1,0], 5] call XfGetSlope;
				if (_slope < 0.5 && !(isOnRoad ([_x1,_y1,0]))) then {_ret_val = [_x1,_y1,0]};
			};
		};
		if (count _ret_val != 0) exitWith {};
	};
	_ret_val
};

// get a random point at the borders of a circle
// parameters:
// center position, radius of the circle
// example: _random_point = [position trigger1, 200] call XfGetRanPointCircleOuter;
XfGetRanPointCircleOuter = {
	private ["_center", "_radius", "_co", "_angle", "_x1", "_y1", "_no", "_valid", "_slope"];
	_center = _this select 0;_radius = _this select 1;
	_center_x = _center select 0;_center_y = _center select 1;
	_ret_val = [];
	for "_co" from 0 to 99 do {
		_angle = floor (random 360);
		_x1 = _center_x - (_radius * sin _angle);
		_y1 = _center_y - (_radius * cos _angle);
		if (!(surfaceiswater [_x1, _y1])) then {
			_no = [_x1, _y1, 0] nearestObject "Static";
			_valid = true;
			if (!isNull _no) then {
				if ([_x1, _y1, 0] distance _no < 11) then {_valid = false};
			};
			if (_valid) then {
				_slope = [[_x1, _y1, 0], 5] call XfGetSlope;
				if (_slope < 0.5) then {_ret_val = [_x1, _y1, 0]};
			};
		};
		if (count _ret_val != 0) exitWith {};
	};
	_ret_val
};

// get a random point inside a square
// parameters:
// center position, a and b (like in triggers), angle
// example: _random_point  = [position trigger2, 200, 300, 30] call XfGetRanPointSquare;
XfGetRanPointSquare = {
	private ["_pos", "_a", "_b", "_angle", "_centerx", "_centery", "_leftx", "_lefty", "_width", "_height", "_co", "_px1", "_py1", "_radius", "_atan", "_x1", "_y1", "_no", "_valid", "_slope"];
	_pos = _this select 0;_a = _this select 1;_b = _this select 2;_angle = _this select 3;
	_centerx = _pos select 0;_centery = _pos select 1;_leftx = _centerx - _a;_lefty = _centery - _b;
	_width = 2 * _a;_height = 2 * _b;_ret_val = [];
	for "_co" from 0 to 99 do {
		_px1 = _leftx + random _width; _py1 = _lefty + random _height;
		_radius = _pos distance [_px1,_py1];
		_atan = (_centerx - _px1) atan2 (_centery - _py1);
		_x1 = _centerx - (_radius * sin (_atan + _angle));
		_y1 = _centery - (_radius * cos (_atan + _angle));
		if (!(surfaceiswater [_x1, _y1])) then {
			_no = [_x1, _y1, 0] nearestObject "Static";
			_valid = true;
			if (!isNull _no) then {
				if ([_x1, _y1, 0] distance _no < 11) then {_valid = false};
			};
			if (_valid) then {
				_slope = [[_x1, _y1, 0], 5] call XfGetSlope;
				if (_slope < 0.5) then {_ret_val = [_x1, _y1, 0]};
			};
		};
		if (count _ret_val != 0) exitWith {};
	};
	_ret_val
};

// no slope check, for patrolling
XfGetRanPointSquareOld = {
	private ["_pos", "_a", "_b", "_angle", "_centerx", "_centery", "_leftx", "_lefty", "_width", "_height", "_ret_val", "_co", "_px1", "_py1", "_radius", "_atan", "_x1", "_y1"];
	_pos = _this select 0;_a = _this select 1;_b = _this select 2;_angle = _this select 3;
	_centerx = _pos select 0;_centery = _pos select 1;_leftx = _centerx - _a;_lefty = _centery - _b;
	_width = 2 * _a;_height = 2 * _b;_ret_val = [];
	for "_co" from 0 to 99 do {
		_px1 = _leftx + random _width; _py1 = _lefty + random _height;
		_radius = _pos distance [_px1,_py1];
		_atan = (_centerx - _px1) atan2 (_centery - _py1);
		_x1 = _centerx - (_radius * sin (_atan + _angle));
		_y1 = _centery - (_radius * cos (_atan + _angle));
		if (!(surfaceiswater [_x1, _y1])) then {_ret_val = [_x1, _y1, 0]};
		if (count _ret_val != 0) exitWith {};
	};
	_ret_val
};

// get a random point at the borders of a square
// parameters:
// center position, a and b (like in triggers), angle
// example: _random_point  = [position trigger2, 200, 300, 30] call XfGetRanPointSquareOuter;
XfGetRanPointSquareOuter = {
	private ["_pos", "_a", "_b", "_angle", "_centerx", "_centery", "_leftx", "_lefty", "_width", "_height", "_co", "_rside", "_px1", "_py1", "_radius", "_atan", "_x1", "_y1", "_no", "_valid", "_slope"];
	_pos = _this select 0;_a = _this select 1;_b = _this select 2;_angle = _this select 3;
	_centerx = _pos select 0;_centery = _pos select 1;_leftx = _centerx - _a;_lefty = _centery - _b;
	_width = 2 * _a;_height = 2 * _b;_ret_val = [];
	for "_co" from 0 to 99 do {
		_rside = floor (random 4);
		_px1 = switch (_rside) do {
			case 0: {_leftx + random _width};
			case 1: {_leftx + _width};
			case 2: {_leftx + random _width};
			case 3: {_leftx};
		};
		_py1 = switch (_rside) do {
			case 0: {_lefty + _height};
			case 1: {_lefty + random _height};
			case 2: {_lefty};
			case 3: {_lefty + random _height};
		};
		_radius = _pos distance [_px1,_py1];
		_atan = (_centerx - _px1) atan2 (_centery - _py1);
		_x1 = _centerx - (_radius * sin (_atan + _angle));
		_y1 = _centery - (_radius * cos (_atan + _angle));
		if (!(surfaceiswater [_x1, _y1])) then {
			_no = [_x1, _y1, 0] nearestObject "Static";
			_valid = true;
			if (!isNull _no) then {
				if ([_x1, _y1, 0] distance _no < 11) then {_valid = false};
			};
			if (_valid) then {
				_slope = [[_x1, _y1, 0], 5] call XfGetSlope;
				if (_slope < 0.5) then {_ret_val = [_x1, _y1,0]};
			};
		};
		if (count _ret_val != 0) exitWith {};
	};
	_ret_val
};

// get a random point at the borders of the current island for spawning air vehicles (no slope check, no is water check, etc)
// parameters:
// center position, left x, left y, width, height, angle (optional)
XfGetRanPointOuterAir = {
	private ["_pos", "_centerx", "_centery", "_leftx", "_lefty", "_width", "_height", "_rside", "_px1", "_py1", "_radius", "_atan", "_x1", "_y1"];
	_pos = EVO_mapcenter;
	_centerx = _pos select 0; _centery = _pos select 1;
	_leftx = 250;_lefty = 250;
	_width = (2 * (_pos select 0)) - 500;
	_height = (2 * (_pos select 1)) - 500;
	_rside = floor (random 4);
	_px1 = switch (_rside) do {
		case 0: {_leftx + random _width};
		case 1: {_leftx + _width};
		case 2: {_leftx + random _width};
		case 3: {_leftx};
	};
	_py1 = switch (_rside) do {
		case 0: {_lefty + _height};
		case 1: {_lefty + random _height};
		case 2: {_lefty};
		case 3: {_lefty + random _height};
	};
	_radius = _pos distance [_px1,_py1,_pos select 2];
	_atan = (_centerx - _px1) atan2 (_centery - _py1);
	_x1 = _centerx - (_radius * sin _atan);
	_y1 = _centery - (_radius * cos _atan);
	[_x1, _y1, 300]
};

XfWorldBoundsCheck = {
	private "_pos";
	_pos = _this;
	if (_pos select 0 < 0) then {_pos set [0, 400]};
	if (_pos select 1 < 0) then {_pos set [1, 400]};
	if (_pos select 0 > (e_island_x_max - 2)) then {_pos set [0, e_island_x_max - 400]};
	if (_pos select 1 > (e_island_y_max - 2)) then {_pos set [1, e_island_y_max - 400]};
	_pos
};

XfOutOfBounds = {
	private ["_vec", "_p_x", "_vec", "_p_y"];
	_vec = _this;
	_p_x = getPosASL _vec select 0;
	_p_y = getPosASL _vec select 1;
	((_p_x < 0 || _p_x > e_island_x_max) && (_p_y < 0 || _p_y > e_island_y_max))
};

PsyfCargoSeats = {
private "_cargoseats";
	_cargoseats = getNumber (configFile >> "CfgVehicles" >> _this >> "transportsoldier");
	switch (_cargoseats) do {
		case (_cargoseats >= 16) : {_cargoseats = 15};
		case (_cargoseats <= 5) : {_cargoseats = 7};
		default {_cargoseats = 10};
	};
	_cargoseats
};

EVO_setToDead = {
	private ["_man"];
	_man = _this select 0;
	_time = time;
	waitUntil {((_time + 600) < time) || !(alive _man)};
	if (alive _man) then {_man setDamage 1};
};

EVO_random_music = {
	private ["_playlist","_num","_track","_duration"];
	#ifndef __A2__
	_playlist = [["Track01_Dead_Forest",70],["Short01_Defcon_Three",40],["Ambient08_Reforger",85],["Ambient07_Manhattan",105],["Ambient05_Cobalt",38],["Ambient04_Electronic_Warfare",80],["Ambient03_Indian_summer",70],["Ambient01_Cold_wind",60],["PMC_Track03",55],["PMC_Track02",80],["PMC_Track01",70],["Falout",120],["Defcon",70],["Wasteland",70],["SkyNet",70],["ToWar",70],["MAD",70]];
	#else
	_playlist = [["Track01_Dead_Forest",70],["Short01_Defcon_Three",40],["Ambient08_Reforger",85],["Ambient07_Manhattan",105],["Ambient05_Cobalt",38],["Ambient04_Electronic_Warfare",80],["Ambient03_Indian_summer",70],["Ambient01_Cold_wind",60]];
	#endif
	_num = _playlist call XfRandomFloorArray;
	_track = (_playlist select _num select 0);
	_duration = (_playlist select _num select 1);
	[_track,_duration]
};

EVO_building_protector = {
	private ["_nBuilding"];
	_nBuilding = nearestBuilding (_this select 0);
	//["allow_dam", [_nBuilding, false]] call XNetCallEvent;
	_nBuilding addEventHandler ["handleDamage", {0}];
};

XfCheckMTShotHD = {
	private ["_tower", "_r", "_val","_quotient"];
	_tower = _this select 0;
	_r = 0;
	_quotient = switch (E_need_satchel) do {
		case (1) : {1};
		case (2) : {5};
	};
	if ((getText(configFile >> "CfgAmmo" >> (_this select 4) >> "simulation") in ["shotPipeBomb", "shotTimeBomb"]) || ((_this select 4) == "ACE_PipebombExplosion")) then {
		_r = (_this select 2) / _quotient;
	} else {
		/*
		if (getText(configFile >> "CfgAmmo" >> (_this select 4) >> "CraterEffects") == "BombCrater") then {
			_r = _this select 2;
		};*/
	};
	_val = _tower getVariable "EVO_dam_t";
	if (isNil "_val") then {_val = 0};
	_r = _r + _val;
	_tower setVariable ["EVO_dam_t", _r];
	_r
};
/* old
XCheckMTHardTarget = {
	private ["_vehicle", "_trigger", "_trigger2"];
	_vehicle = _this select 0;
	_vehicle addEventHandler ["killed", {
		private ["_killer"];
		_killer = _this select 1;
		["mt_radio_down",true] call XNetSetJIP;
		if (!isNil "_killer") then {
			["p_add_score",[_killer,EVO_radio_score]] call XNetCallEvent;
		};
		_list1 = +(list mt_trigger_radio);
		{["p_add_score",[_x, EVO_radio_score_near]] call XNetCallEvent} forEach _list1;
		deleteMarker "mt_radio";
		deleteVehicle mt_trigger_radio;
		_head = localize "STR_i_destroyed";
		_body = localize "STR_i_destbody";
		["evo_message_global",[EVO_brown,_head,_body,"ok"]] call XNetCallEvent;
	}];
	["friendly_was_near",false] call XNetSetJIP;
	["allow_dam", [_vehicle, false]] call XNetCallEvent;
	friendly_near_mt_target = false;
	_trigger = [position _vehicle, [15,15,0,false], [EVO_own_side,"PRESENT",false], ["(getpos (thislist select 0)) select 2 < 15", "friendly_near_mt_target = true", ""]] call XfCreateTrigger;
	while {!friendly_near_mt_target && alive _vehicle} do {
		__MPCheck;
		sleep (1.021 + random 1);
	};
	["friendly_was_near",true] call XNetSetJIP;
	["allow_dam", [_vehicle, true]] call XNetCallEvent;
	deleteVehicle _trigger;
};
*/

XfCheckMTHardTarget = {
	private ["_vehicle", "_hdeh", "_trigger2"];
	_vehicle = _this select 0;
	_vehicle addEventHandler ["killed", {
		private ["_killer"];
		_killer = _this select 1;
		["mt_radio_down",true] call XNetSetJIP;
		if (!isNil "_killer") then {
			["p_add_score",[_killer,EVO_radio_score]] call XNetCallEvent;
		};
		_list1 = +(list mt_trigger_radio);
		{["p_add_score",[_x, EVO_radio_score_near]] call XNetCallEvent} forEach _list1;
		deleteMarker "mt_radio";
		deleteVehicle mt_trigger_radio;
		_head = localize "STR_i_destroyed";
		_body = localize "STR_i_destbody";
		["evo_message_global",[EVO_brown,_head,_body,"ok"]] call XNetCallEvent;
		(_this select 0) removeAllEventHandlers "handleDamage";
	}];
	if (E_need_satchel != 0) then {
		_hdeh = _vehicle addEventHandler ["handleDamage", {_this call XfCheckMTShotHD}];
	};
};

XfTKKickCheck = {
	private ["_tk", "_p", "_numtk", "_uid","_isAdmin"];
	_tk = _this select 0;
	_uid = getPlayerUID _tk;
	_p = EVO_client_event_holder getVariable _uid;
	if (!isNil "_p") then {
		_numtk = _p select 2;
		_st_a = X_JIPH getVariable uid_JIP_store;
		//_isAdmin = _st_a select 0;
		_isAdmin = (_uid in Evo_Admins);
		if (isNil "_isAdmin") then {_isAdmin = false};
		if (!_isAdmin) then {
			_numtk = _numtk + 1;
			_p set [2, _numtk];
		} else {
			_numtk = _numtk + 0;
			_p set [2, _numtk];
		};
		if (_numtk >= E_max_num_TKs) exitWith {
			_pna = _p select 0;
			serverCommand ("#kick " + _pna);
			["search_admin", [_pna]] call XNetCallEvent;
			diag_log format ["Player %1 was kicked automatically because of teamkilling, # team kills: %3, ArmA 2 Key: %2", _pna, _uid, _numtk];
			_head = localize "STR_i_autokick";
			_body = format [localize "STR_i_autokick_reason_tk", _pna,_numtk];
			["evo_message_global",[EVO_brown,_head,_body,"info"]] call XNetCallEvent;
			["end_mission", [_tk]] call XNetCallEvent;
		};
	};
};

Xf_Hacker_Kick = {
	private ["_pna", "_p", "_uid", "_player"];
	_player = _this select 0;
	_uid = getPlayerUID _player;
	_p = EVO_client_event_holder getVariable _uid;
	_pna = _p select 0;
	serverCommand ("#kick " + _pna);
			["search_admin", [_pna]] call XNetCallEvent;
			diag_log format ["Player %1 was kicked automatically because of scripting, ArmA 2 UID: %2", _pna, _uid];
			_head = localize "STR_i_autokick";
			_body = format ["Player %1 was automatically kicked for scripting. Please screencap this and contact an admin immeditately. ArmA 2 UID: %2", _pna, _uid];
			["evo_message_global",[EVO_brown,_head,_body,"info"]] call XNetCallEvent;
			["end_mission", [_p]] call XNetCallEvent;

XfTK_ambu_KickCheck = {
	private ["_ambuk", "_p", "_numtk_ambu", "_uid","_isAdmin"];
	_ambuk = _this select 0;
	_uid = getPlayerUID _ambuk;
	_p = EVO_client_event_holder getVariable _uid;
	if (!isNil "_p") then {
		_numtk_ambu = _p select 3;
		_st_a = X_JIPH getVariable uid_JIP_store;
		_isAdmin = _st_a select 0;
		if (isNil "_isAdmin") then {_isAdmin = false};
		if (!_isAdmin) then {
			_numtk_ambu = _numtk_ambu + 1;
			_p set [3, _numtk_ambu];
		};
		if (_numtk_ambu >= E_max_num_TKs_mhq) exitWith {
			_pna = _p select 0;
			serverCommand ("#kick " + _pna);
			["search_admin", [_pna]] call XNetCallEvent;
			diag_log format ["Player %1 was kicked automatically because raping the mobile spawn multiple times., # destroyed spawns: %3, ArmA 2 Key: %2", _pna, _uid, _numtk_ambu];
			_head = localize "STR_i_autokick";
			_body = format [localize "STR_i_autokick_reason_tk_ambu", _pna,_numtk_ambu];
			["evo_message_global",[EVO_brown,_head,_body,"info"]] call XNetCallEvent;
			["end_mission", [_ambuk]] call XNetCallEvent;
		};
	};
};

XffuelCheck = {
	private "_vec";
	_vec = _this select 0;
	_vec setVariable ["vec_fuel", fuel _vec];
};