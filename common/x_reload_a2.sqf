// by Xeno
#include "setup.sqf"
private ["_config","_count","_i","_magazines","_object","_type","_type_name"];

XfVehicleChat = {(_this select 0) vehicleChat (_this select 1)};
_object = _this select 0;
_type = typeof _object;
if (_object isKindOf "ParachuteBase") exitWith {};

if (isNil {x_reload_time_factor}) then {x_reload_time_factor = 3};

if ((!alive _object) || ((getDammage _object == 0) and (fuel _object >= 0.99))) exitWith {
	[_object,"Vehicle need no support..."] call XfVehicleChat
};
_object action ["engineOff", _object];
_object setFuel 0;
_object setVehicleAmmo 1;

_type_name = [_type,0] call XfGetDisplayName;
if (!isDedicated) then {[_object,format ["Servicing %1... Please stand by...", _type_name]] call XfVehicleChat};

_magazines = getArray(configFile >> "CfgVehicles" >> _type >> "magazines");
if (count _magazines > 0) then {
	_removed = [];
	{
		if (!(_x in _removed)) then {
			_object removeMagazines _x;
			_removed set [count _removed, _x];
		};
	} forEach _magazines;
	{
		if (!isDedicated) then {[_object, format ["Reloading %1", _x]] call XfVehicleChat};
		sleep x_reload_time_factor;
		if (!alive _object) exitWith {};
		_object addMagazine _x;
	} forEach _magazines;
};

_count = count (configFile >> "CfgVehicles" >> _type >> "Turrets");

if (_count > 0) then {
	for "_i" from 0 to (_count - 1) do {
		scopeName "xx_reload2_xx";
		_config = (configFile >> "CfgVehicles" >> _type >> "Turrets") select _i;
		_magazines = getArray(_config >> "magazines");
		_removed = [];
		{
			if (!(_x in _removed)) then {
				_object removeMagazines _x;
				_removed set [count _removed, _x];
			};
		} forEach _magazines;
		{
			_mag_disp_name = [_x,2] call XfGetDisplayName;
			if (!isDedicated) then {[_object,format ["Reloading %1", _mag_disp_name]] call XfVehicleChat};
			sleep x_reload_time_factor;
			if (!alive _object) then {breakOut "xx_reload2_xx"};
			_object addMagazine _x;
			sleep x_reload_time_factor;
			if (!alive _object) then {breakOut "xx_reload2_xx"};
		} forEach _magazines;
		// check if the main turret has other turrets
		_count_other = count (_config >> "Turrets");
		// this code doesn't work, it's not possible to load turrets that are part of another turret :(
		// nevertheless, I leave it here
		if (_count_other > 0) then {
			for "_i" from 0 to (_count_other - 1) do {
				_config2 = (_config >> "Turrets") select _i;
				_magazines = getArray(_config2 >> "magazines");
				_removed = [];
				{
					if (!(_x in _removed)) then {
						_object removeMagazines _x;
						_removed set [count _removed, _x];
					};
				} forEach _magazines;
				{
					_mag_disp_name = [_x,2] call XfGetDisplayName;
					if (!isDedicated) then {[_object,format ["Reloading %1", _mag_disp_name]] call XfVehicleChat};
					sleep x_reload_time_factor;
					if (!alive _object) then {breakOut "xx_reload2_xx"};
					_object addMagazine _x;
					sleep x_reload_time_factor;
					if (!alive _object) then {breakOut "xx_reload2_xx"};
				} forEach _magazines;
			};
		};
	};
};
if (!alive _object) exitWith {};
_object setVehicleAmmo 1;
if (!isDedicated) then {[_object, "Rearmed..."] call XfVehicleChat};

sleep x_reload_time_factor;
if (!alive _object) exitWith {};
if (!isDedicated) then {[_object, "Repairing..."] call XfVehicleChat};
_object setDamage 0;
sleep x_reload_time_factor;
if (!alive _object) exitWith {};
if (!isDedicated) then {[_object, "Refueling..."] call XfVehicleChat};
while {fuel _object < 0.99} do {
	_object setFuel 1;
	sleep 0.01;
};
sleep x_reload_time_factor;
if (!alive _object) exitWith {};
if (!isDedicated) then {[_object, format ["%1 is ready...", _type_name]] call XfVehicleChat};

reload _object;