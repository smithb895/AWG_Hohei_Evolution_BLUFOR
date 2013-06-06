// weather system
#include "setup.sqf"
#define __condition_fog (vehicle player in list foggy1 || vehicle player in list foggy2)
private ["_p"];
if (!X_Client) exitWith {};
_p = player;

while {true} do {
	1 setFog 0.0;
	waitUntil {__condition_fog};
	if ((speed vehicle player) > 100) then {
		8 setFog 0.63;
	} else {
		if ((speed vehicle player) > 25) then {
			15 setFog 0.63;
		} else {
			if ((speed vehicle player) < 25) then {
				25 setFog 0.63;
			};
		};
	};
	[player, 0.03] execVM "client\foggy_breath.sqf";
	
	waitUntil {!__condition_fog || !alive player};
	
	if (alive player) then {
		if ((speed vehicle player) > 100 or not alive player) then {
			8 setFog 0.0;
		} else {
			if ((speed vehicle player) > 25) then {
				15 setFog 0.0;
			} else {
				if ((speed vehicle player) < 25) then {
					25 setFog 0.0;
				};
			};
		};
	} else {
		waitUntil {alive player};
		if (!__condition_fog) then {
			0 setFog 0.0;
		};
	};
	sleep 3.421;
};