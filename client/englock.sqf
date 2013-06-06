//by psycho
#include "setup.sqf"
private ["_p","_vec","_uid","_truckid", "_bool"];
_p = _this select 0;
if (!local _p) exitWith {};
_bool = false;
_vec = EVO_objectID3;
_uid = getPlayerUID _p;
_truckid = "";
_truckid = _vec getVariable "truck_id";

if (format ["%1", (_vec getVariable "truck_id")] != "<null>") then {
	_inactive = ["check_activity", _truckid] call XNetCallEvent;
	if (_inactive and locked _vec) exitWith {
		_vec setVariable ["truck_id", _uid];
		["lock_it", [_vec, false]] call XNetCallEvent;
		"Vehicle unlocked from a disconnected player" call XfGlobalChat;
		_bool = true;
	};
};

if (locked _vec) exitWith {
	_truckid = _vec getVariable "truck_id";
	if (_truckid != _uid) then {
		[EVO_brown,localize "STR_a_abbort",localize "STR_i_t_has_owner","stop"] call EVO_Message;
	} else {
		["lock_it", [_vec, false]] call XNetCallEvent;
		"Vehicle unlocked" call XfGlobalChat;
	};
};

if (!locked _vec && !_bool) then {
	if (count (crew _vec) > 0) then {
		{_x action ["Eject", vehicle _x]} forEach ((crew _vec) - [player])
	}; __sleep;
	if (count (crew _vec) > 0) exitWith {
		[EVO_brown,localize "STR_a_abbort",localize "STR_i_pinside","stop"] call EVO_Message;
	};
	_vec setVariable ["truck_id", _uid];
	["lock_it", [_vec, true]] call XNetCallEvent;
	"Vehicle locked" call XfGlobalChat;
};