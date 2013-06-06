//by psycho
#include "setup.sqf"
_vehicle = _this select 0;
_bomb = _this select 1;




















_pos = [0,0,0];
_pilot = driver _vehicle;
_score = score _pilot;
_side = str (side _pilot);

//_bomb = (nearestObject [_vehicle, "Bo_GBU12_LGB"]);

if (isNull _bomb) exitWith {diag_log "-----------trkbmb aborted cause isNull Bomb"};

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do {
	if(isNull _bomb) then {
		_score = score _pilot;
		_loop=1;
	} else {
		_pos = position _bomb;
	};
	sleep 0.648;
};
_laser = (nearestObject [_pos,"LaserTarget"]);
#ifndef __DEBUG__
	if(isNull _laser) exitWith {diag_log "-----------trkbmb aborted cause isNull Laser"};
#endif
sleep 1.0;
_nscore = score _pilot;
_total = round (_nscore -_score);

_sensor = createTrigger ["EmptyDetector", _pos];
_sensor setTriggerArea [1500,1500,0,false];
_sensor setTriggerActivation [_side,"PRESENT",false];
_sensor setTriggerStatements ["local player","",""];

{
	_primary = primaryWeapon _x;
	if (_primary == "Laserdesignator") then {
		{["p_add_score",[_x,_total]] call XNetAddEvent} forEach group _x;
		_x spawn {
			_head = localize "STR_i_bonuslaserh";
			_body = localize "STR_i_bonuslaserb";
			[EVO_blue,_head,_body,"info"] call EVO_Message;
		};
	};
} forEach list _sensor;

deleteVehicle _sensor;
#ifdef __DEBUG__
	diag_log format ["trkbmb --- vec: %1 -- pilot: %2 -- laserobjekt: %3 -- score: %4",_vehicle,_pilot,_laser,_total];
#endif