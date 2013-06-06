//by psycho
#include "setup.sqf"
while {!__XJIPGetVar(mt_radio_down)} do {
	waitUntil {"Man" countType (list mt_check_for_free) <= (EVO_Infantry select 1) || EVO_all_mobiles <= (EVO_Mechanized select 1)};
	if (__XJIPGetVar(mt_radio_down)) exitWith {};
	if ("Man" countType (list mt_check_for_free) <= 12) then {
			execVM "server\paradrops.sqf";
			sleep ((random 10) + 10);
			execVM "server\grounddrops.sqf";
		};
	if (EVO_all_mobiles <= (EVO_Mechanized select 1)) then {
		execVM "server\tank_reinforcer.sqf";
		sleep ((random 20) + 10);
		execVM "server\tank_reinforcer.sqf";
	};
	__MPCheck;
	_num_p = call XPlayersNumber;
	sleep (switch (true) do {
		case (_num_p < 5): {150};
		case (_num_p < 10): {120};
		case (_num_p < 20): {90};
		case (_num_p < 25): {60};
		case (_num_p >= 25): {45};
		default {60};
	});
};


//waiting for prepair new town... or exit the game
waitUntil {__XJIPGetVar(acc_mt_clear)};
["done_towns_num"] call XNetCallEvent;
if (EVO_done_towns == EVO_alltowns_topass) exitWith {
	["play_outro",[]] call XNetCallEvent;
	sleep 45;
	["EVO_end_is_near",true] call XNetSetJIP;
	sleep 1;
	EVO_real_end = true;
};
sleep 45;
execVM "server\set_maintarget.sqf";