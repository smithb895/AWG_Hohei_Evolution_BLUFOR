// by Xeno, edited by Grimes 
private ["_listin", "_no_lift", "_vehicle", "_position", "_enterer", "_exit_it", "_may_fly", "_type_enterer","_was_engineon"];

_listin = _this select 0;
_no_lift = _this select 1;

_vehicle = _listin select 0;
_position = _listin select 1;
_enterer = _listin select 2;
if (!local _enterer) exitWith {};

if (_position != "driver") then {
	[_vehicle, _position, _enterer] call EVO_boarding;
};

_was_engineon = isEngineOn _vehicle;
_exit_it = false;

if (!_exit_it && _position == "driver") then {
	_may_fly = true;
	_type_enterer = typeOf _enterer;

	if (_may_fly && _enterer == player) then {
		if (_no_lift == 0) then {
			if (d_chophud_on) then {
				player setVariable ["d_hud_id", _vehicle addAction ["Turn Off Hud" call XGreyText, "dialogs\DomiLift\x_sethud.sqf",0,-1,false]];
			} else {
				player setVariable ["d_hud_id", _vehicle addAction ["Turn On Hud" call XGreyText, "dialogs\DomiLift\x_sethud.sqf",1,-1,false]];
			};
			
			[_vehicle] execVM "dialogs\DomiLift\x_helilift.sqf";
		};
	};
};

if (_exit_it) exitWith {
	_enterer action["Eject",_vehicle];
	if (!_was_engineon && isEngineOn _vehicle) then {_vehicle engineOn false};
};