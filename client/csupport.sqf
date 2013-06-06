private ["_type","_base","_tbox","_para","_obj_para"];
#include "setup.sqf"
// Clientside code for ordnance support

_type = _this select 0;
_size = _this select 1;
_countdown = _this select 2;
_ord = _this select 3;

_bpos = getmarkerpos "support_marker_location";
bmark setMarkerSizeLocal [0.1, 0.1];
"support_marker_location" setMarkerPosLocal [0,0,0];
onMapSingleClick "";
_base = "HeliHEmpty" createVehicle _bpos;

["evo_ordenance_request",[player,_type]] call XNetCallEvent;

#ifdef __BLUE__
_smoke = createVehicle ["SmokeShellBlue",_bpos, [], 0, "NONE"];
#else
_smoke = createVehicle ["SmokeShellRed",_bpos, [], 0, "NONE"];
#endif
EVO_firemission = true;
_mark2 = format["%1Bomb2",time];
_mark3 = format["%1Bomb3",time];

_bmark3 = createMarker [_mark3, _bpos];
_bmark3 setMarkerShape "ELLIPSE";
_bmark3 setMarkerType "Destroy";
_bmark3 setMarkerColor "ColorRed";
_bmark3 setMarkerSize [200, 200];

_bmark2 = createMarker [_mark2, _bpos];
_bmark2 setMarkerShape "ICON";
_bmark2 setMarkerType "FireMission";
_bmark2 setMarkerColor "ColorBlack";

_bzone = createTrigger ["EmptyDetector", _bpos];
_bzone setTriggerActivation ["ANY", "PRESENT", false];
_bzone setTriggerArea [_size, _size, 0, true ];

_men = 0;
_car = 0;
_tank = 0;
_score = 0;

_CountDead = {
	_list = list _bzone;
	if(count _list > 0) then {
		{
			if(__kind(_x) "Man" and (side _x) == EVO_enemy_side call EVO_getfunc_Store) then {_men = _men + 1; _score = _score+1};
			if(__kind(_x) "Car" and (side _x) == EVO_enemy_side call EVO_getfunc_Store) then {_car = _car + 1; _score = _score+3};
			if(__kind(_x) "Tank" and (side _x) == EVO_enemy_side call EVO_getfunc_Store) then {_tank = _tank + 1; _score = _score+5};
			if(__kind(_x) "Man" and (side _x) == EVO_own_side call EVO_getfunc_Store) then {_men = _men - 1; _score = _score-1};
			if(__kind(_x) "Car" and (side _x) == EVO_own_side call EVO_getfunc_Store) then {_car = _car - 1;_score = _score-3};
			if(__kind(_x) "Tank" and (side _x) == EVO_own_side call EVO_getfunc_Store) then {_tank = _tank - 1; _score = _score-5};
		} forEach _list;
	};
};

switch (_ord) do {
	case 1 : {_bmark2 setMarkerColor "ColorWhite"};
	case 2 :{_bmark2 setMarkerColor "ColorWhite"};
	case 3 : {_bmark2 setMarkerColor "ColorBlue"};
	case 4 : {_bmark2 setMarkerColor "ColorRed"};
	case 5 : {_bmark2 setMarkerColor "ColorBlack"};
	case 6 : {_bmark2 setMarkerColor "ColorGreen"};
	case 7 : {_bmark2 setMarkerColor "ColorYellow"};
};

_i = _countdown;
while {_i > -1} do {
	_mssg = format ["%1's %2 :%3",(name player),_type,_i];
	_bmark2 setMarkerText _mssg;
	_bmark3 setMarkerSize [0, 0];
	_i = _i - 1;
	if((_ord == 7) and _i == 25) then {
		_base setVehicleInit "[this,6] execVM ""client\nuke.sqf""";
		processInitCommands;
	};	
	sleep 0.5;
	_bmark3 setMarkerSize [_size, _size];
	sleep 0.5;
};

