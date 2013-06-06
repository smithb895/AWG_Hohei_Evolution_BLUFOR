#include "setup.sqf"
_mgarray = ["m240_scoped_EP1","Mk_48_DES_EP1","MG36_camo","M60A4_EP1","M249_m145_EP1","M249_TWS_EP1","M249_EP1",
"M240","RPK_74","Pecheneg","Mk_48","MG36","M8_SAW","M249","PK","ACE_M240B","ACE_M240L","ACE_M240L_M145","ACE_M60"];
if(!((primaryweapon player) in _mgarray)) exitWith {
	_head = localize "STR_a_error";
	_body = localize "STR_a_nomg";
	[EVO_brown,_head,_body,"info"] call EVO_Message;
};
if (player in list AirportIn) exitWith {
	_head = localize "STR_a_error";
	_body = localize "STR_a_impossible";
	[EVO_brown,_head,_body,"stop"] call EVO_Message;
};
deleteVehicle mg;
_id = _this select 2;
player removeaction _id;

player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 3;
WaitUntil {animationState player != "AinvPknlMstpSlayWrflDnon_medic"};
if (!alive player) exitWith {_actionId8 = player addAction [localize "STR_a_mg" call XGreyText, "client\mgtent.sqf",0,1, false, true,"test2"]};

_posmg  = getdir player;
#ifndef __A2__
	if (EVO_own_side == "WEST") then {
		mg = "M2HD_mini_TriPod_US_EP1" createVehicle (position player);
	} else {
		mg = "KORD_TK_EP1" createVehicle (position player);
	};
#else
	if (EVO_own_side == "WEST") then {
		mg = "M2StaticMG" createVehicle (position player);
	} else {
		mg = "KORD" createVehicle (position player);
	};
#endif
mg setdir _posmg;
mgnest_pos = position mg;
player moveInGunner mg;
_actionId8 = player addAction [localize "STR_a_mg" call XGreyText, "client\mgtent.sqf",0,1, false, true,"test2"];