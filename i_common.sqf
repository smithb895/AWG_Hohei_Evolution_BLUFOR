if (isNil "paramsArray") then {
	if (isClass (missionConfigFile/"Params")) then {
		for "_i" from 0 to (count (missionConfigFile/"Params") - 1) do {
			_paramName = configName ((missionConfigFile >> "Params") select _i);
			missionNamespace setVariable [_paramName, getNumber (missionConfigFile >> "Params" >> _paramName >> "default")];
		};
	};
} else {
	for "_i" from 0 to (count paramsArray - 1) do {
		missionNamespace setVariable [configName ((missionConfigFile >> "Params") select _i), paramsArray select _i];
	};
};

e_version = [];
#define __adddv(dtype) e_version set [count e_version, #dtype]
#ifdef __OA__
__adddv(OA);
#endif
#ifdef __CO__
__adddv(CO);
#endif
#ifdef __A2__
__adddv(A2);
#endif
#ifdef __ACE__
__adddv(ACE);
#endif
#ifdef __Takistan__
__adddv(Takistan);
#endif
#ifdef __Chernarus__
__adddv(Chernarus);
#endif
diag_log format ["[AWG] Evolution v5.98b - Version Settings: %1 #######", e_version];
EVO_client_event_holder = "HeliHEmpty" createVehicleLocal [0, 0, 0];

setTerrainGrid 25;
EVO_vdist = E_startviewdist;
EVO_avdist = E_startviewdist + 1000;

// this will remove setVehicleInits in BIS effects and should fix sky in fire bug
// probably breaks addons like WarFX, dunno, I'm not using it
#ifndef __ACE__
if (E_OverrideBISEffects == 0) then {
	[] spawn {
		sleep 0.4;
		waitUntil {!isNil "BIS_Effects_Secondaries"};
		sleep 0.4;
		__cppfln(BIS_Effects_EH_Killed,common\BIS_Effects\killed.sqf);
		__cppfln(BIS_Effects_AirDestruction,common\BIS_Effects\airdestruction.sqf);
		__cppfln(BIS_Effects_AirDestructionStage2,common\BIS_Effects\airdestructionstage2.sqf);
		__cppfln(BIS_Effects_Burn,common\BIS_Effects\burn.sqf);
		if (!isNil "JSRS_Distance_Killed") then {
			JSRS_Distance_Killed = {};
		};
	};
};
#endif

// -----------------------------Set difficulty ------------------------------------
// basic defenders: some infs by the radiotower and a security by the general
// every inf-squad are a group of 8 units! - be advise: every number is one squad!!! 
// EVO_Infantry actual number of GROUPS: give the squads they are present in the town before you attack
// EVO_Infantry base number of MEN: the lowest number of enemys before the enemy will call reinforcements
// the base number must smaler or reinforcements start imediately...
switch (E_diffparam) do {
	case 1 : {// Easy
		EVO_Infantry = [4,16];		// [Actual number of !groups!, Base number of !men!]
		EVO_Mechanized = [4,2];		// [Actual number of mechanized units, Base number of mechanized units]
	};
	case 2 : {// Normal
		EVO_Infantry = [6,32];
		EVO_Mechanized = [4,3];
	};
	case 3 : {// Hard
		EVO_Infantry = [8,48];
		EVO_Mechanized = [6,4];
	};
	case 4 : {// Extreme
		EVO_Infantry = [12,64];
		EVO_Mechanized = [8,6];
	};
	default {diag_log format "%1: ---- error in i_common by setting E_diffparam ----",missionName};
};

// WEST, EAST for own side, setup in setup.sqf
#ifdef __BLUE__
EVO_own_side = "WEST";
EVO_enemy_side = "EAST";
EVO_HQ = west;
#endif
#ifdef __RED__
EVO_own_side = "EAST";
EVO_enemy_side = "WEST";
EVO_HQ = east;
#endif
 
EVO_brown = "#6E5A2B";
EVO_blue = "#655EDE";
EVO_grey = "#f0bfbfbf";
XGreyText = {"<t color='#f0bfbfbf'>" + _this + "</t>"};
XRedText = {"<t color='#f0ff0000'>" + _this + "</t>"};
XYellowText = {"<t color='#f07f7f00'>" + _this + "</t>"};
XBlueText = {"<t color='#655EDE'>" + _this + "</t>"};

// 0-every  --  1-server   --   2-client
[0, "d_AirD", {[_this] spawn BIS_Effects_AirDestruction}] call XNetAddEvent;
[0, "d_AirD2", {_this spawn BIS_Effects_AirDestructionStage2}] call XNetAddEvent;
[0, "D_Burn", {_this spawn BIS_Effects_Burn}] call XNetAddEvent;
[0, "allow_dam", {(_this select 0) allowDamage (_this select 1)}] call XNetAddEvent;
[0, "captive", {(_this select 0) setCaptive (_this select 1)}] call XNetAddEvent;
[0, "swm", {(_this select 0) switchMove (_this select 1)}] call XNetAddEvent;
[0, "lock_it", {(_this select 0) lock (_this select 1)}] call XNetAddEvent;
[0, "search_admin", {if (serverCommandAvailable "#kick") then {serverCommand ("#kick" + (_this select 0))}}] call XNetAddEvent;

[1, "checkTK", {_this call checkTK}] call XNetAddEvent;
[1, "p_add_score", {(_this select 0) addScore (_this select 1)}] call XNetAddEvent;
[1, "prepare_mt_defenders", {
	[(_this select 0) select 0,(_this select 0) select 1,(_this select 0) select 2,(_this select 1)] call EVO_town_defenders;
	[(_this select 1)] call EVO_radio_defenders;
	[(_this select 2)] call EVO_officer_defenders;
}] call XNetAddEvent;
[1, "enemy_air_presence_num", {
	_num = _this select 0;
	switch (true) do {
		case (_num < 0) : {all_planes = all_planes - 1};
		case (_num > 0) : {all_planes = all_planes + 1};
	};
}] call XNetAddEvent;
[1, "enemy_mobile_presence_num", {
	_num = _this select 0;
	switch (true) do {
		case (_num < 0) : {EVO_all_mobiles = EVO_all_mobiles - 1};
		case (_num > 0) : {EVO_all_mobiles = EVO_all_mobiles + 1};
	};
}] call XNetAddEvent;
[1, "done_towns_num", {EVO_done_towns = EVO_done_towns + 1}] call XNetAddEvent;
[1, "mr1_l_c", {if (!isNull _this) then {[_this, 1] spawn x_checktransport}}] call XNetAddEvent;
[1, "mr2_l_c", {if (!isNull _this) then {[_this, 2] spawn x_checktransport}}] call XNetAddEvent;
[1, "check_activity", {if (_this in __XJIPGetVar(get_disconnect_p_a)) then {true} else {false}}] call XNetAddEvent;
[1, "call_air_ord", {[_this select 0,_this select 1] spawn EVO_air_cargodrop}] call XNetAddEvent;

