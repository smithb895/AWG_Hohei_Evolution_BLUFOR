if (X_Client) then {
[] spawn {
	waitUntil {!isNull player};
	execVM "client\notes.sqf";
};

#ifndef __DEBUG__
	_intro = player execVM "client\intro.sqf";
#else
	//_psy = [] execVM "showclass.sqf";
	_psy = [player] execVM "cb_mapswitch.sqf";
	EVO_intro_done = true;
#endif
__pSetVar ["BIS_noCoreConversations", true];

Mpage =[true,false,false,false,false];
CB_Trun = false;
CB_setfire = false;
EVO_breath_script_in_progress = false;
request_is_set = false;

EVO_p_entities = ["evo_med_1","evo_med_2","evo_med_3","evo_med_4","evo_at_1","evo_at_2","evo_at_3","evo_at_4","evo_mg_1","evo_mg_2","evo_mg_3","evo_mg_4","evo_eng_1","evo_eng_2","evo_eng_3","evo_eng_4","evo_arti_1","evo_arti_2","","evo_arti_3","evo_arti_4","evo_so_1","evo_so_2","evo_so_3","evo_so_4","evo_gl_1","evo_gl_2","evo_gl_3","evo_gl_4","evo_aa_1","evo_aa_2","evo_aa_3","evo_aa_4"];
EVO_all_spawn_hints = ["topic_dyk_tomi","topic_dyk_rank","topic_dyk_rt","topic_dyk_hq","topic_dyk_med2","topic_dyk_med1","topic_dyk_eng1","topic_dyk_eng2","topic_dyk_laser","topic_dyk_box","topic_dyk_shipping"];

bmark = createMarkerLocal ["support_marker_location", [0,0,0]];
bmark setMarkerShapeLocal "ELLIPSE";
bmark setMarkerColorLocal "ColorBlack";
bmark setMarkerSizeLocal [0.1, 0.1];

#ifdef __Takistan__
switch (true) do {
	case (__OAonly and __isBlue) : {
		EVO_reptruck = "MtvrRepair_DES_EP1";
		EVO_ammotruck = "MtvrReAmmo_DES_EP1";
		EVO_medivacs = "HMMWV_Ambulance_DES_EP1";	
	};
	case (__COver and __isBlue) : {
		EVO_reptruck = "MtvrRepair_DES_EP1";
		EVO_ammotruck = "MtvrReAmmo_DES_EP1";
		EVO_medivacs = "HMMWV_Ambulance_DES_EP1";	
	};
	case (__OAonly and __isRed) : {
		EVO_reptruck = "UralRepair_TK_EP1";
		EVO_ammotruck = "UralReAmmo_TK_EP1";
		EVO_medivacs = "S1203_ambulance_EP1";	
	};
	case (__COver and __isRed) : {
		EVO_reptruck = "UralRepair_TK_EP1";
		EVO_ammotruck = "UralReAmmo_TK_EP1";
		EVO_medivacs = "GAZ_Vodnik_MedEvac";	
	};
};
#else
switch (true) do {
	case (__A2only and __isBlue) : {
		EVO_reptruck = "MtvrRepair";
		EVO_ammotruck = "MtvrReAmmo";
		EVO_medivacs = "HMMWV_Ambulance";	
	};
	case (__COver and __isBlue) : {
		EVO_reptruck = "MtvrRepair";
		EVO_ammotruck = "MtvrReAmmo";
		EVO_medivacs = "HMMWV_Ambulance";	
	};
	case (__A2only and __isRed) : {
		EVO_reptruck = "KamazRepair";
		EVO_ammotruck = "KamazReAmmo";
		EVO_medivacs = "GAZ_Vodnik_MedEvac";	
	};
	case (__COver and __isRed) : {
		EVO_reptruck = "KamazRepair";
		EVO_ammotruck = "KamazReAmmo";
		EVO_medivacs = "GAZ_Vodnik_MedEvac";	
	};
};
#endif

__cppfln(loadout,client\func\loadout.sqf);
__cppfln(EVO_AssignTasks,client\func\common_func.sqf);
__cppfln(EVO_tentbox,client\func\tentbox.sqf);
__cppfln(EVO_dropbox,client\func\EVO_dropbox.sqf);
__cppfln(EVO_listBox,dialogs\listBox_update.sqf);
__cppfln(bis_ew_fnc_screen,client\func\fn_screen.sqf);
__cppfln(x_dlgopen,dialogs\tele\x_open.sqf);
__cppfln(BI_fnc_infoText,client\func\fn_infoText.sqf);
__cppfln(fastTime,client\func\c_fastTime.sqf);
__cppfln(EVO_ranked_boarding,client\func\boarding_check.sqf);
#ifndef __ACE__
__cppfln(EVO_ammobox,client\func\EVO_ammobox.sqf);
#else
__cppfln(EVO_ammobox,client\func\EVO_ammobox_ace.sqf);
#endif
__ccppfln(client\func\x_perframe.sqf);

//----------------------------------------------------alles ab hier muss auf die init von allen funktionen warten
[] call EVO_AssignTasks;

[] spawn {
	waitUntil {!isNil {__XJIPGetVar(e_overcast)}};
	e_lastovercast = __XJIPGetVar(e_overcast);
	0 setOvercast e_lastovercast;
	if (E_weather == 1 && E_fastTime == 0) then {
		execFSM "fsms\WeatherClient.fsm";
		#ifdef __Chernarus__
		if (E_WithWinterWeather == 1) then {
			execVM "client\weather_winter.sqf";
		};
		#endif
	} else {
		if (E_fastTime != 0) then {E_weather = 0};
	};
};
if (E_weathereffects == 1) then {
#ifdef __Takistan__
execVM "client\sandstorm.sqf"};
#else
execVM "client\fog.sqf"};
#endif

