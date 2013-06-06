// player spawn script
#include "setup.sqf"
#define __condition_night (daytime > 20.50 || daytime < 4.15)
#define __condition_winter (X_JIPH getVariable 'e_winterw' == 1)
private ["_p","_outnum","_name","_light"];
__waitpl;
_p = player;
_pos = getPos _p;
_p setVeloCity [0,0,0]; 
_p setPos [getPos _p select 0,getPos _p select 1, 0.05];

define_ing = {
	private ["_strp"];
	_strp = str(player);
	if (_strp in ["evo_eng_1","evo_eng_2","evo_eng_3","evo_eng_4"]) then {
		switch (true) do {
			case (_strp == "evo_eng_1") : {EVO_EngZone = reng1; reng1 setVariable ["EVO_ing",evo_eng_1,true]};
			case (_strp == "evo_eng_2") : {EVO_EngZone = reng2; reng2 setVariable ["EVO_ing",evo_eng_2,true]};
			case (_strp == "evo_eng_3") : {EVO_EngZone = reng3; reng3 setVariable ["EVO_ing",evo_eng_3,true]};
			case (_strp == "evo_eng_4") : {EVO_EngZone = reng4; reng4 setVariable ["EVO_ing",evo_eng_4,true]};
		};
	};
};

_p addEventHandler ["hit", {
	if (side (_this select 1) == (EVO_enemy_side call EVO_getfunc_Store)) then {
		EVO_fattack = true;
		[] spawn {
			waitUntil {(!alive (vehicle player)) || (getDammage player == 0)};
			if (!alive (vehicle player)) exitWith {EVO_fattack = false};
			if (EVO_fattack) then {
				_med = objNull;
				_obj = (vehicle player) nearObjects 8;
				{if (__kind(_x) "US_Soldier_Medic_EP1" or __kind(_x) "FR_Corpsman" or __kind(_x) "USMC_Soldier_Medic" or __kind(_x) "US_Delta_Force_Medic_EP1" or __kind(_x) "GER_Soldier_Medic_EP1" or __kind(_x) "RU_Soldier_Medic" or __kind(_x) "TK_Soldier_Medic_EP1" or __kind(_x) "MASH") then {
						_med = _x;
						if ((!isNull _med) and (!local _med)) then {_med call EVO_Mrew};
					}
				} forEach _obj;
				EVO_fattack = false;
			};
		};
	}
}];

#ifndef __A2__
_p addMPEventHandler ["MPkilled",{if (isServer) then {_this call checkTK}}];
#else
_p addEventHandler ["killed", {["checkTK", _this] call XNetCallEvent}];
#endif
_p addEventHandler ["killed", {
	_handlee = [(_this select 0),(_this select 1)] execVM "client\killcam.sqf";
}];


player addeventhandler ["hit",{
		_hit = _this select 2;
		_sqf = [0.5 + _hit] spawn bis_ew_fnc_screen;
		"dynamicblur" ppeffectenable true;
		"dynamicblur" ppeffectadjust [1];
		"dynamicblur" ppeffectcommit 0;
		"dynamicblur" ppeffectadjust [0];
		"dynamicblur" ppeffectcommit (1 + random 1);
}];
player addeventhandler ["killed",{
	[] spawn {
		for "_i" from 0 to 5 do {_sqf = [1] spawn bis_ew_fnc_screen; sleep 0.1;};
	};
}];
player addeventhandler ["animchanged",{
	_anim = _this select 1;
	if (_anim in [
		"amovppnemstpsraswrfldnon_amovppnemevaslowwrfldl",
		"amovppnemstpsraswrfldnon_amovppnemevaslowwrfldr"
	]) then {
		sqf = [1,true] spawn bis_ew_fnc_screen;
	};
}];
#ifndef __A2__
removeBackpack player;
#endif

if (E_loadout == 0) then {
	EVO_pweapons = weapons player;
	EVO_pammo = magazines player;
	EVO_pitems = items player;
};

[0] call loadout;
_first_run = true;
_name = vehicleVarName player;
#ifdef __ACE__
ace_chute = {backbox1 addWeaponCargo ["ACE_ParachutePack",5]};
#endif

