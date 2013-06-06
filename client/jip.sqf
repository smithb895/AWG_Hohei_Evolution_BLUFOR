//by psycho
#include "setup.sqf"
if (!X_client) exitWith {};
__waitpl;
execVM "client\handle_threads.sqf"; __sleep;
execVM "client\CB_suppscore_tracker.sqf"; __sleep;
execFSM "fsms\boardingCheck.fsm"; __sleep;
execVM "client\lift_init.sqf";
sleep 1;
execVM "client\spawn.sqf"; __sleep;
if (isNil "notes_done") then {execVM "client\notes.sqf";};

#ifndef __DEBUG__
	//_psy = player execVM "client\jail_new.sqf";
#endif

__XJIPGetVar(enemy_air_presence);
__XJIPGetVar(mr1_in_air);
__XJIPGetVar(mr2_in_air);
__XJIPGetVar(EVO_end_is_near);
__XJIPGetVar(MHQ_is_locked);
__XJIPGetVar(AHQ_is_locked);

uid_JIP_store =  getPlayerUID player;
_st_a = X_JIPH getVariable uid_JIP_store;
CB_suppoints = (_st_a select 1);
if (isNil "CB_suppoints") then {CB_suppoints = 0};

if ((isNil "EVO_current_task") and (time > 30)) then {
	waitUntil {!isNil "EVO_intro_done" || !EVO_intro_done};
	sleep 5;
	player call EVO_fgetTask;
	_current_target = EVO_all_possible_towns select __XJIPGetVar(current_target_index);
	_current_target_pos = _current_target select 0;
	_current_target_name = _current_target select 1;
	_current_target_radius = _current_target select 2;
	#ifndef __A2__
	_brush = 'SolidBorder';
	#else
	_brush = 'Solid';
	#endif
	#ifdef __BLUE__
	_color = 'ColorRed';
	#else
	_color = 'ColorBlue';
	#endif
	_my_local_marker = ['mt_'+str(_current_target_name),  _current_target_pos, 'ELLIPSE', _color, [_current_target_radius,_current_target_radius], "", 0, '', _brush,1] call XfCreateMarkerLocal;
	/*
	if (E_need_satchel == 0) then {
		if (!__XJIPGetVar(mt_radio_down) and !__XJIPGetVar(friendly_was_near)) then {["allow_dam",[__XJIPGetVar(EVO_acc_radio),false]] call XNetCallEvent;};
	};*/
	_rank = player call EVO_get_players_jip_rank;
	player setRank _rank;
	waitUntil {__XJIPGetVar(acc_mt_clear)};
	deleteMarkerLocal _my_local_marker;
};