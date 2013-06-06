//by psycho
#include "setup.sqf"
private ["_unit","_grp","_target","_plane"];
if (!isServer) exitWith {};
check_out = false;

_target = _this select 0;
if (typeName _target != "ARRAY") then {_target = position _target};
["supply_plane",false] call XNetSetJIP;

#ifdef __BLUE__
switch (true) do {
	case (__Takistan) : {_unit = "C130J_US_EP1"};
	case (__Chernarus) : {_unit = "C130J"};
};
#else
switch (true) do {
	case (__Takistan) : {_unit = "An2_TK_EP1"};
	case (__Chernarus) : {_unit = "Mi17_medevac_RU"};
};
#endif

_grp = [EVO_own_side] call EVO_createGroup;
_point = [_target, 1000] call XfGetRanPointCircleOuter;
_dir = [_point,_target] call XfDirTo;
_vec = [_point,_dir,_unit,_grp] call EVO_spawn_vehicle;
_plane = _vec select 0;
__sleep;
[_plane, 400] call XfSetHeight;
_plane flyinheight 350;
if ((date select 3) < 4 or (date select 3) > 20) then {
	_grp setBehaviour "CARELESS";
	vehicle (units _grp select 0) action ["LIGHT ON",vehicle (units _grp select 0)];
};
__sleep;

_wps = _grp addWaypoint [_target,30];
_wps = _grp addWaypoint [EVO_mapcenter,1000];
[_grp, 1] setWaypointCompletionRadius 50;
[_grp, 2] setWaypointCompletionRadius 100;
[_grp, 2] setWaypointStatements ["true", "check_out = true"];
__sleep;
_c130 animate ["ramp_top", 1];
_c130 animate ["ramp_bottom", 1];

waitUntil {!alive _plane || isNull (driver _plane) || check_out};
{_x setDamage 1} forEach (units _grp);
_plane setFuel 0;
_plane setdammage 1; deleteVehicle _plane;