[2, "evo_message", {
	if ((_this select 4) == vehicle player) then {
		[_this select 0,_this select 1,_this select 2,_this select 3] call EVO_Message;
	};
}] call XNetAddEvent;
[2, "evo_message_global", {[_this select 0,_this select 1,_this select 2,_this select 3] call EVO_Message}] call XNetAddEvent;
[2, "d_n_v", {_this call x_initvec}] call XNetAddEvent;
[2, "set_players_task", {player call EVO_fgetTask}] call XNetAddEvent;
[2, "succeed_players_task", {player call EVO_fsucceedTask}] call XNetAddEvent;
[2, "evo_music", {
	private ["_track","_duration"];
	_track = _this select 0; _duration = _this select 1;
	[] spawn {0 fadeMusic 0.3;playMusic _track;sleep _duration;10 fadeMusic 0.0;sleep 11;playMusic "";2 fadeMusic 0.5;};
}] call XNetAddEvent;
[2, "evo_ordenance_request", {
	private ["_caller","_type","_message"];
	[(_this select 0),(_this select 1)] spawn {
		_message = format [localize "STR_M04t118", (_this select 1)];
		[(_this select 0), _message] call XfSideChat;
		sleep 4.0;
		_message = format [localize "STR_M04t119", (name (_this select 0))];
		[[EVO_HQ,"HQ"], _message] call XfSideChat;
	};
}] call XNetAddEvent;
[2, "evo_join_request", {
	if (player == leader (_this select 0)) then {[(_this select 0),(_this select 1)] execVM "client\join_request.sqf"};
}] call XNetAddEvent;
[2, "play_outro", {player execVM "client\outro.sqf"}] call XNetAddEvent;
[2, "transmit_box_content", {[_this select 0] call EVO_tentbox}] call XNetAddEvent;
[2, "say3D_sound", {(_this select 0) say3D (_this select 1)}] call XNetAddEvent;
[2, "reward_ttext", {if ((_this select 2) == player) then {titleText [format ["-BONUS-\n%1 %2",(_this select 0),(_this select 1)], "PLAIN DOWN",0.8];}}] call XNetAddEvent;
[2, "end_mission", {if (player == (_this select 0)) then {endMission "LOSER"}}] call XNetAddEvent;
[1, "kickhacker", {_this call Xf_Hacker_Kick}] call XNetAddEvent;

//define vars--------------------------------------------------------------------
EVO_rank1 = 25;							//points still needed for the rank
EVO_rank2 = 45;
EVO_rank3 = 85;
EVO_rank4 = 145;
EVO_rank5 = 220;
EVO_rank6 = 360;

EVO_date = [2011,7,4,E_Mtime,59];       // Current date and time
setDate EVO_date;
EVO_PlayerSkill = 0.0;

EVO_objectID1 = objNull;
EVO_objectID2 = objNull;
EVO_objectID3 = objNull;
EVO_real_end = false;

EVO_AHQ_respawn_delay = 300;			//time in seconds
EVO_MHQ_respawn_delay = 180;			//time in seconds
EVO_jetspawn_delay = 300;			//time in seconds
EVO_attackhspawn_delay = 180;			//time in seconds

EVO_town_free_score = 10;				//score for every player still in town in moment of clearing
EVO_radio_score = 10;					//score for destroying the radio tower
EVO_radio_score_near = 5;				//score ffor be present inner a cirlce of 100metres by destroying radio tower
EVO_officer_score = 15;					//scorepoints, one time for capture and again for transport to prison
EVO_soldier_score = 5;					//scorepoints for capture an unamred soldier

EVO_ai_skill = [0.8,0.6];				//first number: minimum ai skill, second number random additional
EVO_max_alive_infs = 2;					//max numbers from alive enemys to call a maintarget "clear"
EVO_max_alive_tanks = 0;				//max numbers from alive tanks to call a maintarget "clear"
EVO_max_alive_cars = 1;					//max numbers from alive cars to call a maintarget "clear"

EVO_fattack = false; 					// detects if the player was attacked by the enemy for medic rewards.
EVO_mpoint = objNull;
EVO_dunit = "none"; 					// Name of disconnection player.
EVO_Onmission = false;
EVO_sm_reward = 20;
EVO_firemission = false;			   	// Limits support to one request at a time.
CB_sup = objNull;			   			// by psycho

#ifdef __Takistan__
EVO_all_possible_towns = [
	[[1779.68,11808.1,0],"Nur",600], // 0
	[[3082.35,9922.74,0],"Nagara",600], // 1
	[[6220.99,11111.8,0],"Rasman",600], // 2
	[[5662.6,8936.69,0],"Bastam",600], // 3
	[[9858.96,11464.5,0],"Zavarak",600], // 4
	[[12334.2,10247.7,0],"Karachinar",600], // 5
	[[10721.5,6347.16,0],"Garmsar",600], // 6
	[[9127.56,6757.6,0],"Garmarud",600], // 7
	[[5937.14,7282.13,0],"Falar",600], // 8
	[[5253.33,6177.37,0],"Feruz-Abad",600], // 9
	[[6016.37,5690.92,0],"Anar",600], // 10
	[[5304.67,4742.74,0],"Kakaru",600], // 11
	[[3655.71,4316.29,0],"Sakhe",600], // 12
	[[1466.8,3594.07,0],"Shukurkalay",600], // 13
	[[546.094,2811.05,0],"Chaman",600], // 14
	[[8894.68,5272.33,0],"Timurkalay",600], // 15
	[[4438.04,686.898,0],"Chak Chak",600], // 16
	[[6041.86,1148.34,0],"Huzrutimam",600], // 17
	[[8485.58,2452.54,0],"Loy Manara",600], // 18
	[[10142.7,2336.75,0],"Chardarakht",600], // 19
	[[2003.28,352.347,0],"Landay",600], // 20
	[[1987.14,7657.36,0],"Mulladost",600], // 21
	[[11528.4,8351.98,0],"Ravanay",600], // 22
	[[1507.13,5701.05,0],"Khushab",600] // 23
];
#else
EVO_all_possible_towns = [	
	[[2733.7,5306.05,0],"Zelenogorsk",600], // 0
	[[6728.4,2590.29,0],"Chernogorsk",600], // 1
	[[10269.5,2110.25,0],"Elektrozavodsk",600], // 2
	[[11146.5,12302.7,0],"Krasnostav",600], // 3
	[[12012.4,9095.97,0],"Berezino",600], // 4
	[[6147.54,7757.34,0],"Stary Sobor",600], // 5
	[[3814.73,8901.37,0],"Vybor",600], // 6
	[[7555.26,5149.45,0],"Mogilevka",600], // 7
	[[10680.4,8054.11,0],"Polana",600], // 8
	[[10412.8,9768.09,0],"Dubrovka",600], // 9
	[[9548.47,8846.42,0],"Gorka",600], // 10
	[[13381.5,6254.74,0],"Solnichniy",600], // 11
	[[10118.6,5521.33,0],"Staroye",600], // 12
	[[1697.54,3847.5,0],"Pavlovo",600], // 13
	[[3075.33,7916.48,0],"Pustoschka",600], // 14
	[[12971.1,10109.1,0],"Berezino Harbour",600], // 15
	[[9178.31,3870.64,0],"Pusta",600], // 16
	[[4741.96,6799.19,0],"Rogovo",600], // 17
	[[4393.77,4606.03,0],"Kozlovka",600], // 18
	[[1828.09,2249.49,0],"Kamenka",600], // 19
	[[8659.28,11840.9,0],"Gvozdno",600], // 20
	[[2727.84,9941.74,0],"Lopatino",600], // 21
	[[11252.52,5445.69,0],"Msta",600], // 22
	[[4604.92,2489.79,0],"Balota Airfield",600], // 23
	[[7088.44,7688.07,0],"Novy Sobor",600] // 24
];
#endif

