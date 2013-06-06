// by Xeno
#include "setup.sqf"

x_event_holder = "HeliHEmpty" createVehicleLocal [0, 0, 0];

// multiple events per type
XNetAddEvent = {
	private ["_a", "_ea"];
	_a = switch (_this select 0) do {
		case 0: {true}; // all
		case 1: {if (isServer) then {true} else {false}}; // server only
		case 2: {if (X_Client) then {true} else {false}}; // client only
		case 3: {if (isDedicated) then {true} else {false}}; // dedicated only
		case 4: {if (!isServer) then {true} else {false}}; // client only, 2
	};
	if (_a) then {
		_ea = x_event_holder getVariable (_this select 1);
		if (isNil "_ea") then {_ea = []};
		_ea set [count _ea, _this select 2];
		x_event_holder setVariable [_this select 1, _ea];
	};
};

XNetRemoveEvent = {
	if (!isNil {x_event_holder getVariable _this}) then {x_event_holder setVariable [_this, nil]};
};

XNetRunEvent = {
	private ["_ea", "_p", "_pa"];
	_ea = x_event_holder getVariable (_this select 0);
	if (!isNil "_ea") then {
		_pa = _this select 1;
		if (!isNil "_pa") then {
			{_pa call _x} forEach _ea;
		} else {
			{call _x} forEach _ea;
		};
	};
};

XNetCallEvent = {
	x_n_e_gl = _this; publicVariable "x_n_e_gl";
	_this call XNetRunEvent;
};

"x_n_e_gl" addPublicVariableEventHandler {
	(_this select 1) call XNetRunEvent;
};

XNetSetJIP = {
	__XJIPSetVar [_this select 0,_this select 1,true];
};