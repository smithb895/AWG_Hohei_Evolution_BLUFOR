//by psycho
#include "setup.sqf"
if (!isServer) exitWith {};
sleep 3;

/*
{
	private ["_x"];
	{
		private ["_x"];
		_typex = typeOf _x;
		if ((_typex in EVO_spawn_vecs) || (_typex isKindOf "Air") and !(_typex in EVO_own_spawn_system_vecs)) then {
			if (_x isKindOf "Air" and (format ["%1", (_x getVariable "d_vec")] == "<null>")) then {
				if (_typex in EVO_f_jets) then {[_x, EVO_jetspawn_delay] execVM "server\vr_base.sqf"};
				if (_typex in EVO_f_attackhelis) then {[_x, EVO_attackhspawn_delay] execVM "server\vr_base.sqf"};
			} else {
				[_x, 300] execVM "server\vr_base.sqf";
			};
		} else {
			if ((_typex in EVO_own_spawn_system_vecs) || isPlayer _x) exitWith {};
			[_x] execVM "server\vr_instant.sqf";
		};
		sleep 0.1;
	} forEach list _x;
} forEach [AirportIn, farp1, farp2, farp3];
*/

_instant_list = d_helilift1_types - EVO_spawn_vecs - EVO_own_spawn_system_vecs;

{
	_typex = typeOf _x;
	switch (true) do {
		case (_typex in _instant_list) : {[_x] execVM "server\vr_instant.sqf"};
		case ((_typex isKindOf "Air") && !(_typex in EVO_own_spawn_system_vecs) && (format ["%1", (_x getVariable "d_vec")] == "<null>")) : {
			if (_typex in EVO_f_jets) then {[_x, EVO_jetspawn_delay] execVM "server\vr_base.sqf"};
			if (_typex in EVO_f_attackhelis) then {[_x, EVO_attackhspawn_delay] execVM "server\vr_base.sqf"};	
		};
		case ((_typex in EVO_spawn_vecs) && !(_typex in EVO_own_spawn_system_vecs)) : {
			[_x, 600] execVM "server\vr_base.sqf";
		};
	};
	sleep 0.03;
} forEach vehicles;