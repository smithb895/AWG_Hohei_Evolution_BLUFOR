//scriptName "Functions\spawning\fn_taskAttack.sqf";
/*
	File: taskAttack.sqf
	Author: Joris-Jan van 't Land

	Description:
	Group will attack the position.

	Parameter(s):
	_this select 0: group (Group)
	_this select 1: attack position (Array)
	
	Returns:
	Boolean - success flag
*/

//Validate parameter count
if ((count _this) < 2) exitWith {false};

private ["_grp", "_pos"];
_grp = _this select 0;
_pos = _this select 1;

//Validate parameters
if ((typeName _grp) != (typeName grpNull)) exitWith {false};
if ((typeName _pos) != (typeName [])) exitWith {false};

//Create the waypoint.
private ["_wp"];
_wp = _grp addWaypoint [_pos, 0];
_wp setWaypointType "SAD";
_wp setWaypointCompletionRadius 20;

//Set group properties.
_grp setBehaviour "AWARE";

true