[] spawn {
	__waitpl;
	_strp = str(player);
	_allmedics = ["US_Soldier_Medic_EP1","FR_Corpsman","USMC_Soldier_Medic","US_Delta_Force_Medic_EP1","GER_Soldier_Medic_EP1","RU_Soldier_Medic","TK_Soldier_Medic_EP1"];
	if (_strp in ["evo_med_1","evo_med_2","evo_med_3","evo_med_4"]) then {
		_med = player execVM "client\markwounded.sqf";
	};
	if (_strp in ["evo_eng_1","evo_eng_2","evo_eng_3","evo_eng_4"]) then {
		switch (true) do {
			case (_strp == "evo_eng_1") : {EVO_EngZone = reng1; reng1 setVariable ["EVO_ing",evo_eng_1,true]};
			case (_strp == "evo_eng_2") : {EVO_EngZone = reng2; reng2 setVariable ["EVO_ing",evo_eng_2,true]};
			case (_strp == "evo_eng_3") : {EVO_EngZone = reng3; reng3 setVariable ["EVO_ing",evo_eng_3,true]};
			case (_strp == "evo_eng_4") : {EVO_EngZone = reng4; reng4 setVariable ["EVO_ing",evo_eng_4,true]};
		};
	};
};

// chopper varname, type (0 = lift chopper, 1 = wreck lift chopper, 2 = normal chopper), marker name, unique number, marker type, marker color, marker text, chopper display name
d_choppers = [
	["ch1",0,"chopper1",301,"n_air","ColorWhite","Lift 1","Lift One"],
	["ch2",0,"chopper2",302,"n_air","ColorWhite","Lift 2","Lift Two"],
	["ch3",0,"chopper3",303,"n_air","ColorWhite","Lift 3","Lift Three"],
	["ch4",2,"chopper4",304,"n_air","ColorWhite","4","Transport One"],
	["ch5",2,"chopper5",305,"n_air","ColorWhite","5","Transport Two"],
	["ch6",2,"chopper6",306,"n_air","ColorWhite","6","Transport Three"]
];
for "_i" from 0 to (count d_choppers - 1) do {
	_elem = d_choppers select _i;
	switch (_elem select 1) do {
		case 0: {_elem set [count _elem, d_helilift1_types]};
	};
};
d_chophud_on = true;
d_show_chopper_welcome = true;