switch (_ord) do {
	case 1: {						//ordenance box
		_pos = (position _base);
		["call_air_ord",[_pos]] call XNetCallEvent;
		_para = EVO_own_side call XfGetParachuteSide;
		sleep 18;	//wait until plane is above the target zone
		_obj_para = _para createVehicle [0,0,0];
		_obj_para setpos [_pos select 0,_pos select 1,(_pos select 2) +100];
		#ifdef __Takistan__
			if (EVO_own_side == "WEST") then {
				_tbox = "USBasicAmmunitionBox_EP1" createVehicle _pos;
			} else {
				_tbox = "TKBasicAmmunitionBox_EP1" createVehicle _pos;
			};
		#else
			if (EVO_own_side == "WEST") then {
				_tbox = "USBasicAmmunitionBox" createVehicle _pos;
			} else {
				_tbox = "RUBasicAmmunitionBox" createVehicle _pos;
			};
		#endif
		_tbox attachTo [_obj_para, [0,0,-1.6]];
		sleep 3;
		_time = time;
		WaitUntil {((getpos _tbox select 2) < 0.2) || (_time + 30 < time)};
		detach _tbox;
		deleteVehicle _obj_para;
		deletevehicle _tbox;
		_pos = position _tbox;
		#ifdef __Takistan__
			if (EVO_own_side == "WEST") then {
				_tbox = "USBasicAmmunitionBox_EP1" createVehicle _pos;
			} else {
				_tbox = "TKBasicAmmunitionBox_EP1" createVehicle _pos;
			};
		#else
			if (EVO_own_side == "WEST") then {
				_tbox = "USBasicAmmunitionBox" createVehicle _pos;
			} else {
				_tbox = "RUBasicAmmunitionBox" createVehicle _pos;
			};
		#endif
		_tbox setpos getpos _tbox;
		[_tbox] execVM "client\del_drops.sqf";
		["transmit_box_content",[_tbox]] call XNetCallEvent;
	};
	case 2: {			//precision airstrike
		[] call _CountDead;
		_k = createVehicle ["Bo_GBU12_LGB",[(position _base select 0), (position _base select 1)-50,50], [], 0, "NONE"];
		sleep 5;
	};
	case 3: {			//cluster bomb
		[] call _CountDead;
		for "_i" from 0 to 20 do {
			_k = createVehicle ["Sh_105_HE",[(position _base select 0), (position _base select 1),50], [], _size, "NONE"];
			sleep (0.5 + random 1);
		};
		sleep 5;
	};
	case 4: {
		[] call _CountDead;
		for "_i" from 0 to 6 do {
			_k = createVehicle ["Bo_GBU12_LGB",[(position _base select 0), (position _base select 1)-50,50], [], _size, "NONE"];
			sleep 0.12;			
		};
		sleep 5;
	};
	case 5: {
		[] call _CountDead;
		for "_i" from 0 to 40 do {
			_k = createVehicle ["Sh_122_HE",[(position _base select 0), (position _base select 1),50], [], _size, "NONE"];
			sleep (0.3 + random 1);
		};
		sleep 5;
	};
	case 6: {		//gas
		_base setVehicleInit "[this,5] execVM ""client\nuke.sqf""";
		processInitCommands;
		_list = list _bzone;
		{
			if(_x isKindof "Man" and (side _x) == EVO_enemy_side call EVO_getfunc_Store) then {_x setdamage 1;_men = _men + 1;_score = _score+1};
		} forEach _list;
		sleep 5;
	};
	case 7: {
		[] call _CountDead;
		_objs = nearestObjects [_base, ["Man","Car","Tank","Air","House","Strategic","NonStrategic"], 25];
		{if(!(_x isKindOf EVO_radiotower)) then {_x setdamage 1}} forEach _objs;
		sleep 0.5;
		_objs = nearestObjects [_base, ["Man","Car","Tank","Air","House","Strategic","NonStrategic"], 50];
		{if(!(_x isKindOf EVO_radiotower)) then {_x setdamage 1}} forEach _objs;
		sleep 0.5;
		_objs = nearestObjects [_base, ["Man","Car","Tank","Air","House","Strategic","NonStrategic"], 75];
		{if(!(_x isKindOf EVO_radiotower)) then {_x setdamage 1}} forEach _objs;
		sleep 0.5;
		_objs = nearestObjects [_base, ["Man","Car","Tank","Air","House","Strategic","NonStrategic"], 100];
		{if(!(_x isKindOf EVO_radiotower)) then {_x setdamage 1}} forEach _objs;
		sleep 0.5;
		_objs = nearestObjects [_base, ["Man","Car","Tank","Air","House","Strategic","NonStrategic"], 150];
		{if(!(_x isKindOf EVO_radiotower)) then {_x setdamage 1}} forEach _objs;
		sleep 0.5;
		_objs = nearestObjects [_base, ["Man","Car","Tank","Air","House","Strategic","NonStrategic"], 200];
		{if(!(_x isKindOf EVO_radiotower)) then {_x setdamage 1}} forEach _objs;
	};
	case 8: {
		_pos = (position _base);
		["call_air_ord",[_pos]] call XNetCallEvent;
		_para = EVO_own_side call XfGetParachuteSide;
		sleep 18;	//wait until plane is above the target zone
		if (isNil "_para") then {
			_para = "ParachuteBigWest";
		} else {
			_obj_para = _para createVehicle [0,0,0];
		};
		_obj_para setpos [_pos select 0,_pos select 1,(_pos select 2) +100];
		#ifdef __Takistan__
			if (EVO_own_side == "WEST") then {
				_tbox = "HMMWV_M998_crows_M2_DES_EP1" createVehicle _pos;
			} else {
				_tbox = "LandRover_MG_TK_EP1" createVehicle _pos;
			};
		#else
			if (EVO_own_side == "WEST") then {
				_tbox = "HMMWV_M2" createVehicle _pos;
			} else {
				_tbox = "UAZ_MG_INS" createVehicle _pos;
			};
		#endif
		_tbox attachTo [_obj_para, [0,0,-1.6]];
		sleep 3;
		_time = time;
		WaitUntil {((getpos _tbox select 2) < 0.2) || (_time + 30 < time)};
		detach _tbox;
		deleteVehicle _obj_para;
		_tbox setpos getpos _tbox;
		_tbox setDammage 0;
	};	
};

deletevehicle _smoke;
deletevehicle _bzone;
deletemarker _mark2;
deletemarker _mark3;
deletevehicle _base;
EVO_firemission = false;

if(_ord != 1 and _ord != 8) then {
	if(_ord == 2 or _ord == 4) then {sleep 5}; // Time to drop 50m
	_name = parseText format["<t color='#FFFFCC'>%1</t>",localize "STR_M04t92"];
	_separator1 = parseText "<br /><br />";
	_imen = parseText format["<t color='#FFFFFF'>%1 %2</t><br />",_men,localize "STR_M04t93"];
	_icar = parseText format["<t color='#FFFFFF'>%1 %2</t><br />",_car,localize "STR_M04t94"];
	_itank = parseText format["<t color='#FFFFFF'>%1 %2</t><br />",_tank,localize "STR_M04t95"];
	_tally = format["+%1 %2",_score,localize "STR_M04t0_5"];
	_iscore = parseText format["<t color='#FFFFFF'>%1</t><br />",_tally];
	_txt = composeText [_name,_separator1,_imen,_icar,_itank,_iscore];
	hint _txt;
	["p_add_score",[player,_score]] call XNetCallEvent;
};