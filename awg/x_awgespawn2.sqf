// by Xeno

#include "setup.sqf"
private ["_heli_array", "_vec_a", "_vehicle", "_number_v", "_is_west_chopper", "_i", "_tt", "_ifdamage", "_empty", "_disabled", "_empty_respawn", "_startpos", "_hasbox", "_fuelleft"];
if (!isServer) exitWith {};
	
_heli_array = [];
{
	_vec_a = _x;
	_vehicle = _vec_a select 0;
	_number_v = _vec_a select 1;
	_ifdamage = _vec_a select 2;
	_heli_array set [count _heli_array, [_vehicle,_number_v,_ifdamage,-1, position _vehicle,direction _vehicle,typeOf _vehicle,(if (_ifdamage) then {-1} else {_vec_a select 3})]];
	
	_vehicle setVariable ["D_OUT_OF_SPACE", -1];
	_vehicle setVariable ["d_vec", _number_v, true];
	_vehicle setVariable ["d_vec_islocked", (locked _vehicle)];
	[_vehicle] call EVO_air_vecinit;
	} forEach _this;
	_this = nil;

while {true} do {
	__MPCheck;
	#ifdef __A2__
	private "_forEachIndex";
	_forEachIndex = 0;
	#endif
	{
		_tt = 20 + random 5;
		sleep _tt;
		_vec_a = _x;
		_vehicle = _vec_a select 0;
		_ifdamage = _vec_a select 2;
		
		_empty = _vehicle call XfGetVehicleEmpty;
		
		_disabled = false;
		if (!_ifdamage) then {
			_empty_respawn = _vec_a select 3;
			if (_empty && _vehicle distance (_vec_a select 4) > 10 && _empty_respawn == -1) then {
				_vec_a set [3, time + (_vec_a select 7)];
			};
			
			if (_empty && time > _empty_respawn && _empty_respawn != -1) then {
				_disabled = true;
			} else {
				if (!_empty && alive _vehicle) then {_vec_a set [3,-1]};
			};
		};
			
		if (damage _vehicle > 0.8) then {_disabled = true};
		
		if (_empty && !_disabled && alive _vehicle && (_vehicle call XfOutOfBounds)) then {
			_outb = _vehicle getVariable "D_OUT_OF_SPACE";
			if (_outb != -1) then {
				if (time > _outb) then {_disabled = true};
			} else {
				_vehicle setVariable ["D_OUT_OF_SPACE", time + 600];
			};
		} else {
			_vehicle setVariable ["D_OUT_OF_SPACE", -1];
		};
		
		sleep 0.01;
		
		if ((_disabled && _empty) || (_empty && !(alive _vehicle))) then {
			_fuelleft = _vehicle getVariable "vec_fuel";
			if (isNil "_fuelleft") then {_fuelleft = 1};
			_isitlocked = _vehicle getVariable "d_vec_islocked";
			sleep 0.1;
			deletevehicle _vehicle;
			if (!_ifdamage) then {_vec_a set [3,-1]};
			sleep 0.5;
			_vehicle = objNull;
			_vehicle = createVehicle [_vec_a select 6, _vec_a select 4, [], 0, "NONE"];
			_vehicle setdir (_vec_a select 5);
			_vehicle setpos (_vec_a select 4);
			// COMMENCE SUPERXPDUDE EDIT  
			_vehicle setVehicleInit format ["%1;", 'this addeventhandler ["fired",{  if (vehicle (_this select 0) in list base ) then {deleteVehicle (_this select 6)}; }]; this allowdamage false;'];
			processInitCommands;
			// END SUPERXPDUDE EDIT
			
			_vehicle setVariable ["d_vec_islocked", _isitlocked];
			if (_isitlocked) then {_vehicle lock true};
			
			_vec_a set [0,_vehicle];
			_heli_array set [_forEachIndex, _vec_a];
			_number_v = _vec_a select 1;
			_vehicle setVariable ["D_OUT_OF_SPACE", -1];
			_vehicle setVariable ["d_vec", _number_v, true];
			["d_n_v", _vehicle] call XNetCallEvent;
			[_vehicle] call EVO_air_vecinit;
		};
		#ifdef __A2__
		_forEachIndex = _forEachIndex + 1;
		#endif
	} forEach _heli_array;
	sleep 20 + random 5;
};