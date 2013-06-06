#include "setup.sqf"

_guidedarray = ["Javelin","MetisLauncher","M47Launcher_EP1","BAF_NLAW_Launcher","ACE_RPOM","ACE_Javelin_Direct"];
if(!((secondaryweapon player) in _guidedarray)) exitWith {
	_head = localize "STR_a_error";
	_body = localize "STR_a_noat";
	[EVO_brown,_head,_body,"info"] call EVO_Message;
};
if (player in list AirportIn) exitWith {
	_head = localize "STR_a_error";
	_body = localize "STR_a_impossible";
	[EVO_brown,_head,_body,"stop"] call EVO_Message;
};
deleteVehicle fat;
_id = _this select 2;
player removeaction _id;

player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 3;
WaitUntil {animationState player != "AinvPknlMstpSlayWrflDnon_medic"};
if (!(alive player)) exitWith {_actionId8 = player addAction [localize "STR_a_tow" call XGreyText, "client\attent.sqf",0,1, false, true,"test2"]};

_posat  = getdir player;
#ifndef __A2__
	if (EVO_own_side == "WEST") then {
		fat = "TOW_TriPod_US_EP1" createVehicle (position player);
	} else {
		fat = "Metis_TK_EP1" createVehicle (position player);
	};
#else
	if (EVO_own_side == "WEST") then {
		fat = "TOW_TriPod" createVehicle (position player);
	} else {
		fat = "Metis" createVehicle (position player);
	};
#endif
fat setdir _posat;
atnest_pos = position fat;
player moveInGunner fat;
_actionId8 = player addAction [localize "STR_a_tow" call XGreyText, "client\attent.sqf",0,1, false, true,"test2"];