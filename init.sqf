#include "setup.sqf"
diag_log format ["########################## %1 ################################", missionName];

if (!isNil "e_init_started") exitWith {};
e_init_started = true;

enableSaving [false,false];
enableTeamSwitch false;
#ifndef __DEBUG__
titleCut ["","black faded", 0];
#endif

X_INIT = false;X_Server = false; X_Client = false; X_JIP = false;X_SPE = false;X_MP = isMultiplayer;
if (isServer) then {
	X_Server = true;
	if (!isDedicated) then {
		X_Client = true;
		X_SPE = true;
		__waitpl;
	} else {
		X_INIT = true;	
	};
} else {
	X_Client = true;
	if (isNull player) then {
		X_JIP = true;
		__waitpl;
	} else {	
		X_INIT = true;
	};
};
if (isNil "x_funcs1_compiled") then {
	#ifndef __A2__
	__cppfln(x_reload,common\x_reload.sqf);
	#else
	__cppfln(x_reload,common\x_reload_a2.sqf);
	#endif
	__ccppfln(common\x_functions1.sqf);
	__ccppfln(common\x_netinit.sqf);
};

#include "i_common.sqf"
#include "i_server.sqf"
#include "i_client.sqf"


#ifdef __Takistan__
switch (E_Towns) do {
	case 1: {EVO_maintargets = [1,21,9,12,16,18,15,7,4]}; //9 town standard-route on takistan
	case 2: {EVO_maintargets = [2,3,8,9,10,11,12,13,14,20]}; //north-south axis
	case 3: {EVO_maintargets = (count EVO_all_possible_towns) call XfRandomIndexArray}; //random all
	case 4: {EVO_maintargets = [EVO_all_possible_towns,1] call PsyfRandomCountedIndexArray}; //1 random town
	case 5: {EVO_maintargets = [EVO_all_possible_towns,3] call PsyfRandomCountedIndexArray}; //3 random towns
	case 6: {EVO_maintargets = [EVO_all_possible_towns,5] call PsyfRandomCountedIndexArray}; //5 random towns
	case 7: {EVO_maintargets = [EVO_all_possible_towns,8] call PsyfRandomCountedIndexArray}; //8 random towns
};
#else
switch (E_Towns) do {
	case 1: {EVO_maintargets = [21,5,0,1,2,22,15,3,20]}; //9 town standard-route on chernarus
	case 2: {EVO_maintargets = [15,4,11,2,1,23,19]}; //coast route
	case 3: {EVO_maintargets = (count EVO_all_possible_towns) call XfRandomIndexArray}; //random all
	case 4: {EVO_maintargets = [EVO_all_possible_towns,1] call PsyfRandomCountedIndexArray}; //1 random town
	case 5: {EVO_maintargets = [EVO_all_possible_towns,3] call PsyfRandomCountedIndexArray}; //3 random towns
	case 6: {EVO_maintargets = [EVO_all_possible_towns,5] call PsyfRandomCountedIndexArray}; //5 random towns
	case 7: {EVO_maintargets = [EVO_all_possible_towns,8] call PsyfRandomCountedIndexArray}; //8 random towns
};
#endif
EVO_done_towns = 0;
EVO_current_counter = 0;
EVO_alltowns_topass = count EVO_maintargets;

waitUntil {!isNil "bis_fnc_init"};

//ace abfrage
//if (isClass(configFile/"CfgPatches"/"ace_main")) then {};

if (isServer) then {
	"paddscore" addPublicVariableEventHandler {
		((_this select 1) select 0) addScore ((_this select 1) select 1);
	};
};
masteradminsarray = [
	"1234567", // Replace with admin UIDs
	"09876545"
	];