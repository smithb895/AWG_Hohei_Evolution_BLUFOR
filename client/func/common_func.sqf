//by psycho
//all common functions for clients
#include "setup.sqf"
EVO_RankReq = {
	_player = _this select 0;
	_reqrank = _this select 1;
	_rank = rank _player;
	_nrank = "";
	switch (_reqrank) do {
	    case EVO_rank1: {_nrank = "CORPORAL"};
	    case EVO_rank2: {_nrank = "SERGEANT"};
	    case EVO_rank3: {_nrank = "LIEUTENANT"};
	    case EVO_rank4: {_nrank = "CAPTAIN"};
	    case EVO_rank5: {_nrank = "MAJOR"};
	    case EVO_rank6: {_nrank = "COLONEL"};
	};
	_txthead = localize "STR_M04t79";
	_txtreq = localize "STR_M04t80";
	_textcur = localize "STR_M04t81";
	_txtbody = format["%1 : %2<br/>%3 : %4",_textcur,_rank,_txtreq,_nrank];
	[EVO_brown,_txthead,_txtbody,"stop"] call EVO_Message;
};

// get actual rank from other players if myself is JIP - cause "rank" work only local (BIS bug)
EVO_get_players_jip_rank = {
	private ["_score","_rank"];
	_score = score _this;
	_rank = switch (true) do {
		case (_score >= EVO_rank6) : {"COLONEL"};
		case (_score >= EVO_rank5) : {"MAJOR"};
		case (_score >= EVO_rank4) : {"CAPTAIN"};
		case (_score >= EVO_rank3) : {"LIEUTENANT"};
		case (_score >= EVO_rank2) : {"SERGEANT"};
		case (_score >= EVO_rank1) : {"CORPORAL"};
		default {"PRIVATE"};
	};
	_rank
};

/* no longer needed		-- updated for version 2.06
EVO_prank_num = {
	private ["_ranknum","_rank","_p"];
	_p = _this select 0;
	_rank = rank player;
	switch (toUpper _rank) do {
		case "CORPORAL" : {_ranknum = 1};
		case "SERGEANT" : {_ranknum = 2};
		case "LIEUTENANT" : {_ranknum = 3};
		case "CAPTAIN" : {_ranknum = 4};
		case "MAJOR" : {_ranknum = 5};
		case "COLONEL" : {_ranknum = 6};
		default {_ranknum = 0};
	};
	_ranknum;
};
*/

EVO_Message = {
	private ["_parsedtext","_picture","_pic","_txt","_msg"];
	_headcolor = _this select 0;
	_head = _this select 1;
	_body = _this select 2;
	_picture = if (count _this > 3) then {_this select 3} else {""};
	if (_picture == "" || isNil "_picture") then {
		_parsedtext = parseText format["<br /><t align='center' color='%1' size='1.4'>%2</t><br /><t>%3</t><br />",_headcolor,_head,_body];
	} else {
		switch (_picture) do {
			case "ok" : {_pic = "pictures\ok.paa"};
			case "info" : {_pic = "pictures\info.paa"};
			case "achtung" : {_pic = "pictures\achtung.paa"};
			case "stop" : {_pic = "pictures\stop.paa"};
			default {_pic = ""};
		};
		_parsedtext = parseText format["<br /><img align='center' size='4' image='%4'/><br /><br /><t align='center' color='%1' size='1.4' >%2</t><br /><t>%3</t><br />",_headcolor,_head,_body,_pic];	
	};
	_msg = [_parsedtext];
	_txt = composeText _msg;
	hintSilent _txt;
	playsound "counter";
};

EVO_Eject = {
	private ["_unit","_vec"];
	_unit = _this select 0;
	_vec = vehicle _unit;
	_unit action ["ENGINEOFF", _vec];
	_unit action ["Eject",_vec];
	_vec setVelocity [0, 0, 0];
	sleep 1.1;
	if (isEngineOn _vec) then {
		_vec engineOn false;
		_unit action ["engineOff", _vec];
	};
	_unit action ["Eject",_vec];
	_vec setVelocity [0, 0, 0];
	disableUserInput false;
};

BIS_EVO_Eject = 
	{
		_unit = _this select 0;
		_unit action ["ENGINEOFF", _vec];
		_unit action ["Eject",_vec];
		_vec setVelocity [0, 0, 0];
		sleep 1.0;
		_unit action ["ENGINEOFF", _vec];
		_unit action ["Eject",_vec];
		_vec setVelocity [0, 0, 0];		
		if(_unit == player) then {disableUserInput false};
	};

