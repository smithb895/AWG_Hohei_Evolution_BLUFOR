#include "setup.sqf"
_carrier = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_action = (_this select 3) select 0;

_fuel = fuel _carrier;
_loadpos = _carrier ModelToWorld [0,-12,-5.5];
_cargo = _carrier getVariable "cargo";

if (_action == "load") then {
	if (_cargo == "") then {
		_near = nearestObjects [_loadpos, ["Ship","LandVehicle","Car","Motorcycle","Tank"], 8];
		_obj = _near select 0;
		_bound = boundingBox _obj;
		
		_width = (_bound select 1 select 0) - (_bound select 0 select 0);
		_length = (_bound select 1 select 1) - (_bound select 0 select 1);
		_height = (_bound select 1 select 2) - (_bound select 0 select 2);
		
		if (count _near > 0) then {
			//player groupChat format ["x:%1 y:%2 z:%3",_width,_length,_height];
			if ((_width <= 8.0) && (_length <= 15) && (_height <= 8.2)) then {
				_carrier setVariable ["cargo",_obj];
				_carrier removeAction _id;
			
				//player groupChat format ["Loading %1 into cargo",typeOf _obj];
				_carrier setFuel 0;
				_carrier animate ["ramp_top", 1];
				_carrier animate ["ramp_bottom", 1];
				sleep 3;
				_obj attachTo [_carrier,[0,2,((_obj modelToWorld [0,0,0]) select 2)-4.5]];
				_evh = _obj addEventHandler ["GetOut", {(_this select 2) moveInCargo (_this select 0 getvariable "carrier")}];
				_obj setVariable ["evh",_evh];
				_obj setVariable ["carrier",_carrier];
				_obj setVariable ["isLoaded",true];


				sleep 1;
				_carrier animate ["ramp_top", 0];
				_carrier animate ["ramp_bottom", 0];
				sleep 1;
				_head = localize "STR_i_takenote";
				_body = localize "STR_i_thottle";
				[EVO_brown,_head,_body,"info"] call EVO_Message;
				_carrier setFuel _fuel;
				_id = _carrier addaction ["Unload Cargo" call XRedText, "client\cargoscript.sqf", ["drop"],0, false, true];
			} else {
				_head = localize "STR_i_info";
				_body = localize "STR_i_ctosmall";
				[EVO_brown,_head,_body,"stop"] call EVO_Message;
			};
		} else {
			_head = localize "STR_i_info";
			_body = localize "STR_i_nothingir";
			[EVO_brown,_head,_body,"stop"] call EVO_Message;
		};
	} else {
		"Cargo is already in use" call XfGlobalChat;
		_head = localize "STR_i_info";
		_body = localize "STR_i_cfull";
		[EVO_brown,_head,_body,"stop"] call EVO_Message;
	};
};

if (_action == "drop") then {
	_carrier removeAction _id;
	_evh = _cargo getVariable "evh";
	_cargo removeEventHandler ["GetOut", _evh];
	if ((getpos _carrier select 2) > 3) then {
		_carrier animate ["ramp_top", 1];
		_carrier animate ["ramp_bottom", 1];
		sleep 3;
		detach _cargo;
		_cargo setpos _loadpos;
		sleep 1;
		#ifndef __A2__
			if (EVO_own_side == "WEST") then {
				_chute = "ParachuteMediumWest_EP1" createVehicle getpos _cargo;
			} else {
				_chute = "ParachuteMediumEast_EP1" createVehicle getpos _cargo;
			};
		#else
			if (EVO_own_side == "WEST") then {
				_chute = "ParachuteMediumWest" createVehicle getpos _cargo;
			} else {
				_chute = "ParachuteMediumEast" createVehicle getpos _cargo;
			};
		#endif
		_chute setpos (_cargo ModelToWorld [0,0,3]);
		_cargo attachTo [_chute,[0,0,0]];
		_carrier animate ["ramp_top", 0];
		_carrier animate ["ramp_bottom", 0];
		
		waitUntil {((getpos _cargo select 2) < 5)};
		sleep 2;
		deleteVehicle _chute;
		_cargo setPos [(getPos _cargo select 0),(getPos _cargo select 1),0.3];
		"C130_cargodrop" setMarkerPos getPos _cargo;
		sleep 1;
		_cargo setDammage 0;

	} else {
		_carrier animate ["ramp_top", 1];
		_carrier animate ["ramp_bottom", 1];
		sleep 3;
		detach _cargo;
		_cargo setpos _loadpos;
		sleep 1;
		_carrier animate ["ramp_top", 0];
		_carrier animate ["ramp_bottom", 0];
	};
	_cargo setVariable ["isLoaded",false];
	_carrier setVariable ["cargo",""];
	_id = _carrier addaction [localize 'STR_a_cload' call XGreyText, "client\cargoscript.sqf", ["load"],0, false, true];
};