#ifdef __DEBUG__
// only for debugging, creates markers at all main target positions
{
	_pos = _x select 0;
	_name = _x select 1;
	_size = _x select 2;
	_marker= createMarkerLocal [_name, _pos];
	_marker setMarkerShapeLocal "ELLIPSE";
	_name setMarkerColorLocal "ColorGreen";
	_name setMarkerSizeLocal [_size,_size];
	_name = _name + "xx";
	_marker= createMarkerLocal [_name, _pos];
	_marker setMarkerTypeLocal "mil_dot";
	_name setMarkerColorLocal "ColorBlack";
	_name setMarkerSizeLocal [0.5,0.5];
	_name setMarkerTextLocal _name;
} forEach EVO_all_possible_towns;
#endif

// target classes
#ifdef __Takistan__
	EVO_radiotower = "Land_radar_EP1";
	if __isBlue then {
		EVO_enemy_arty = "D30_TK_EP1";
		EVO_officer = "TK_Aziz_EP1";
	} else {
		EVO_enemy_arty = "M119_US_EP1";
		EVO_officer = "US_Soldier_Officer_EP1";
	};
#else
	EVO_radiotower = "Land_Vysilac_FM";  //Wyatt: Changed "Land_radar" to a FM Radio.  Looks more like a real radio tower. XD
	if __isBlue then {
		EVO_enemy_arty = "D30_RU";
		EVO_officer = "RU_Soldier_Officer";
	} else {
		EVO_enemy_arty = "M119";
		EVO_officer = "USMC_Soldier_Officer";
	};
#endif

#ifndef __A2__
if (E_arty_comp == 0) then {enableEngineArtillery false};
#endif

// The players default custom load out
#ifdef __BLUE__
switch (true) do {
	case (__OAonly) : {
		EVO_pammo = ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","17Rnd_9x19_glock17","17Rnd_9x19_glock17","17Rnd_9x19_glock17","17Rnd_9x19_glock17"];
		EVO_pweapons = ["SCAR_L_STD_HOLO","glock17_EP1","Binocular_Vector","NVGoggles"];
	};
	case (__A2only) : {
		EVO_pammo = ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","pipebomb","Laserbatteries","15Rnd_9x19_M9","15Rnd_9x19_M9","15Rnd_9x19_M9","15Rnd_9x19_M9"];
		EVO_pweapons = ["m16a4","M9","Laserdesignator","NVGoggles"];
	};
	case (__COver and __Takistan and !__ACEver) : {
		EVO_pammo = ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","17Rnd_9x19_glock17","17Rnd_9x19_glock17","17Rnd_9x19_glock17","17Rnd_9x19_glock17"];
		EVO_pweapons = ["SCAR_L_STD_HOLO","glock17_EP1","Binocular_Vector","NVGoggles"];
	};
	case (__COver and __Chernarus and !__ACEver) : {
		EVO_pammo = ["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","17Rnd_9x19_glock17","17Rnd_9x19_glock17","17Rnd_9x19_glock17","17Rnd_9x19_glock17"];
		EVO_pweapons = ["m16a4_acg","glock17_EP1","Binocular_Vector","NVGoggles"];
	};
	case (__ACEver and __Takistan) : {
		EVO_pammo = ["ACE_30Rnd_556x45_T_Stanag","ACE_30Rnd_556x45_T_Stanag","ACE_30Rnd_556x45_T_Stanag","ACE_30Rnd_556x45_T_Stanag","ACE_30Rnd_556x45_T_Stanag","17Rnd_9x19_glock17","17Rnd_9x19_glock17","17Rnd_9x19_glock17","17Rnd_9x19_glock17"];
		EVO_pweapons = ["ACE_M4","glock17_EP1","Binocular_Vector","NVGoggles"];
	};
	case (__ACEver and __Chernarus) : {
		EVO_pammo = ["ACE_30Rnd_556x45_T_Stanag","ACE_30Rnd_556x45_T_Stanag","ACE_30Rnd_556x45_T_Stanag","ACE_30Rnd_556x45_T_Stanag","ACE_30Rnd_556x45_T_Stanag","17Rnd_9x19_glock17","17Rnd_9x19_glock17","17Rnd_9x19_glock17","17Rnd_9x19_glock17"];
		EVO_pweapons = ["ACE_M4A1_Eotech","ACE_Glock18","ACE_Rangefinder_OD","NVGoggles"];
	};
};
#else
switch (true) do {
	case (__OAonly) : {
		EVO_pammo = ["30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","8Rnd_9x18_Makarov","8Rnd_9x18_Makarov","8Rnd_9x18_Makarov","8Rnd_9x18_Makarov"];
		EVO_pweapons = ["AK_74","Makarov","Binocular","NVGoggles"];
	};
	case (!__ACEver and (__A2only or __COver)) : {
		EVO_pammo = ["30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","Laserbatteries","8Rnd_9x18_Makarov","8Rnd_9x18_Makarov","8Rnd_9x18_Makarov","8Rnd_9x18_Makarov"];
		EVO_pweapons = ["AK_47","Makarov","Laserdesignator","NVGoggles"];
	};
	case (__ACEver and __Takistan) : {
		EVO_pammo = ["ACE_30Rnd_545x39_T_AK","ACE_30Rnd_545x39_T_AK","ACE_30Rnd_545x39_T_AK","ACE_30Rnd_545x39_T_AK","ACE_30Rnd_545x39_T_AK","ACE_8Rnd_762x25_B_Tokarev","ACE_8Rnd_762x25_B_Tokarev","ACE_8Rnd_762x25_B_Tokarev","ACE_8Rnd_762x25_B_Tokarev"];
		EVO_pweapons = ["ACE_AK74M","ACE_TT","Binocular","NVGoggles"];
	};
	case (__ACEver and __Chernarus) : {
		EVO_pammo = ["ACE_30Rnd_545x39_T_AK","ACE_30Rnd_545x39_T_AK","ACE_30Rnd_545x39_T_AK","ACE_30Rnd_545x39_T_AK","ACE_30Rnd_545x39_T_AK","ACE_8Rnd_762x25_B_Tokarev","ACE_8Rnd_762x25_B_Tokarev","ACE_8Rnd_762x25_B_Tokarev","ACE_8Rnd_762x25_B_Tokarev"];
		EVO_pweapons = ["ACE_AK74M","ACE_TT","Binocular","NVGoggles"];
	};
};
#endif

#ifdef __ACE__
	EVO_pitems = ["ItemCompass","ItemGPS","ItemRadio","ACE_Map","ACE_Map_Tools","ItemWatch","ACE_Earplugs"];
#else
	EVO_pitems = ["ItemCompass","ItemGPS","ItemRadio","ItemWatch"];
#endif

// Which car is usable with which rank
#ifdef __RED__
EVO_rank1_vecs = ["UAZ_AGS30_RU","BTR90","GAZ_Vodnik","BRDM2_INS"];
EVO_rank2_vecs = ["Ural_ZU23_INS","GRAD_INS","GRAD_RU","GAZ_Vodnik_HMG","Mi17_Civilian","T72_RU","BRDM2_ATGM_INS","Mi17_Ins","BMP3"];
EVO_rank3_vecs = ["ZSU_INS","BMP2_INS","T90","2S6M_Tunguska","D30_RU","Mi17_rockets_RU"];
EVO_rank4_vecs = ["Mi24_V","Mi24_P"];
EVO_rank5_vecs = ["Su25_Ins","Su39"];
EVO_rank6_vecs = ["Su34","Ka52Black","Ka52"];
#else
EVO_rank1_vecs = ["M119","Mi17_CDF","HMMWV_Armored","HMMWV_M2","HMMWV_TOW","HMMWV_MK19","Mi17_Civilian","LAV25","AAV","BRDM2_CDF","BRDM2_ATGM_CDF","UAZ_AGS30_CDF","UAZ_MG_CDF","BMP2_CDF"];
Evo_Rank2_vecs = ["HMMWV_Avenger","MH60S","UH1Y","M1A1","T72_CDF","ZSU_CDF"];
EVO_rank3_vecs = ["MLRS","M1A2_TUSK_MG","Mi24_D","MV22","C130J"];
EVO_rank4_vecs = ["Su25_CDF","AH64D_Sidewinders","AH64D"];
EVO_rank5_vecs = ["AV8B","A10","F35B","F-35B"];
EVO_rank6_vecs = ["AV8B2","AH1Z"];
#endif

