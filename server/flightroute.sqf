//by psycho
#include "setup.sqf"
private ["_grp", "_wps"];
_grp = _this select 0;
_current_target = EVO_all_possible_towns select __XJIPGetVar(current_target_index);
_current_target_pos = _current_target select 0;

_wps = _grp addWaypoint [_current_target_pos,200];
_wps = _grp addWaypoint [EVO_mapcenter,1000];
_wps = _grp addWaypoint [_current_target_pos,200];
[_grp, 1] setWaypointCompletionRadius 100;
[_grp, 2] setWaypointCompletionRadius 100;
[_grp, 3] setWaypointCompletionRadius 100;
[_grp, 2] setWaypointTimeOut [60,120,200];
[_grp, 2] setWaypointStatements ["true", "(vehicle (units _grp select 0)) setVehicleAmmo 1"];
[_grp, 3] setWaypointType "CYCLE";