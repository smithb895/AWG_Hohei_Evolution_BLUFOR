//by psycho
#include "setup.sqf"

#ifdef __BLUE__
	_mhq = {
		private ["_marker","_name"];
		_name = "MHQ";
		_marker = createMarkerLocal [_name, [0,0,0]];
		_marker setMarkerTypeLocal "b_empty";
		_name setMarkerColorLocal "ColorOrange";
		_name setMarkerSizeLocal [1,1];
		_name setMarkerTextLocal _name;
		while {true} do {
			_marker setMarkerPosLocal getPos MHQ;
			sleep 2;
			if (!alive MHQ) then {
				deleteMarkerLocal _marker;
				waitUntil {alive MHQ};
				_marker = createMarkerLocal [_name, [0,0,0]];
				_marker setMarkerTypeLocal "b_empty";
				_name setMarkerColorLocal "ColorOrange";
				_name setMarkerSizeLocal [1,1];
				_name setMarkerTextLocal _name;
			};
		};
	};
	_ahq = {
		private ["_marker","_name"];
		_name = "AHQ";
		_marker = createMarkerLocal [_name, [0,0,0]];
		_marker setMarkerTypeLocal "b_air";
		_name setMarkerColorLocal "ColorRed";
		_name setMarkerSizeLocal [1,1];
		_name setMarkerTextLocal _name;
		while {true} do {
			_marker setMarkerPosLocal getPos AHQ;
			sleep 2;
			if (!alive AHQ) then {
				deleteMarkerLocal _marker;
				waitUntil {alive AHQ};
				_marker = createMarkerLocal [_name, [0,0,0]];
				_marker setMarkerTypeLocal "b_air";
				_name setMarkerColorLocal "ColorRed";
				_name setMarkerSizeLocal [1,1];
				_name setMarkerTextLocal _name;
			};
		};
	};
#else
	_mhq = {
		private ["_marker","_name"];
		_name = "MHQ";
		_marker = createMarkerLocal [_name, [0,0,0]];
		_marker setMarkerTypeLocal "o_empty";
		_name setMarkerColorLocal "ColorOrange";
		_name setMarkerSizeLocal [1,1];
		_name setMarkerTextLocal _name;
		while {true} do {
			_marker setMarkerPosLocal getPos MHQ;
			sleep 2;
			if (!alive MHQ) then {
				deleteMarkerLocal _marker;
				waitUntil {alive MHQ};
				_marker = createMarkerLocal [_name, [0,0,0]];
				_marker setMarkerTypeLocal "o_empty";
				_name setMarkerColorLocal "ColorOrange";
				_name setMarkerSizeLocal [1,1];
				_name setMarkerTextLocal _name;
			};
		};
	};
	_ahq = {
		private ["_marker","_name"];
		_name = "AHQ";
		_marker = createMarkerLocal [_name, [0,0,0]];
		_marker setMarkerTypeLocal "o_air";
		_name setMarkerColorLocal "ColorRed";
		_name setMarkerSizeLocal [1,1];
		_name setMarkerTextLocal _name;
		while {true} do {
			_marker setMarkerPosLocal getPos AHQ;
			sleep 2;
			if (!alive AHQ) then {
				deleteMarkerLocal _marker;
				waitUntil {alive AHQ};
				_marker = createMarkerLocal [_name, [0,0,0]];
				_marker setMarkerTypeLocal "o_air";
				_name setMarkerColorLocal "ColorRed";
				_name setMarkerSizeLocal [1,1];
				_name setMarkerTextLocal _name;
			};
		};
	};
#endif
waitUntil {time > 5};

_psy = [] spawn _mhq;
_psy = [] spawn _ahq;