// enemy and friendly classes for ai-spawning
#ifdef __Takistan__
if __isBlue then {
		EVO_e_leader = ["TK_Soldier_Officer_EP1","TK_Soldier_SL_EP1"];
		EVO_e_crew = ["TK_Soldier_Pilot_EP1","TK_Soldier_Crew_EP1"];
		EVO_e_soldiers = ["TK_Soldier_TWS_EP1","TK_Soldier_Spotter_EP1","TK_Soldier_Sniper_Night_EP1","TK_Soldier_Sniper_EP1","TK_Soldier_SniperH_EP1","TK_Soldier_AAT_EP1","TK_Soldier_AA_EP1","TK_Soldier_Night_2_EP1","TK_Soldier_Night_1_EP1","TK_Soldier_Medic_EP1","TK_Soldier_MG_EP1","TK_Soldier_LAT_EP1","TK_Soldier_HAT_EP1","TK_Soldier_GL_EP1","TK_Soldier_Engineer_EP1","TK_Soldier_EP1","TK_Soldier_AT_EP1","TK_Soldier_AR_EP1","TK_Soldier_AMG_EP1"];
		EVO_e_specops = ["TK_Special_Forces_TL_EP1","TK_Soldier_TWS_EP1","TK_Special_Forces_MG_EP1","TK_Special_Forces_EP1","TK_Soldier_Sniper_Night_EP1"];
		EVO_e_wheeled = ["UAZ_MG_TK_EP1","UAZ_AGS30_TK_EP1","LandRover_SPG9_TK_EP1","LandRover_MG_TK_EP1","GRAD_TK_EP1","BTR60_TK_EP1","BRDM2_TK_EP1","BRDM2_ATGM_TK_EP1"];
		EVO_e_tracked = ["T72_TK_EP1","T55_TK_EP1","T34_TK_EP1","M113_TK_EP1","BMP2_TK_EP1"];
		EVO_e_aa = ["ZSU_TK_EP1","Ural_ZU23_TK_EP1"];
		EVO_e_jets = ["L39_TK_EP1","Su25_TK_EP1"];
		EVO_e_attackhelis = ["Mi24_D_TK_EP1"];
		EVO_e_transporthelis = ["Mi17_TK_EP1","UH1H_TK_EP1","An2_TK_EP1"];
		EVO_e_transport = ["V3S_Open_TK_EP1","UAZ_Unarmed_TK_EP1","UralSupply_TK_EP1"];
		EVO_e_supplys = ["UralReammo_TK_EP1","UralRefuel_TK_EP1","UralRepair_TK_EP1","UralSalvage_TK_EP1"];
		EVO_e_static = ["D30_TK_EP1","Metis_TK_EP1","KORD_high_TK_EP1","KORD_TK_EP1","2b14_82mm_TK_EP1","AGS_TK_EP1"];
		EVO_e_staticaa = ["ZU23_TK_EP1","Igla_AA_pod_TK_EP1"];
		EVO_smVehicles = ["TT650_TK_EP1","UAZ_MG_TK_EP1","UAZ_AGS30_TK_EP1","LandRover_MG_TK_EP1","LandRover_SPG9_TK_EP1","BRDM2_ATGM_TK_EP1","BTR60_TK_EP1","BMP2_TK_EP1"];

		EVO_f_leader = ["US_Soldier_Officer_EP1","US_Soldier_SL_EP1","US_Soldier_TL_EP1"];
		EVO_f_soldiers = ["US_Soldier_Spotter_EP1","US_Soldier_Sniper_NV_EP1","US_Soldier_Sniper_EP1","US_Soldier_SniperH_EP1","US_Soldier_Medic_EP1","US_Soldier_LAT_EP1","US_Soldier_MG_EP1","US_Soldier_Marksman_EP1","US_Soldier_HAT_EP1","US_Soldier_GL_EP1","US_Soldier_Engineer_EP1","US_Soldier_EP1","US_Soldier_AHAT_EP1","US_Soldier_AMG_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_AA_EP1","US_Soldier_AAT_EP1","US_Soldier_AAR_EP1"];
		EVO_f_crew = ["US_Pilot_Light_EP1","US_Soldier_Crew_EP1"];
		EVO_f_specops = ["US_Delta_Force_TL_EP1","US_Delta_Force_SD_EP1","US_Delta_Force_Night_EP1","US_Delta_Force_M14_EP1","US_Delta_Force_MG_EP1","US_Delta_Force_Marksman_EP1","US_Delta_Force_Medic_EP1","US_Delta_Force_EP1","US_Delta_Force_Assault_EP1","US_Delta_Force_Air_Controller_EP1","US_Delta_Force_AR_EP1"];
		EVO_f_wheeled = ["M1135_ATGMV_EP1","M1126_ICV_mk19_EP1","M1128_MGS_EP1","M1129_MC_EP1","M1130_CV_EP1","M1126_ICV_M2_EP1","HMMWV_TOW_DES_EP1","HMMWV_MK19_DES_EP1","HMMWV_M998_crows_MK19_DES_EP1","HMMWV_M998_crows_M2_DES_EP1","HMMWV_M998A2_SOV_DES_EP1","HMMWV_M1151_M2_DES_EP1"];
		EVO_f_tracked = ["MLRS_DES_EP1","M2A3_EP1","M2A2_EP1","M1A2_US_TUSK_MG_EP1","M1A1_US_DES_EP1"];
		EVO_f_aa = ["M6_EP1","HMMWV_Avenger_DES_EP1"];
		EVO_f_jets = ["A10_US_EP1"];
		EVO_f_attackhelis = ["AH6J_EP1","AH64D_EP1"];
		EVO_f_transporthelis = ["MH6J_EP1","UH60M_EP1","CH_47F_EP1"];
		EVO_f_transport = ["SUV_UN_EP1","HMMWV_M1035_DES_EP1","MtvrSupply_DES_EP1"];
		EVO_f_supplys = ["MtvrSalvage_DES_EP1","MtvrRepair_DES_EP1","MtvrRefuel_DES_EP1","MtvrReammo_DES_EP1"];
		EVO_f_static = ["M119_US_EP1","M252_US_EP1","TOW_TriPod_US_EP1","MK19_TriPod_US_EP1","M2StaticMG_US_EP1","M2HD_mini_TriPod_US_EP1"];
		EVO_f_staticaa = ["Stinger_Pod_US_EP1"];
	} else {
		EVO_e_leader = ["US_Soldier_Officer_EP1","US_Soldier_SL_EP1","US_Soldier_TL_EP1"];
		EVO_e_soldiers = ["US_Soldier_Spotter_EP1","US_Soldier_Sniper_NV_EP1","US_Soldier_Sniper_EP1","US_Soldier_SniperH_EP1","US_Soldier_Medic_EP1","US_Soldier_LAT_EP1","US_Soldier_MG_EP1","US_Soldier_Marksman_EP1","US_Soldier_HAT_EP1","US_Soldier_GL_EP1","US_Soldier_Engineer_EP1","US_Soldier_EP1","US_Soldier_AHAT_EP1","US_Soldier_AMG_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_AA_EP1","US_Soldier_AAT_EP1","US_Soldier_AAR_EP1"];
		EVO_e_crew = ["US_Pilot_Light_EP1","US_Soldier_Crew_EP1"];
		EVO_e_specops = ["US_Delta_Force_TL_EP1","US_Delta_Force_SD_EP1","US_Delta_Force_Night_EP1","US_Delta_Force_M14_EP1","US_Delta_Force_MG_EP1","US_Delta_Force_Marksman_EP1","US_Delta_Force_Medic_EP1","US_Delta_Force_EP1","US_Delta_Force_Assault_EP1","US_Delta_Force_Air_Controller_EP1","US_Delta_Force_AR_EP1"];
		EVO_e_wheeled = ["M1135_ATGMV_EP1","M1126_ICV_mk19_EP1","M1128_MGS_EP1","M1129_MC_EP1","M1130_CV_EP1","M1126_ICV_M2_EP1","HMMWV_TOW_DES_EP1","HMMWV_MK19_DES_EP1","HMMWV_M998_crows_MK19_DES_EP1","HMMWV_M998_crows_M2_DES_EP1","HMMWV_M998A2_SOV_DES_EP1","HMMWV_M1151_M2_DES_EP1"];
		EVO_e_tracked = ["MLRS_DES_EP1","M2A3_EP1","M2A2_EP1","M1A2_US_TUSK_MG_EP1","M1A1_US_DES_EP1"];
		EVO_e_aa = ["M6_EP1","HMMWV_Avenger_DES_EP1"];
		EVO_e_jets = ["A10_US_EP1"];
		EVO_e_attackhelis = ["AH6J_EP1","AH64D_EP1"];
		EVO_e_transporthelis = ["MH6J_EP1","UH60M_EP1","CH_47F_EP1"];
		EVO_e_transport = ["SUV_UN_EP1","HMMWV_M1035_DES_EP1","MtvrSupply_DES_EP1"];
		EVO_e_supplys = ["MtvrSalvage_DES_EP1","MtvrRepair_DES_EP1","MtvrRefuel_DES_EP1","MtvrReammo_DES_EP1"];
		EVO_e_static = ["M119_US_EP1","M252_US_EP1","TOW_TriPod_US_EP1","MK19_TriPod_US_EP1","M2StaticMG_US_EP1","M2HD_mini_TriPod_US_EP1"];
		EVO_smVehicles = ["ATV_US_EP1","HMMWV_Avenger_DES_EP1","HMMWV_M1151_M2_DES_EP1","HMMWV_MK19_DES_EP1","M1126_ICV_M2_EP1","M1128_MGS_EP1","M2A3_EP1"];
		
		EVO_f_leader = ["TK_Aziz_EP1","TK_Soldier_Officer_EP1","TK_Soldier_SL_EP1"];
		EVO_f_crew = ["TK_Soldier_Pilot_EP1","TK_Soldier_Crew_EP1"];
		EVO_f_soldiers = ["TK_Soldier_TWS_EP1","TK_Soldier_Spotter_EP1","TK_Soldier_Sniper_Night_EP1","TK_Soldier_Sniper_EP1","TK_Soldier_SniperH_EP1","TK_Soldier_AAT_EP1","TK_Soldier_AA_EP1","TK_Soldier_Night_2_EP1","TK_Soldier_Night_1_EP1","TK_Soldier_Medic_EP1","TK_Soldier_MG_EP1","TK_Soldier_LAT_EP1","TK_Soldier_HAT_EP1","TK_Soldier_GL_EP1","TK_Soldier_Engineer_EP1","TK_Soldier_EP1","TK_Soldier_AT_EP1","TK_Soldier_AR_EP1","TK_Soldier_AMG_EP1"];
		EVO_f_specops = ["TK_Special_Forces_TL_EP1","TK_Soldier_TWS_EP1","TK_Special_Forces_MG_EP1","TK_Special_Forces_EP1","TK_Soldier_Sniper_Night_EP1"];
		EVO_f_wheeled = ["UAZ_MG_TK_EP1","UAZ_AGS30_TK_EP1","LandRover_SPG9_TK_EP1","LandRover_MG_TK_EP1","GRAD_TK_EP1","BTR60_TK_EP1","BRDM2_TK_EP1","BRDM2_ATGM_TK_EP1"];
		EVO_f_tracked = ["T72_TK_EP1","T55_TK_EP1","T34_TK_EP1","M113_TK_EP1","BMP2_TK_EP1"];
		EVO_f_aa = ["ZSU_TK_EP1","Ural_ZU23_TK_EP1"];
		EVO_f_jets = ["L39_TK_EP1","Su25_TK_EP1"];
		EVO_f_attackhelis = ["Mi24_D_TK_EP1"];
		EVO_f_transporthelis = ["Mi17_TK_EP1","UH1H_TK_EP1"];
		EVO_f_transport = ["V3S_Open_TK_EP1","UAZ_Unarmed_TK_EP1","UralSupply_TK_EP1"];
		EVO_f_supplys = ["UralReammo_TK_EP1","UralRefuel_TK_EP1","UralRepair_TK_EP1","UralSalvage_TK_EP1"];
		EVO_f_static = ["D30_TK_EP1","Metis_TK_EP1","KORD_high_TK_EP1","KORD_TK_EP1","2b14_82mm_TK_EP1","AGS_TK_EP1"];
		EVO_f_staticaa = ["ZU23_TK_EP1","Igla_AA_pod_TK_EP1"];
	};
