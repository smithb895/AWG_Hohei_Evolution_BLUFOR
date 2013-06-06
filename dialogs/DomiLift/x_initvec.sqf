// by Xeno
#define __chopmarker _mxname = _car select 2; \
if (str(markerPos _mxname) == "[0,0,0]") then { \
[_mxname, getPosASL _vec,"ICON",_car select 5,[1,1],_car select 6,0,_car select 4] call XfCreateMarkerLocal;\
} else { \
_mxname setMarkerPosLocal (getPosASL _vec); \
}; \
_vec setVariable ["d_marker", _mxname];\
d_marker_vecs set [count d_marker_vecs, _vec];\
if (count _car > 8) then {_vec setVariable ["d_lift_types", _car select 8]}

#define __chopset _index = _car select 1;\
_vec setVariable ["d_choppertype", _index];\
_vec setVariable ["d_vec_type", "chopper"];\
switch (_index) do {\
	case 0: {_vec addEventHandler ["getin", {[_this,0] call x_checkhelipilot}]};\
	case 1: {_vec addEventHandler ["getin", {[_this,1] call x_checkhelipilot}]};\
	case 2: {_vec addEventHandler ["getin", {[_this,1] call x_checkhelipilot}]};\
};\
_vec addEventHandler ["getout", {_this spawn x_checkhelipilotout}]

#define __chopname _vec setVariable ["d_vec_name", _car select 7]

#define __mNsSetVar missionNamespace setVariable

private "_vec";
_vec = _this;

_d_vec = _vec getVariable "d_vec";
if (isNil "_d_vec") exitWith {};

if (!isNil {_vec getVariable "d_vcheck"}) exitWith {};
_vec setVariable ["d_vcheck", true];

if (_d_vec < 400) exitWith {
	_car = [];
	{if ((_x select 3) == _d_vec) exitWith {_car = _x}} forEach d_choppers;
	if (count _car > 0) then {
		if (!alive _vec) exitWith {};
		__mNsSetVar [_car select 0, _vec];
		__chopname;
		__chopmarker;
	};
	if (!alive _vec) exitWith {};
	__chopset;
};