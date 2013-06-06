// by psycho
// Evolution respawn script - vehicles spawn at place where there destroy'd and must be repair
#include "setup.sqf"
private ["_vcl","_class","_markerobj","_rtime"];

_vcl = _this select 0;
_class = typeOf _vcl;
_markerobj = "";
_rtime = 0;

_eng_reward = {
	if(time > _rtime) then {
		switch (true) do {
			case (_vcl in list reng1) : {reng1 call EVO_Erew};
			case (_vcl in list reng2) : {reng2 call EVO_Erew};
			case (_vcl in list reng3) : {reng3 call EVO_Erew};
			case (_vcl in list reng4) : {reng4 call EVO_Erew};
			default {};
		};
		_rtime = time + 120;
	};
};


while {true} do {

	if (alive _vcl) then {
		if ((count units _vcl) == 0 and _markerobj == "") then {				
			_markerobj = [_vcl] call EVO_vecmarker;
		};
		if ((count units _vcl) > 0 and _markerobj != "") then {
			deleteMarker _markerobj;
			_markerobj = "";
		};
		
	} else {
	
		_pos = position _vcl;
		_dir = getDir _vcl;
		sleep (60 + random 20);
		deleteVehicle _vcl;
		__sleep;

		_vcl = createVehicle [_class, _pos, [], 0, "NONE"];
		_vcl setPos _pos;
		_vcl setDir _dir;
		_vcl setFuel 0;
		_vcl setDammage 0.60;
		deleteMarker _markerobj;
		_markerobj = "";
		_markerobj = [_vcl] call EVO_vecmarker;
		__sleep;
		_vcl setVeloCity [0.1, 0, 0.05];
		
		waitUntil {damage _vcl == 0 || !(alive _vcl)};
		if (damage _vcl == 0) then {[] call _eng_reward};
	};

	sleep 2;
};