//....warte mit der initialisierung der sekundären funktionen....
waitUntil {time > 1};
#ifdef __BETA__
kick = false;
if (isMultiplayer) then {
	kick = if (!(getPlayerUID vehicle player in __betalist)) then {true} else {false};
};
_end = [[5,1,0], [0, 0, 0, false], ["NONE", "PRESENT", true], ["kick", "", ""]] call XfCreateTrigger;
_end setTriggerType "END6";
#endif
#ifndef __A2__
	if __isBlue then {
		ammobox1 = "USVehicleBox_EP1" createVehicleLocal getmarkerpos "ammob1";ammobox1 setpos getmarkerpos "ammob1"; __sleep;
		ammobox2 = "USVehicleBox_EP1" createVehicleLocal getmarkerpos "ammob3";ammobox2 setpos getmarkerpos "ammob2"; __sleep;
		ammobox3 = "USVehicleBox_EP1" createVehicleLocal getmarkerpos "ammob5";ammobox3 setpos getmarkerpos "ammob3"; __sleep;
		ammobox4 = "USVehicleBox_EP1" createVehicleLocal getmarkerpos "ammob6";ammobox4 setpos getmarkerpos "ammob4"; __sleep;
	} else {
		ammobox1 = "TKVehicleBox_EP1" createVehicleLocal getmarkerpos "ammob1";ammobox1 setpos getmarkerpos "ammob1"; __sleep;
		ammobox2 = "TKVehicleBox_EP1" createVehicleLocal getmarkerpos "ammob3";ammobox2 setpos getmarkerpos "ammob2"; __sleep;
		ammobox3 = "TKVehicleBox_EP1" createVehicleLocal getmarkerpos "ammob5";ammobox3 setpos getmarkerpos "ammob3"; __sleep;
		ammobox4 = "TKVehicleBox_EP1" createVehicleLocal getmarkerpos "ammob6";ammobox4 setpos getmarkerpos "ammob4"; __sleep;
	};
#else
	if __isBlue then {
		ammobox1 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob1";ammobox1 setpos getmarkerpos "ammob1"; __sleep;
		ammobox2 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob3";ammobox2 setpos getmarkerpos "ammob2"; __sleep;
		ammobox3 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob5";ammobox3 setpos getmarkerpos "ammob3"; __sleep;
		ammobox4 = "USVehicleBox" createVehicleLocal getmarkerpos "ammob6";ammobox4 setpos getmarkerpos "ammob4"; __sleep;
	} else {
		ammobox1 = "RUVehicleBox" createVehicleLocal getmarkerpos "ammob1";ammobox1 setpos getmarkerpos "ammob1"; __sleep;
		ammobox2 = "RUVehicleBox" createVehicleLocal getmarkerpos "ammob3";ammobox2 setpos getmarkerpos "ammob2"; __sleep;
		ammobox3 = "RUVehicleBox" createVehicleLocal getmarkerpos "ammob5";ammobox3 setpos getmarkerpos "ammob3"; __sleep;
		ammobox4 = "RUVehicleBox" createVehicleLocal getmarkerpos "ammob6";ammobox4 setpos getmarkerpos "ammob4"; __sleep;
	};
#endif
ammobox1 addAction [localize "STR_a_sl" call XYellowText, "client\func\saveloadout.sqf"];
player reveal ammobox1;

if (!__A2only and !__ACEver) then {
	backbox1 = "Misc_Backpackheap_EP1" createVehicleLocal getmarkerpos "backbox1";backbox1 setpos getmarkerpos "backbox1";
	backbox1 addAction [localize "STR_a_gbp" call XGreyText,"dialogs\openmenu_backpack.sqf"];
	player reveal backbox1; backbox1 allowDamage false;
};
if (__ACEver) then {
#ifdef __BLUE__
_boxclass = "ACE_RuckBox_West";
#else
_boxclass = "ACE_RuckBox_East";
#endif
	backbox1 = _boxclass createVehicleLocal getmarkerpos "backbox1";backbox1 setpos getmarkerpos "backbox1";
	player reveal backbox1; backbox1 allowDamage false;
	backbox1 addAction [localize "STR_a_sl" call XYellowText, "client\func\saveloadout.sqf"];
};

{_x allowDamage false; [_x] call EVO_AmmoBox} forEach [ammobox1,ammobox2,ammobox3,ammobox4];

waitUntil {time > 5};

execVM "client\launchT.sqf";
execVM "client\mobilemarker.sqf";
player setVariable ["EVO_passenger",Nil];

#ifndef __A2__
_pos1 = [(getpos Evo_Baseflag_MHQ select 0),(getpos Evo_Baseflag_MHQ select 1),1.0];
_pos2 = [(getpos Evo_Baseflag_AHQ select 0),(getpos Evo_Baseflag_AHQ select 1),1.0];
_pos3 = [(getpos EVO_heli_repair select 0),(getpos EVO_heli_repair select 1),1.0];
_pos4 = [(getpos EVO_jet_repair select 0),(getpos EVO_jet_repair select 1),1.0];
_head1 = localize "STR_a_mhq";
_head2 = localize "STR_a_ahq";
_head3 = localize "STR_i_chrep";
_head4 = localize "STR_i_jetrep";
[format ["<t color='%1' size='1.5'>%2</t>",EVO_grey,_head1 + "<br/><img image='pictures\mhq.paa'/>"],_pos1,14,0.5] spawn credits_3d; //old: bis_fnc_3Dcredits
[format ["<t color='%1' size='1.5'>%2</t>",EVO_grey,_head2 + "<br/><img image='pictures\airhq.paa'/>"],_pos2,14,0.5] spawn credits_3d;
[format ["<t color='%1' size='1.5'>%2</t>",EVO_blue,_head3],_pos3,20,2] spawn credits_3d;
[format ["<t color='%1' size='1.5'>%2</t>",EVO_blue,_head4],_pos4,20,2] spawn credits_3d;
#endif

