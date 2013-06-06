//by psycho
#include "setup.sqf"
private ["_offipos","_radiopos","_color","_id","_officer","_radio","_current_target_radius","_current_target_name","_current_target_pos","_current_target","_music_a"];
["acc_mt_clear",false] call XNetSetJIP;
acc_offi = objNull;

if ((E_Towns == 1) or (E_Towns == 2)) then {
	["current_target_index",EVO_maintargets select EVO_current_counter] call XNetSetJIP;
	EVO_current_counter = EVO_current_counter + 1;
} else {
	EVO_current_counter = EVO_maintargets call XfRandomFloorArray;
	["current_target_index",EVO_maintargets select EVO_current_counter] call XNetSetJIP;
	EVO_maintargets = EVO_maintargets - [__XJIPGetVar(current_target_index)];
};

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

['mt_'+str(_current_target_name),  _current_target_pos, 'ELLIPSE', _color, [_current_target_radius,_current_target_radius], "", 0, '', _brush,1] call XfCreateMarkerGlobal;

//radiotower
_radiopos = [_current_target_pos, 120] call XfGetRanPointCircle;
_radio = createVehicle [EVO_radiotower, _radiopos, [], 0, "NONE"];
["EVO_acc_radio",_radio] call XNetSetJIP;
_zise = sizeOf EVO_radiotower;
_isFlat = (position _radio) isFlatEmpty [_zise / 2, 150, 0.7, _zise, 0, false, _radio];
if (count _isFlat > 1) then {
	_pos = _isFlat;
	_pos set [2, 0];
	_current_target_pos = _pos;
};
_radio setPos _current_target_pos;
_radio setVectorUp [0,0,1];
["mt_radio_down",false] call XNetSetJIP;
[_radio] call XfCheckMTHardTarget;
radio_position = position _radio;
mt_trigger_radio = [radio_position, [100,100,0,false], [EVO_own_side,"PRESENT",false], ["this", "psy = ['mt_radio',  radio_position, 'ICON', 'ColorKhaki', [0.5,0.5], localize 'STR_i_rtower', 0, 'mil_destroy'] call XfCreateMarkerGlobal;", ""]] call XfCreateTrigger;

//officer
_grp1 = [EVO_enemy_side] call EVO_createGroup;
_offipos = [_current_target_pos, 250] call XfGetRanPointCircle;
_officer = EVO_officer createUnit [_offipos, _grp1, "acc_offi = this", 0.8, "COLONEL"];
_officer = acc_offi;
__addDead(_officer);
__aiSetVar(_officer) ["BIS_noCoreConversations", true];
_officer setCaptive true;
mt_trigger_officer = [_offipos, [100,100,0,false], [EVO_own_side,"PRESENT",false], ["this", "psy = ['mt_officer',  position acc_offi, 'ICON', 'ColorKhaki', [0.5,0.5], localize 'STR_i_offi', 0, 'mil_join'] call XfCreateMarkerGlobal;", ""]] call XfCreateTrigger;
["mt_officer_status",0] call XNetSetJIP;
removeallWeapons _officer;
__sleep;
acc_offi setVehicleInit "offi_id = acc_offi addaction ['Capture' call XYellowText,'server\capture.sqf',0,1, true, true];";
processInitCommands;
clearVehicleInit acc_offi;
_officer switchmove "amovpercmstpsnonwnondnon";
_officer addEventHandler ["killed", {
	private ["_killer","_off"];
	_off = _this select 0;
	_killer = _this select 1;
	deleteMarker "mt_officer";
	deleteVehicle mt_trigger_officer;
	["mt_officer_status",-1] call XNetSetJIP;
	_off removeAction offi_id;
	if (!isNil "_killer") then {
		["p_add_score",[_killer,-6]] call XNetCallEvent;
		_head = localize "STR_i_ofc_dead2";
		_body = localize "STR_i_ofc_deadb2";
		["evo_message",[EVO_brown,_head,_body,"stop",_killer]] call XNetCallEvent;
	};
}];

//mines
if (E_mines == 1) then {execVM "server\mines.sqf"};

//anti air
if (E_ga_defence > 0) then {
	for "_i" from 1 to E_ga_defence do {
		_grp2 = [EVO_enemy_side] call EVO_createGroup;
		_aapos = [_current_target_pos, _current_target_radius] call XfGetRanPointCircle;
		_vec = [_aapos, random 359, EVO_e_aa select 0, _grp2] call EVO_spawn_vehicle;
		(_vec select 0) setVehicleVarName 'st_' + str(_i);
		['st_' + str(_i),  position (_vec select 0), 'ELLIPSE', _color, [800,800], "", 0, '', 'Solid', 0.3] call XfCreateMarkerGlobal;
		(_vec select 0) addEventHandler ["killed", {
			private ["_markername"];
			_aa = _this select 0;
			_markername = vehicleVarName _aa;
			deleteMarker _markername;
		}];
		sleep 3;
	};
};

//inf defenders
sleep 1.54;
["prepare_mt_defenders",[_current_target,_radiopos,_offipos]] call XNetCallEvent;
["set_players_task",[]] call XNetCallEvent;

sleep 10.78;
_deepcheck = ["('Man' countType thislist <= EVO_max_alive_infs) && ('Tank' countType thislist <= EVO_max_alive_tanks) && ('Car' countType thislist  <= EVO_max_alive_cars) && (X_JIPH getVariable 'mt_radio_down')", "['acc_mt_clear',true] call XNetSetJIP;", ""];
mt_check_for_free = [_current_target_pos, [_current_target_radius  + 100, _current_target_radius + 100, 0, false],[EVO_enemy_side, "PRESENT", false], _deepcheck] call XfCreateTrigger;
execVM "server\handle_reinforcer.sqf";
waitUntil {__XJIPGetVar(mt_radio_down)};
mt_score_tracker = [_current_target_pos, [_current_target_radius, _current_target_radius, 0, false],[EVO_own_side, "PRESENT", false], ["(vehicle player) in thisList","",""]] call XfCreateTrigger;





waitUntil {__XJIPGetVar(acc_mt_clear)};
sleep 5;
["succeed_players_task",[]] call XNetCallEvent;
sleep 2;
_list = List mt_score_tracker;
{["p_add_score",[_x,EVO_town_free_score]] call XNetCallEvent} forEach _list;
_head = format [localize "STR_i_hclear",_current_target_name];
_body = localize "STR_i_bclear";
["evo_message_global",[EVO_brown,_head,_body,"ok"]] call XNetCallEvent;
_music_a = [] call EVO_random_music;
["evo_music",[(_music_a select 0),(_music_a select 1)]] call XNetCallEvent;
_markername = 'mt_'+str(_current_target_name);
deleteMarker _markername;

{
	[_x] spawn EVO_setToDead;
	if (_x == _officer) exitWith {};
	_x setCaptive true;
	removeallWeapons _x;
	_x switchmove "amovpercmstpsnonwnondnon";
	_x setVehicleInit "this addaction [localize 'STR_a_capture' call XYellowText,'server\capture.sqf',0,1, true, true];";
	processInitCommands;
	clearVehicleInit _x;
} forEach list mt_check_for_free;

{deletevehicle _x} forEach [mt_check_for_free,mt_score_tracker];