#else
if __isBlue then {
		EVO_e_leader = ["RU_Soldier_SL","RU_Soldier_Officer","RU_Commander"];
		EVO_e_crew = ["RU_Soldier_Pilot","RU_Soldier_Crew"];
		EVO_PlayerPilot = ["USMC_Soldier_Pilot","FR_TL","RU_Soldier_Pilot","Ins_Soldier_Pilot","AFR_Soldier_Pilot","MOL_Soldier_Pilot"];
		EVO_e_soldiers = ["RU_Soldier_TL","RU_Soldier_Spotter","RU_Soldier_SniperH","RU_Soldier_Sniper","RU_Soldier_Medic","RU_Soldier_Marksman","RU_Soldier_MG","RU_Soldier_Light","RU_Soldier_LAT","RU_Soldier_HAT","RU_Soldier_GL","RU_Soldier_AT","RU_Soldier_AR","RU_Soldier_AA","RU_Soldier2","RU_Soldier"];
		EVO_e_specops = ["RUS_Commander","RUS_Soldier_GL","RUS_Soldier3","RUS_Soldier2","RUS_Soldier1","RUS_Soldier_Marksman","RUS_Soldier_Sab","RUS_Soldier_TL","MVD_Soldier_TL","MVD_Soldier_Sniper","MVD_Soldier_Marksman","MVD_Soldier_MG","MVD_Soldier_GL","MVD_Soldier_AT","MVD_Soldier"];
		EVO_e_pjtroops = ["RU_Commander","RUS_Commander","RUS_Soldier_GL","RU_Soldier_AA","RU_Soldier_AT","RU_Soldier_Sniper"];
		EVO_e_wheeled = ["UAZ_AGS30_RU","GAZ_Vodnik_HMG","GAZ_Vodnik","BTR90"];
		EVO_e_tracked = ["T90","T72_RU","BMP3"];
		EVO_e_aa = ["2S6M_Tunguska","ZSU_INS"];
		EVO_e_jets = ["Su34","Su39"];
		EVO_e_attackhelis = ["Mi24_V","Mi24_P","Ka52"];
		EVO_e_transporthelis = ["Mi17_rockets_RU"];
		EVO_e_transport = ["UAZ_RU","KamazOpen","Kamaz"];
		EVO_e_supplys = ["KamazRepair","KamazRefuel","KamazReammo"];
		EVO_e_static = ["D30_RU","Metis","KORD_high","KORD","AGS_RU","2b14_82mm"];
		EVO_e_staticaa = ["Igla_AA_pod_East"];
		EVO_smVehicles = ["TT650_Ins","Offroad_DSHKM_Gue","UAZ_MG_INS","UAZ_AGS30_RU","GAZ_Vodnik_HMG","GAZ_Vodnik","BTR90","BMP3"];
	
		EVO_f_leader = ["USMC_Soldier_TL","USMC_Soldier_SL","USMC_Soldier_Officer"];
		EVO_f_soldiers = ["USMC_Soldier_Medic","USMC_Soldier_MG","USMC_Soldier_Light","USMC_Soldier_LAT","USMC_Soldier_HAT","USMC_Soldier_GL","USMC_Soldier_AT","USMC_Soldier_AR","USMC_Soldier_AA","USMC_SoldierS_Spotter","USMC_SoldierS_SniperH","USMC_SoldierS_Sniper","USMC_SoldierS_Engineer","USMC_SoldierS","USMC_SoldierM_Marksman","USMC_Soldier2","USMC_Soldier"];
		EVO_PlayerPilot = ["USMC_Soldier_Pilot","FR_TL","RU_Soldier_Pilot","Ins_Soldier_Pilot","AFR_Soldier_Pilot","MOL_Soldier_Pilot"];
		EVO_f_crew = ["USMC_Soldier_Crew"];
		EVO_f_specops = ["FR_Commander","FR_TL","FR_Sapper","FR_R","FR_Marksman","FR_Light","FR_GL","FR_Corpsman","FR_Assault_R","FR_Assault_GL","FR_AR","FR_AC"];
		EVO_f_wheeled = ["LAV25","HMMWV_TOW","HMMWV_MK19","HMMWV_M2","HMMWV_Armored"];
		EVO_f_tracked = ["M1A2_TUSK_MG","M1A1","AAV"];
		EVO_f_aa = ["HMMWV_Avenger"];
		EVO_f_jets = ["F35B","AV8B2","AV8B","A10"];
		EVO_f_attackhelis = ["AH64D_Sidewinders","AH64D","AH1Z"];
		EVO_f_transporthelis = ["MH60S"];
		EVO_f_transport = ["Mtvr","HMMWV"];
		EVO_f_supplys = ["MtvrRepair","MtvrRefuel","MtvrReammo"];
		EVO_f_static = ["M119","TOW_TriPod","MK19_TriPod","M2StaticMG","M2HD_mini_TriPod","M252","Fort_Nest_M240"];
		EVO_f_staticaa = ["Stinger_Pod"];
	} else {
		EVO_e_leader = ["USMC_Soldier_TL","USMC_Soldier_SL","USMC_Soldier_Officer"];
		EVO_e_soldiers = ["USMC_Soldier_Medic","USMC_Soldier_MG","USMC_Soldier_Light","USMC_Soldier_LAT","USMC_Soldier_HAT","USMC_Soldier_GL","USMC_Soldier_AT","USMC_Soldier_AR","USMC_Soldier_AA","USMC_SoldierS_Spotter","USMC_SoldierS_SniperH","USMC_SoldierS_Sniper","USMC_SoldierS_Engineer","USMC_SoldierS","USMC_SoldierM_Marksman","USMC_Soldier2","USMC_Soldier"];
		EVO_e_crew = ["USMC_Soldier_Crew"];
		EVO_PlayerPilot = ["USMC_Soldier_Pilot","FR_TL","RU_Soldier_Pilot","Ins_Soldier_Pilot","AFR_Soldier_Pilot","MOL_Soldier_Pilot"];
		EVO_e_specops = ["FR_Commander","FR_TL","FR_Sapper","FR_R","FR_Marksman","FR_Light","FR_GL","FR_Corpsman","FR_Assault_R","FR_Assault_GL","FR_AR","FR_AC"];
		EVO_e_wheeled = ["LAV25","HMMWV_TOW","HMMWV_MK19","HMMWV_M2","HMMWV_Armored"];
		EVO_e_tracked = ["M1A2_TUSK_MG","M1A1","AAV"];
		EVO_e_aa = ["HMMWV_Avenger"];
		EVO_e_jets = ["F35B","AV8B2","AV8B","A10"];
		EVO_e_attackhelis = ["AH64D_Sidewinders","AH64D","AH1Z"];
		EVO_e_transporthelis = ["MH60S","UH1Y"];
		EVO_e_transport = ["Mtvr","HMMWV"];
		EVO_e_supplys = ["MtvrRepair","MtvrRefuel","MtvrReammo"];
		EVO_e_static = ["M119","TOW_TriPod","MK19_TriPod","M2StaticMG","M2HD_mini_TriPod","M252","Fort_Nest_M240"];
		EVO_e_staticaa = ["Stinger_Pod"];
		EVO_smVehicles = ["MMT_USMC","HMMWV_Avenger","HMMWV_M2","HMMWV_MK19","LAV25","AAV"];
	
		EVO_f_leader = ["RU_Soldier_SL","RU_Soldier_Officer","RU_Commander"];
		EVO_f_crew = ["RU_Soldier_Crew"];
		EVO_PlayerPilot = ["USMC_Soldier_Pilot","FR_TL","RU_Soldier_Pilot","Ins_Soldier_Pilot","AFR_Soldier_Pilot","MOL_Soldier_Pilot"];
		EVO_f_soldiers = ["RU_Soldier_TL","RU_Soldier_Spotter","RU_Soldier_SniperH","RU_Soldier_Sniper","RU_Soldier_Medic","RU_Soldier_Marksman","RU_Soldier_MG","RU_Soldier_Light","RU_Soldier_LAT","RU_Soldier_HAT","RU_Soldier_GL","RU_Soldier_AT","RU_Soldier_AR","RU_Soldier_AA","RU_Soldier2","RU_Soldier"];
		EVO_f_specops = ["RUS_Commander","RUS_Soldier_GL","RUS_Soldier3","RUS_Soldier2","RUS_Soldier1","RUS_Soldier_Marksman","RUS_Soldier_Sab","RUS_Soldier_TL","MVD_Soldier_TL","MVD_Soldier_Sniper","MVD_Soldier_Marksman","MVD_Soldier_MG","MVD_Soldier_GL","MVD_Soldier_AT","MVD_Soldier"];
		EVO_f_wheeled = ["UAZ_AGS30_RU","GAZ_Vodnik_HMG","GAZ_Vodnik","BTR90"];
		EVO_f_tracked = ["T90","T72_RU","BMP3"];
		EVO_f_aa = ["2S6M_Tunguska","ZSU_INS"];
		EVO_f_jets = ["Su34","Su39"];
		EVO_f_attackhelis = ["Mi24_V","Mi24_P","Ka52"];
		EVO_f_transporthelis = ["Mi17_rockets_RU"];
		EVO_f_transport = ["UAZ_RU","KamazOpen","Kamaz"];
		EVO_f_supplys = ["KamazRepair","KamazRefuel","KamazReammo"];
		EVO_f_static = ["D30_RU","Metis","KORD_high","KORD","AGS_RU","2b14_82mm"];
		EVO_f_staticaa = ["Igla_AA_pod_East"];
	};
