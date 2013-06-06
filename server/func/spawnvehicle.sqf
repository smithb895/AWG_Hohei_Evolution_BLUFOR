#include "setup.sqf"
/*
	File: spawnVehicle.sqf
	Author: Joris-Jan van 't Land

	Description:
	Function to spawn a certain vehicle type with all crew (including turrets).
	The vehicle can either become part of an existing group or create a new group.

	Parameter(s):
	_this select 0: desired position (Array).
	_this select 1: desired azimuth (Number).
	_this select 2: type of the vehicle (String).
	_this select 3: side or existing group (Side or Group).

	Returns:
	Array:
	0: new vehicle (Object).
	1: all crew (Array of Objects).
	2: vehicle's group (Group).
*/
private ["_pos", "_azi", "_type", "_param4", "_grp", "_side", "_newGrp"];
_pos = _this select 0;
_azi = _this select 1;
_type = _this select 2;
_param4 = _this select 3;

if ((typeName _param4) == (typeName sideEnemy)) then {
	_side = _param4;
	_grp = [_side] call EVO_createGroup;
} else {
	_grp = _param4;
	_side = side _grp;
};
private ["_sim", "_veh", "_crew"];
_sim = getText(configFile >> "CfgVehicles" >> _type >> "simulation");
if (_sim in ["airplane", "helicopter"]) then {
	if ((count _pos) == 2) then {_pos set [count _pos, 200]};
	_veh = createVehicle [_type, _pos, [], 0, "FLY"];
	_veh setVelocity [50 * (sin _azi), 50 * (cos _azi), 0];
	_veh engineOn true;
} else {
	_veh = createVehicle [_type, _pos, [], 0, "NONE"];
	_svec = sizeOf _type;
	_isFlat = (position _veh) isFlatEmpty [_svec / 2, 150, 0.7, _svec, 0, false, _veh];
	if (count _isFlat > 1) then {
		_pos = _isFlat;
		_pos set [2, 0];
	};
};
_veh setDir _azi;
_veh setPos _pos;
_grp addVehicle _veh;
_crew = [_veh,_grp] call EVO_spawnCrew;
_grp selectLeader (commander _veh);

_veh addEventHandler ["killed",{[_this select 0] call x_handleDeadVeh}];
_veh call EVO_Lock;

[_veh, _crew, _grp]