EVO_GetGuns = {
	private ["_primtxt","_primpic","_sectxt","_secpic","_name","_i","_type","_array","_count","_portrait","_uname"];
	_type = _this select 0;
	_array = getArray (configFile >> "CfgVehicles" >> _type >> "weapons");
	_count = (count _array)-1;
	_i=0;
	while {_i <= _count} do {
		if (_i == 0) then {
			_name = getText (configFile >> "CfgWeapons" >> (_array select _i) >> "displayName");
			_primpic = getText (configFile >> "cfgWeapons" >> (_array select _i) >> "picture");
			_primtxt = format ["%1",_name];
		};
		if (_i == _count) then {
			_name = getText (configFile >> "CfgWeapons" >> (_array select _i) >> "displayName");
			_secpic = getText (configFile >> "cfgWeapons" >> (_array select _i) >> "picture");
			_sectxt = format ["%1",_name];	
		};
		_i = _i+1;
	};
	_portrait = getText (configFile >> "cfgVehicles" >> _type >> "portrait");
	_uname = getText (configFile >> "CfgVehicles" >> _type >> "DisplayName");
	[_uname,_primpic,_secpic,_portrait];
};

x_ffunc = {
	private ["_l","_vUp","_winkel"];
	if ((vehicle player) == player) then {
		EVO_objectID1 = (position player nearestObject "LandVehicle");
		if (!alive EVO_objectID1 || player distance EVO_objectID1 > 8) then {
			false
		} else {
			_vUp = vectorUp EVO_objectID1;
			if ((_vUp select 2) < 0) then {
				true
			} else {
				_l = sqrt((_vUp select 0)^2 + (_vUp select 1)^2);
				if (_l != 0) then {
					_winkel = (_vUp select 2) atan2 _l;
					if (_winkel < 30) then {
						true
					} else {
						false
					}
				}
			}
		}
	} else {
		false
	};
};

#ifndef __ACE__
x_sfunc = {
	private ["_objs"];
	if ((vehicle player) == player) then {
		_objs = nearestObjects [player,["LandVehicle","Air"],5];
		if (count _objs > 0) then {
			EVO_objectID2 = _objs select 0;
			if (alive EVO_objectID2) then {
				if(damage EVO_objectID2 > 0.05 || fuel EVO_objectID2 < 1)then {
					true
				} else {
					false
				}
			}else{
				false
			}
		}
	}else{
		false
	};
};
#else
x_sfunc = {
	private ["_objs"];
	if ((vehicle player) == player && player call ace_sys_ruck_fnc_hasRuck) then {
		_objs = nearestObjects [player,["LandVehicle","Air"],5];
		if (count _objs > 0) then {
			EVO_objectID2 = _objs select 0;
			if (alive EVO_objectID2) then {
				if(damage EVO_objectID2 > 0.05 || fuel EVO_objectID2 < 1) then {
					true
				}else{
					false
				}
			}else{
				false
			}
		}
	}else{
		false
	};
};
#endif

x_sfunc_specivec = {
	private ["_objs","_checkobj","_strp"];
	_strp = str(player);
	if ((vehicle player) == player) then {
		switch (true) do {
			case (_strp in ["evo_eng_1","evo_eng_2","evo_eng_3","evo_eng_4"]) : {_checkobj = EVO_reptruck};
			case (_strp in ["evo_med_1","evo_med_2","evo_med_3","evo_med_4"]) : {_checkobj = EVO_medivacs};
			case (_strp in ["evo_arti_1","evo_arti_2","evo_arti_3","evo_arti_4"]) : {_checkobj = EVO_ammotruck};
			default {_checkobj = ""};
		};
		_objs = nearestObjects [player,[_checkobj],5];
		if (count _objs > 0) then {
			EVO_objectID3 = _objs select 0;
			if (alive EVO_objectID3) then {
				true
			}else{
				false
			}
		}
	}else{
		false
	};
};

// setup global chat logic
if (isNil "x_global_chat_logic") then {x_global_chat_logic = "Logic" createVehicleLocal [0,0,0]};

// display a text message over a global logic chat
// parameters: text (without brackets)
// example: "Hello World!" call XfGlobalChat;
XfGlobalChat = {x_global_chat_logic globalChat _this};

// display a text message over side chat
// parameters: unit, text
// example: [player,"Hello World!"] call XfSideChat;
XfSideChat = {(_this select 0) sideChat (_this select 1)};

// example: [vehicle,"Hello Driver!"] call XfVehicleChat;
XfVehicleChat = {(_this select 0) vehicleChat (_this select 1)};

XTaskHint = {
	private ["_task", "_status", "_params"];
	if (count _this < 2) exitWith {};
	_task = _this select 0;
	_status = _this select 1;

	_params = switch (true) do {
		case (_status == "created"): {[localize "str_taskNew", [1,1,1,1], "taskNew"]};
		case ((_status == "current") || (_status == "assigned")): {[localize "str_taskSetCurrent", [1,1,1,1], "taskCurrent"]};
		case (_status == "succeeded"): {[localize "str_taskAccomplished", [0.600000,0.839215,0.466666,1.000000], "taskDone"]};
		case (_status == "failed"): {[localize "str_taskFailed", [0.972549,0.121568,0.000000,1.000000], "taskFailed"]};
		case (_status == "canceled"): {[localize "str_taskCancelled", [0.750000,0.750000,0.750000,1.000000], "taskFailed"]};
	};

	taskHint [format [(_params select 0) + "\n%1", (taskDescription _task) select 1], (_params select 1), (_params select 2)];
};