//sm
#ifdef __Takistan__
	EVO_all_smpos = [
		[802.20313,10546.621,0],
		[4213.8892,7697.1221,0],
		[1534.9053,8743.1865,0],
		[1183.8677,7419.1943,0],
		[6584.1157,4458.5137,0],
		[7081.8325,6379.6738,0],
		[11471.84,8196.2969,0],
		[9638.2168,6287.8262,0],
		[11944.437,2659.0198,0],
		[8730.1895,1720.4028,0],
		[7333.6289,221.19321,0],
		[6457.168,2394.0647,0],
		[6595.4717,3706.7732,0],
		[4528.8594,4446.4121,0],
		[8366.5049,11049.821,0],
		[12191.052,11175.096,0],
		[10465.999,10841.428,0],
		[9831.3936,8137.2988,0],
		[6671.5068,9489.5156,0],
		[4653.2573,12397.048,0]
	];
#endif

EVO_get_random_smPos = {
	_num = count EVO_all_smpos;
	_pos = EVO_all_smpos select (round (random _num - 1));
	_pos
};

#ifndef __A2__
[] spawn {
	waitUntil {!isNil "bis_fnc_init"};
	["ca\missions_pmc\data\ui_gps_ca.paa",-0.05,0.16] call bis_fnc_customGPS;
};
#endif

#ifndef __A2__
	_shield = "ProtectionZone_Ep1" createVehicleLocal (getMarkerPos "base");
	_shield setPos (getMarkerPos "base");
	_shield setObjectTexture [0,"#(argb,8,8,3)color(0,0,0,0,ca)"];
#endif

[[5,10,0],[0,0,0,false],["NONE", "PRESENT", true], ["vehicle player != player and local player", "thisvec = vehicle player; smenu = thisvec addaction [localize 'STR_M04t51' call XgreyText, 'client\crew.sqf',0,1, false, true,'test2'];", "thisvec removeaction smenu"]] call XfCreateTrigger;

[[5,5,0], [0, 0, 0, false], ["NONE", "PRESENT", true], ["call x_ffunc", "actionID1 = player addAction ['Unflip Vehicle' call XGreyText, 'client\unflipVehicle.sqf',[EVO_objectID1],-1,false];", "player removeAction actionID1"]] call XfCreateTrigger;

_strp = str(player);
if (_strp in ["evo_eng_1","evo_eng_2","evo_eng_3","evo_eng_4"]) then {
	[[5,5,0],[0,0,0,false],["NONE", "PRESENT", true], ["call x_sfunc_specivec", "actionID3 = player addAction ['Lock/Unlock Repair-Truck' call XGreyText, 'client\englock.sqf',[],-1,false]", "player removeAction actionID3"]] call XfCreateTrigger;
};
if (_strp in ["evo_med_1","evo_med_2","evo_med_3","evo_med_4"]) then {
	[[5,5,0],[0,0,0,false],["NONE", "PRESENT", true], ["call x_sfunc_specivec", "actionID3 = player addAction ['Lock/Unlock MEV' call XGreyText, 'client\englock.sqf',[],-1,false]", "player removeAction actionID3"]] call XfCreateTrigger;
};
if (_strp in ["evo_arti_1","evo_arti_2","evo_arti_3","evo_arti_4"]) then {
	[[5,5,0],[0,0,0,false],["NONE", "PRESENT", true], ["call x_sfunc_specivec", "actionID3 = player addAction ['Lock/Unlock Ammo-Truck' call XGreyText, 'client\englock.sqf',[],-1,false]", "player removeAction actionID3"]] call XfCreateTrigger;
};

//jips
if (E_fastTime != 0) then {[] spawn fastTime};

[] spawn {
	waitUntil {!isNull player};
	while {true} do {
		{[_x] execVM "common\Cargo_Drop\InitAction.sqf";} forEach (nearestObjects [player, ["Air"], 30]);
		sleep 6;
	};
};
execFSM "fsms\checkForAdmin.fsm";

};