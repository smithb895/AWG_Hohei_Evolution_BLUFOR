#include "setup.sqf"

_grenadearray = ["Mk13_EP1","M32_EP1","SCAR_L_STD_EGLM_TWS","SCAR_L_STD_EGLM_RCO","SCAR_L_CQC_EGLM_Holo",
"M4A3_RCO_GL_EP1","M8_carbineGL","M4A1_HWS_GL_camo","M4A1_RCO_GL","M4A1_HWS_GL","M4A1_HWS_GL_SD_Camo",
"M16A4_ACG_GL","M16A4_GL","M16A2GL","AK_74_GL","AK_107_GL_pso","AK_107_GL_kobra","SCAR_H_STD_EGLM_Spect",
"AK_74_GL_kobra","ACE_AK103_GL","ACE_AK103_GL_1P29","ACE_AK103_GL_Kobra","ACE_AK103_GL_PSO","ACE_AK74M_GL",
"ACE_AK74M_GL_1P29","ACE_AK74M_GL_1P78","ACE_AK74M_GL_Kobra","ACE_AK74M_GL_NSPU","ACE_AK74M_GL_PSO","ACE_AK74M_GL_TWS",
"ACE_AKM_GL","ACE_AKS74P_GL","ACE_AKS74P_GL_1P29","ACE_AKS74P_GL_Kobra","ACE_AKS74P_GL_PSO","ACE_M16A4_ACG_GL_UP",
"ACE_M16A4_CCO_GL_UP","ACE_M16A4_GL_UP","ACE_M4_AIM_GL_UP","ACE_M4_Eotech_GL_UP","ACE_M4_GL_UP","ACE_M4_RCO_GL_UP",
"ACE_M4A1_AIM_GL_UP","ACE_M4A1_AIM_GL_SD_UP","ACE_M4A1_GL_SD_UP","ACE_M4A1_GL_UP","ACE_M4A1_HWS_GL_camo_UP",
"ACE_M4A1_HWS_GL_SD_Camo_UP","ACE_M4A1_HWS_GL_UP","ACE_M4A1_RCO2_GL_UP","ACE_M4A1_RCO_GL","ACE_SOC_M4A1_GL",
"ACE_SOC_M4A1_GL_13","ACE_SOC_M4A1_GL_AIMPOINT","ACE_SOC_M4A1_GL_EOTECH","ACE_SOC_M4A1_GL_SD_UP","ACE_SOC_M4A1_GL_UP",
"ACE_SOC_M4A1_RCO_GL_UP"];

if(!((primaryWeapon player) in _grenadearray)) exitWith {
	_head = localize "STR_a_error";
	_body = localize "STR_a_nogrnen";
	[EVO_brown,_head,_body,"info"] call EVO_Message;
};
if (player in list AirportIn) exitWith {
	_head = localize "STR_a_error";
	_body = localize "STR_a_impossible";
	[EVO_brown,_head,_body,"stop"] call EVO_Message;
};
deleteVehicle mk;
_id = _this select 2;
player removeaction _id;

player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 3;
WaitUntil {animationState player != "AinvPknlMstpSlayWrflDnon_medic"};
if (!(alive player)) exitWith {_actionId8 = player addAction [localize "STR_a_gren" call XGreyText, "client\eierwerfer.sqf",0,1, false, true,"test2"]};

_posmk  = getdir player;
#ifndef __A2__
	if (EVO_own_side == "WEST") then {
		mk = "MK19_TriPod_US_EP1" createVehicle (position player);
	} else {
		mk = "AGS_TK_EP1" createVehicle (position player);
	};
#else
	if (EVO_own_side == "WEST") then {
		mk = "MK19_TriPod" createVehicle (position player);
	} else {
		mk = "AGS_RU" createVehicle (position player);
	};
#endif
mk setdir _posmk;
player moveInGunner mk;
_actionId8 = player addAction [localize "STR_a_gren" call XGreyText, "client\eierwerfer.sqf",0,1, false, true,"test2"];