EVO_fgetTask = {
	private ["_current_target_name","_current_target_pos","_t_array"];
	_current_target = EVO_all_possible_towns select __XJIPGetVar(current_target_index);
	_current_target_pos = _current_target select 0;
	_current_target_name = _current_target select 1;
	
	call compile format ["
		task%1 = player createSimpleTask ['obj%1'];
		task%1 setSimpleTaskDescription ['Free %2 and destroy the radio tower.','Main Target: Liberate %2','Liberate %2'];
		task%1 setTaskState 'Created';
		task%1 setSimpleTaskDestination _current_target_pos;
		EVO_current_task = task%1;
	", __XJIPGetVar(current_target_index) + 1,_current_target_name];

	playSound "IncomingChallenge";
	[EVO_current_task, "CREATED"] spawn XTaskHint;
};

EVO_fsucceedTask = {
	EVO_current_task setTaskState "Succeeded";
	[EVO_current_task, "SUCCEEDED"] spawn XTaskHint;
};

credits_3d = {
	disableserialization;
	private ["_text","_pos","_display","_control","_w","_h","_minsDis","_dis","_alpha","_pos2D"];

	_text = _this select 0;
	_pos = _this select 1;
	_minDis = if (count _this > 2) then {_this select 2} else {20};
	_fadeDis = if (count _this > 3) then {_this select 3} else {1.5};
	if (isnil "BIS_fnc_3dCredits_n") then {BIS_fnc_3dCredits_n = 2733;};
	if (typename _pos == typename objnull) then {_pos = position _pos};
	if (typename _pos == typename "") then {_pos = markerpos _pos};
	BIS_fnc_3dCredits_n cutrsc ["rscDynamicText","plain"];
	BIS_fnc_3dCredits_n = BIS_fnc_3dCredits_n + 1;
	_display = uinamespace getvariable "BIS_dynamicText";
	_control = _display displayctrl 9999;

	#define DISPLAY	_display
	#define CONTROL	_control

	CONTROL ctrlsetfade 1;
	CONTROL ctrlcommit 0;
	CONTROL ctrlsetstructuredtext parsetext _text;
	CONTROL ctrlcommit 0;

	_w = safezoneW;//0.5;
	_h = safezoneH;//0.3;

	while {true} do {
		_dis = player distance _pos;
		_alpha = abs ((_dis / _minDis) - _fadeDis);
		if (_alpha <= 1) then {
			_pos2D = worldtoscreen _pos;
			if (count _pos2D > 0) then {
				CONTROL ctrlsetposition [(_pos2D select 0) - _w/2,(_pos2D select 1) - _h/2,_w,_h];
				CONTROL ctrlsetstructuredtext parsetext _text;
				CONTROL ctrlsetfade (_alpha^3);
				CONTROL ctrlcommit 0.01;
			} else {
				CONTROL ctrlsetfade 1;
				CONTROL ctrlcommit 0.1;
			};
		} else {
			CONTROL ctrlsetfade 1;
			CONTROL ctrlcommit 0.1;
			sleep 0.1;
		};
		sleep 0.01;
	};
};

XsFixHeadBug = {
	private ["_dir","_pos","_vehicle", "_posasl"];
	_unit = _this;
	if (vehicle _unit != _unit) exitWith {(localize "STR_i_hb") call XfGlobalChat;};
	titleCut ["... Fixing head bug ...","black faded", 0];
	_pos = position _unit;
	if (surfaceIsWater _pos) then {_posasl = getPosASL _unit};
	_dir = direction _unit;
#ifndef __A2__
	_vehicle = "UAZ_Unarmed_TK_EP1" createVehicleLocal _pos;
#else
	_vehicle = "UAZ_RU" createVehicleLocal _pos;
#endif
	if (surfaceIsWater _pos) then {_vehicle setPosASL _posasl};
	_unit moveincargo _vehicle;
	waitUntil {vehicle _unit != _unit};
	unassignVehicle _unit;
	_unit action ["Eject",vehicle _unit];
	waitUntil {vehicle _unit == _unit};
	deleteVehicle _vehicle;
	if (surfaceIsWater _pos) then {_unit setPosASL _posasl} else {_unit setPos _pos};
	_unit setDir _dir;
	titleCut["", "BLACK IN", 2];
};

EVO_timetostring = {
	private ["_min", "_hour"];
	_min = _this mod 1;
	_hour = _this - _min;
	_hour = (if (_hour <= 9) then {"0"} else {""}) + str _hour;
	_min = (60 * _min) - ((60 * _min) mod 1);
	_min = (if (_min <= 9) then {"0"} else {""}) + str _min;
	format ["%1:%2",_hour,_min]
};

XfGetRanJumpPoint = {
	private ["_center", "_radius", "_angle", "_r", "_x1", "_y1"];
	_center = _this select 0;
	_radius = _this select 1;
	_center_x = _center select 0;_center_y = _center select 1;
	_angle = floor (random 360);
	_r = random _radius;
	if (_r < 50) then {_r = 50};
	_x1 = _center_x - ((random _r) * sin _angle);
	_r = random _radius;
	if (_r < 50) then {_r = 50};
	_y1 = _center_y - ((random _r) * cos _angle);
	[_x1, _y1, 0]
};

EVO_spectating = {
	#ifdef __BLUE__
	KEGs_ShownSides = [west];
	#else
	KEGs_ShownSides = [east];
	#endif
	KEGs_can_exit_spectator = true;
	KEGs_playable_only = true;
	KEGs_no_butterfly_mode = true;
	[player, objNull, "noWait"] execVM "dialogs\spect\specta.sqf";
};

EVO_wich_rank_req = {
	private ["_req_r","_vtype"];
	_vtype = typeOf (vehicle player);
	_req_r = switch (true) do {
		case (_vtype in EVO_rank1_vecs) : {EVO_rank1};
		case (_vtype in EVO_rank2_vecs) : {EVO_rank2};
		case (_vtype in EVO_rank3_vecs) : {EVO_rank3};
		case (_vtype in EVO_rank4_vecs) : {EVO_rank4};
		case (_vtype in EVO_rank5_vecs) : {EVO_rank5};
		case (_vtype in EVO_rank6_vecs) : {EVO_rank6};
		default {EVO_rank6};
	};
	_req_r
};

EVO_boarding = {
	private ["_vec","_cargo_pos","_passenger"];
	_vec = _this select 0;
	_cargo_pos = _this select 1;
	_passenger = _this select 2;
	
	if((_vec in list AirportIn) and _cargo_pos != "driver") then {
		_passenger setVariable ["EVO_passenger",true];
	};
};

EVO_deboarding = {
	private ["_vec","_cargo_pos","_passenger"];
	_vec = _this select 0;
	_cargo_pos = _this select 1;
	_passenger = _this select 2;
	
	_dist = [Evo_Baseflag_MHQ, _vec] call BIS_fnc_distance2D;
	//if (_dist <= 1000) exitWith {hint "distanz fehler"};  //Wyatt: does nothing but annoy me.
	_real = _passenger getVariable "EVO_passenger";
	if (isNil "_real") exitWith {hint "getvar found nothing"};
	if ((_cargo_pos != "driver") && isPlayer _passenger && canMove _vec) then {
		switch (true) do {
			case (_dist > 5000) : {
				["p_add_score",[driver _vec,2]] call XNetCallEvent;
				_head = localize "STR_i_bonush";
				_body = localize "STR_i_bonusb3";
				[EVO_brown, _head, _body, "info", driver _vec] call EVO_Message;		
			};
			case (_dist > 1000) : {
				["p_add_score",[driver _vec,1]] call XNetCallEvent;
				_head = localize "STR_i_bonush";
				_body = localize "STR_i_bonusb1";
				[EVO_brown, _head, _body, "info", driver _vec] call EVO_Message;		
			};
			default {};
		};
		_passenger setVariable ["EVO_passenger",Nil];
	};
};

EVO_topic_info_spawn = {
	private ["_ran","_ran_txt"];
	_ran = 100 call XfRandomFloor;
	if (_ran > 85) then {
		_ran_txt = EVO_all_spawn_hints call XfRandomArrayVal;
		waitUntil {!dialog};
		TitleRsc [_ran_txt, "plain", 1.0];
	};
};

EVO_topic_info_vehicle = {
	private ["_ran","_spawn_txt","_vec"];
	_ran = 100 call XfRandomFloor;
	if (_ran > 90) then {
		if (!alive player) exitWith {};
		_vec = vehicle player;
		_spawn_txt = switch (true) do {
			case (typeOf _vec in EVO_f_supplys) : {"topic_dykv_supply"};
			case (typeOf _vec in EVO_f_jets) : {"topic_dykv_airbomb"};
			case (typeOf _vec in EVO_f_transporthelis) : {"topic_dyk_shipping"};
			case (typeOf _vec in EVO_f_attackhelis) : {"topic_dyk_achop"};
			default {""};
		};
		if (_spawn_txt != "") then {TitleRsc [_spawn_txt, "plain", 1.0]};
	};
};