#endif

#ifdef __ACE__	//add ace vehicles to the lists
if __isBlue then {
	if (__Takistan) then {EVO_e_wheeled = EVO_e_wheeled + ["ACE_BTR70_TK"]} else {EVO_e_wheeled = EVO_e_wheeled + ["ACE_BRDM2_ATGM_RU","ACE_BRDM2_RU","ACE_Offroad_SPG9_INS"]};
	if (__Chernarus) then {EVO_e_tracked = EVO_e_tracked + ["ACE_T72B_RU","ACE_T72B_INS","ACE_T72BA_RU","ACE_T72BA_INS","ACE_BMP2D_RU"]};
	if (__Takistan) then {EVO_e_aa = EVO_e_aa + ["ACE_BRDM2_SA9_TK"]} else {EVO_e_aa = EVO_e_aa + ["ACE_BRDM2_ATGM_RU","ACE_BRDM2_RU"]};
	if (__Takistan) then {EVO_e_jets = EVO_e_jets + ["ACE_L39_TK_FAB250"]} else {EVO_e_jets = EVO_e_jets + ["ACE_Su27_CAP","ACE_Su27_CAS","ACE_Su27_CASP"]};
	EVO_e_supplys = EVO_e_supplys + ["ACE_KamazRefuel","ACE_KamazRepair","ACE_KamazReammo"];
	
	EVO_f_wheeled = EVO_f_wheeled + ["ACE_Stryker_TOW","ACE_Stryker_MGS_Slat","ACE_Stryker_TOW_MG","ACE_Stryker_ICV_M2","ACE_Stryker_ICV_M2_SLAT","ACE_Stryker_ICV_MK19","ACE_Stryker_ICV_MK19_SLAT","ACE_Stryker_RV","ACE_HMMWV_GMV","ACE_HMMWV_GMV_MK19"];
	EVO_f_tracked = EVO_f_tracked + ["ACE_M113A3","ACE_M2A2_W"];
	EVO_f_aa = EVO_f_aa + ["ACE_Vulcan","ACE_M6A1_W"];
	EVO_f_attackhelis = EVO_f_attackhelis + ["ACE_AH6_GAU19","ACE_AH6","ACE_AH1W_AGM_W","ACE_AH1W_AGM_D"];
	EVO_f_supplys = EVO_f_supplys + ["ACE_MTVRRefuel","ACE_MTVRReammo","ACE_MTVRRepair"];
} else {
	EVO_e_wheeled = EVO_e_wheeled + ["ACE_Stryker_TOW","ACE_Stryker_MGS_Slat","ACE_Stryker_TOW_MG","ACE_Stryker_ICV_M2","ACE_Stryker_ICV_M2_SLAT","ACE_Stryker_ICV_MK19","ACE_Stryker_ICV_MK19_SLAT","ACE_Stryker_RV","ACE_HMMWV_GMV","ACE_HMMWV_GMV_MK19"];
	EVO_e_tracked = EVO_e_tracked + ["ACE_M113A3","ACE_M2A2_W"];
	EVO_e_aa = EVO_e_aa + ["ACE_Vulcan","ACE_M6A1_W"];
	EVO_e_attackhelis = EVO_e_attackhelis + ["ACE_AH6_GAU19","ACE_AH6","ACE_AH1W_AGM_W","ACE_AH1W_AGM_D"];
	EVO_e_supplys = EVO_e_supplys + ["ACE_MTVRRefuel","ACE_MTVRReammo","ACE_MTVRRepair"];
	
	if (__Takistan) then {EVO_f_wheeled = EVO_f_wheeled + ["ACE_BTR70_TK"]} else {EVO_f_wheeled = EVO_f_wheeled + ["ACE_BRDM2_ATGM_RU","ACE_BRDM2_RU","ACE_Offroad_SPG9_INS"]};
	if (__Chernarus) then {EVO_f_tracked = EVO_f_tracked + ["ACE_T72B_RU","ACE_T72B_INS","ACE_T72BA_RU","ACE_T72BA_INS","ACE_BMP2D_RU"]};
	if (__Takistan) then {EVO_f_aa = EVO_f_aa + ["ACE_BRDM2_SA9_TK"]} else {EVO_f_aa = EVO_f_aa + ["ACE_BRDM2_ATGM_RU","ACE_BRDM2_RU"]};
	if (__Takistan) then {EVO_f_jets = EVO_f_jets + ["ACE_L39_TK_FAB250"]} else {EVO_f_jets = EVO_f_jets + ["ACE_Su27_CAP","ACE_Su27_CAS","ACE_Su27_CASP"]};
	EVO_f_supplys = EVO_f_supplys + ["ACE_KamazRefuel","ACE_KamazRepair","ACE_KamazReammo"];
};
#endif

