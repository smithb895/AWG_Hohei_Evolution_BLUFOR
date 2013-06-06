#include "setup.sqf"
if (!X_Client) exitWith {};
0 setOverCast 0;

waitUntil {!isNil {__XJIPGetVar(EVO_currentTime)}};
while {true} do {
	sleep 1;
	skipTime (__XJIPGetVar(EVO_currentTime) - DayTime);
};