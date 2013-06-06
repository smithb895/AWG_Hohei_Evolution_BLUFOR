// by Xeno, edited by Grimes 
private ["_vehicle", "_nearest", "_id", "_pos", "_nobjects", "_dummy", "_depl", "_nx", "_ny", "_px", "_py", "_npos"];
if (!X_Client) exitWith {};

_vehicle = _this select 0;

_menu_lift_shown = false;
_nearest = objNull;
_id = -1212;
_release_id = -1212;

_vehicle setVariable ["D_Vehicle_Attached", false];
_vehicle setVariable ["D_Vehicle_Released", false];
_vehicle setVariable ["D_Attached_Vec", objNull];

sleep 10.123;

_possible_types = _vehicle getVariable "d_lift_types";

while {alive _vehicle && alive player && (player in _vehicle)} do {
	if ((driver _vehicle) == player) then {
		_pos = getPos _vehicle;
		
		if (!(_vehicle getVariable "D_Vehicle_Attached") && (_pos select 2 > 2.5) && (_pos select 2 < 11)) then {
			_nearest = objNull;
			_nobjects = nearestObjects [_vehicle, ["LandVehicle","Air"],40];
			if (count _nobjects > 0) then {
				_dummy = _nobjects select 0;
				if (_dummy == _vehicle) then {
					if (count _nobjects > 1) then {_nearest = _nobjects select 1};
				} else {
					_nearest = _dummy;
				};
			};
			if (!isNull _nearest) then {
				if (_nearest isKindOf "Man") then {
					_nearest = objNull;
				} else {
					if ((speed _nearest > 10) || (position _nearest select 2 > 5) || !((typeof _nearest) in _possible_types)) then {_nearest = objNull};
				};
			};
			sleep 0.1;
			if (!(isNull _nearest) && _nearest != (_vehicle getVariable "D_Attached_Vec")) then {
				_nearest_pos = getPos _nearest;
				_nx = _nearest_pos select 0;_ny = _nearest_pos select 1;_px = _pos select 0;_py = _pos select 1;
				if ((_px <= _nx + 10 && _px >= _nx - 10) && (_py <= _ny + 10 && _py >= _ny - 10)) then {
					if (!_menu_lift_shown) then {
						_id = _vehicle addAction ["Lift Vehicle" call XYellowText, "dialogs\DomiLift\x_heli_action.sqf",-1,100000];
						_menu_lift_shown = true;
					};
				} else {
					_nearest = objNull;
					if (_menu_lift_shown) then {
						_vehicle removeAction _id;
						_id = -1212;
						_menu_lift_shown = false;
					};
				};
			};
		} else {
			if (_menu_lift_shown) then {
				_vehicle removeAction _id;
				_id = -1212;
				_menu_lift_shown = false;
			};
			
			sleep 0.1;
			
			if (isNull _nearest) then {
				_vehicle setVariable ["D_Vehicle_Attached", false];
				_vehicle setVariable ["D_Vehicle_Released", false];
			} else {
				if (_vehicle getVariable "D_Vehicle_Attached") then {
					_release_id = _vehicle addAction ["Release Vehicle" call XRedText, "dialogs\DomiLift\x_heli_release.sqf",-1,100000];
					[_vehicle, "Vehicle attached to chopper"] call XfVehicleChat;
					_vehicle setVariable ["D_Attached_Vec", _nearest];
					
					switch (_nearest) do {
						case MHQ: {
							["mr1_in_air",true] call XNetSetJIP;
							["mr1_l_c", _vehicle] call XNetCallEvent;
						};
						case AHQ: {
							["mr2_in_air",true] call XNetSetJIP;
							["mr2_l_c", _vehicle] call XNetCallEvent;
						};
					};
					
					_nearest engineOn false;
					_nearest attachTo [_vehicle, [0,0,-15]];
					
					while {alive _vehicle && alive _nearest && alive player && !(_vehicle getVariable "D_Vehicle_Released") && (player in _vehicle)} do {sleep 0.312};
					detach _nearest;					
					_nearest setVelocity [0,0,0];
					_nearest engineOn false;
					if (position _nearest select 2 > 5) then {
						_nearest spawn {
							while {position _this select 2 > 5} do {
								_this setDamage ((damage _this) + 0.01);
								sleep 0.1;
								if (!alive _this) exitWith {};
							};
						};
					};
					
					_vehicle setVariable ["D_Vehicle_Attached", false];
					_vehicle setVariable ["D_Vehicle_Released", false];
					
					switch (_nearest) do {
						case MHQ: {
							["mr1_in_air",false] call XNetSetJIP;
							["mr1_l_c", objNull] call XNetCallEvent;
						};
						case AHQ: {
							["mr2_in_air",false] call XNetSetJIP;
							["mr2_l_c", objNull] call XNetCallEvent;
						};
					};
					
					_vehicle setVariable ["D_Attached_Vec", objNull];
					
					if (!alive _vehicle) then {
						_vehicle removeAction _release_id;
					} else {
						if (alive _vehicle && alive player) then {[_vehicle, "Vehicle released"] call XfVehicleChat};
					};
					
					if (!(_nearest isKindOf "StaticWeapon") && (position _nearest) select 2 < 200) then {
						waitUntil {(position _nearest) select 2 < 10};
					} else {
						_npos = position _nearest;
						_nearest setPos [_npos select 0, _npos select 1, 0];
					};
					_nearest setVelocity [0,0,0];
					
					sleep 1.012;
				};
			};
		};
	};
	sleep 0.51;
};

if (alive _vehicle) then {
	if (_id != -1212) then {_vehicle removeAction _id};
	if (_release_id != -1212) then {_vehicle removeAction _release_id};
};