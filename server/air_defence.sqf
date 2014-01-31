//by psycho
#include "setup.sqf"
all_planes = 0;

EVO_spawn_enemyAirDefence = {
	private ["_crew","_vec","_heli","_grp","_pos","_unit","_spawntype"];
	_spawntype = _this select 0;
	_pos = call XfGetRanPointOuterAir;
	if (_pos distance Evo_Baseflag_MHQ < 1000) then {
		_pos = call XfGetRanPointOuterAir;
	};
	_grp = [EVO_enemy_side] call EVO_createGroup;
	switch (_spawntype) do {
		case "chopper" : {_unit = EVO_e_attackhelis call XfRandomArrayVal};
		case "jet" : {_unit = EVO_e_jets call XfRandomArrayVal};
		default {};
	};
	_vec = [_pos,random 359,_unit,_grp] call EVO_spawn_vehicle;
	_heli = _vec select 0;
	_heli addEventHandler ["killed",{["enemy_air_presence_num",[-1]] call XNetCallEvent}];
	if (_spawntype == "chopper") then {[_heli, 200] call XfSetHeight} else {[_heli, 600] call XfSetHeight};
	_grp setCombatMode "RED";
	if ((date select 3) < 4 or (date select 3) > 20) then {
		_grp setBehaviour "COMBAT";
		vehicle (units _grp select 0) action ["LIGHT ON",vehicle (units _grp select 0)];
	};
	if (!isNull _heli) then {
		[_vec select 2] execVM "server\flightroute.sqf";
		[_heli] execVM "server\amarker.sqf";
		["enemy_air_presence_num",[1]] call XNetCallEvent;
	};
};

_ran = {
	_a = ["chopper","jet"];
	_choise = _a select ((ceil random 2)-1);
	_choise
};

sleep 20.09;
waitUntil {__XJIPGetVar(current_target_index) != -1};
sleep 15.98;

while {true} do {
	waitUntil {all_planes < 4};
	__MPCheck;
	_num_p = call XPlayersNumber;
	sleep (switch (true) do {
		case (_num_p < 5): {600};
		case (_num_p < 10): {450};
		case (_num_p < 20): {300};
		default {300};
	});
	_ranstr = call _ran;
	[_ranstr] call EVO_spawn_enemyAirDefence;
};