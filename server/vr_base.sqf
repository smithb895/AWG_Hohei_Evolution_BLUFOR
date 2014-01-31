// by psycho
// vehicles that spawn after a few minutes in the base
#include "setup.sqf"
private ["_unit","_unitname"];

_unit = _this select 0;
_delay = _this select 1;


_air_vecinit = {
	private ["_vec", "_hasBombs", "_launcher"];
	_vec = _this select 0;
	_vec removeallEventHandlers "IncomingMissile";
	_vec removeallEventHandlers "Fired";

	_vec addEventHandler [
		"IncomingMissile",{
			["say3D_sound", [(_this select 0),"incoming"]] call XNetCallEvent;
			_head = localize "STR_i_incommingh";
			_body = localize "STR_i_incommingb";
			["evo_message", [driver (_this select 0),EVO_blue,_head,_body,"achtung"]] call XNetCallEventSTO;
		}
	];
	
	_hasBombs = false;
	_launcher = "";
	#ifdef __BLUE__
	{if (_vec hasWeapon _x) then {_hasBombs = true; _launcher = _x}} forEach ["BombLauncherA10","BombLauncher","BombLauncherF35","Mk82BombLauncher_6"];
	#else
	{if (_vec hasWeapon _x) then {_hasBombs = true; _launcher = _x}} forEach ["AirBombLauncher","ACE_AirBombLauncher"];
	#endif
	if (_hasBombs && _launcher != "") then {
		_vec addEventHandler ["Fired", {[(_this select 0),(_this select 6)] execVM "client\track_bomb.sqf"}];
	};
};


_unitname = vehicleVarName _unit;
_dir = getDir _unit;
_pos = getPosASL _unit;
_type = typeOf _unit;
_truedead = false;
_unit setVariable ["BTK_CargoDrop_ObjectLoaded",false];

if (_unit isKindOf "Air") then {[_unit] call _air_vecinit};


while {true} do {

	waitUntil {(getDammage _unit > 0.8) || (({alive _x} count crew _unit == 0) and (getPosASL _unit distance _pos > 10)) || !alive _unit};
	
		if (!alive _unit) then {
			_unit setVehicleAmmo 0;
			_unit setFuel 0;
			_truedead = true;
			sleep (_delay + random 60);
		} else {
			_timeout = time + _delay;
			waitUntil {(_timeout < time) || (!alive _unit) || ({alive _x} count crew _unit > 0)};
			_loaded = _unit getVariable "BTK_CargoDrop_ObjectLoaded";
			if (_timeout > time) then {
				_truedead = false;
			} else {
				if (!_loaded) then {
					_truedead = true;
				} else {
					_truedead = false;
				};
			};
		};
		
		if (_truedead) then {
			deleteVehicle _unit;
			_unit = createVehicle [_type, _pos, [], 0, "NONE"];
			_unit setPosASL _pos;
			_unit setDir _dir;
			__addDead(_unit)
			
			if (!isNil "_unitname") then {
				_unit setVehicleInit format ["this setVehicleVarName ""%1""",_unitname];
				processInitCommands;
			};
			_unit setVariable ["BTK_CargoDrop_ObjectLoaded",false];
			
			if (_type isKindOf "Air") then {[_unit] call _air_vecinit};
			_truedead = false;
		};
		
		sleep 0.987;
};