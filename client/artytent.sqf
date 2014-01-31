#include "setup.sqf"
_truck = objNull;
_truck = (nearestObject [vehicle player, EVO_ammotruck]);
if(isNull _truck) exitWith {
	_head = localize "STR_a_error";
	_body = localize "STR_a_truck1";
	[EVO_brown,_head,_body,"info"] call EVO_Message;
};
if (player in list AirportIn) exitWith {
	_head = localize "STR_a_error";
	_body = localize "STR_a_impossible";
	[EVO_brown,_head,_body,"stop"] call EVO_Message;
};
deleteVehicle d30;
_id = _this select 2;
player removeaction _id;

player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 3;
WaitUntil {animationState player != "AinvPknlMstpSlayWrflDnon_medic"};
if (!alive player) exitWith {_actionId8 = player addAction [localize "STR_a_arti" call XGreyText, "client\artytent.sqf",0,1, false, true,"test2"]};

_posd30  = getdir player;
#ifndef __A2__
	if (EVO_own_side == "WEST") then {
		d30 = "M119_US_EP1" createVehicle (position player);
	} else {
		d30 = "D30_TK_EP1" createVehicle (position player);
	};
#else
	if (EVO_own_side == "WEST") then {
		d30 = "M119" createVehicle (position player);
	} else {
		d30 = "D30_RU" createVehicle (position player);
	};
#endif
d30 setdir _posd30;
d30nest_pos = position d30;
//d30 addmagazine "20Rnd_120mmSABOT_M1A2";
//d30 addweapon "M256";
if (EVO_own_side == "WEST") then {
	{d30 removeMagazine _x} forEach magazines d30;
	d30 addmagazine "ARTY_30Rnd_105mmHE_M119";
	d30 addmagazine "ARTY_30Rnd_105mmLASER_M119";
	d30 addmagazine "ARTY_30Rnd_105mmSMOKE_M119";
	d30 addmagazine "ARTY_30Rnd_105mmILLUM_M119";
	} else {
	{d30 removeMagazine _x} forEach magazines d30;
	d30 addmagazine "ARTY_30Rnd_122mmHE_D30";
	d30 addmagazine "ARTY_30Rnd_122mmLASER_D30";
	d30 addmagazine "ARTY_30Rnd_122mmSMOKE_D30";
	d30 addmagazine "ARTY_30Rnd_122mmILLUM_D30";
};
d30 setVariable ["ARTY_VEHICLE",true];
player moveInGunner d30;
_head = localize "STR_i_info";
_body = localize "STR_a_artch";
[EVO_brown,_head,_body,"info"] call EVO_Message;
_actionId8 = player addAction [localize "STR_a_arti" call XGreyText, "client\artytent.sqf",0,1, false, true,"test2"];