if (E_spawn == 1) then {[player] execVM "common\bon_ais\init_ais.sqf"};

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do {
	waitUntil {alive player};
	_p = player;
	if ((E_with_respawn_dlg == 1) && (!_first_run)) then {[] spawn x_dlgopen};
	if (__condition_night || __condition_winter) then {
		[_p, 0.03] execVM "client\foggy_breath.sqf";
	};
	/*
	#ifndef __ACE__
	if (__condition_night) then {
		_light = "#lightpoint" createVehicleLocal getpos _p; //inspired by ACE Mod
		#ifdef __RED__
		_light setLightBrightness 0.0022;
		_light setLightColor [0.9,0.1,0.1];
		_light setLightAmbient [0.1,0.01,0.01];
		#else
		_light setLightBrightness 0.0028;
		_light setLightColor [0.1,0.1,0.9];
		_light setLightAmbient [0.01,0.01,0.1];	
		#endif
		_light attachTo [_p, [-0.025,-0.05,0.05], "LeftShoulder"];
	};
	#endif
	*/
	player setVehicleVarName _name;
	[1] call loadout;
	_p setSkill EVO_PlayerSkill;
	setViewDistance EVO_vdist;
	#ifndef __ACE__
	if (daytime > 19.75 || daytime < 4.15) then {_p action ["NVGoggles",_p]};
	#endif
	#ifdef __BLUE__
		if (__kindp "US_Soldier_Medic_EP1" or __kindp "FR_Corpsman" or __kindp "USMC_Soldier_Medic" or __kindp "US_Delta_Force_Medic_EP1" or __kindp "GER_Soldier_Medic_EP1") then {_actionId8 = player addAction [localize "STR_a_medic" call XGreyText, "client\mash.sqf",1,1, false, true,"test2"]};
		if (__kindp "US_Soldier_Engineer_EP1" or __kindp "FR_Sapper" or __kindp "USMC_SoldierS_Engineer") then {_actionId8 = player addAction [localize "STR_a_ing" call XGreyText, "client\farp.sqf",2,1, false, true,"test2"]; player call define_ing;};
		if (__kindp "US_Soldier_GL_EP1" or __kindp "USMC_Soldier_GL") then {_actionId8 = player addAction [localize "STR_a_gren" call XGreyText, "client\eierwerfer.sqf",0,1, false, true,"test2"]};
		if (__kindp "US_Soldier_AA_EP1" or __kindp "USMC_Soldier_AA") then {_actionId8 = player addAction [localize "STR_a_aa" call XGreyText, "client\aatent.sqf",0,1, false, true,"test2"]};
		if (__kindp "US_Soldier_HAT_EP1" or __kindp "USMC_Soldier_HAT") then {_actionId8 = player addAction [localize "STR_a_tow" call XGreyText, "client\attent.sqf",0,1, false, true,"test2"]};
		if (__kindp "GER_Soldier_MG_EP1" or __kindp "US_Soldier_MG_EP1" or __kindp "USMC_Soldier_MG") then {_actionId8 = player addAction [localize "STR_a_mg" call XGreyText, "client\mgtent.sqf",0,1, false, true,"test2"]};
		if (__kindp "US_Soldier_Spotter_EP1" or __kindp "USMC_SoldierS_Spotter") then {_actionId8 = player addAction [localize "STR_a_arti" call XGreyText, "client\artytent.sqf",0,1, false, true,"test2"]};
		if (__kindp "FR_Sapper" or __kindp "FR_Assault_R" or __kindp "GER_Soldier_EP1" or __kindp "US_Delta_Force_EP1") then {_actionId9 = player addAction [localize "STR_a_halo" call XGreyText, "client\parajump.sqf",0,1, false, true,"test2"]};
	#endif
	#ifdef __RED__
		if (__kindp "RU_Soldier_Medic" or __kindp "TK_Soldier_Medic_EP1") then {_actionId8 = player addAction [localize "STR_a_medic" call XGreyText, "client\mash.sqf",0,1, false, true,"test2"]};
		if (__kindp "RUS_Soldier_Sab" or __kindp "TK_Soldier_Engineer_EP1") then {_actionId8 = player addAction [localize "STR_a_ing" call XGreyText, "client\farp.sqf",0,1, false, true,"test2"]; player call define_ing;};
		if (__kindp "RU_Soldier_GL" or __kindp "TK_Soldier_GL_EP1") then {_actionId8 = player addAction [localize "STR_a_gren" call XGreyText, "client\eierwerfer.sqf",0,1, false, true,"test2"]};
		if (__kindp "RU_Soldier_AA" or __kindp "TK_Soldier_AA_EP1") then {_actionId8 = player addAction [localize "STR_a_aa" call XGreyText, "client\aatent.sqf",0,1, false, true,"test2"]};
		if (__kindp "RU_Soldier_HAT" or __kindp "TK_Soldier_HAT_EP1") then {_actionId8 = player addAction [localize "STR_a_tow" call XGreyText, "client\attent.sqf",0,1, false, true,"test2"]};
		if (__kindp "RU_Soldier_MG" or __kindp "MVD_Soldier_MG" or __kindp "TK_Soldier_MG_EP1") then {_actionId8 = player addAction [localize "STR_a_mg" call XGreyText, "client\mgtent.sqf",0,1, false, true,"test2"]};
		if (__kindp "RU_Soldier_Spotter" or __kindp "TK_Soldier_Spotter_EP1") then {_actionId8 = player addAction [localize "STR_a_arti" call XGreyText, "client\artytent.sqf",0,1, false, true,"test2"]};
		if (__kindp "RUS_Soldier1" or __kindp "MVD_Soldier" or __kindp "TK_Special_Forces_EP1") then {_actionId9 = player addAction [localize "STR_a_halo" call XGreyText, "client\parajump.sqf",0,1, false, true,"test2"]};
	#endif
	_actionId8 = player addAction [localize "STR_a_trench" call XGreyText, "client\trench.sqf",0,1, false, true,"test2"];
	{[_x] call EVO_AmmoBox} forEach [ammobox1,ammobox2,ammobox3,ammobox4];
	#ifdef __ACE__
	[] call ace_chute;
	#endif
	if __Tcondition  then {
		_actionIdTomi = player addAction [localize "STR_a_tomi" call XRedText, "client\checklaunch.sqf",[],0, false, true];
	};
	if __PsyCondition then {_psy = [player] execVM "client\CB_debug_psycho.sqf"};
	sleep 1;
	execVM "login.sqf";
	#ifdef __BLUE__
	_actionId = player addAction [localize "STR_a_chq" call XBlueText, "dialogs\open_maindialogs.sqf",[],0, false, true];
	#else
	_actionId = player addAction [localize "STR_a_chq" call XRedText, "dialogs\open_maindialogs.sqf",[],0, false, true];
	#endif
	[player] spawn {
		private ["_killed"];
		_killed = _this select 0;
		//_old_light = _this select 1;
		waitUntil {!alive player};
		sleep 20 + (random 15);
		deleteVehicle _killed;
		//deleteVehicle _old_light;
	};
	player setVariable ["EVO_passenger",Nil];
	
	if (!_first_run) then {
		sleep 2;
		[] spawn EVO_topic_info_spawn;
	};
	
	waitUntil {!alive player};
	if (_first_run) then {_first_run = false};
};