bon_getbackpack_backpacks = ["US_Backpack_EP1","US_Patrol_Pack_EP1","TK_Assault_Pack_EP1","CZ_VestPouch_EP1","US_Assault_Pack_EP1","TK_ALICE_Pack_EP1","CZ_Backpack_EP1","AGS_UN_Bag_EP1","KORD_high_UN_Bag_EP1","KORD_UN_Bag_EP1","M2HD_mini_TriPod_US_Bag_EP1","M2StaticMG_US_Bag_EP1","TK_RPG_Backpack_EP1","MK19_TriPod_US_Bag_EP1","Metis_TK_Bag_EP1","TOW_TriPod_US_Bag_EP1","Tripod_Bag"];
EVO_launchers = ["MAAWS","M47Launcher_EP1","Strela","Stinger","SMAW","RPG7V","RPG18","MetisLauncher","M136",
"Javelin","Igla","ACE_RMG","ACE_RPG22","ACE_RPG27","ACE_RPG29","ACE_RPG7V_PGO7","ACE_RPOM","ACE_RSHG1",
"BAF_NLAW_Launcher","ACE_M72A2","ACE_M72","ACE_M136_CSRS","ACE_Javelin_Direct"]; //include all ace launchers

// Only listing blufor vehicles for lift in EVO Blue.
d_helilift1_types = ["AAV","M1A1","M1A2_TUSK_MG","MLRS",
"BMP2_Ambul_CDF","BMP2_CDF","T72_CDF","ZSU_CDF",
"HMMWV","HMMWV_Ambulance","HMMWV_Armored","HMMWV_Avenger","HMMWV_M2","HMMWV_MK19","HMMWV_TOW",
"LAV25","MTVR","MtvrRepair","MtvrRefuel","MtvrReammo",
"BRDM2_ATGM_CDF","BRDM2_CDF","GRAD_CDF","UAZ_CDF"];

