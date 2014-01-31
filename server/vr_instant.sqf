// by psycho
// Evolution respawn script - vehicles spawn at place where there destroy'd and must be repair
#include "setup.sqf"
#define __Trans(tkind) _trans = getNumber(configFile >> #CfgVehicles >> typeOf _vec >> #tkind)
private ["_vec","_class","_rtime","_gm"];

_vec = _this select 0;
_class = typeOf _vec;
_rtime = 0;

//_vec addMPEventhandler ["MPKilled", {if (isServer) then {_this call XffuelCheck}};];

_eng_reward = {
	if(time > _rtime) then {
		switch (true) do {
			case (_vec in list reng1) : {reng1 call EVO_Erew};
			case (_vec in list reng2) : {reng2 call EVO_Erew};
			case (_vec in list reng3) : {reng3 call EVO_Erew};
			case (_vec in list reng4) : {reng4 call EVO_Erew};
			default {};
		};
		_rtime = time + 600;
	};
};


while {true} do {
	waitUntil {!alive _vec || getDammage _vec > 0.6};
	
	_pos = position _vec;
	_dir = getDir _vec;
	sleep 10; //(60 + random 60)
	deleteVehicle _vec;
	_vec = objNull;
	__sleep;
	
	_vec = createVehicle [_class, _pos, [], 0, "NONE"];
	_vec setPos _pos;
	_vec setDir _dir;
	_vec setFuel 0;
	_vec setDammage 0.60;
	_vec addMPEventhandler ["MPKilled", {if (isServer) then {_this call XffuelCheck}}];
	_markerobj = [_vcl] call EVO_vecmarker;
	__sleep;
	_vec setVeloCity [0.1, 0, 0.05];
	__Trans(transportAmmo);
	if (_trans > 0) then {
		_vec setAmmoCargo 0;
	};
	__Trans(transportRepair);
	if (_trans > 0) then {
		_vec setRepairCargo 0;
	};
	__Trans(transportFuel);
	if (_trans > 0) then {
		_vec setFuelCargo 0;
	};
	["d_n_v",_vec] call XNetCallEventToClients;
	
	waitUntil {damage _vec <= 0.05 || !(alive _vec)};
	if (damage _vec <= 0.05) then {
		[] call _eng_reward;
		if (damage _vec <= 0.05) then {
			deleteMarker _markerobj;
			_fuelleft = _vehicle getVariable "vec_fuel";
			if (isNil "_fuelleft") then {_fuelleft = 1};
			_vec setFuel _fuelleft;
			_vec addMPEventhandler ["MPKilled", {if (isServer) then {_this call XffuelCheck}}];
			[] call _eng_reward;
			__Trans(transportAmmo);
			if (_trans > 0) then {
				_vec setAmmoCargo 1;
			};
			__Trans(transportRepair);
			if (_trans > 0) then {
				_vec setRepairCargo 1;
			};
			__Trans(transportFuel);
			if (_trans > 0) then {
				_vec setFuelCargo 1;
			};
		};
	};
};