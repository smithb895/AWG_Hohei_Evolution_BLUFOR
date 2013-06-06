//by psycho
//scoretracker for supplys
#include "setup.sqf"
private ["_score1","_score2","_diff","_st_a"];
//CB_suppoints = 0;
__waitpl;
sleep 5;

uid_JIP_store =  getPlayerUID player;
_store = {
	_s = X_JIPH getVariable uid_JIP_store;
	_s
};

while {true} do {
	_score1 = score player;
	waitUntil {score player != _score1};
	_score2 = score player;
	_diff = _score2 - _score1;
	if (_diff != 0) then {
		CB_suppoints = CB_suppoints + _diff;
		_st_a = call _store;
		[uid_JIP_store, [(_st_a select 0), CB_suppoints]] call XNetSetJIP;
	};
};