// vehicles that can be lifted
/*
d_helilift1_types = ["ACE_Stryker_ICV_M2","ACE_Stryker_ICV_M2_SLAT","ACE_Stryker_ICV_MK19","M1A1","M1A2_TUSK_MG","BMP2_Ambul_CDF",
"ACE_Stryker_ICV_MK19_SLAT","ACE_Stryker_RV","ACE_Stryker_MGS","ACE_Stryker_MGS_Slat","ACE_Stryker_TOW",
"ACE_Stryker_TOW_MG","ACE_M2A2_D","ACE_M2A2_W","ACE_M6A1_D","ACE_M6A1_W","ACE_Vulcan","M1A2_US_TUSK_MG_EP1",
"M1A1_US_DES_EP1","M1126_ICV_M2_EP1","M1126_ICV_mk19_EP1","M1128_MGS_EP1","M1135_ATGMV_EP1","M2A2_EP1",
"M2A3_EP1","M6_EP1","AAV","LAV25","MLRS","HMMWV_Avenger_DES_EP1","HMMWV_M1151_M2_DES_EP1",
"HMMWV_M998_crows_M2_DES_EP1","HMMWV_M1151_M2_CZ_DES_EP1","LandRover_Special_CZ_EP1",
"HMMWV_M998_crows_MK19_DES_EP1","HMMWV_MK19_DES_EP1","HMMWV_TOW_DES_EP1","M119_US_EP1","HMMWV_Avenger",
"HMMWV_M2","HMMWV_Armored","HMMWV_MK19","HMMWV_TOW","ACE_HMMWV_GMV","ACE_HMMWV_GMV_MK19","M119","M1133_MEV_EP1",
"HMMWV_DES_EP1","HMMWV_M1035_DES_EP1","MTVR_DES_EP1","HMMWV_Ambulance_DES_EP1","MtvrReammo_DES_EP1",
"MtvrRefuel_DES_EP1","MtvrRepair_DES_EP1","LandRover_CZ_EP1","HMMWV_Ambulance_CZ_DES_EP1","MtvrSalvage_DES_EP1",
"LAV25_HQ","HMMWV","MTVR","HMMWV_Ambulance","MtvrReammo","MtvrRefuel","MtvrRepair",
"ACE_MTVRRepair","ACE_MTVRReammo","ACE_MTVRRefuel","BAF_Offroad_D","SUV_PMC_BAF","SUV_PMC","ArmoredSUV_PMC",
"BAF_FV510_W","BAF_Jackal2_GMG_D","BAF_Jackal2_GMG_W","BAF_Jackal2_L2A1_D","BAF_Jackal2_L2A1_W","BAF_Offroad_W",
"BAF_FV510_D","BAF_ATV_D","BAF_ATV_W","M113Ambul_UN_EP1","T72_TK_EP1","T55_TK_EP1","T34_TK_EP1","BMP2_HQ_TK_EP1","BMP2_TK_EP1","M113_TK_EP1","BMP2_Ambul_INS",
"BRDM2_ATGM_TK_EP1","BRDM2_TK_EP1","BTR60_TK_EP1","ZSU_TK_EP1","Ural_ZU23_TK_EP1","GRAD_TK_EP1","BMP3","BTR90",
"BTR90_HQ","GAZ_Vodnik","GAZ_Vodnik_HMG","UAZ_MG_TK_EP1","BTR40_MG_TK_INS_EP1","LandRover_MG_TK_INS_EP1",
"LandRover_MG_TK_EP1","UAZ_AGS30_TK_EP1","LandRover_SPG9_TK_INS_EP1","LandRover_SPG9_TK_EP1","D30_TK_EP1",
"D30_TK_INS_EP1","UAZ_RU","UAZ_AGS30_RU","D30_RU","T55_TK_GUE_EP1","T34_TK_GUE_EP1","BRDM2_TK_GUE_EP1",
"BTR40_MG_TK_GUE_EP1","Ural_ZU23_TK_GUE_EP1","BMP2_Gue","BRDM2_Gue","BRDM2_HQ_Gue","T34",
"Offroad_DSHKM_TK_GUE_EP1","Offroad_SPG9_TK_GUE_EP1","D30_TK_GUE_EP1","Offroad_DSHKM_Gue","Offroad_SPG9_Gue",
"Pickup_PK_GUE","Ural_ZU23_Gue","M113Ambul_TK_EP1","UralSalvage_TK_EP1","UralRepair_TK_EP1","UralRefuel_TK_EP1",
"UralReammo_TK_EP1","V3S_Open_TK_EP1","V3S_TK_EP1","UAZ_Unarmed_TK_EP1","GAZ_Vodnik_MedEvac",
"WarfareSalvageTruck_RU","KamazRepair","KamazRefuel","KamazReammo","ACE_KamazReammo","ACE_KamazRefuel",
"ACE_KamazRepair","Kamaz","KamazOpen","SUV_TK_EP1","SUV_UN_EP1","T90","2S6M_Tunguska","T72_RU"]; //include all ace-types, A2 and OA
*/

//alle fahrzeuge die NICHT in den evo-spawn fallen sollen - also nicht an ort und stelle repariert werden müssen
EVO_spawn_vecs = [
	"tractor","hilux1_civil_3_open","hilux1_civil_2_covered","hilux1_civil_1_open","VWGolf",
	"UAZ_RU","UAZ_INS","UAZ_CDF","TT650_Gue","TT650_Civ","TT650_Ins","MMT_USMC","MMT_Civ",
	"M1030","Lada1","HMMWV","Ikarus_TK_CIV_EP1","Lada1_TK_CIV_EP1",
	"LandRover_CZ_EP1","Lada2_TK_CIV_EP1","hilux1_civil_3_open_EP1","VolhaLimo_TK_CIV_EP1",
	"UAZ_Unarmed_UN_EP1","UAZ_Unarmed_TK_EP1","UAZ_Unarmed_TK_CIV_EP1","TT650_TK_EP1",
	"TT650_TK_CIV_EP1","SUV_UN_EP1","SUV_TK_EP1","LandRover_TK_CIV_EP1","SUV_TK_CIV_EP1",
	"Old_moto_TK_Civ_EP1","Old_bike_TK_INS_EP1","ATV_CZ_EP1","ATV_US_EP1","HMMWV_Ambulance_CZ_DES_EP1",
	"Old_bike_TK_CIV_EP1","M1030_US_DES_EP1","HMMWV_M1035_DES_EP1","HMMWV_DES_EP1","BAF_Offroad_W",
	"BAF_Offroad_D","BAF_ATV_D","BAF_ATV_W","SUV_PMC_BAF","SUV_PMC"
];
//alle fahrzeuge die KOMPLETT aus dem evo system fallen sollen, also ohne respawn oder ein eigenes respawnsystem enutzen
//for example, medivacs used as mobile spawn or lift choppers, transport choppers...
EVO_own_spawn_system_vecs = ["Mi17_medevac_CDF","Mi17_medevac_RU","LAV25_HQ","BTR90_HQ",
	"Mi17_Ins","BTR90_HQ","Mi171Sh_CZ_EP1","Mi17_rockets_RU"
];
// editor varname, unique number, true = respawn only when the chopper is completely destroyed, false = respawn after some time when no crew is in or chopper is destroyed
init_lift_choppers = {
	{
		_vec_a = _x;
		_vehicle = _vec_a select 0;
		_number_v = _vec_a select 1;
		_vehicle setVariable ["d_vec", _number_v, true];
	} forEach [[ch1,301],[ch2,302],[ch3,303],[ch4,304],[ch5,305],[ch6,306],[ch7,307]];
};
// editor varname, unique number, true = respawn only when the chopper is completely destroyed, false = respawn after some time when no crew is in or chopper is destroyed
if (isServer) then {
	[[ch1,301,false,120],[ch2,302,false,120]] execVM "server\x_helirespawn2.sqf";
	[[ch3,303,false,240],[ch7,307,false,240]] execVM "server\x_helirespawn3.sqf";
	[[ah12,308,false,120]] execVM "awg\x_awgespawn2.sqf"; //Admin Choppers
};

[[5,5,0],[0,0,0,false],["NONE", "PRESENT", true], ["X_JIPH getVariable 'EVO_broken_spawn' >= 2", "psy = [] execVM 'client\loosing.sqf'", ""]] call XfCreateTrigger;