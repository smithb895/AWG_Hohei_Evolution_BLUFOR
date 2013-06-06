//by psycho
//startet konterangriffe gegen die base
#include "setup.sqf"

private ["_pos","_spawn","_guard","_unit","_allunits","_max","_wp","_wp1","_2","_3","_4","_pos1","_pos2","_pos3","_pos4"];

for [{_n = 0},{_n < 1},{_n = _n}] do {
	if (X_MP) then {waitUntil {sleep (1.012 + random 1);(call XPlayersNumber) > 0}};
	_sleeprandom = round (random 1200);
	sleep 2700 + _sleeprandom;

	_txthead = localize "STR_i_headConter";
	_txtbody = localize "STR_i_bodyConter";
	_publichint = [EVO_brown,_txthead,_txtbody,"achtung"];
	EVO_messagefiles_packed = str (_publichint);
	publicVariable "EVO_messagefiles_packed";
	
	_pos = Evo_Baseflag_MHQ;
	_y = 3+ (round random 5);		//maximal mögliche gruppen
	_array = ["CB_conter1","CB_conter2","CB_conter3","CB_conter4"];
	_spawn = getMarkerPos (_array select (round random 3));
	///////////////////create inf-squads
	for [{_j = 0},{_j < _y},{_j= _j+1}] do {
		_z = 6 + (round random 6);
		_guard = grpNull;
		_max = count EVO_e_soldiers;
		#ifdef __BLUE__
		_guard = createGroup (east);
		#else
		_guard = createGroup (west);
		#endif
		for [{_i = 0},{_i < z},{_i = _i+1}] do {
			_unit = _guard createUnit [(EVO_e_soldiers select round random (_max - 1)), _spawn, [], 0, "NONE"];
			_unit 0.3+(random 0.3);
			[_unit] join _guard;
			__sleep;
		};
		_wp = _guard addWaypoint [position _pos, 50];
		sleep 1.04;
	};

	/////////////////create mechanics
	_guardmech = grpNull;
	_maxo = (count EVO_e_wheeled)-1;
	#ifdef __BLUE__
	_side = east;
	#else
	_side = west;
	#endif		
	_array = [EVO_e_wheeled select (round random _maxo),_spawn,_side,0,random 359,20] call BIS_EVO_CreateVehicle;
	_guardmech = _array select 0;	
	[_guardmech, 1] setWaypointCombatMode "RED";
	_guardmech setFormation "COLUMN";
	_wp1 = _guardmech addWaypoint [position _pos, 50];
};
