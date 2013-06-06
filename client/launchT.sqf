//by psycho
#include "setup.sqf"
CB_launch = {
	private ["_grp","_post","_spawnpos","_cruise"];
	_post = position T_launchpos;
	#ifndef __A2__
		_cruise = createVehicle ["Chukar_EP1", _post,[], 0, "FLY"];
	#else
		_cruise = createVehicle ["Chukar", _post,[], 0, "FLY"];
	#endif
	_cruise setvectorup [1,1,0];
	_cruise setPos [(getPos _cruise select 0),(getPos _cruise select 1),- 20] ;
	_cruise setVelocity [0,0,50]; sleep 0.2;
	_cruise flyinHeight 70;
	_cruise setSpeedMode "FULL"; 
	_cruise setVelocity [0,0,30]; sleep 0.2;
	_cruise setdamage 0.9;
	_cruise say "rocketaway";
	_cruise setVelocity [0,0,40]; sleep 0.2;
	_cruise setVelocity [30,0,100]; sleep 0.2;
	_cruise setVelocity [60,0,100];
	sleep 5;
	_grp = group _cruise;
	deletevehicle _cruise;
	deleteGroup _grp;
};

CB_detonation = {
	private ["_grp","_dropp","_cruise"];
	_dropp = position TTarget;
	_cruise = createVehicle ["Chukar",_dropp,[], 0, "FLY"];
	_grp = group _cruise;
	
	if (_cruise in list AirportIn) exitWith {
		deleteVehicle _cruise;
		deleteGroup _grp;
		player groupChat localize "STR_i_tbrape";
	};
	
	_cruise setvectordir [ 0.1,- 1,+ 0.5];
	[_cruise, 570] call XfSetHeight;
	_cruise setVelocity [0,2,0];
	_cruise setSpeedMode "FULL";
	_cruise setdamage 0.9;
	_dropPosX = _dropp select 0;
	_dropPosY = _dropp select 1;
	_dropPosZ = _dropp select 2;

	_droppos1 = [_dropPosX + 10, _dropPosY + 10, _dropPosZ];
	_droppos2 = [_dropPosX -10, _dropPosY + 10, _dropPosZ];
	_droppos3 = [_dropPosX + 0, _dropPosY - 10, _dropPosZ];
	
	_cpos = getPos _cruise;
	sleep 7;
	["say3D_sound",[_cruise,"r_incoming"]] call XNetCallEvent;
	waitUntil {!alive _cruise};

	_det1 = "BO_GBU12_LGB" createVehicle _dropp;
	_det2 =  createVehicle ["BO_GBU12_LGB",_droppos1,[], 0, "None"];
	_det3 =  createVehicle ["BO_GBU12_LGB",_droppos2,[], 0, "None"];   
	_det4 =  createVehicle ["BO_GBU12_LGB",_droppos3,[], 0, "None"];    
	_det12 = "BO_GBU12_LGB" createVehicle [( getpos TTarget select 0),(getpos TTarget select 1), 5];
	deleteVehicle _cruise;
	deleteGroup _grp;
};

CB_checklaunch = {
	private ["_dist"];
	(localize "STR_i_tarea") call XfGlobalChat;
	onMapSingleClick "
		TTarget setPos _pos;
		CB_setfire=true;
	";
	waitUntil {CB_setfire || !alive player};
	_dist = [Evo_Baseflag_MHQ, TTarget] call BIS_fnc_distance2D;
	if (_dist <= 500) exitWith {
		CB_setfire = false;
		onMapSingleClick "";
		_head = localize "STR_a_error";
		_body = localize "STR_i_tbrape";
		[EVO_brown,_head,_body,"stop"] call EVO_Message;
		_actionIdTomi = player addAction [localize "STR_a_tomi" call XRedText, "client\checklaunch.sqf",[],0, false, true];
	};
	if (!alive player) exitWith {CB_setfire = false; onMapSingleClick "";};

	onMapSingleClick "";
	_smoke = "SmokeshellRed" createVehicle [(getPos TTarget select 0), (getpos TTarget select 1), 0.2];

	["evo_ordenance_request", [player,"Tomahawk"]] call XNetCallEvent;
	sleep 3;
	_psy = [] spawn CB_launch;

	_dist = [player, T_launchpos] call BIS_fnc_distance2D;
	if (_dist < 6000) then {
		if (_dist < 3000) then {
			sleep 14;
		} else {
			sleep 20;
		};
	} else {
		sleep 24;
	};
	
	_psy = [] spawn CB_detonation;
	sleep 900;
	CB_setfire = false;
	if __Tcondition then {
		(localize "STR_i_tagain") call XfGlobalChat;
		_actionIdTomi = player addAction [localize "STR_a_tomi" call XRedText, "client\checklaunch.sqf",[],0, false, true];
	};
};