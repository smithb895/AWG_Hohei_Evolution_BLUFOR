//by psycho
#include "setup.sqf"
private ["_marker","_unit","_rounds","_body1","_body2","_unitname","_delay","_light"];
if (!isServer) exitWith {};
_unit = _this select 0;
_unitname = vehicleVarName _unit;
_delay = switch {_unitname} do {
	case ("AHQ") : {EVO_AHQ_respawn_delay};
	case ("MHQ") : {EVO_MHQ_respawn_delay};
	default {60};
};
_run = true;
_rounds = 0;

sleep 7;
_dir = getDir _unit;
_position = getPosASL _unit;
_type = typeOf _unit;
_unit setVehicleInit "this addAction [localize 'STR_a_base','client\beam_actions.sqf',0];";
processInitCommands;


_light = "#lightpoint" createVehicleLocal getpos _unit;
_light setLightBrightness 0.03;
#ifdef __RED__
_light setLightColor [0.9,0.1,0.1];
_light setLightAmbient [0.1,0.01,0.01];
#else
_light setLightColor [0.1,0.1,0.8];
_light setLightAmbient [0.01,0.01,0.1];
#endif
_light attachTo [_unit, [0,0,-0.5]];


_head = localize "STR_i_destroyed";
switch (_unitname) do {
	case ("MHQ") : {_body1 = localize "STR_i_mhq_d";_body2 = localize "STR_i_mhq_nor";};
	case ("AHQ") : {_body1 = localize "STR_i_ahq_d";_body2 = localize "STR_i_mhq_nor";};
	default {_body1 = localize "STR_i_any_d";_body2 = localize "STR_i_mhq_nor";};
};

while {_run} do {
	waitUntil {!alive _unit};
	_rounds = _rounds + 1;
	if (_rounds >= E_max_amburespawn) exitWith {
		["evo_message_global",[EVO_brown,_head,_body2,"stop"]] call XNetCallEvent;
		evo_broken_spawn_num = evo_broken_spawn_num + 1;
		["EVO_broken_spawn",evo_broken_spawn_num] call XNetSetJIP;
		_run = false;
	};
	if (!_run) exitWith {};
	["evo_message_global",[EVO_brown,_head,_body1,"info"]] call XNetCallEvent;
	sleep _delay;
	deleteVehicle _unit;
	deleteVehicle _light;
	sleep 2;
	_unit = _type createVehicle _position; __sleep;
	_unit setPosASL _position;
	_unit setDir _dir;
	_unit setVehicleInit format ["
		_id0 = this addAction [localize 'STR_a_base','client\beam_actions.sqf',0];
		%1 = this; this setVehicleVarName ""%1"""
	,_unitname];
	processInitCommands;
	_light = "#lightpoint" createVehicleLocal getpos _unit;
	_light setLightBrightness 0.03;
	#ifdef __RED__
	_light setLightColor [0.9,0.1,0.1];
	_light setLightAmbient [0.1,0.01,0.01];
	#else
	_light setLightColor [0.1,0.1,0.8];
	_light setLightAmbient [0.01,0.01,0.1];
	#endif
	_light attachTo [_unit, [0,0,-0.5]];
};