//by psycho
if (isServer) then {
#ifdef __ACE__
ace_sys_aitalk_enabled = true;
publicVariable "ace_sys_aitalk_enabled";
ace_sys_aitalk_radio_enabled = true;
publicVariable "ace_sys_aitalk_radio_enabled";
ace_sys_tracking_markers_enabled = false;
publicVariable "ace_sys_tracking_markers_enabled";
ace_sys_repair_default_tyres = true;
publicVariable "ace_sys_repair_default_tyres";
#endif

EVO_disconnected_players = [];
__cppfln(p_c,server\p_connected.sqf);
__cppfln(p_d,server\p_disconnected.sqf);
onPlayerConnected {[_name,_uid] call p_c};
onPlayerDisconnected {[_name,_uid] call p_d};
execVM "server\func\serverfunctions.sqf";
__cppfln(EVO_spawnCrew,server\func\spawncrew.sqf);
__cppfln(EVO_spawn_vehicle,server\func\spawnvehicle.sqf);
__cppfln(EVO_taskDefend,server\func\taskDefend.sqf);
__cppfln(EVO_taskAttack,server\func\taskAttack.sqf);
__cppfln(EVO_taskPatrol,server\func\taskPatrol.sqf);
__cppfln(EVO_town_defenders,server\defenders_town.sqf);
__cppfln(EVO_radio_defenders,server\defenders_radio.sqf);
__cppfln(EVO_officer_defenders,server\defenders_officer.sqf);
__cppfln(x_checktransport,server\x_checktransporter.sqf);
__cppfln(EVO_deleteGrp,common\deleteGroups.sqf);
__cppfln(EVO_air_cargodrop,server\air_cargodrop.sqf);
__cppfln(checkTK,server\checkTK.sqf);

d_allunits_add = [];
execFSM "fsms\GroupClean.fsm";
execFSM "fsms\NotAliveRemover.fsm";


#ifndef __Takistan__
EVO_mapcenter = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
#else
// workaround for Takistan, the island center of Takistan is located at the airfield in the south ^^
EVO_mapcenter = [6481.51,6506.95,300];
#endif
e_island_x_max = (EVO_mapcenter select 0) * 2;
e_island_y_max = (EVO_mapcenter select 1) * 2;

["acc_mt_clear",false] call XNetSetJIP;
["current_target_index",-1] call XNetSetJIP;
["mt_radio_down",false] call XNetSetJIP;
["EVO_acc_radio",""] call XNetSetJIP;
["mt_officer_status",0] call XNetSetJIP;
["enemy_air_presence",false] call XNetSetJIP;
["mr1_in_air",false] call XNetSetJIP;
["mr2_in_air",false] call XNetSetJIP;
["EVO_end_is_near",false] call XNetSetJIP;
["friendly_was_near",false] call XNetSetJIP;
_currentTime = DayTime;
["EVO_currentTime",_currentTime] call XNetSetJIP;
["MHQ_is_locked",false] call XNetSetJIP;
["AHQ_is_locked",false] call XNetSetJIP;
evo_broken_spawn_num = 0;
["EVO_broken_spawn",0] call XNetSetJIP;


if (E_fastTime != 0) then {
	private ["_param"];
	switch (E_fastTime) do {
		case (1) : {_param = 0.00052};
		case (2) : {_param = 0.00104};
		case (3) : {_param = 0.00208};
	};
	[_param] execFSM "fsms\fastTime.fsm";
};

if (E_weather == 1 && E_fastTime == 0) then {
	_ranover = random 1;
	["e_overcast",_ranover] call XNetSetJIP;
	_ww = if (_ranover > 0.5) then {if (rain <= 0.3) then {1} else {2}} else {0};
	#ifdef __Chernarus__
	["e_winterw", _ww] call XNetSetJIP;
	#else
	["e_winterw", 0] call XNetSetJIP;
	#endif
	execFSM "fsms\WeatherServer.fsm";
} else {
	E_weather = 0;
	["e_overcast",0] call XNetSetJIP;
};
if (E_weathereffects == 1) then {
#ifdef __Takistan__
execFSM "fsms\moveSand.fsm"};
#else
execFSM "fsms\moveFog.fsm"};
#endif


};