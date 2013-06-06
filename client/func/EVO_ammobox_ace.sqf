//by psycho
#include "setup.sqf"
private ["_crate","_rank"];
_rank = rank player;
_crate = _this select 0;
clearWeaponCargo _crate;
clearMagazineCargo _crate;

#ifdef __Takistan__
	if (__isBlue) then { //----------------------------------------------------------------------------------------------------west CO	
	if (E_lock == 0 or E_lock == 3) then {
		switch (_rank) do {
			case "PRIVATE": {
				_crate addWeaponCargo ["ACE_M136_CSRS", 2];	//launcher
				_crate addWeaponCargo ["M60A4_EP1", 2];	//mg
				_crate addWeaponCargo ["ACE_Glock18", 2];	//pistol
				_crate addWeaponCargo ["ACE_Knicklicht_Proxy", 2];
				_crate addWeaponCargo ["ACE_m16a2_scope", 2];	//rifles
				_crate addWeaponCargo ["ACE_M16A2GL_UP", 2];
				_crate addWeaponCargo ["ACE_M4", 2];
				_crate addWeaponCargo ["ACE_M4_GL", 2];
				_crate addWeaponCargo ["ACE_M4A1_F", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL", 2];
				_crate addWeaponCargo ["ACE_MP5A4", 2];
				_crate addWeaponCargo ["ACE_MP5A5", 2];
				_crate addWeaponCargo ["ACE_MP5SD", 2];
				_crate addWeaponCargo ["ACE_UMP45", 2];;
				_crate addWeaponCargo ["ACE_UMP45_SD", 2];
			};
			case "CORPORAL": {
				_crate addWeaponCargo ["ACE_M136_CSRS", 2];	//launcher
				_crate addWeaponCargo ["SMAW", 2];
				_crate addWeaponCargo ["ACE_M240L", 2];	//mg
				_crate addWeaponCargo ["M60A4_EP1", 2];
				_crate addWeaponCargo ["ACE_Glock18", 2];	//pistol
				_crate addWeaponCargo ["ACE_Knicklicht_Proxy", 2];
				_crate addWeaponCargo ["ACE_P226", 2];
				_crate addWeaponCargo ["ACE_USP", 2];
				_crate addWeaponCargo ["ACE_USPSD", 2];
				_crate addWeaponCargo ["ACE_G3A3", 2];	//rifles
				_crate addWeaponCargo ["ACE_G36A2", 2];
				_crate addWeaponCargo ["ACE_G36A2_D", 2];
				_crate addWeaponCargo ["ACE_HK416_D10", 2];
				_crate addWeaponCargo ["ACE_m16a2_scope", 2];
				_crate addWeaponCargo ["ACE_m16a2gl_scope_UP", 2];
				_crate addWeaponCargo ["ACE_M16A2GL_UP", 2];
				_crate addWeaponCargo ["ACE_M16A4_Iron", 2];
				_crate addWeaponCargo ["ACE_M27_IAR", 2];
				_crate addWeaponCargo ["ACE_M4", 2];
				_crate addWeaponCargo ["ACE_M4_GL", 2];
				_crate addWeaponCargo ["ACE_M4_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M4A1_F", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL_SD", 2];
				_crate addWeaponCargo ["ACE_MP5A4", 2];
				_crate addWeaponCargo ["ACE_MP5A5", 2];
				_crate addWeaponCargo ["ACE_MP5SD", 2];
				_crate addWeaponCargo ["ACE_UMP45", 2];;
				_crate addWeaponCargo ["ACE_UMP45_SD", 2];
			};
			case "SERGEANT": {
				_crate addWeaponCargo ["ACE_M136_CSRS", 2];	//launcher
				_crate addWeaponCargo ["ACE_M72", 2];
				_crate addWeaponCargo ["ACE_M72A2", 2];
				_crate addWeaponCargo ["SMAW", 2];
				_crate addWeaponCargo ["ACE_M249_AIM", 2];	//ar
				_crate addWeaponCargo ["M249_EP1", 2];
				_crate addWeaponCargo ["ACE_M240B", 2];	//mg
				_crate addWeaponCargo ["ACE_M240L", 2];
				_crate addWeaponCargo ["M60A4_EP1", 2];
				_crate addWeaponCargo ["ACE_Glock18", 2];	//pistol
				_crate addWeaponCargo ["ACE_Knicklicht_Proxy", 2];
				_crate addWeaponCargo ["ACE_P226", 2];
				_crate addWeaponCargo ["ACE_USP", 2];
				_crate addWeaponCargo ["ACE_USPSD", 2];
				_crate addWeaponCargo ["ACE_G3A3_RSAS", 2];	//rifles
				_crate addWeaponCargo ["ACE_G3A3", 2];
				_crate addWeaponCargo ["ACE_G36A2", 2];
				_crate addWeaponCargo ["ACE_G36A2_D", 2];
				_crate addWeaponCargo ["ACE_HK416_D10", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_AIM", 2];
				_crate addWeaponCargo ["ACE_HK416_D14", 2];
				_crate addWeaponCargo ["ACE_M14_ACOG", 2];
				_crate addWeaponCargo ["ACE_m16a2_scope", 2];
				_crate addWeaponCargo ["ACE_m16a2gl_scope_UP", 2];
				_crate addWeaponCargo ["ACE_M16A2GL_UP", 2];
				_crate addWeaponCargo ["ACE_M16A4_Iron", 2];
				_crate addWeaponCargo ["ACE_M27_IAR", 2];
				_crate addWeaponCargo ["ACE_M4", 2];
				_crate addWeaponCargo ["ACE_M4_Aim", 2];
				_crate addWeaponCargo ["ACE_M4_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M4A1_Aim_F", 2];
				_crate addWeaponCargo ["ACE_M4A1_AIM_GL", 2];
				_crate addWeaponCargo ["ACE_M4A1_Aim_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_F", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL_UP", 2];
				_crate addWeaponCargo ["ACE_MP5A4", 2];
				_crate addWeaponCargo ["ACE_MP5A5", 2];
				_crate addWeaponCargo ["ACE_MP5SD", 2];
				_crate addWeaponCargo ["ACE_SCAR_H_STD_Spect", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_Aim", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_AIM_SD", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL", 2];
				_crate addWeaponCargo ["ACE_UMP45", 2];;
				_crate addWeaponCargo ["ACE_UMP45_SD", 2];
				_crate addWeaponCargo ["ACE_M110", 2];	//sniper
				_crate addWeaponCargo ["ACE_M110_SD", 2];
			};
			case "LIEUTENANT": {
				_crate addWeaponCargo ["ACE_Javelin_CLU", 2];	//launcher
				_crate addWeaponCargo ["ACE_M136_CSRS", 2];
				_crate addWeaponCargo ["ACE_M72", 2];
				_crate addWeaponCargo ["ACE_M72A2", 2];
				_crate addWeaponCargo ["SMAW", 2];
				_crate addWeaponCargo ["Stinger", 2];
				_crate addWeaponCargo ["ACE_M249_AIM", 2];	//ar
				_crate addWeaponCargo ["M249_EP1", 2];
				_crate addWeaponCargo ["ACE_BAF_L7A2_GPMG", 2];	//mg
				_crate addWeaponCargo ["ACE_M240B", 2];
				_crate addWeaponCargo ["ACE_M240L", 2];
				_crate addWeaponCargo ["M60A4_EP1", 2];
				_crate addWeaponCargo ["ACE_Glock18", 2];	//pistol
				_crate addWeaponCargo ["ACE_Knicklicht_Proxy", 2];
				_crate addWeaponCargo ["ACE_P226", 2];
				_crate addWeaponCargo ["ACE_P8", 2];
				_crate addWeaponCargo ["ACE_USP", 2];
				_crate addWeaponCargo ["ACE_USPSD", 2];
				_crate addWeaponCargo ["ACE_G3A3_RSAS", 2];	//rifles
				_crate addWeaponCargo ["ACE_G3A3", 2];
				_crate addWeaponCargo ["ACE_G36A1_AG36A1_UP", 2];
				_crate addWeaponCargo ["ACE_G36A1_AG36A1_D_UP", 2];
				_crate addWeaponCargo ["ACE_G36A2", 2];
				_crate addWeaponCargo ["ACE_G36A2_D", 2];
				_crate addWeaponCargo ["ACE_HK416_D10", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_AIM", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_Holo", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_M320", 2];
				_crate addWeaponCargo ["ACE_HK416_D14", 2];
				_crate addWeaponCargo ["ACE_KAC_PDW", 2];
				_crate addWeaponCargo ["ACE_M1014_Eotech", 2];
				_crate addWeaponCargo ["ACE_M14_ACOG", 2];
				_crate addWeaponCargo ["ACE_m16a2_scope", 2];
				_crate addWeaponCargo ["ACE_m16a2gl_scope_UP", 2];
				_crate addWeaponCargo ["ACE_M16A2GL_UP", 2];
				_crate addWeaponCargo ["ACE_M16A4_ACG_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M16A4_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M16A4_Iron", 2];
				_crate addWeaponCargo ["ACE_M27_IAR", 2];
				_crate addWeaponCargo ["ACE_M27_IAR_CCO", 2];
				_crate addWeaponCargo ["ACE_M4", 2];
				_crate addWeaponCargo ["ACE_M4_Aim", 2];
				_crate addWeaponCargo ["ACE_M4_AIM_GL", 2];
				_crate addWeaponCargo ["ACE_M4_GL", 2];
				_crate addWeaponCargo ["ACE_M4_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M4A1_Aim_F", 2];
				_crate addWeaponCargo ["ACE_M4A1_AIM_GL", 2];
				_crate addWeaponCargo ["ACE_M4A1_AIM_GL_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_Aim_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_F", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL_UP", 2];
				_crate addWeaponCargo ["ACE_MP5A4", 2];
				_crate addWeaponCargo ["ACE_MP5A5", 2];
				_crate addWeaponCargo ["ACE_MP5SD", 2];
				_crate addWeaponCargo ["ACE_SCAR_H_STD_Spect", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_Aim", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_AIM_SD", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_13", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_SD_UP", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_UP", 2];
				_crate addWeaponCargo ["ACE_SPAS12", 2];
				_crate addWeaponCargo ["ACE_UMP45", 2];;
				_crate addWeaponCargo ["ACE_UMP45_SD", 2];
				_crate addWeaponCargo ["ACE_M110", 2];	//sniper
				_crate addWeaponCargo ["ACE_M110_SD", 2];
			};
			case "CAPTAIN": {
				_crate addWeaponCargo ["ACE_Javelin_CLU", 2];	//launcher
				_crate addWeaponCargo ["ACE_Javelin_Direct", 2];
				_crate addWeaponCargo ["ACE_M136_CSRS", 2];
				_crate addWeaponCargo ["ACE_M72", 2];
				_crate addWeaponCargo ["ACE_M72A2", 2];
				_crate addWeaponCargo ["Javelin", 2];
				_crate addWeaponCargo ["SMAW", 2];
				_crate addWeaponCargo ["Stinger", 2];
				_crate addWeaponCargo ["ACE_M249_AIM", 2];	//ar
				_crate addWeaponCargo ["ACE_M249_PIP_ACOG", 2];
				_crate addWeaponCargo ["M249_EP1", 2];
				_crate addWeaponCargo ["ACE_BAF_L7A2_GPMG", 2];	//mg
				_crate addWeaponCargo ["ACE_M240B", 2];
				_crate addWeaponCargo ["ACE_M240L", 2];
				_crate addWeaponCargo ["ACE_M240L_M145", 2];
				_crate addWeaponCargo ["m240_scoped_EP1", 2];
				_crate addWeaponCargo ["M60A4_EP1", 2];
				_crate addWeaponCargo ["ACE_Glock18", 2];	//pistol
				_crate addWeaponCargo ["ACE_Knicklicht_Proxy", 2];
				_crate addWeaponCargo ["ACE_P226", 2];
				_crate addWeaponCargo ["ACE_P8", 2];
				_crate addWeaponCargo ["ACE_USP", 2];
				_crate addWeaponCargo ["ACE_USPSD", 2];
				_crate addWeaponCargo ["ACE_G3A3_RSAS", 2];	//rifles
				_crate addWeaponCargo ["ACE_G3A3", 2];
				_crate addWeaponCargo ["ACE_G36A1_AG36A1_UP", 2];
				_crate addWeaponCargo ["ACE_G36A1_AG36A1_D_UP", 2];
				_crate addWeaponCargo ["ACE_G36A2", 2];
				_crate addWeaponCargo ["ACE_G36A2_D", 2];
				_crate addWeaponCargo ["ACE_G36A2_Bipod", 2];
				_crate addWeaponCargo ["ACE_G36A2_Bipod_D", 2];
				_crate addWeaponCargo ["ACE_HK416_D10", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_AIM", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_Holo", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_M320_UP", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_SD", 2];
				_crate addWeaponCargo ["ACE_HK416_D14", 2];
				_crate addWeaponCargo ["ACE_HK416_D14_COMPM3", 2];
				_crate addWeaponCargo ["ACE_HK416_D14_SD", 2];
				_crate addWeaponCargo ["ACE_KAC_PDW", 2];
				_crate addWeaponCargo ["ACE_M1014_Eotech", 2];
				_crate addWeaponCargo ["ACE_M14_ACOG", 2];
				_crate addWeaponCargo ["ACE_m16a2_scope", 2];
				_crate addWeaponCargo ["ACE_m16a2gl_scope_UP", 2];
				_crate addWeaponCargo ["ACE_M16A2GL_UP", 2];
				_crate addWeaponCargo ["ACE_M16A4_ACG_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M16A4_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M16A4_Iron", 2];
				_crate addWeaponCargo ["ACE_M27_IAR", 2];
				_crate addWeaponCargo ["ACE_M27_IAR_ACOG", 2];
				_crate addWeaponCargo ["ACE_M27_IAR_CCO", 2];
				_crate addWeaponCargo ["ACE_M4", 2];
				_crate addWeaponCargo ["ACE_M4_Aim", 2];
				_crate addWeaponCargo ["ACE_M4_AIM_GL", 2];
				_crate addWeaponCargo ["ACE_M4_GL", 2];
				_crate addWeaponCargo ["ACE_M4_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M4_RCO_GL", 2];
				_crate addWeaponCargo ["ACE_M4A1_ACOG", 2];
				_crate addWeaponCargo ["ACE_M4A1_ACOG_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_Aim_F", 2];
				_crate addWeaponCargo ["ACE_M4A1_AIM_GL", 2];
				_crate addWeaponCargo ["ACE_M4A1_AIM_GL_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_Aim_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_Eotech", 2];
				_crate addWeaponCargo ["ACE_M4A1_F", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M4SPR_SD", 2];
				_crate addWeaponCargo ["ACE_Mk12mod1_SD", 2];
				_crate addWeaponCargo ["ACE_MP5A4", 2];
				_crate addWeaponCargo ["ACE_MP5A5", 2];
				_crate addWeaponCargo ["ACE_MP5SD", 2];
				_crate addWeaponCargo ["ACE_SCAR_H_STD_Spect", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_Aim", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_AIM_SD", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_Eotech", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_13", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_AIMPOINT", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_EOTECH", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_SD_UP", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_UP", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_RCO_GL", 2];
				_crate addWeaponCargo ["ACE_SPAS12", 2];
				_crate addWeaponCargo ["ACE_UMP45", 2];
				_crate addWeaponCargo ["ACE_UMP45_AIM", 2];
				_crate addWeaponCargo ["ACE_UMP45_AIM_SD", 2];
				_crate addWeaponCargo ["ACE_UMP45_SD", 2];
				_crate addWeaponCargo ["ACE_AS50", 2];	//sniper
				_crate addWeaponCargo ["ACE_M110", 2];
				_crate addWeaponCargo ["ACE_M110_SD", 2];
			};
			case "MAJOR": {
				_crate addWeaponCargo ["ACE_Javelin_CLU", 2];	//launcher
				_crate addWeaponCargo ["ACE_Javelin_Direct", 2];
				_crate addWeaponCargo ["ACE_M136_CSRS", 2];
				_crate addWeaponCargo ["ACE_M72", 2];
				_crate addWeaponCargo ["ACE_M72A2", 2];
				_crate addWeaponCargo ["Javelin", 2];
				_crate addWeaponCargo ["SMAW", 2];
				_crate addWeaponCargo ["Stinger", 2];
				_crate addWeaponCargo ["ACE_M249_AIM", 2];	//ar
				_crate addWeaponCargo ["ACE_M249_PIP_ACOG", 2];
				_crate addWeaponCargo ["M249_EP1", 2];
				_crate addWeaponCargo ["M249_m145_EP1", 2];
				_crate addWeaponCargo ["ACE_BAF_L7A2_GPMG", 2];	//mg
				_crate addWeaponCargo ["ACE_M240B", 2];
				_crate addWeaponCargo ["ACE_M240L", 2];
				_crate addWeaponCargo ["ACE_M240L_M145", 2];
				_crate addWeaponCargo ["m240_scoped_EP1", 2];
				_crate addWeaponCargo ["M60A4_EP1", 2];
				_crate addWeaponCargo ["Mk_48_DES_EP1", 2];
				_crate addWeaponCargo ["ACE_Glock18", 2];	//pistol
				_crate addWeaponCargo ["ACE_Knicklicht_Proxy", 2];
				_crate addWeaponCargo ["ACE_P226", 2];
				_crate addWeaponCargo ["ACE_P8", 2];
				_crate addWeaponCargo ["ACE_USP", 2];
				_crate addWeaponCargo ["ACE_USPSD", 2];
				_crate addWeaponCargo ["ACE_G3A3_RSAS", 2];	//rifles
				_crate addWeaponCargo ["ACE_G3A3", 2];
				_crate addWeaponCargo ["ACE_G3SG1", 2];
				_crate addWeaponCargo ["ACE_G36K_EOTech", 2];
				_crate addWeaponCargo ["ACE_G36K_iron", 2];
				_crate addWeaponCargo ["ACE_G36A1_AG36A1_UP", 2];
				_crate addWeaponCargo ["ACE_G36A1_AG36A1_D_UP", 2];
				_crate addWeaponCargo ["ACE_G36A2", 2];
				_crate addWeaponCargo ["ACE_G36A2_D", 2];
				_crate addWeaponCargo ["ACE_G36A2_Bipod", 2];
				_crate addWeaponCargo ["ACE_G36A2_Bipod_D", 2];
				_crate addWeaponCargo ["ACE_HK416_D10", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_AIM", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_COMPM3", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_COMPM3_SD", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_Holo", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_M320_UP", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_SD", 2];
				_crate addWeaponCargo ["ACE_HK416_D14", 2];
				_crate addWeaponCargo ["ACE_HK416_D14_ACOG_PVS14", 2];
				_crate addWeaponCargo ["ACE_HK416_D14_COMPM3", 2];
				_crate addWeaponCargo ["ACE_HK416_D14_SD", 2];
				_crate addWeaponCargo ["ACE_HK416_D14_TWS", 2];
				_crate addWeaponCargo ["ACE_HK417_Eotech_4x", 2];
				_crate addWeaponCargo ["ACE_HK417_leupold", 2];
				_crate addWeaponCargo ["ACE_KAC_PDW", 2];
				_crate addWeaponCargo ["ACE_M1014_Eotech", 2];
				_crate addWeaponCargo ["ACE_M14_ACOG", 2];
				_crate addWeaponCargo ["ACE_m16a2_scope", 2];
				_crate addWeaponCargo ["ACE_m16a2gl_scope_UP", 2];
				_crate addWeaponCargo ["ACE_M16A2GL_UP", 2];
				_crate addWeaponCargo ["ACE_M16A4_ACG_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M16A4_CCO_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M16A4_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M16A4_Iron", 2];
				_crate addWeaponCargo ["ACE_M27_IAR", 2];
				_crate addWeaponCargo ["ACE_M27_IAR_ACOG", 2];
				_crate addWeaponCargo ["ACE_M27_IAR_CCO", 2];
				_crate addWeaponCargo ["ACE_M4", 2];
				_crate addWeaponCargo ["ACE_M4_ACOG", 2];
				_crate addWeaponCargo ["ACE_M4_Aim", 2];
				_crate addWeaponCargo ["ACE_M4_AIM_GL", 2];
				_crate addWeaponCargo ["ACE_M4_Eotech", 2];
				_crate addWeaponCargo ["ACE_M4_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M4_RCO_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M4A1_ACOG", 2];
				_crate addWeaponCargo ["ACE_M4A1_ACOG_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_AIM_GL", 2];
				_crate addWeaponCargo ["ACE_M4A1_AIM_GL_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_AIM_GL_SD_UP", 2];
				_crate addWeaponCargo ["ACE_M4A1_Aim_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_Aim_SD_F", 2];
				_crate addWeaponCargo ["ACE_M4A1_Eotech", 2];
				_crate addWeaponCargo ["ACE_M4A1_Eotech_F", 2];
				_crate addWeaponCargo ["ACE_M4A1_F", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL_SD_UP", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M4A1_RCO2_GL", 2];
				_crate addWeaponCargo ["ACE_M4A1_RCO_GL", 2];
				_crate addWeaponCargo ["ACE_M4SPR_SD", 2];
				_crate addWeaponCargo ["ACE_Mk12mod1", 2];
				_crate addWeaponCargo ["ACE_Mk12mod1_SD", 2];
				_crate addWeaponCargo ["ACE_MP5A4", 2];
				_crate addWeaponCargo ["ACE_MP5A5", 2];
				_crate addWeaponCargo ["ACE_MP5SD", 2];
				_crate addWeaponCargo ["ACE_SCAR_H_STD_Spect", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_Aim", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_AIM_SD", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_Eotech", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_13", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_AIMPOINT", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_EOTECH", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_SD_UP", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_UP", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_RCO_GL_UP", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_SD_9", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_SHORTDOT_SD", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_TWS", 2];
				_crate addWeaponCargo ["ACE_SPAS12", 2];
				_crate addWeaponCargo ["ACE_UMP45", 2];
				_crate addWeaponCargo ["ACE_UMP45_AIM", 2];
				_crate addWeaponCargo ["ACE_UMP45_AIM_SD", 2];
				_crate addWeaponCargo ["ACE_UMP45_SD", 2];
				_crate addWeaponCargo ["ACE_AS50", 2];	//sniper
				_crate addWeaponCargo ["ACE_M109", 2];
				_crate addWeaponCargo ["ACE_M110", 2];
				_crate addWeaponCargo ["ACE_M110_SD", 2];
				_crate addWeaponCargo ["ACE_TAC50_SD", 2];
			};
			case "COLONEL": {
				_crate addWeaponCargo ["ACE_Javelin_CLU", 2];	//launcher
				_crate addWeaponCargo ["ACE_Javelin_Direct", 2];
				_crate addWeaponCargo ["ACE_M136_CSRS", 2];
				_crate addWeaponCargo ["ACE_M72", 2];
				_crate addWeaponCargo ["ACE_M72A2", 2];
				_crate addWeaponCargo ["Javelin", 2];
				_crate addWeaponCargo ["SMAW", 2];
				_crate addWeaponCargo ["Stinger", 2];
				_crate addWeaponCargo ["ACE_M249_AIM", 2];	//ar
				_crate addWeaponCargo ["ACE_M249_PIP_ACOG", 2];
				_crate addWeaponCargo ["M249_EP1", 2];
				_crate addWeaponCargo ["M249_m145_EP1", 2];
				_crate addWeaponCargo ["M249_TWS_EP1", 2];
				_crate addWeaponCargo ["ACE_BAF_L7A2_GPMG", 2];	//mg
				_crate addWeaponCargo ["ACE_M240B", 2];
				_crate addWeaponCargo ["ACE_M240L", 2];
				_crate addWeaponCargo ["ACE_M240L_M145", 2];
				_crate addWeaponCargo ["m240_scoped_EP1", 2];
				_crate addWeaponCargo ["M60A4_EP1", 2];
				_crate addWeaponCargo ["Mk_48_DES_EP1", 2];
				_crate addWeaponCargo ["ACE_Glock18", 2];	//pistol
				_crate addWeaponCargo ["ACE_Knicklicht_Proxy", 2];
				_crate addWeaponCargo ["ACE_P226", 2];
				_crate addWeaponCargo ["ACE_P8", 2];
				_crate addWeaponCargo ["ACE_USP", 2];
				_crate addWeaponCargo ["ACE_USPSD", 2];
				_crate addWeaponCargo ["ACE_G3A3_RSAS", 2];	//rifles
				_crate addWeaponCargo ["ACE_G3A3", 2];
				_crate addWeaponCargo ["ACE_G3SG1", 2];
				_crate addWeaponCargo ["ACE_G36K_EOTech", 2];
				_crate addWeaponCargo ["ACE_G36K_iron", 2];
				_crate addWeaponCargo ["ACE_G36A1_AG36A1_UP", 2];
				_crate addWeaponCargo ["ACE_G36A1_AG36A1_D_UP", 2];
				_crate addWeaponCargo ["ACE_G36A2", 2];
				_crate addWeaponCargo ["ACE_G36A2_D", 2];
				_crate addWeaponCargo ["ACE_G36A2_Bipod", 2];
				_crate addWeaponCargo ["ACE_G36A2_Bipod_D", 2];
				_crate addWeaponCargo ["ACE_HK416_D10", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_AIM", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_COMPM3", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_COMPM3_SD", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_Holo", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_M320_UP", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_SD", 2];
				_crate addWeaponCargo ["ACE_HK416_D14", 2];
				_crate addWeaponCargo ["ACE_HK416_D14_ACOG_PVS14", 2];
				_crate addWeaponCargo ["ACE_HK416_D14_COMPM3", 2];
				_crate addWeaponCargo ["ACE_HK416_D14_COMPM3_M320_UP", 2];
				_crate addWeaponCargo ["ACE_HK416_D14_SD", 2];
				_crate addWeaponCargo ["ACE_HK416_D14_TWS", 2];
				_crate addWeaponCargo ["ACE_HK417_Eotech_4x", 2];
				_crate addWeaponCargo ["ACE_HK417_leupold", 2];
				_crate addWeaponCargo ["ACE_HK417_micro", 2];
				_crate addWeaponCargo ["ACE_HK417_Shortdot", 2];
				_crate addWeaponCargo ["ACE_KAC_PDW", 2];
				_crate addWeaponCargo ["ACE_M1014_Eotech", 2];
				_crate addWeaponCargo ["ACE_M14_ACOG", 2];
				_crate addWeaponCargo ["ACE_m16a2_scope", 2];
				_crate addWeaponCargo ["ACE_m16a2gl_scope_UP", 2];
				_crate addWeaponCargo ["ACE_M16A4_ACG_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M16A4_CCO_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M16A4_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M16A4_Iron", 2];
				_crate addWeaponCargo ["ACE_M27_IAR", 2];
				_crate addWeaponCargo ["ACE_M27_IAR_ACOG", 2];
				_crate addWeaponCargo ["ACE_M27_IAR_CCO", 2];
				_crate addWeaponCargo ["ACE_M4", 2];
				_crate addWeaponCargo ["ACE_M4_ACOG", 2];
				_crate addWeaponCargo ["ACE_M4_Aim", 2];
				_crate addWeaponCargo ["ACE_M4_AIM_GL", 2];
				_crate addWeaponCargo ["ACE_M4_AIM_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M4_Eotech", 2];
				_crate addWeaponCargo ["ACE_M4_Eotech_F", 2];
				_crate addWeaponCargo ["ACE_M4_GL", 2];
				_crate addWeaponCargo ["ACE_M4_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M4_RCO_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M4A1_ACOG", 2];
				_crate addWeaponCargo ["ACE_M4A1_ACOG_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_AIM_GL", 2];
				_crate addWeaponCargo ["ACE_M4A1_AIM_GL_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_AIM_GL_SD_UP", 2];
				_crate addWeaponCargo ["ACE_M4A1_AIM_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M4A1_Aim_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_Eotech", 2];
				_crate addWeaponCargo ["ACE_M4A1_F", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL_SD_UP", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M4A1_RCO2_GL_UP", 2];
				_crate addWeaponCargo ["ACE_M4A1_RCO_GL", 2];
				_crate addWeaponCargo ["ACE_M4SPR_SD", 2];
				_crate addWeaponCargo ["ACE_Mk12mod1", 2];
				_crate addWeaponCargo ["ACE_Mk12mod1_SD", 2];
				_crate addWeaponCargo ["ACE_MP5A4", 2];
				_crate addWeaponCargo ["ACE_MP5A5", 2];
				_crate addWeaponCargo ["ACE_MP5SD", 2];
				_crate addWeaponCargo ["ACE_SCAR_H_STD_Spect", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_Aim", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_AIM_SD", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_Eotech", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_Eotech_4x", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_Eotech_F", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_13", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_AIMPOINT", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_EOTECH", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_SD", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_SD_UP", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_UP", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_RCO_GL", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_RCO_GL_UP", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_SD_9", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_SHORTDOT", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_SHORTDOT_SD", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_TWS", 2];
				_crate addWeaponCargo ["ACE_SPAS12", 2];
				_crate addWeaponCargo ["ACE_UMP45", 2];
				_crate addWeaponCargo ["ACE_UMP45_AIM", 2];
				_crate addWeaponCargo ["ACE_UMP45_AIM_SD", 2];
				_crate addWeaponCargo ["ACE_UMP45_SD", 2];
				_crate addWeaponCargo ["ACE_AS50", 2];	//sniper
				_crate addWeaponCargo ["ACE_M109", 2];
				_crate addWeaponCargo ["ACE_M110", 2];
				_crate addWeaponCargo ["ACE_M110_SD", 2];
				_crate addWeaponCargo ["ACE_TAC50", 2];
				_crate addWeaponCargo ["ACE_TAC50_SD", 2];
			};
		};
	} else {
	_crate addWeaponCargo ["ACE_Javelin_CLU", 2];	//launcher
	_crate addWeaponCargo ["ACE_Javelin_Direct", 2];
	_crate addWeaponCargo ["ACE_M136_CSRS", 2];
	_crate addWeaponCargo ["ACE_M72", 2];
	_crate addWeaponCargo ["ACE_M72A2", 2];
	_crate addWeaponCargo ["Javelin", 2];
	_crate addWeaponCargo ["SMAW", 2];
	_crate addWeaponCargo ["Stinger", 2];
	_crate addWeaponCargo ["ACE_M249_AIM", 2];	//ar
	_crate addWeaponCargo ["ACE_M249_PIP_ACOG", 2];
	_crate addWeaponCargo ["M249_EP1", 2];
	_crate addWeaponCargo ["M249_m145_EP1", 2];
	_crate addWeaponCargo ["M249_TWS_EP1", 2];
	_crate addWeaponCargo ["ACE_BAF_L7A2_GPMG", 2];	//mg
	_crate addWeaponCargo ["ACE_M240B", 2];
	_crate addWeaponCargo ["ACE_M240L", 2];
	_crate addWeaponCargo ["ACE_M240L_M145", 2];
	_crate addWeaponCargo ["m240_scoped_EP1", 2];
	_crate addWeaponCargo ["M60A4_EP1", 2];
	_crate addWeaponCargo ["Mk_48_DES_EP1", 2];
	_crate addWeaponCargo ["ACE_Glock18", 2];	//pistol
	_crate addWeaponCargo ["ACE_Knicklicht_Proxy", 2];
	_crate addWeaponCargo ["ACE_P226", 2];
	_crate addWeaponCargo ["ACE_P8", 2];
	_crate addWeaponCargo ["ACE_USP", 2];
	_crate addWeaponCargo ["ACE_USPSD", 2];
	_crate addWeaponCargo ["ACE_G3A3_RSAS", 2];	//rifles
	
	_crate addWeaponCargo ["ACE_G3A3", 2];
	_crate addWeaponCargo ["ACE_G3SG1", 2];
	_crate addWeaponCargo ["ACE_G36K_EOTech", 2];
	_crate addWeaponCargo ["ACE_G36K_iron", 2];
	_crate addWeaponCargo ["ACE_G36A1_AG36A1_UP", 2];
	_crate addWeaponCargo ["ACE_G36A1_AG36A1_D_UP", 2];
	_crate addWeaponCargo ["ACE_G36A2", 2];
	_crate addWeaponCargo ["ACE_G36A2_D", 2];
	_crate addWeaponCargo ["ACE_G36A2_Bipod", 2];
	_crate addWeaponCargo ["ACE_G36A2_Bipod_D", 2];
	
	_crate addWeaponCargo ["ACE_HK416_D10", 2];
	_crate addWeaponCargo ["ACE_HK416_D10_AIM", 2];
	_crate addWeaponCargo ["ACE_HK416_D10_COMPM3", 2];
	_crate addWeaponCargo ["ACE_HK416_D10_COMPM3_SD", 2];
	_crate addWeaponCargo ["ACE_HK416_D10_Holo", 2];
	_crate addWeaponCargo ["ACE_HK416_D10_M320_UP", 2];
	_crate addWeaponCargo ["ACE_HK416_D10_SD", 2];
	_crate addWeaponCargo ["ACE_HK416_D14", 2];
	_crate addWeaponCargo ["ACE_HK416_D14_ACOG_PVS14", 2];
	_crate addWeaponCargo ["ACE_HK416_D14_COMPM3", 2];
	_crate addWeaponCargo ["ACE_HK416_D14_COMPM3_M320_UP", 2];
	_crate addWeaponCargo ["ACE_HK416_D14_SD", 2];
	_crate addWeaponCargo ["ACE_HK416_D14_TWS", 2];
	_crate addWeaponCargo ["ACE_HK417_Eotech_4x", 2];
	_crate addWeaponCargo ["ACE_HK417_leupold", 2];
	_crate addWeaponCargo ["ACE_HK417_micro", 2];
	_crate addWeaponCargo ["ACE_HK417_Shortdot", 2];
	_crate addWeaponCargo ["ACE_KAC_PDW", 2];
	_crate addWeaponCargo ["ACE_M1014_Eotech", 2];
	_crate addWeaponCargo ["ACE_M14_ACOG", 2];
	_crate addWeaponCargo ["ACE_m16a2_scope", 2];
	_crate addWeaponCargo ["ACE_m16a2gl_scope_UP", 2];
	_crate addWeaponCargo ["ACE_M16A2GL_UP", 2];
	_crate addWeaponCargo ["ACE_M16A4_ACG_GL_UP", 2];
	_crate addWeaponCargo ["ACE_M16A4_CCO_GL_UP", 2];
	_crate addWeaponCargo ["ACE_M16A4_GL_UP", 2];
	_crate addWeaponCargo ["ACE_M16A4_Iron", 2];
	_crate addWeaponCargo ["ACE_M27_IAR", 2];
	_crate addWeaponCargo ["ACE_M27_IAR_ACOG", 2];
	_crate addWeaponCargo ["ACE_M27_IAR_CCO", 2];
	_crate addWeaponCargo ["ACE_M4", 2];
	_crate addWeaponCargo ["ACE_M4_ACOG", 2];
	_crate addWeaponCargo ["ACE_M4_Aim", 2];
	_crate addWeaponCargo ["ACE_M4_AIM_GL_UP", 2];
	_crate addWeaponCargo ["ACE_M4_Eotech", 2];
	_crate addWeaponCargo ["ACE_M4_GL", 2];
	_crate addWeaponCargo ["ACE_M4_RCO_GL_UP", 2];
	_crate addWeaponCargo ["ACE_M4A1_ACOG", 2];
	_crate addWeaponCargo ["ACE_M4A1_ACOG_SD", 2];
	_crate addWeaponCargo ["ACE_M4A1_Aim_F", 2];
	_crate addWeaponCargo ["ACE_M4A1_AIM_GL_SD_UP", 2];
	_crate addWeaponCargo ["ACE_M4A1_AIM_GL_UP", 2];
	_crate addWeaponCargo ["ACE_M4A1_Aim_SD", 2];
	_crate addWeaponCargo ["ACE_M4A1_Eotech", 2];
	_crate addWeaponCargo ["ACE_M4A1_F", 2];
	_crate addWeaponCargo ["ACE_M4A1_GL", 2];
	_crate addWeaponCargo ["ACE_M4A1_GL_SD_UP", 2];
	_crate addWeaponCargo ["ACE_M4A1_GL_UP", 2];
	_crate addWeaponCargo ["ACE_M4A1_RCO2_GL", 2];
	_crate addWeaponCargo ["ACE_M4A1_RCO2_GL_UP", 2];
	_crate addWeaponCargo ["ACE_M4A1_RCO_GL", 2];
	_crate addWeaponCargo ["ACE_M4SPR_SD", 2];
	_crate addWeaponCargo ["ACE_Mk12mod1", 2];
	_crate addWeaponCargo ["ACE_Mk12mod1_SD", 2];
	_crate addWeaponCargo ["ACE_MP5A4", 2];
	_crate addWeaponCargo ["ACE_MP5A5", 2];
	_crate addWeaponCargo ["ACE_MP5SD", 2];
	_crate addWeaponCargo ["ACE_SCAR_H_STD_Spect", 2];
	_crate addWeaponCargo ["ACE_SOC_M4A1", 2];
	_crate addWeaponCargo ["ACE_SOC_M4A1_Aim", 2];
	_crate addWeaponCargo ["ACE_SOC_M4A1_AIM_SD", 2];
	_crate addWeaponCargo ["ACE_SOC_M4A1_Eotech", 2];
	_crate addWeaponCargo ["ACE_SOC_M4A1_Eotech_4x", 2];
	_crate addWeaponCargo ["ACE_SOC_M4A1_GL_13", 2];
	_crate addWeaponCargo ["ACE_SOC_M4A1_GL_AIMPOINT", 2];
	_crate addWeaponCargo ["ACE_SOC_M4A1_GL_EOTECH", 2];
	_crate addWeaponCargo ["ACE_SOC_M4A1_GL_SD_UP", 2];
	_crate addWeaponCargo ["ACE_SOC_M4A1_GL_UP", 2];
	_crate addWeaponCargo ["ACE_SOC_M4A1_RCO_GL", 2];
	_crate addWeaponCargo ["ACE_SOC_M4A1_RCO_GL_UP", 2];
	_crate addWeaponCargo ["ACE_SOC_M4A1_SD_9", 2];
	_crate addWeaponCargo ["ACE_SOC_M4A1_SHORTDOT", 2];
	_crate addWeaponCargo ["ACE_SOC_M4A1_SHORTDOT_SD", 2];
	_crate addWeaponCargo ["ACE_SOC_M4A1_TWS", 2];
	_crate addWeaponCargo ["ACE_SPAS12", 2];
	_crate addWeaponCargo ["ACE_UMP45", 2];
	_crate addWeaponCargo ["ACE_UMP45_AIM", 2];
	_crate addWeaponCargo ["ACE_UMP45_AIM_SD", 2];
	_crate addWeaponCargo ["ACE_UMP45_SD", 2];
	_crate addWeaponCargo ["ACE_AS50", 2];	//sniper
	_crate addWeaponCargo ["ACE_M109", 2];
	_crate addWeaponCargo ["ACE_M110", 2];
	_crate addWeaponCargo ["ACE_M110_SD", 2];
	_crate addWeaponCargo ["ACE_TAC50", 2];
	_crate addWeaponCargo ["ACE_TAC50_SD", 2];
};
_crate addWeaponCargo ["Laserdesignator",1];
_crate addWeaponCargo ["NVGoggles",1];
_crate addWeaponCargo ["Binocular_Vector",1];
_crate addWeaponCargo ["Binocular",1];
_crate addWeaponCargo ["ACE_YardAge450",1];
_crate addWeaponCargo ["ACE_Rangefinder_OD",1];
_crate addWeaponCargo ["ACE_MX2A",1];
_crate addWeaponCargo ["ACE_DAGR",1];
_crate addWeaponCargo ["ACE_Earplugs",1];
_crate addWeaponCargo ["ACE_GlassesBalaklava",1];
_crate addWeaponCargo ["ACE_GlassesBalaklavaGray",1];
_crate addWeaponCargo ["ACE_GlassesBalaklavaOlive",1];
_crate addWeaponCargo ["ACE_GlassesBlackSun",1];
_crate addWeaponCargo ["ACE_GlassesBlueSun",1];
_crate addWeaponCargo ["ACE_GlassesGasMask_US",1];
_crate addWeaponCargo ["ACE_GlassesLHD_glasses",1];
_crate addWeaponCargo ["ACE_GlassesSunglasses",1];
_crate addWeaponCargo ["ACE_GlassesTactical",1];
_crate addWeaponCargo ["ACE_HuntIR_monitor",1];
_crate addWeaponCargo ["ACE_Kestrel4500",1];
_crate addWeaponCargo ["ACE_KeyCuffs",1];
_crate addWeaponCargo ["ACE_Map_Tools",1];
_crate addWeaponCargo ["ACE_SpottingScope",1];
_crate addWeaponCargo ["ACE_WireCutter",1];
_crate addWeaponCargo ["ACE_Javelin_CLU",1];
_crate addMagazineCargo ["ACE_Battery_Rangefinder",1];
_crate addMagazineCargo ["Laserbatteries",1];
_crate addMagazineCargo ["pipebomb",20];
_crate addMagazineCargo ["mine",20];
_crate addMagazineCargo ["ACE_100Rnd_556x45_T_M249", 16];	//ar
_crate addMagazineCargo ["ACE_200Rnd_556x45_T_M249", 16];
_crate addMagazineCargo ["ACE_30Rnd_556x45_T_G36", 16];
_crate addMagazineCargo ["ACE_SMAW_NE", 16];	//launcher
_crate addMagazineCargo ["SMAW_HEAA", 16];
_crate addMagazineCargo ["SMAW_HEDP", 16];
_crate addMagazineCargo ["ACE_SMAW_Spotting", 16];
_crate addMagazineCargo ["ACE_MAAWS_HE", 16];
_crate addMagazineCargo ["MAAWS_HEAT", 16];
_crate addMagazineCargo ["MAAWS_HEDP", 16];
_crate addMagazineCargo ["ACE_Javelin_Direct", 16];
_crate addMagazineCargo ["Javelin", 16];
_crate addMagazineCargo ["ACE_M136_CSRS", 16];
_crate addMagazineCargo ["ACE_M72A2", 16];
_crate addMagazineCargo ["NLAW", 16];
_crate addMagazineCargo ["M136", 16];
_crate addMagazineCargo ["Dragon_EP1", 16];
_crate addMagazineCargo ["Stinger", 16];
_crate addMagazineCargo ["100Rnd_762x51_M240", 16];	//mg
_crate addMagazineCargo ["17Rnd_9x19_glock17", 16];	//pistols
_crate addMagazineCargo ["ACE_33Rnd_9x19_G18", 16];
_crate addMagazineCargo ["ACE_15Rnd_9x19_P226", 16];
_crate addMagazineCargo ["ACE_15Rnd_9x19_P8", 16];
_crate addMagazineCargo ["ACE_12Rnd_45ACP_USP", 16];
_crate addMagazineCargo ["ACE_20Rnd_762x51_B_G3", 16];	//rifles
_crate addMagazineCargo ["ACE_20Rnd_762x51_T_G3", 16];
_crate addMagazineCargo ["ACE_30Rnd_556x45_SB_Stanag", 16];
_crate addMagazineCargo ["ACE_30Rnd_556x45_T_Stanag", 16];
_crate addMagazineCargo ["ACE_1Rnd_CS_M203", 16];
_crate addMagazineCargo ["ACE_1Rnd_HE_M203", 16];
_crate addMagazineCargo ["ACE_1Rnd_PR_M203", 16];
_crate addMagazineCargo ["ACE_FlareIR_M203", 16];
_crate addMagazineCargo ["ACE_HuntIR_M203", 16];
_crate addMagazineCargo ["ACE_M576", 16];
_crate addMagazineCargo ["30Rnd_9x19_MP5", 16];
_crate addMagazineCargo ["30Rnd_9x19_MP5SD", 16];
_crate addMagazineCargo ["ACE_SSGreen_M203", 16];
_crate addMagazineCargo ["ACE_SSRed_M203", 16];
_crate addMagazineCargo ["ACE_SSWhite_M203", 16];
_crate addMagazineCargo ["ACE_SSYellow_M203", 16];
_crate addMagazineCargo ["1Rnd_Smoke_M203",20];
_crate addMagazineCargo ["1Rnd_SmokeGreen_M203",20];
_crate addMagazineCargo ["1Rnd_SmokeRed_M203",20];
_crate addMagazineCargo ["1Rnd_SmokeYellow_M203",20];
_crate addMagazineCargo ["ACE_20Rnd_762x51_B_HK417", 16];
_crate addMagazineCargo ["ACE_20Rnd_762x51_SB_HK417", 16];
_crate addMagazineCargo ["ACE_20Rnd_762x51_T_HK417", 16];
_crate addMagazineCargo ["ACE_30Rnd_6x35_B_PDW", 16];
_crate addMagazineCargo ["ACE_20Rnd_762x51_B_M14", 16];
_crate addMagazineCargo ["ACE_20Rnd_762x51_T_DMR", 16];
_crate addMagazineCargo ["ACE_20Rnd_762x51_SB_SCAR", 16];
_crate addMagazineCargo ["ACE_20Rnd_762x51_T_SCAR", 16];
_crate addMagazineCargo ["ACE_25Rnd_1143x23_B_UMP45", 16];
_crate addMagazineCargo ["ACE_6Rnd_CS_M32", 16];
_crate addMagazineCargo ["ACE_30Rnd_556x45_T_G36", 16];
_crate addMagazineCargo ["ACE_30Rnd_762x39_T_SA58", 16];
_crate addMagazineCargo ["ACE_5Rnd_127x99_B_TAC50", 16];	//sniper
_crate addMagazineCargo ["ACE_5Rnd_127x99_T_TAC50", 16];
_crate addMagazineCargo ["ACE_5Rnd_25x59_HEDP_Barrett", 16];
_crate addMagazineCargo ["ACE_20Rnd_762x51_SB_M110", 16];
_crate addMagazineCargo ["ACE_20Rnd_762x51_SB_SCAR", 16];
_crate addMagazineCargo ["ACE_20Rnd_762x51_T_M110", 16];
_crate addMagazineCargo ["ACE_20Rnd_762x51_T_SCAR", 16];
_crate addMagazineCargo ["ACE_20Rnd_762x51_B_M14", 16];
_crate addMagazineCargo ["ACE_20Rnd_762x51_T_DMR", 16];
_crate addMagazineCargo ["ACE_10Rnd_127x99_Raufoss_m107", 16];
_crate addMagazineCargo ["ACE_10Rnd_127x99_T_m107", 16];
_crate addMagazineCargo ["ACE_5Rnd_762x51_T_M24", 16];
};
	
	if (__isRed) then { //----------------------------------------------------------------------------------------------------east CO
	if (E_lock == 0 or E_lock == 3) then {	
		switch (_rank) do {
			case "PRIVATE": {
				_crate addWeaponCargo ["ACE_RMG", 2];	//launcher
				_crate addWeaponCargo ["ACE_RSHG1", 2];
				_crate addWeaponCargo ["RPG18", 2];
				_crate addWeaponCargo ["RPG7V", 2];
				_crate addWeaponCargo ["ACE_RPK74M", 2];	//ar
				_crate addWeaponCargo ["Makarov", 2];	//pistols
				_crate addWeaponCargo ["ACE_AK74M", 2];	//rifles
				_crate addWeaponCargo ["ACE_AK74M_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL", 2];
				_crate addWeaponCargo ["ACE_AKS74_GP25", 2];
				_crate addWeaponCargo ["ACE_AKS74_UN", 2];
				_crate addWeaponCargo ["ACE_AKS74P", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL", 2];
				_crate addWeaponCargo ["AK_74", 2];
				_crate addWeaponCargo ["ACE_SVD_Bipod", 2];	//sniper
			};
			case "CORPORAL": {
				_crate addWeaponCargo ["ACE_RMG", 2];	//launcher
				_crate addWeaponCargo ["ACE_RPG22", 2];
				_crate addWeaponCargo ["ACE_RPG27", 2];
				_crate addWeaponCargo ["ACE_RPOM", 2];
				_crate addWeaponCargo ["ACE_RSHG1", 2];
				_crate addWeaponCargo ["RPG18", 2];
				_crate addWeaponCargo ["RPG7V", 2];
				_crate addWeaponCargo ["ACE_RPK74M", 2];	//ar
				_crate addWeaponCargo ["Makarov", 2];	//pistols
				_crate addWeaponCargo ["MakarovSD", 2];
				_crate addWeaponCargo ["ACE_AK74M", 2];	//rifles
				_crate addWeaponCargo ["ACE_AK74M_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_Kobra", 2];
				_crate addWeaponCargo ["ACE_AKS74_GP25", 2];
				_crate addWeaponCargo ["ACE_AKS74_UN", 2];
				_crate addWeaponCargo ["ACE_AKS74P", 2];
				_crate addWeaponCargo ["ACE_AKS74P_1P29", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL", 2];
				_crate addWeaponCargo ["AK_74", 2];
				_crate addWeaponCargo ["ACE_SVD_Bipod", 2];	//sniper
			};
			case "SERGEANT": {
				_crate addWeaponCargo ["ACE_RMG", 2];	//launcher
				_crate addWeaponCargo ["ACE_RPG22", 2];
				_crate addWeaponCargo ["ACE_RPG27", 2];
				_crate addWeaponCargo ["ACE_RPG29", 2];
				_crate addWeaponCargo ["ACE_RPOM", 2];
				_crate addWeaponCargo ["ACE_RSHG1", 2];
				_crate addWeaponCargo ["Igla", 2];
				_crate addWeaponCargo ["RPG18", 2];
				_crate addWeaponCargo ["RPG7V", 2];
				_crate addWeaponCargo ["ACE_RPK74M", 2];	//ar
				_crate addWeaponCargo ["Makarov", 2];	//pistols
				_crate addWeaponCargo ["MakarovSD", 2];
				_crate addWeaponCargo ["revolver_EP1", 2];
				_crate addWeaponCargo ["ACE_AK103", 2];	//rifles
				_crate addWeaponCargo ["ACE_AK103_1P29", 2];
				_crate addWeaponCargo ["ACE_AK103_GL", 2];
				_crate addWeaponCargo ["ACE_AK103_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AK103_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK104", 2];
				_crate addWeaponCargo ["ACE_AK104_1P29", 2];
				_crate addWeaponCargo ["ACE_AK105", 2];
				_crate addWeaponCargo ["ACE_AK105_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M", 2];
				_crate addWeaponCargo ["ACE_AK74M_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK74M_Kobra_F", 2];
				_crate addWeaponCargo ["ACE_AKS74_GP25", 2];
				_crate addWeaponCargo ["ACE_AKS74_UN", 2];
				_crate addWeaponCargo ["ACE_AKS74P", 2];
				_crate addWeaponCargo ["ACE_AKS74P_1P29", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL", 2];
				_crate addWeaponCargo ["ACE_AKS74P_Kobra", 2];
				_crate addWeaponCargo ["AK_74", 2];
				_crate addWeaponCargo ["ACE_SVD_Bipod", 2];	//sniper
			};
			case "LIEUTENANT": {
				_crate addWeaponCargo ["ACE_RMG", 2];	//launcher
				_crate addWeaponCargo ["ACE_RPG22", 2];
				_crate addWeaponCargo ["ACE_RPG27", 2];
				_crate addWeaponCargo ["ACE_RPG29", 2];
				_crate addWeaponCargo ["ACE_RPG7V_PGO7", 2];
				_crate addWeaponCargo ["ACE_RPOM", 2];
				_crate addWeaponCargo ["ACE_RSHG1", 2];
				_crate addWeaponCargo ["Igla", 2];
				_crate addWeaponCargo ["RPG18", 2];
				_crate addWeaponCargo ["RPG7V", 2];
				_crate addWeaponCargo ["ACE_RPK74M", 2];	//ar
				_crate addWeaponCargo ["PK", 2];	//mg
				_crate addWeaponCargo ["ACE_APS", 2];	//pistols
				_crate addWeaponCargo ["Makarov", 2];
				_crate addWeaponCargo ["MakarovSD", 2];
				_crate addWeaponCargo ["revolver_EP1", 2];
				_crate addWeaponCargo ["ACE_AK103", 2];	//rifles
				_crate addWeaponCargo ["ACE_AK103_1P29", 2];
				_crate addWeaponCargo ["ACE_AK103_GL", 2];
				_crate addWeaponCargo ["ACE_AK103_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AK103_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK103_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK104", 2];
				_crate addWeaponCargo ["ACE_AK104_1P29", 2];
				_crate addWeaponCargo ["ACE_AK104_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK105", 2];
				_crate addWeaponCargo ["ACE_AK105_1P29", 2];
				_crate addWeaponCargo ["ACE_AK105_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK74M", 2];
				_crate addWeaponCargo ["ACE_AK74M_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK74M_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK74M_Kobra_F", 2];
				_crate addWeaponCargo ["ACE_AKS74_GP25", 2];
				_crate addWeaponCargo ["ACE_AKS74_UN", 2];
				_crate addWeaponCargo ["ACE_AKS74P", 2];
				_crate addWeaponCargo ["ACE_AKS74P_1P29", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AKS74P_Kobra", 2];
				_crate addWeaponCargo ["AK_107_kobra", 2];
				_crate addWeaponCargo ["AK_74", 2];
				_crate addWeaponCargo ["AK_74_GL", 2];
				_crate addWeaponCargo ["AK_74_GL_kobra", 2];
				_crate addWeaponCargo ["ACE_SVD_Bipod", 2];	//sniper
				_crate addWeaponCargo ["SVD", 2];
			};
			case "CAPTAIN": {
				_crate addWeaponCargo ["ACE_RMG", 2];	//launcher
				_crate addWeaponCargo ["ACE_RPG22", 2];
				_crate addWeaponCargo ["ACE_RPG27", 2];
				_crate addWeaponCargo ["ACE_RPG29", 2];
				_crate addWeaponCargo ["ACE_RPG7V_PGO7", 2];
				_crate addWeaponCargo ["ACE_RPOM", 2];
				_crate addWeaponCargo ["ACE_RSHG1", 2];
				_crate addWeaponCargo ["Igla", 2];
				_crate addWeaponCargo ["MetisLauncher", 2];
				_crate addWeaponCargo ["RPG18", 2];
				_crate addWeaponCargo ["RPG7V", 2];
				_crate addWeaponCargo ["ACE_RPK74M", 2];	//ar
				_crate addWeaponCargo ["ACE_RPK74M_1P29", 2];
				_crate addWeaponCargo ["PK", 2];	//mg
				_crate addWeaponCargo ["ACE_APS", 2];	//pistols
				_crate addWeaponCargo ["ACE_APSB", 2];
				_crate addWeaponCargo ["Makarov", 2];
				_crate addWeaponCargo ["MakarovSD", 2];
				_crate addWeaponCargo ["revolver_EP1", 2];
				_crate addWeaponCargo ["ACE_AK103", 2];	//rifles
				_crate addWeaponCargo ["ACE_AK103_1P29", 2];
				_crate addWeaponCargo ["ACE_AK103_GL", 2];
				_crate addWeaponCargo ["ACE_AK103_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AK103_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK103_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK104", 2];
				_crate addWeaponCargo ["ACE_AK104_1P29", 2];
				_crate addWeaponCargo ["ACE_AK104_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK105", 2];
				_crate addWeaponCargo ["ACE_AK105_1P29", 2];
				_crate addWeaponCargo ["ACE_AK105_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK74M", 2];
				_crate addWeaponCargo ["ACE_AK74M_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_PSO", 2];
				_crate addWeaponCargo ["ACE_AK74M_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK74M_PSO", 2];
				_crate addWeaponCargo ["ACE_AKS74_GP25", 2];
				_crate addWeaponCargo ["ACE_AKS74_UN", 2];
				_crate addWeaponCargo ["ACE_AKS74P", 2];
				_crate addWeaponCargo ["ACE_AKS74P_1P29", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AKS74P_Kobra", 2];
				_crate addWeaponCargo ["ACE_gr1", 2];
				_crate addWeaponCargo ["ACE_gr1sd", 2];
				_crate addWeaponCargo ["ACE_gr1sdsp", 2];
				_crate addWeaponCargo ["ACE_gr1sp", 2];
				_crate addWeaponCargo ["ACE_oc14", 2];
				_crate addWeaponCargo ["ACE_oc14sp", 2];
				_crate addWeaponCargo ["ACE_Val", 2];
				_crate addWeaponCargo ["ACE_Val_Kobra", 2];
				_crate addWeaponCargo ["AK_107_kobra", 2];
				_crate addWeaponCargo ["AK_107_pso", 2];
				_crate addWeaponCargo ["AK_74", 2];
				_crate addWeaponCargo ["AK_74_GL", 2];
				_crate addWeaponCargo ["AK_74_GL_kobra", 2];
				_crate addWeaponCargo ["ACE_SVD_Bipod", 2];	//sniper
				_crate addWeaponCargo ["SVD", 2];
				_crate addWeaponCargo ["SVD_des_EP1", 2];
			};
			case "MAJOR": {
				_crate addWeaponCargo ["ACE_RMG", 2];	//launcher
				_crate addWeaponCargo ["ACE_RPG22", 2];
				_crate addWeaponCargo ["ACE_RPG27", 2];
				_crate addWeaponCargo ["ACE_RPG29", 2];
				_crate addWeaponCargo ["ACE_RPG7V_PGO7", 2];
				_crate addWeaponCargo ["ACE_RPOM", 2];
				_crate addWeaponCargo ["ACE_RSHG1", 2];
				_crate addWeaponCargo ["Igla", 2];
				_crate addWeaponCargo ["MetisLauncher", 2];
				_crate addWeaponCargo ["RPG18", 2];
				_crate addWeaponCargo ["RPG7V", 2];
				_crate addWeaponCargo ["ACE_RPK74M", 2];	//ar
				_crate addWeaponCargo ["ACE_RPK74M_1P29", 2];
				_crate addWeaponCargo ["Pecheneg", 2];	//mg
				_crate addWeaponCargo ["PK", 2];
				_crate addWeaponCargo ["ACE_APS", 2];	//pistols
				_crate addWeaponCargo ["ACE_APSB", 2];
				_crate addWeaponCargo ["Makarov", 2];
				_crate addWeaponCargo ["MakarovSD", 2];
				_crate addWeaponCargo ["revolver_EP1", 2];
				_crate addWeaponCargo ["Sa61_EP1", 2];
				_crate addWeaponCargo ["ACE_AK103", 2];	//rifles
				_crate addWeaponCargo ["ACE_AK103_1P29", 2];
				_crate addWeaponCargo ["ACE_AK103_GL", 2];
				_crate addWeaponCargo ["ACE_AK103_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AK103_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK103_GL_PSO", 2];
				_crate addWeaponCargo ["ACE_AK103_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK103_PSO", 2];
				_crate addWeaponCargo ["ACE_AK104", 2];
				_crate addWeaponCargo ["ACE_AK104_1P29", 2];
				_crate addWeaponCargo ["ACE_AK104_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK104_PSO", 2];
				_crate addWeaponCargo ["ACE_AK105", 2];
				_crate addWeaponCargo ["ACE_AK105_1P29", 2];
				_crate addWeaponCargo ["ACE_AK105_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK105_PSO", 2];
				_crate addWeaponCargo ["ACE_AK74M", 2];
				_crate addWeaponCargo ["ACE_AK74M_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_PSO", 2];
				_crate addWeaponCargo ["ACE_AK74M_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK74M_PSO", 2];
				_crate addWeaponCargo ["ACE_AKS74_GP25", 2];
				_crate addWeaponCargo ["ACE_AKS74_UN", 2];
				_crate addWeaponCargo ["ACE_AKS74P", 2];
				_crate addWeaponCargo ["ACE_AKS74P_1P29", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AKS74P_Kobra", 2];
				_crate addWeaponCargo ["ACE_AKS74P_PSO", 2];
				_crate addWeaponCargo ["ACE_gr1", 2];
				_crate addWeaponCargo ["ACE_gr1sd", 2];
				_crate addWeaponCargo ["ACE_gr1sdsp", 2];
				_crate addWeaponCargo ["ACE_gr1sp", 2];
				_crate addWeaponCargo ["ACE_oc14", 2];
				_crate addWeaponCargo ["ACE_oc14gl", 2];
				_crate addWeaponCargo ["ACE_oc14glsp", 2];
				_crate addWeaponCargo ["ACE_oc14sp", 2];
				_crate addWeaponCargo ["ACE_Val", 2];
				_crate addWeaponCargo ["ACE_Val_Kobra", 2];
				_crate addWeaponCargo ["AK_107_GL_kobra", 2];
				_crate addWeaponCargo ["AK_107_kobra", 2];
				_crate addWeaponCargo ["AK_107_pso", 2];
				_crate addWeaponCargo ["AK_74", 2];
				_crate addWeaponCargo ["AK_74_GL", 2];
				_crate addWeaponCargo ["AK_74_GL_kobra", 2];
				_crate addWeaponCargo ["ACE_SVD_Bipod", 2];	//sniper
				_crate addWeaponCargo ["ksvk", 2];
				_crate addWeaponCargo ["SVD", 2];
				_crate addWeaponCargo ["SVD_des_EP1", 2];
			};
			case "COLONEL": {
				_crate addWeaponCargo ["ACE_RMG", 2];	//launcher
				_crate addWeaponCargo ["ACE_RPG22", 2];
				_crate addWeaponCargo ["ACE_RPG27", 2];
				_crate addWeaponCargo ["ACE_RPG29", 2];
				_crate addWeaponCargo ["ACE_RPG7V_PGO7", 2];
				_crate addWeaponCargo ["ACE_RPOM", 2];
				_crate addWeaponCargo ["ACE_RSHG1", 2];
				_crate addWeaponCargo ["Igla", 2];
				_crate addWeaponCargo ["MetisLauncher", 2];
				_crate addWeaponCargo ["RPG18", 2];
				_crate addWeaponCargo ["RPG7V", 2];
				_crate addWeaponCargo ["ACE_RPK74M", 2];	//ar
				_crate addWeaponCargo ["ACE_RPK74M_1P29", 2];
				_crate addWeaponCargo ["Pecheneg", 2];	//mg
				_crate addWeaponCargo ["PK", 2];
				_crate addWeaponCargo ["ACE_APS", 2];	//pistols
				_crate addWeaponCargo ["ACE_APSB", 2];
				_crate addWeaponCargo ["Makarov", 2];
				_crate addWeaponCargo ["MakarovSD", 2];
				_crate addWeaponCargo ["revolver_EP1", 2];
				_crate addWeaponCargo ["revolver_gold_EP1", 2];
				_crate addWeaponCargo ["Sa61_EP1", 2];
				_crate addWeaponCargo ["ACE_AK103", 2];	//rifles
				_crate addWeaponCargo ["ACE_AK103_1P29", 2];
				_crate addWeaponCargo ["ACE_AK103_GL", 2];
				_crate addWeaponCargo ["ACE_AK103_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AK103_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK103_GL_PSO", 2];
				_crate addWeaponCargo ["ACE_AK103_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK103_PSO", 2];
				_crate addWeaponCargo ["ACE_AK104", 2];
				_crate addWeaponCargo ["ACE_AK104_1P29", 2];
				_crate addWeaponCargo ["ACE_AK104_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK104_PSO", 2];
				_crate addWeaponCargo ["ACE_AK105", 2];
				_crate addWeaponCargo ["ACE_AK105_1P29", 2];
				_crate addWeaponCargo ["ACE_AK105_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK105_PSO", 2];
				_crate addWeaponCargo ["ACE_AK74M", 2];
				_crate addWeaponCargo ["ACE_AK74M_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_PSO", 2];
				_crate addWeaponCargo ["ACE_AK74M_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK74M_PSO", 2];
				_crate addWeaponCargo ["ACE_AKS74_GP25", 2];
				_crate addWeaponCargo ["ACE_AKS74_UN", 2];
				_crate addWeaponCargo ["ACE_AKS74P", 2];
				_crate addWeaponCargo ["ACE_AKS74P_1P29", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL_PSO", 2];
				_crate addWeaponCargo ["ACE_AKS74P_Kobra", 2];
				_crate addWeaponCargo ["ACE_AKS74P_PSO", 2];
				_crate addWeaponCargo ["ACE_gr1", 2];
				_crate addWeaponCargo ["ACE_gr1sd", 2];
				_crate addWeaponCargo ["ACE_gr1sdsp", 2];
				_crate addWeaponCargo ["ACE_gr1sp", 2];
				_crate addWeaponCargo ["ACE_oc14", 2];
				_crate addWeaponCargo ["ACE_oc14gl", 2];
				_crate addWeaponCargo ["ACE_oc14glsp", 2];
				_crate addWeaponCargo ["ACE_oc14sd", 2];
				_crate addWeaponCargo ["ACE_oc14sdsp", 2];
				_crate addWeaponCargo ["ACE_oc14sp", 2];
				_crate addWeaponCargo ["ACE_Val", 2];
				_crate addWeaponCargo ["ACE_Val_Kobra", 2];
				_crate addWeaponCargo ["ACE_Val_PSO", 2];
				_crate addWeaponCargo ["AK_107_GL_kobra", 2];
				_crate addWeaponCargo ["AK_107_GL_pso", 2];
				_crate addWeaponCargo ["AK_107_kobra", 2];
				_crate addWeaponCargo ["AK_107_pso", 2];
				_crate addWeaponCargo ["AK_74", 2];
				_crate addWeaponCargo ["AK_74_GL", 2];
				_crate addWeaponCargo ["AK_74_GL_kobra", 2];
				_crate addWeaponCargo ["ACE_SVD_Bipod", 2];	//sniper
				_crate addWeaponCargo ["ksvk", 2];
				_crate addWeaponCargo ["SVD", 2];
				_crate addWeaponCargo ["SVD_des_EP1", 2];
				_crate addWeaponCargo ["SVD_NSPU_EP1", 2];
			};
		};
	} else {
		_crate addWeaponCargo ["ACE_RMG", 2];	//launcher
		_crate addWeaponCargo ["ACE_RPG22", 2];
		_crate addWeaponCargo ["ACE_RPG27", 2];
		_crate addWeaponCargo ["ACE_RPG29", 2];
		_crate addWeaponCargo ["ACE_RPG7V_PGO7", 2];
		_crate addWeaponCargo ["ACE_RPOM", 2];
		_crate addWeaponCargo ["ACE_RSHG1", 2];
		_crate addWeaponCargo ["Igla", 2];
		_crate addWeaponCargo ["MetisLauncher", 2];
		_crate addWeaponCargo ["RPG18", 2];
		_crate addWeaponCargo ["RPG7V", 2];
		_crate addWeaponCargo ["ACE_RPK74M", 2];	//ar
		_crate addWeaponCargo ["ACE_RPK74M_1P29", 2];
		_crate addWeaponCargo ["Pecheneg", 2];	//mg
		_crate addWeaponCargo ["PK", 2];
		_crate addWeaponCargo ["ACE_APS", 2];	//pistols
		_crate addWeaponCargo ["ACE_APSB", 2];
		_crate addWeaponCargo ["Makarov", 2];
		_crate addWeaponCargo ["MakarovSD", 2];
		_crate addWeaponCargo ["revolver_EP1", 2];
		_crate addWeaponCargo ["revolver_gold_EP1", 2];
		_crate addWeaponCargo ["Sa61_EP1", 2];
		_crate addWeaponCargo ["ACE_AK103", 2];	//rifles
		_crate addWeaponCargo ["ACE_AK103_1P29", 2];
		_crate addWeaponCargo ["ACE_AK103_GL", 2];
		_crate addWeaponCargo ["ACE_AK103_GL_1P29", 2];
		_crate addWeaponCargo ["ACE_AK103_GL_Kobra", 2];
		_crate addWeaponCargo ["ACE_AK103_GL_PSO", 2];
		_crate addWeaponCargo ["ACE_AK103_Kobra", 2];
		_crate addWeaponCargo ["ACE_AK103_PSO", 2];
		_crate addWeaponCargo ["ACE_AK104", 2];
		_crate addWeaponCargo ["ACE_AK104_1P29", 2];
		_crate addWeaponCargo ["ACE_AK104_Kobra", 2];
		_crate addWeaponCargo ["ACE_AK104_PSO", 2];
		_crate addWeaponCargo ["ACE_AK105", 2];
		_crate addWeaponCargo ["ACE_AK105_1P29", 2];
		_crate addWeaponCargo ["ACE_AK105_Kobra", 2];
		_crate addWeaponCargo ["ACE_AK105_PSO", 2];
		_crate addWeaponCargo ["ACE_AK74M", 2];
		_crate addWeaponCargo ["ACE_AK74M_1P29", 2];
		_crate addWeaponCargo ["ACE_AK74M_GL", 2];
		_crate addWeaponCargo ["ACE_AK74M_GL_1P29", 2];
		_crate addWeaponCargo ["ACE_AK74M_GL_Kobra", 2];
		_crate addWeaponCargo ["ACE_AK74M_GL_PSO", 2];
		_crate addWeaponCargo ["ACE_AK74M_Kobra", 2];
		_crate addWeaponCargo ["ACE_AK74M_PSO", 2];
		_crate addWeaponCargo ["ACE_AKS74_GP25", 2];
		_crate addWeaponCargo ["ACE_AKS74_UN", 2];
		_crate addWeaponCargo ["ACE_AKS74P", 2];
		_crate addWeaponCargo ["ACE_AKS74P_1P29", 2];
		_crate addWeaponCargo ["ACE_AKS74P_GL", 2];
		_crate addWeaponCargo ["ACE_AKS74P_GL_1P29", 2];
		_crate addWeaponCargo ["ACE_AKS74P_GL_Kobra", 2];
		_crate addWeaponCargo ["ACE_AKS74P_GL_PSO", 2];
		_crate addWeaponCargo ["ACE_AKS74P_Kobra", 2];
		_crate addWeaponCargo ["ACE_AKS74P_PSO", 2];
		_crate addWeaponCargo ["ACE_gr1", 2];
		_crate addWeaponCargo ["ACE_gr1sd", 2];
		_crate addWeaponCargo ["ACE_gr1sdsp", 2];
		_crate addWeaponCargo ["ACE_gr1sp", 2];
		_crate addWeaponCargo ["ACE_oc14", 2];
		_crate addWeaponCargo ["ACE_oc14gl", 2];
		_crate addWeaponCargo ["ACE_oc14glsp", 2];
		_crate addWeaponCargo ["ACE_oc14sd", 2];
		_crate addWeaponCargo ["ACE_oc14sdsp", 2];
		_crate addWeaponCargo ["ACE_oc14sp", 2];
		_crate addWeaponCargo ["ACE_Val", 2];
		_crate addWeaponCargo ["ACE_Val_Kobra", 2];
		_crate addWeaponCargo ["ACE_Val_PSO", 2];
		_crate addWeaponCargo ["AK_107_GL_kobra", 2];
		_crate addWeaponCargo ["AK_107_GL_pso", 2];
		_crate addWeaponCargo ["AK_107_kobra", 2];
		_crate addWeaponCargo ["AK_107_pso", 2];
		_crate addWeaponCargo ["AK_74", 2];
		_crate addWeaponCargo ["AK_74_GL", 2];
		_crate addWeaponCargo ["AK_74_GL_kobra", 2];
		_crate addWeaponCargo ["ACE_SVD_Bipod", 2];	//sniper
		_crate addWeaponCargo ["ksvk", 2];
		_crate addWeaponCargo ["SVD", 2];
		_crate addWeaponCargo ["SVD_des_EP1", 2];
		_crate addWeaponCargo ["SVD_NSPU_EP1", 2];
	};
	_crate addWeaponCargo ["Laserdesignator",1];
	_crate addWeaponCargo ["NVGoggles",1];
	_crate addWeaponCargo ["Binocular_Vector",1];
	_crate addWeaponCargo ["Binocular",1];
	_crate addWeaponCargo ["ACE_YardAge450",1];
	_crate addWeaponCargo ["ACE_Rangefinder_OD",1];
	_crate addWeaponCargo ["ACE_MX2A",1];
	_crate addWeaponCargo ["ACE_DAGR",1];
	_crate addWeaponCargo ["ACE_Earplugs",1];
	_crate addWeaponCargo ["ACE_GlassesBalaklava",1];
	_crate addWeaponCargo ["ACE_GlassesBalaklavaGray",1];
	_crate addWeaponCargo ["ACE_GlassesBalaklavaOlive",1];
	_crate addWeaponCargo ["ACE_GlassesBlackSun",1];
	_crate addWeaponCargo ["ACE_GlassesBlueSun",1];
	_crate addWeaponCargo ["ACE_GlassesGasMask_RU",1];
	_crate addWeaponCargo ["ACE_GlassesLHD_glasses",1];
	_crate addWeaponCargo ["ACE_GlassesSunglasses",1];
	_crate addWeaponCargo ["ACE_GlassesTactical",1];
	_crate addWeaponCargo ["ACE_HuntIR_monitor",1];
	_crate addWeaponCargo ["ACE_Kestrel4500",1];
	_crate addWeaponCargo ["ACE_KeyCuffs",1];
	_crate addWeaponCargo ["ACE_Map_Tools",1];
	_crate addWeaponCargo ["ACE_SpottingScope",1];
	_crate addWeaponCargo ["ACE_WireCutter",1];
	_crate addWeaponCargo ["ACE_Javelin_CLU",1];
	_crate addMagazineCargo ["ACE_Battery_Rangefinder",1];
	_crate addMagazineCargo ["Laserbatteries",1];
	_crate addMagazineCargo ["ACE_RMG", 10];	//launcher
	_crate addMagazineCargo ["ACE_RPG22", 10];
	_crate addMagazineCargo ["ACE_RPG27", 10];
	_crate addMagazineCargo ["ACE_RPG29", 10];
	_crate addMagazineCargo ["ACE_OG7_PGO7", 10];
	_crate addMagazineCargo ["ACE_PG7V_PGO7", 10];
	_crate addMagazineCargo ["ACE_PG7VM", 10];
	_crate addMagazineCargo ["ACE_PG7VM_PGO7", 10];
	_crate addMagazineCargo ["ACE_PG7VR_PGO7", 10];
	_crate addMagazineCargo ["ACE_TBG7V", 10];
	_crate addMagazineCargo ["ACE_TBG7V_PGO7", 10];
	_crate addMagazineCargo ["ACE_RPG7V_PGO7", 10];
	_crate addMagazineCargo ["ACE_RPOM", 10];
	_crate addMagazineCargo ["ACE_RSHG1", 10];
	_crate addMagazineCargo ["ACE_AT13TB", 10];
	_crate addMagazineCargo ["Igla", 10];
	_crate addMagazineCargo ["Strela", 10];
	_crate addMagazineCargo ["AT13", 10];
	_crate addMagazineCargo ["RPG18", 10];
	_crate addMagazineCargo ["RPG7V", 10];
	_crate addMagazineCargo ["RPG7VL", 10];
	_crate addMagazineCargo ["RPG7VR", 10];
	_crate addMagazineCargo ["OG7", 10];
	_crate addMagazineCargo ["ACE_30Rnd_545x39_T_AK", 16];	//ar
	_crate addMagazineCargo ["ACE_45Rnd_545x39_B_AK", 16];
	_crate addMagazineCargo ["ACE_75Rnd_545x39_T_RPK", 16];
	_crate addMagazineCargo ["100Rnd_762x54_PK", 16];	//mg
	_crate addMagazineCargo ["ACE_20Rnd_9x18_APS", 16];	//pistol
	_crate addMagazineCargo ["ACE_20Rnd_9x18_APSB", 16];
	_crate addMagazineCargo ["8Rnd_9x18_Makarov", 16];
	_crate addMagazineCargo ["8Rnd_9x18_MakarovSD", 16];
	_crate addMagazineCargo ["6Rnd_45ACP", 16];
	_crate addMagazineCargo ["10Rnd_B_765x17_Ball", 16];
	_crate addMagazineCargo ["20Rnd_B_765x17_Ball", 16];
	_crate addMagazineCargo ["ACE_30Rnd_762x39_SD_AK47", 16];	//rifle
	_crate addMagazineCargo ["ACE_30Rnd_762x39_T_AK47", 16];
	_crate addMagazineCargo ["ACE_40Rnd_762x39_B_AK47", 16];
	_crate addMagazineCargo ["ACE_40Rnd_762x39_T_AK47", 16];
	_crate addMagazineCargo ["ACE_75Rnd_762x39_B_AK47", 16];
	_crate addMagazineCargo ["ACE_75Rnd_762x39_SD_AK47", 16];
	_crate addMagazineCargo ["ACE_1Rnd_CS_GP25", 16];
	_crate addMagazineCargo ["ACE_1Rnd_HE_GP25P", 16];
	_crate addMagazineCargo ["ACE_SSGreen_GP25", 16];
	_crate addMagazineCargo ["ACE_SSRed_GP25", 16];
	_crate addMagazineCargo ["ACE_SSWhite_GP25", 16];
	_crate addMagazineCargo ["ACE_SSYellow_GP25", 16];
	_crate addMagazineCargo ["ACE_30Rnd_545x39_T_AK", 16];
	_crate addMagazineCargo ["ACE_45Rnd_545x39_B_AK", 16];
	_crate addMagazineCargo ["ACE_75Rnd_545x39_T_RPK", 16];
	_crate addMagazineCargo ["ACE_20Rnd_9x39_B_OC14", 16];
	_crate addMagazineCargo ["ACE_20Rnd_9x39_B_SP6_OC14", 16];
	_crate addMagazineCargo ["10Rnd_762x54_SVD", 16];	//sniper
	_crate addMagazineCargo ["ACE_10Rnd_762x54_T_SVD", 16];
	_crate addMagazineCargo ["5Rnd_127x108_KSVK", 16];
	_crate addMagazineCargo ["ACE_5Rnd_127x108_T_KSVK", 16];
	_crate addMagazineCargo ["pipebomb",20];
	_crate addMagazineCargo ["mineE",20];
};//-----------------------------------------------------------------------------------------------------------------------------
#endif





#ifdef __Chernarus__
	if (__isBlue) then { //----------------------------------------------------------------------------------------------------west A2
	if (E_lock == 0 or E_lock == 3) then {
		switch (_rank) do {
			 case "PRIVATE": {
				_crate addWeaponCargo ["ACE_M136_CSRS", 2]; //launcher
				_crate addWeaponCargo ["ACE_M60", 2]; //mg
				_crate addWeaponCargo ["ACE_Glock17", 2];	//pistols
				_crate addWeaponCargo ["ACE_Knicklicht_Proxy", 2];
				_crate addWeaponCargo ["ACE_G3A3", 2];	//rifle
				_crate addWeaponCargo ["ACE_G3A3_RSAS", 2];
				_crate addWeaponCargo ["ACE_G3SG1", 2];
				_crate addWeaponCargo ["ACE_M1014_Eotech", 2];
				_crate addWeaponCargo ["ACE_M16A4_Iron", 2];
				_crate addWeaponCargo ["ACE_M32", 2];
				_crate addWeaponCargo ["ACE_MP5A4", 2];
				_crate addWeaponCargo ["ACE_MP5A5", 2];
				_crate addWeaponCargo ["ACE_MP5SD", 2];
				_crate addWeaponCargo ["ACE_SA58", 2];
				_crate addWeaponCargo ["ACE_UMP45_SD", 2];
			};
			 case "CORPORAL": {
				_crate addWeaponCargo ["MAAWS", 2]; //launcher
				_crate addWeaponCargo ["ACE_MK19MOD3Proxy", 2];
				_crate addWeaponCargo ["SMAW", 2];
				_crate addWeaponCargo ["ACE_M249Para", 2];	//ar
				_crate addWeaponCargo ["ACE_M60", 2]; //mg
				_crate addWeaponCargo ["ACE_Glock17", 2];	//pistols
				_crate addWeaponCargo ["ACE_Knicklicht_Proxy", 2];
				_crate addWeaponCargo ["ACE_P226", 2];
				_crate addWeaponCargo ["ACE_USP", 2];
				_crate addWeaponCargo ["ACE_USPSD", 2];
				_crate addWeaponCargo ["ACE_G36", 2];	//rifle
				_crate addWeaponCargo ["ACE_G36A1", 2];
				_crate addWeaponCargo ["ACE_G36A1_CQB", 2];
				_crate addWeaponCargo ["ACE_G3A3", 2];
				_crate addWeaponCargo ["ACE_G3A3_RSAS", 2];
				_crate addWeaponCargo ["ACE_HK416_D10", 2];
				_crate addWeaponCargo ["ACE_M1014_Eotech", 2];
				_crate addWeaponCargo ["ACE_M16A4_Iron", 2];
				_crate addWeaponCargo ["ACE_M32", 2];
				_crate addWeaponCargo ["ACE_M4A1_Aim_SD", 2];
				_crate addWeaponCargo ["ACE_M4SPR_SD", 2];
				_crate addWeaponCargo ["ACE_M79", 2];
				_crate addWeaponCargo ["ACE_M79_CQB", 2];
				_crate addWeaponCargo ["ACE_MP5A4", 2];
				_crate addWeaponCargo ["ACE_MP5A5", 2];
				_crate addWeaponCargo ["ACE_MP5SD", 2];
				_crate addWeaponCargo ["ACE_SA58", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_ACOG", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_ACOG_CQB", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_Aim", 2];
				_crate addWeaponCargo ["ACE_UMP45_SD", 2];
			};
			 case "SERGEANT": {
				_crate addWeaponCargo ["MAAWS", 2];	//launcher
				_crate addWeaponCargo ["ACE_M2HBProxy", 2];
				_crate addWeaponCargo ["ACE_M72", 2];
				_crate addWeaponCargo ["ACE_M72A2", 2];
				_crate addWeaponCargo ["ACE_MK19MOD3Proxy", 2];
				_crate addWeaponCargo ["SMAW", 2];
				_crate addWeaponCargo ["Stinger", 2];
				_crate addWeaponCargo ["ACE_M249Para", 2];	//ar
				_crate addWeaponCargo ["ACE_M240G_M145", 2];	//mg
				_crate addWeaponCargo ["ACE_M60", 2];
				_crate addWeaponCargo ["ACE_Glock17", 2];	//pistols
				_crate addWeaponCargo ["ACE_Knicklicht_Proxy", 2];
				_crate addWeaponCargo ["ACE_P226", 2];
				_crate addWeaponCargo ["ACE_USP", 2];
				_crate addWeaponCargo ["ACE_USPSD", 2];
				_crate addWeaponCargo ["ACE_G36", 2];	//rifle
				_crate addWeaponCargo ["ACE_G36A1", 2];
				_crate addWeaponCargo ["ACE_G36A1_CQB", 2];
				_crate addWeaponCargo ["ACE_G36A2", 2];
				_crate addWeaponCargo ["ACE_G36A2_CQB", 2];
				_crate addWeaponCargo ["ACE_G36K", 2];
				_crate addWeaponCargo ["ACE_G36K_CQB", 2];
				_crate addWeaponCargo ["ACE_G3A3", 2];
				_crate addWeaponCargo ["ACE_G3A3_RSAS", 2];
				_crate addWeaponCargo ["ACE_HK416_D10", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_AIM", 2];
				_crate addWeaponCargo ["ACE_HK416_D14", 2];
				_crate addWeaponCargo ["ACE_M1014_Eotech", 2];
				_crate addWeaponCargo ["ACE_M16A4_Iron", 2];
				_crate addWeaponCargo ["ACE_M32", 2];
				_crate addWeaponCargo ["ACE_M4A1_Aim_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL_SD", 2];
				_crate addWeaponCargo ["ACE_M4SPR_SD", 2];
				_crate addWeaponCargo ["ACE_M79", 2];
				_crate addWeaponCargo ["ACE_M79_CQB", 2];
				_crate addWeaponCargo ["ACE_MP5A4", 2];
				_crate addWeaponCargo ["ACE_MP5A5", 2];
				_crate addWeaponCargo ["ACE_MP5SD", 2];
				_crate addWeaponCargo ["ACE_SA58", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_ACOG", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_ACOG_CQB", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_Aim", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_AIM_SD", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_Eotech", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_13", 2];
				_crate addWeaponCargo ["ACE_UMP45_SD", 2];
				_crate addWeaponCargo ["ACE_M110_SD", 2];	//sniper
			};
			 case "LIEUTENANT": {
				_crate addWeaponCargo ["MAAWS", 2];	//launcher
				_crate addWeaponCargo ["M47Launcher_EP1", 2];
				_crate addWeaponCargo ["ACE_M136_CSRS", 2];
				_crate addWeaponCargo ["ACE_M2HBProxy", 2];
				_crate addWeaponCargo ["ACE_M3TripodProxy", 2];
				_crate addWeaponCargo ["ACE_M72", 2];
				_crate addWeaponCargo ["ACE_M72A2", 2];
				_crate addWeaponCargo ["ACE_MK19MOD3Proxy", 2];
				_crate addWeaponCargo ["SMAW", 2];
				_crate addWeaponCargo ["Stinger", 2];
				_crate addWeaponCargo ["ACE_M249Para", 2];	//ar
				_crate addWeaponCargo ["ACE_M240G_M145", 2];	//mg
				_crate addWeaponCargo ["ACE_M60", 2];
				_crate addWeaponCargo ["ACE_Glock17", 2];	//pistols
				_crate addWeaponCargo ["ACE_Knicklicht_Proxy", 2];
				_crate addWeaponCargo ["ACE_P226", 2];
				_crate addWeaponCargo ["ACE_P8", 2];
				_crate addWeaponCargo ["ACE_USP", 2];
				_crate addWeaponCargo ["ACE_USPSD", 2];
				_crate addWeaponCargo ["ACE_G36", 2];	//rifle
				_crate addWeaponCargo ["ACE_G36A1", 2];
				_crate addWeaponCargo ["ACE_G36A1_CQB", 2];
				_crate addWeaponCargo ["ACE_G36A1_D", 2];
				_crate addWeaponCargo ["ACE_G36A1_D_CQB", 2];
				_crate addWeaponCargo ["ACE_G36A2", 2];
				_crate addWeaponCargo ["ACE_G36A2_CQB", 2];
				_crate addWeaponCargo ["ACE_G36K", 2];
				_crate addWeaponCargo ["ACE_G36K_CQB", 2];
				_crate addWeaponCargo ["ACE_G36K_D", 2];
				_crate addWeaponCargo ["ACE_G36K_D_CQB", 2];
				_crate addWeaponCargo ["ACE_G3A3", 2];
				_crate addWeaponCargo ["ACE_G3A3_RSAS", 2];
				_crate addWeaponCargo ["ACE_G3SG1", 2];
				_crate addWeaponCargo ["ACE_HK416_D10", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_AIM", 2];
				_crate addWeaponCargo ["ACE_HK416_D14", 2];
				_crate addWeaponCargo ["ACE_M1014_Eotech", 2];
				_crate addWeaponCargo ["ACE_M16A4_Iron", 2];
				_crate addWeaponCargo ["ACE_M32", 2];
				_crate addWeaponCargo ["ACE_M4A1_AIM_GL", 2];
				_crate addWeaponCargo ["ACE_M4A1_AIM_GL_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_Aim_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL_SD", 2];
				_crate addWeaponCargo ["ACE_M4SPR_SD", 2];
				_crate addWeaponCargo ["ACE_M79", 2];
				_crate addWeaponCargo ["ACE_M79_CQB", 2];
				_crate addWeaponCargo ["ACE_MP5A4", 2];
				_crate addWeaponCargo ["ACE_MP5A5", 2];
				_crate addWeaponCargo ["ACE_MP5SD", 2];
				_crate addWeaponCargo ["ACE_SA58", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_ACOG", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_ACOG_CQB", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_CQC_Eotech", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_CQC_Eotech_EGLM", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_Aim", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_AIM_SD", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_Eotech", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_13", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_AIMPOINT", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_EOTECH", 2];
				_crate addWeaponCargo ["ACE_UMP45_SD", 2];
				_crate addWeaponCargo ["ACE_M110_SD", 2];	//sniper
				_crate addWeaponCargo ["ACE_TAC50_SD", 2];

			};
			 case "CAPTAIN": {
				_crate addWeaponCargo ["MAAWS", 2];	//launcher
				_crate addWeaponCargo ["M47Launcher_EP1", 2];
				_crate addWeaponCargo ["ACE_M136_CSRS", 2];
				_crate addWeaponCargo ["ACE_M2HBProxy", 2];
				_crate addWeaponCargo ["ACE_M3TripodProxy", 2];
				_crate addWeaponCargo ["ACE_M72", 2];
				_crate addWeaponCargo ["ACE_M72A2", 2];
				_crate addWeaponCargo ["ACE_MK19MOD3Proxy", 2];
				_crate addWeaponCargo ["ACE_Javelin_CLU", 2];
				_crate addWeaponCargo ["ACE_Javelin_Direct", 2];
				_crate addWeaponCargo ["SMAW", 2];
				_crate addWeaponCargo ["Stinger", 2];
				_crate addWeaponCargo ["ACE_M249Para", 2];	//ar
				_crate addWeaponCargo ["ACE_M240G_M145", 2];	//mg
				_crate addWeaponCargo ["ACE_M60", 2];
				_crate addWeaponCargo ["ACE_Glock17", 2];	//pistols
				_crate addWeaponCargo ["ACE_Glock18", 2];
				_crate addWeaponCargo ["ACE_Knicklicht_Proxy", 2];
				_crate addWeaponCargo ["ACE_P226", 2];
				_crate addWeaponCargo ["ACE_P8", 2];
				_crate addWeaponCargo ["ACE_USP", 2];
				_crate addWeaponCargo ["ACE_USPSD", 2];
				_crate addWeaponCargo ["ACE_G36", 2];	//rifle
				_crate addWeaponCargo ["ACE_G36_CQB", 2];
				_crate addWeaponCargo ["ACE_G36A1", 2];
				_crate addWeaponCargo ["ACE_G36A1_AG36A1", 2];
				_crate addWeaponCargo ["ACE_G36A1_AG36A1_CQB", 2];
				_crate addWeaponCargo ["ACE_G36A1_CQB", 2];
				_crate addWeaponCargo ["ACE_G36A1_D", 2];
				_crate addWeaponCargo ["ACE_G36A1_D_CQB", 2];
				_crate addWeaponCargo ["ACE_G36A2", 2];
				_crate addWeaponCargo ["ACE_G36A2_Bipod", 2];
				_crate addWeaponCargo ["ACE_G36A2_Bipod_CQB", 2];
				_crate addWeaponCargo ["ACE_G36A2_CQB", 2];
				_crate addWeaponCargo ["ACE_G36K", 2];
				_crate addWeaponCargo ["ACE_G36K_CQB", 2];
				_crate addWeaponCargo ["ACE_G36K_D", 2];
				_crate addWeaponCargo ["ACE_G36K_D_CQB", 2];
				_crate addWeaponCargo ["ACE_G36K_EOTech", 2];
				_crate addWeaponCargo ["ACE_G36K_EOTech_D", 2];
				_crate addWeaponCargo ["ACE_G36K_iron", 2];
				_crate addWeaponCargo ["ACE_G36K_iron_D", 2];
				_crate addWeaponCargo ["ACE_G3A3", 2];
				_crate addWeaponCargo ["ACE_G3A3_RSAS", 2];
				_crate addWeaponCargo ["ACE_G3SG1", 2];
				_crate addWeaponCargo ["ACE_HK416_D10", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_AIM", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_COMPM3", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_COMPM3_SD", 2];
				_crate addWeaponCargo ["ACE_HK416_D14", 2];
				_crate addWeaponCargo ["ACE_M1014_Eotech", 2];
				_crate addWeaponCargo ["ACE_m16a4_acg_CQB", 2];
				_crate addWeaponCargo ["ACE_M16A4_ACG_GL_CQB", 2];
				_crate addWeaponCargo ["ACE_M16A4_Iron", 2];
				_crate addWeaponCargo ["ACE_M32", 2];
				_crate addWeaponCargo ["ACE_M4A1_ACOG_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_ACOG_SD_CQB", 2];
				_crate addWeaponCargo ["ACE_M4A1_AIM_GL", 2];
				_crate addWeaponCargo ["ACE_M4A1_AIM_GL_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_Aim_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_Eotech", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL_SD", 2];
				_crate addWeaponCargo ["ACE_M4SPR_SD", 2];
				_crate addWeaponCargo ["ACE_M79", 2];
				_crate addWeaponCargo ["ACE_M79_CQB", 2];
				_crate addWeaponCargo ["ACE_MG36A1", 2];
				_crate addWeaponCargo ["ACE_MP5A4", 2];
				_crate addWeaponCargo ["ACE_MP5A5", 2];
				_crate addWeaponCargo ["ACE_MP5SD", 2];
				_crate addWeaponCargo ["ACE_SA58", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_ACOG", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_ACOG_CQB", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_CQC_Eotech", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_CQC_Eotech_EGLM", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_SNIPER", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_SPECTER", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_SPECTER_CQB", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_Aim", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_AIM_SD", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_Eotech", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_13", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_AIMPOINT", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_EOTECH", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_SD", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_SD_9", 2];
				_crate addWeaponCargo ["ACE_UMP45", 2];
				_crate addWeaponCargo ["ACE_UMP45_SD", 2];
				_crate addWeaponCargo ["ACE_AS50", 2];	//sniper
				_crate addWeaponCargo ["ACE_M110_SD", 2];
				_crate addWeaponCargo ["ACE_TAC50_SD", 2];
			};
			 case "MAJOR": {
				_crate addWeaponCargo ["MAAWS", 2];	//launcher
				_crate addWeaponCargo ["M47Launcher_EP1", 2];
				_crate addWeaponCargo ["ACE_M136_CSRS", 2];
				_crate addWeaponCargo ["ACE_M2HBProxy", 2];
				_crate addWeaponCargo ["ACE_M3TripodProxy", 2];
				_crate addWeaponCargo ["ACE_M72", 2];
				_crate addWeaponCargo ["ACE_M72A2", 2];
				_crate addWeaponCargo ["ACE_MK19MOD3Proxy", 2];
				_crate addWeaponCargo ["ACE_Javelin_CLU", 2];
				_crate addWeaponCargo ["ACE_Javelin_Direct", 2];
				_crate addWeaponCargo ["SMAW", 2];
				_crate addWeaponCargo ["Stinger", 2];
				_crate addWeaponCargo ["ACE_M249Para", 2];	//ar
				_crate addWeaponCargo ["ACE_M249Para_M145", 2];
				_crate addWeaponCargo ["ACE_M240G_M145", 2];	//mg
				_crate addWeaponCargo ["ACE_M60", 2];
				_crate addWeaponCargo ["ACE_Glock17", 2];	//pistols
				_crate addWeaponCargo ["ACE_Glock18", 2];
				_crate addWeaponCargo ["ACE_Knicklicht_Proxy", 2];
				_crate addWeaponCargo ["ACE_P226", 2];
				_crate addWeaponCargo ["ACE_P8", 2];
				_crate addWeaponCargo ["ACE_USP", 2];
				_crate addWeaponCargo ["ACE_USPSD", 2];
				_crate addWeaponCargo ["ACE_G36", 2];	//rifle
				_crate addWeaponCargo ["ACE_G36_CQB", 2];
				_crate addWeaponCargo ["ACE_G36A1", 2];
				_crate addWeaponCargo ["ACE_G36A1_AG36A1", 2];
				_crate addWeaponCargo ["ACE_G36A1_AG36A1_CQB", 2];
				_crate addWeaponCargo ["ACE_G36A1_AG36A1_D", 2];
				_crate addWeaponCargo ["ACE_G36A1_AG36A1_D_CQB", 2];
				_crate addWeaponCargo ["ACE_G36A1_CQB", 2];
				_crate addWeaponCargo ["ACE_G36A1_D", 2];
				_crate addWeaponCargo ["ACE_G36A1_D_CQB", 2];
				_crate addWeaponCargo ["ACE_G36A2", 2];
				_crate addWeaponCargo ["ACE_G36A2_Bipod", 2];
				_crate addWeaponCargo ["ACE_G36A2_Bipod_CQB", 2];
				_crate addWeaponCargo ["ACE_G36A2_Bipod_D", 2];
				_crate addWeaponCargo ["ACE_G36A2_Bipod_D_CQB", 2];
				_crate addWeaponCargo ["ACE_G36A2_CQB", 2];
				_crate addWeaponCargo ["ACE_G36K", 2];
				_crate addWeaponCargo ["ACE_G36K_CQB", 2];
				_crate addWeaponCargo ["ACE_G36K_D", 2];
				_crate addWeaponCargo ["ACE_G36K_D_CQB", 2];
				_crate addWeaponCargo ["ACE_G36K_EOTech", 2];
				_crate addWeaponCargo ["ACE_G36K_EOTech_D", 2];
				_crate addWeaponCargo ["ACE_G36K_iron", 2];
				_crate addWeaponCargo ["ACE_G36K_iron_D", 2];
				_crate addWeaponCargo ["ACE_G3A3", 2];
				_crate addWeaponCargo ["ACE_G3A3_RSAS", 2];
				_crate addWeaponCargo ["ACE_G3SG1", 2];
				_crate addWeaponCargo ["ACE_HK416_D10", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_AIM", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_COMPM3", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_COMPM3_SD", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_M320", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_SD", 2];
				_crate addWeaponCargo ["ACE_HK416_D14", 2];
				_crate addWeaponCargo ["ACE_M1014_Eotech", 2];
				_crate addWeaponCargo ["ACE_m16a4_acg_CQB", 2];
				_crate addWeaponCargo ["ACE_M16A4_ACG_GL_CQB", 2];
				_crate addWeaponCargo ["ACE_M16A4_Iron", 2];
				_crate addWeaponCargo ["ACE_M32", 2];
				_crate addWeaponCargo ["ACE_M4A1_ACOG", 2];
				_crate addWeaponCargo ["ACE_M4A1_ACOG_CQB", 2];
				_crate addWeaponCargo ["ACE_M4A1_ACOG_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_ACOG_SD_CQB", 2];
				_crate addWeaponCargo ["ACE_M4A1_AIM_GL", 2];
				_crate addWeaponCargo ["ACE_M4A1_AIM_GL_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_Aim_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_Eotech", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_RCO_GL", 2];
				_crate addWeaponCargo ["ACE_M4A1_RCO_GL_CQB", 2];
				_crate addWeaponCargo ["ACE_M4SPR_SD", 2];
				_crate addWeaponCargo ["ACE_M79", 2];
				_crate addWeaponCargo ["ACE_M79_CQB", 2];
				_crate addWeaponCargo ["ACE_MG36A1", 2];
				_crate addWeaponCargo ["ACE_MP5A4", 2];
				_crate addWeaponCargo ["ACE_MP5A5", 2];
				_crate addWeaponCargo ["ACE_MP5SD", 2];
				_crate addWeaponCargo ["ACE_SA58", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_ACOG", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_ACOG_CQB", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_CQC_Eotech", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_CQC_Eotech_EGLM", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_SNIPER", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_SPECTER", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_SPECTER_CQB", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_Aim", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_AIM_SD", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_Eotech", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_13", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_AIMPOINT", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_EOTECH", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_SD", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_RCO_GL", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_RCO_GL_CQB", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_SD_9", 2];
				_crate addWeaponCargo ["ACE_UMP45", 2];
				_crate addWeaponCargo ["ACE_UMP45_SD", 2];
				_crate addWeaponCargo ["ACE_AS50", 2];	//sniper
				_crate addWeaponCargo ["ACE_M109", 2];
				_crate addWeaponCargo ["ACE_M110_SD", 2];
				_crate addWeaponCargo ["ACE_TAC50_SD", 2];
			};
			 case "COLONEL": {
				_crate addWeaponCargo ["MAAWS", 2];	//launcher
				_crate addWeaponCargo ["M47Launcher_EP1", 2];
				_crate addWeaponCargo ["ACE_M136_CSRS", 2];
				_crate addWeaponCargo ["ACE_M2HBProxy", 2];
				_crate addWeaponCargo ["ACE_M3TripodProxy", 2];
				_crate addWeaponCargo ["ACE_M72", 2];
				_crate addWeaponCargo ["ACE_M72A2", 2];
				_crate addWeaponCargo ["ACE_MK19MOD3Proxy", 2];
				_crate addWeaponCargo ["ACE_Javelin_CLU", 2];
				_crate addWeaponCargo ["ACE_Javelin_Direct", 2];
				_crate addWeaponCargo ["SMAW", 2];
				_crate addWeaponCargo ["Stinger", 2];
				_crate addWeaponCargo ["ACE_M249Para", 2];	//ar
				_crate addWeaponCargo ["ACE_M249Para_M145", 2];
				_crate addWeaponCargo ["ACE_M249Para_M145_CQB", 2];
				_crate addWeaponCargo ["ACE_M240G_M145", 2];	//mg
				_crate addWeaponCargo ["ACE_M240G_M145_CQB", 2];
				_crate addWeaponCargo ["ACE_M60", 2];
				_crate addWeaponCargo ["ACE_Glock17", 2];	//pistols
				_crate addWeaponCargo ["ACE_Glock18", 2];
				_crate addWeaponCargo ["ACE_Knicklicht_Proxy", 2];
				_crate addWeaponCargo ["ACE_P226", 2];
				_crate addWeaponCargo ["ACE_P8", 2];
				_crate addWeaponCargo ["ACE_USP", 2];
				_crate addWeaponCargo ["ACE_USPSD", 2];
				_crate addWeaponCargo ["ACE_G36", 2];	//rifle
				_crate addWeaponCargo ["ACE_G36_CQB", 2];
				_crate addWeaponCargo ["ACE_G36A1", 2];
				_crate addWeaponCargo ["ACE_G36A1_AG36A1", 2];
				_crate addWeaponCargo ["ACE_G36A1_AG36A1_CQB", 2];
				_crate addWeaponCargo ["ACE_G36A1_AG36A1_D", 2];
				_crate addWeaponCargo ["ACE_G36A1_AG36A1_D_CQB", 2];
				_crate addWeaponCargo ["ACE_G36A1_CQB", 2];
				_crate addWeaponCargo ["ACE_G36A1_D", 2];
				_crate addWeaponCargo ["ACE_G36A1_D_CQB", 2];
				_crate addWeaponCargo ["ACE_G36A2", 2];
				_crate addWeaponCargo ["ACE_G36A2_Bipod", 2];
				_crate addWeaponCargo ["ACE_G36A2_Bipod_CQB", 2];
				_crate addWeaponCargo ["ACE_G36A2_Bipod_D", 2];
				_crate addWeaponCargo ["ACE_G36A2_Bipod_D_CQB", 2];
				_crate addWeaponCargo ["ACE_G36A2_CQB", 2];
				_crate addWeaponCargo ["ACE_G36K", 2];
				_crate addWeaponCargo ["ACE_G36K_CQB", 2];
				_crate addWeaponCargo ["ACE_G36K_D", 2];
				_crate addWeaponCargo ["ACE_G36K_D_CQB", 2];
				_crate addWeaponCargo ["ACE_G36K_EOTech", 2];
				_crate addWeaponCargo ["ACE_G36K_EOTech_D", 2];
				_crate addWeaponCargo ["ACE_G36K_iron", 2];
				_crate addWeaponCargo ["ACE_G36K_iron_D", 2];
				_crate addWeaponCargo ["ACE_G3A3", 2];
				_crate addWeaponCargo ["ACE_G3A3_RSAS", 2];
				_crate addWeaponCargo ["ACE_G3SG1", 2];
				_crate addWeaponCargo ["ACE_HK416_D10", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_AIM", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_COMPM3", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_COMPM3_SD", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_M320", 2];
				_crate addWeaponCargo ["ACE_HK416_D10_SD", 2];
				_crate addWeaponCargo ["ACE_HK416_D14", 2];
				_crate addWeaponCargo ["ACE_HK416_D14_COMPM3", 2];
				_crate addWeaponCargo ["ACE_HK416_D14_COMPM3_M320", 2];
				_crate addWeaponCargo ["ACE_HK416_D14_SD", 2];
				_crate addWeaponCargo ["ACE_M1014_Eotech", 2];
				_crate addWeaponCargo ["ACE_m16a4_acg_CQB", 2];
				_crate addWeaponCargo ["ACE_M16A4_ACG_GL_CQB", 2];
				_crate addWeaponCargo ["ACE_M16A4_Iron", 2];
				_crate addWeaponCargo ["ACE_M32", 2];
				_crate addWeaponCargo ["ACE_M4A1_ACOG", 2];
				_crate addWeaponCargo ["ACE_M4A1_ACOG_CQB", 2];
				_crate addWeaponCargo ["ACE_M4A1_ACOG_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_ACOG_SD_CQB", 2];
				_crate addWeaponCargo ["ACE_M4A1_AIM_GL", 2];
				_crate addWeaponCargo ["ACE_M4A1_AIM_GL_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_Aim_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_Eotech", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL", 2];
				_crate addWeaponCargo ["ACE_M4A1_GL_SD", 2];
				_crate addWeaponCargo ["ACE_M4A1_RCO2_GL", 2];
				_crate addWeaponCargo ["ACE_M4A1_RCO2_GL_CQB", 2];
				_crate addWeaponCargo ["ACE_M4A1_RCO_GL", 2];
				_crate addWeaponCargo ["ACE_M4A1_RCO_GL_CQB", 2];
				_crate addWeaponCargo ["ACE_M4SPR_SD", 2];
				_crate addWeaponCargo ["ACE_M79", 2];
				_crate addWeaponCargo ["ACE_M79_CQB", 2];
				_crate addWeaponCargo ["ACE_MG36A1", 2];
				_crate addWeaponCargo ["ACE_MG36A1_CQB", 2];
				_crate addWeaponCargo ["ACE_MG36A1_D", 2];
				_crate addWeaponCargo ["ACE_MG36A1_D_CQB", 2];
				_crate addWeaponCargo ["ACE_MP5A4", 2];
				_crate addWeaponCargo ["ACE_MP5A5", 2];
				_crate addWeaponCargo ["ACE_MP5SD", 2];
				_crate addWeaponCargo ["ACE_SA58", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_ACOG", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_ACOG_CQB", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_CQC_Eotech", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_CQC_Eotech_EGLM", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_SNIPER", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_SPECTER", 2];
				_crate addWeaponCargo ["ACE_SCAR_L_SPECTER_CQB", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_Aim", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_AIM_SD", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_Eotech", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_13", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_AIMPOINT", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_EOTECH", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_GL_SD", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_RCO_GL", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_RCO_GL_CQB", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_SD_9", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_SHORTDOT", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_SHORTDOT_CQB", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_SHORTDOT_SD", 2];
				_crate addWeaponCargo ["ACE_SOC_M4A1_SHORTDOT_SD_CQB", 2];
				_crate addWeaponCargo ["ACE_UMP45", 2];
				_crate addWeaponCargo ["ACE_UMP45_SD", 2];
				_crate addWeaponCargo ["ACE_AS50", 2];	//sniper
				_crate addWeaponCargo ["ACE_M109", 2];
				_crate addWeaponCargo ["ACE_M110", 2];
				_crate addWeaponCargo ["ACE_M110_SD", 2];
				_crate addWeaponCargo ["ACE_TAC50", 2];
				_crate addWeaponCargo ["ACE_TAC50_SD", 2];
			};
		};
	} else {	
		_crate addWeaponCargo ["MAAWS", 2];	//launcher
		_crate addWeaponCargo ["M47Launcher_EP1", 2];
		_crate addWeaponCargo ["ACE_M136_CSRS", 2];
		_crate addWeaponCargo ["ACE_M2HBProxy", 2];
		_crate addWeaponCargo ["ACE_M3TripodProxy", 2];
		_crate addWeaponCargo ["ACE_M72", 2];
		_crate addWeaponCargo ["ACE_M72A2", 2];
		_crate addWeaponCargo ["ACE_MK19MOD3Proxy", 2];
		_crate addWeaponCargo ["ACE_Javelin_CLU", 2];
		_crate addWeaponCargo ["ACE_Javelin_Direct", 2];
		_crate addWeaponCargo ["SMAW", 2];
		_crate addWeaponCargo ["Stinger", 2];
		_crate addWeaponCargo ["ACE_M249Para", 2];	//ar
		_crate addWeaponCargo ["ACE_M249Para_M145", 2];
		_crate addWeaponCargo ["ACE_M249Para_M145_CQB", 2];
		_crate addWeaponCargo ["ACE_M240G_M145", 2];	//mg
		_crate addWeaponCargo ["ACE_M240G_M145_CQB", 2];
		_crate addWeaponCargo ["ACE_M60", 2];
		_crate addWeaponCargo ["ACE_Glock17", 2];	//pistols
		_crate addWeaponCargo ["ACE_Glock18", 2];
		_crate addWeaponCargo ["ACE_Knicklicht_Proxy", 2];
		_crate addWeaponCargo ["ACE_P226", 2];
		_crate addWeaponCargo ["ACE_P8", 2];
		_crate addWeaponCargo ["ACE_USP", 2];
		_crate addWeaponCargo ["ACE_USPSD", 2];
		_crate addWeaponCargo ["ACE_G36", 2];	//rifle
		_crate addWeaponCargo ["ACE_G36_CQB", 2];
		_crate addWeaponCargo ["ACE_G36A1", 2];
		_crate addWeaponCargo ["ACE_G36A1_AG36A1", 2];
		_crate addWeaponCargo ["ACE_G36A1_AG36A1_CQB", 2];
		_crate addWeaponCargo ["ACE_G36A1_AG36A1_D", 2];
		_crate addWeaponCargo ["ACE_G36A1_AG36A1_D_CQB", 2];
		_crate addWeaponCargo ["ACE_G36A1_CQB", 2];
		_crate addWeaponCargo ["ACE_G36A1_D", 2];
		_crate addWeaponCargo ["ACE_G36A1_D_CQB", 2];
		_crate addWeaponCargo ["ACE_G36A2", 2];
		_crate addWeaponCargo ["ACE_G36A2_Bipod", 2];
		_crate addWeaponCargo ["ACE_G36A2_Bipod_CQB", 2];
		_crate addWeaponCargo ["ACE_G36A2_Bipod_D", 2];
		_crate addWeaponCargo ["ACE_G36A2_Bipod_D_CQB", 2];
		_crate addWeaponCargo ["ACE_G36A2_CQB", 2];
		_crate addWeaponCargo ["ACE_G36K", 2];
		_crate addWeaponCargo ["ACE_G36K_CQB", 2];
		_crate addWeaponCargo ["ACE_G36K_D", 2];
		_crate addWeaponCargo ["ACE_G36K_D_CQB", 2];
		_crate addWeaponCargo ["ACE_G36K_EOTech", 2];
		_crate addWeaponCargo ["ACE_G36K_EOTech_D", 2];
		_crate addWeaponCargo ["ACE_G36K_iron", 2];
		_crate addWeaponCargo ["ACE_G36K_iron_D", 2];
		_crate addWeaponCargo ["ACE_G3A3", 2];
		_crate addWeaponCargo ["ACE_G3A3_RSAS", 2];
		_crate addWeaponCargo ["ACE_G3SG1", 2];
		_crate addWeaponCargo ["ACE_HK416_D10", 2];
		_crate addWeaponCargo ["ACE_HK416_D10_AIM", 2];
		_crate addWeaponCargo ["ACE_HK416_D10_COMPM3", 2];
		_crate addWeaponCargo ["ACE_HK416_D10_COMPM3_SD", 2];
		_crate addWeaponCargo ["ACE_HK416_D10_M320", 2];
		_crate addWeaponCargo ["ACE_HK416_D10_SD", 2];
		_crate addWeaponCargo ["ACE_HK416_D14", 2];
		_crate addWeaponCargo ["ACE_HK416_D14_COMPM3", 2];
		_crate addWeaponCargo ["ACE_HK416_D14_COMPM3_M320", 2];
		_crate addWeaponCargo ["ACE_HK416_D14_SD", 2];
		_crate addWeaponCargo ["ACE_M1014_Eotech", 2];
		_crate addWeaponCargo ["ACE_m16a4_acg_CQB", 2];
		_crate addWeaponCargo ["ACE_M16A4_ACG_GL_CQB", 2];
		_crate addWeaponCargo ["ACE_M16A4_Iron", 2];
		_crate addWeaponCargo ["ACE_M32", 2];
		_crate addWeaponCargo ["ACE_M4A1_ACOG", 2];
		_crate addWeaponCargo ["ACE_M4A1_ACOG_CQB", 2];
		_crate addWeaponCargo ["ACE_M4A1_ACOG_SD", 2];
		_crate addWeaponCargo ["ACE_M4A1_ACOG_SD_CQB", 2];
		_crate addWeaponCargo ["ACE_M4A1_AIM_GL", 2];
		_crate addWeaponCargo ["ACE_M4A1_AIM_GL_SD", 2];
		_crate addWeaponCargo ["ACE_M4A1_Aim_SD", 2];
		_crate addWeaponCargo ["ACE_M4A1_Eotech", 2];
		_crate addWeaponCargo ["ACE_M4A1_GL", 2];
		_crate addWeaponCargo ["ACE_M4A1_GL_SD", 2];
		_crate addWeaponCargo ["ACE_M4A1_RCO2_GL", 2];
		_crate addWeaponCargo ["ACE_M4A1_RCO2_GL_CQB", 2];
		_crate addWeaponCargo ["ACE_M4A1_RCO_GL", 2];
		_crate addWeaponCargo ["ACE_M4A1_RCO_GL_CQB", 2];
		_crate addWeaponCargo ["ACE_M4SPR_SD", 2];
		_crate addWeaponCargo ["ACE_M79", 2];
		_crate addWeaponCargo ["ACE_M79_CQB", 2];
		_crate addWeaponCargo ["ACE_MG36A1", 2];
		_crate addWeaponCargo ["ACE_MG36A1_CQB", 2];
		_crate addWeaponCargo ["ACE_MG36A1_D", 2];
		_crate addWeaponCargo ["ACE_MG36A1_D_CQB", 2];
		_crate addWeaponCargo ["ACE_MP5A4", 2];
		_crate addWeaponCargo ["ACE_MP5A5", 2];
		_crate addWeaponCargo ["ACE_MP5SD", 2];
		_crate addWeaponCargo ["ACE_SA58", 2];
		_crate addWeaponCargo ["ACE_SCAR_L_ACOG", 2];
		_crate addWeaponCargo ["ACE_SCAR_L_ACOG_CQB", 2];
		_crate addWeaponCargo ["ACE_SCAR_L_CQC_Eotech", 2];
		_crate addWeaponCargo ["ACE_SCAR_L_CQC_Eotech_EGLM", 2];
		_crate addWeaponCargo ["ACE_SCAR_L_SNIPER", 2];
		_crate addWeaponCargo ["ACE_SCAR_L_SPECTER", 2];
		_crate addWeaponCargo ["ACE_SCAR_L_SPECTER_CQB", 2];
		_crate addWeaponCargo ["ACE_SOC_M4A1", 2];
		_crate addWeaponCargo ["ACE_SOC_M4A1_Aim", 2];
		_crate addWeaponCargo ["ACE_SOC_M4A1_AIM_SD", 2];
		_crate addWeaponCargo ["ACE_SOC_M4A1_Eotech", 2];
		_crate addWeaponCargo ["ACE_SOC_M4A1_GL", 2];
		_crate addWeaponCargo ["ACE_SOC_M4A1_GL_13", 2];
		_crate addWeaponCargo ["ACE_SOC_M4A1_GL_AIMPOINT", 2];
		_crate addWeaponCargo ["ACE_SOC_M4A1_GL_EOTECH", 2];
		_crate addWeaponCargo ["ACE_SOC_M4A1_GL_SD", 2];
		_crate addWeaponCargo ["ACE_SOC_M4A1_RCO_GL", 2];
		_crate addWeaponCargo ["ACE_SOC_M4A1_RCO_GL_CQB", 2];
		_crate addWeaponCargo ["ACE_SOC_M4A1_SD_9", 2];
		_crate addWeaponCargo ["ACE_SOC_M4A1_SHORTDOT", 2];
		_crate addWeaponCargo ["ACE_SOC_M4A1_SHORTDOT_CQB", 2];
		_crate addWeaponCargo ["ACE_SOC_M4A1_SHORTDOT_SD", 2];
		_crate addWeaponCargo ["ACE_SOC_M4A1_SHORTDOT_SD_CQB", 2];
		_crate addWeaponCargo ["ACE_UMP45", 2];
		_crate addWeaponCargo ["ACE_UMP45_SD", 2];
		_crate addWeaponCargo ["ACE_AS50", 2];	//sniper
		_crate addWeaponCargo ["ACE_M109", 2];
		_crate addWeaponCargo ["ACE_M110", 2];
		_crate addWeaponCargo ["ACE_M110_SD", 2];
		_crate addWeaponCargo ["ACE_TAC50", 2];
		_crate addWeaponCargo ["ACE_TAC50_SD", 2];
	};
	_crate addWeaponCargo ["Laserdesignator",1];
	_crate addWeaponCargo ["NVGoggles",1];
	_crate addWeaponCargo ["Binocular_Vector",1];
	_crate addWeaponCargo ["Binocular",1];
	_crate addWeaponCargo ["ACE_YardAge450",1];
	_crate addWeaponCargo ["ACE_Rangefinder_OD",1];
	_crate addWeaponCargo ["ACE_MX2A",1];
	_crate addWeaponCargo ["ACE_DAGR",1];
	_crate addWeaponCargo ["ACE_Earplugs",1];
	_crate addWeaponCargo ["ACE_GlassesBalaklava",1];
	_crate addWeaponCargo ["ACE_GlassesBalaklavaGray",1];
	_crate addWeaponCargo ["ACE_GlassesBalaklavaOlive",1];
	_crate addWeaponCargo ["ACE_GlassesBlackSun",1];
	_crate addWeaponCargo ["ACE_GlassesBlueSun",1];
	_crate addWeaponCargo ["ACE_GlassesGasMask_US",1];
	_crate addWeaponCargo ["ACE_GlassesLHD_glasses",1];
	_crate addWeaponCargo ["ACE_GlassesSunglasses",1];
	_crate addWeaponCargo ["ACE_GlassesTactical",1];
	_crate addWeaponCargo ["ACE_HuntIR_monitor",1];
	_crate addWeaponCargo ["ACE_Kestrel4500",1];
	_crate addWeaponCargo ["ACE_KeyCuffs",1];
	_crate addWeaponCargo ["ACE_Map_Tools",1];
	_crate addWeaponCargo ["ACE_SpottingScope",1];
	_crate addWeaponCargo ["ACE_WireCutter",1];
	_crate addWeaponCargo ["ACE_Javelin_CLU",1];
	_crate addMagazineCargo ["ACE_Battery_Rangefinder",1];
	_crate addMagazineCargo ["Laserbatteries",1];
	_crate addWeaponCargo ["Laserdesignator",1];
	_crate addMagazineCargo ["ACE_200Rnd_556x45_T_M249", 16];	//ar
	_crate addMagazineCargo ["ACE_SMAW_NE", 16];	//launcher
	_crate addMagazineCargo ["SMAW_HEAA", 16];
	_crate addMagazineCargo ["SMAW_HEDP", 16];
	_crate addMagazineCargo ["ACE_SMAW_Spotting", 16];
	_crate addMagazineCargo ["ACE_MAAWS_HE", 16];
	_crate addMagazineCargo ["MAAWS_HEAT", 16];
	_crate addMagazineCargo ["MAAWS_HEDP", 16];
	_crate addMagazineCargo ["ACE_Javelin_Direct", 16];
	_crate addMagazineCargo ["Javelin", 16];
	_crate addMagazineCargo ["ACE_M136_CSRS", 16];
	_crate addMagazineCargo ["ACE_M72A2", 16];
	_crate addMagazineCargo ["NLAW", 16];
	_crate addMagazineCargo ["M136", 16];
	_crate addMagazineCargo ["Dragon_EP1", 16];
	_crate addMagazineCargo ["Stinger", 16];
	_crate addMagazineCargo ["100Rnd_762x51_M240", 16];	//mg
	_crate addMagazineCargo ["ACE_17Rnd_9x19_G17", 16];	//pistols
	_crate addMagazineCargo ["ACE_33Rnd_9x19_G18", 16];
	_crate addMagazineCargo ["ACE_15Rnd_9x19_P226", 16];
	_crate addMagazineCargo ["ACE_15Rnd_9x19_P8", 16];
	_crate addMagazineCargo ["ACE_12Rnd_45ACP_USP", 16];
	_crate addMagazineCargo ["ACE_12Rnd_45ACP_USPSD", 16];
	_crate addMagazineCargo ["15Rnd_9x19_M9SD", 16];
	_crate addMagazineCargo ["ACE_100Rnd_556x45_S_BetaCMag", 16];	//rifles
	_crate addMagazineCargo ["ACE_30Rnd_556x45_S_G36", 16];
	_crate addMagazineCargo ["ACE_30Rnd_556x45_T_G36", 16];
	_crate addMagazineCargo ["ACE_1Rnd_CS_M203", 16];
	_crate addMagazineCargo ["ACE_1Rnd_HE_M203", 16];
	_crate addMagazineCargo ["ACE_1Rnd_PR_M203", 16];
	_crate addMagazineCargo ["ACE_HuntIR_M203", 16];
	_crate addMagazineCargo ["ACE_SSGreen_M203", 16];
	_crate addMagazineCargo ["ACE_SSRed_M203", 16];
	_crate addMagazineCargo ["ACE_SSWhite_M203", 16];
	_crate addMagazineCargo ["ACE_SSYellow_M203", 16];
	_crate addMagazineCargo ["ACE_20Rnd_762x51_B_G3", 16];
	_crate addMagazineCargo ["ACE_20Rnd_556x45_S_Stanag", 16];
	_crate addMagazineCargo ["ACE_30Rnd_556x45_S_Stanag", 16];
	_crate addMagazineCargo ["ACE_30Rnd_556x45_SB_S_Stanag", 16];
	_crate addMagazineCargo ["ACE_30Rnd_556x45_SB_Stanag", 16];
	_crate addMagazineCargo ["ACE_30Rnd_556x45_T_Stanag", 16];
	_crate addMagazineCargo ["ACE_8Rnd_12Ga_Buck00", 16];
	_crate addMagazineCargo ["ACE_6Rnd_40mm_M32", 16];
	_crate addMagazineCargo ["ACE_6Rnd_CS_M32", 16];
	_crate addMagazineCargo ["ACE_40mm_Buck_M79", 16];
	_crate addMagazineCargo ["ACE_30Rnd_9x19_S_MP5", 16];
	_crate addMagazineCargo ["ACE_20Rnd_762x51_B_FAL", 16];
	_crate addMagazineCargo ["ACE_30Rnd_762x51_B_FAL", 16];
	_crate addMagazineCargo ["ACE_25Rnd_1143x23_B_UMP45", 16];
	_crate addMagazineCargo ["ACE_5Rnd_127x99_B_TAC50", 16];	//sniper
	_crate addMagazineCargo ["ACE_5Rnd_127x99_S_TAC50", 16];
	_crate addMagazineCargo ["ACE_5Rnd_127x99_T_TAC50", 16];
	_crate addMagazineCargo ["ACE_5Rnd_25x59_HEDP_Barrett", 16];
	_crate addMagazineCargo ["ACE_20Rnd_762x51_S_M110", 16];
	_crate addMagazineCargo ["ACE_20Rnd_762x51_SB_M110", 16];
	_crate addMagazineCargo ["ACE_20Rnd_762x51_T_M110", 16];
	_crate addMagazineCargo ["ACE_20Rnd_762x51_T_DMR", 16];
	_crate addMagazineCargo ["ACE_10Rnd_127x99_Raufoss_m107", 16];
	_crate addMagazineCargo ["ACE_10Rnd_127x99_T_m107", 16];
	_crate addMagazineCargo ["ACE_5Rnd_762x51_T_M24", 16];
	_crate addMagazineCargo ["pipebomb",20];
};
	

if (__isRed) then { //----------------------------------------------------------------------------------------------------east A2
	if (E_lock == 0 or E_lock == 3) then {
		switch (_rank) do {
			case "PRIVATE": {
				_crate addWeaponCargo ["ACE_RMG", 2];	//launcher
				_crate addWeaponCargo ["ACE_RSHG1", 2];
				_crate addWeaponCargo ["RPG18", 2];
				_crate addWeaponCargo ["RPG7V", 2];
				_crate addWeaponCargo ["ACE_RPK74M", 2];	//ar
				_crate addWeaponCargo ["Makarov", 2];	//pistols
				_crate addWeaponCargo ["ACE_AK74M", 2];	//rifles
				_crate addWeaponCargo ["ACE_AK74M_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL", 2];
				_crate addWeaponCargo ["ACE_AKS74_GP25", 2];
				_crate addWeaponCargo ["ACE_AKS74_UN", 2];
				_crate addWeaponCargo ["ACE_AKS74P", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL", 2];
				_crate addWeaponCargo ["AK_74", 2];
				_crate addWeaponCargo ["ACE_SVD_Bipod", 2];	//sniper
			};
			case "CORPORAL": {
				_crate addWeaponCargo ["ACE_RMG", 2];	//launcher
				_crate addWeaponCargo ["ACE_RPG22", 2];
				_crate addWeaponCargo ["ACE_RPG27", 2];
				_crate addWeaponCargo ["ACE_RPOM", 2];
				_crate addWeaponCargo ["ACE_RSHG1", 2];
				_crate addWeaponCargo ["RPG18", 2];
				_crate addWeaponCargo ["RPG7V", 2];
				_crate addWeaponCargo ["ACE_RPK74M", 2];	//ar
				_crate addWeaponCargo ["Makarov", 2];	//pistols
				_crate addWeaponCargo ["MakarovSD", 2];
				_crate addWeaponCargo ["ACE_AK74M", 2];	//rifles
				_crate addWeaponCargo ["ACE_AK74M_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_Kobra", 2];
				_crate addWeaponCargo ["ACE_AKS74_GP25", 2];
				_crate addWeaponCargo ["ACE_AKS74_UN", 2];
				_crate addWeaponCargo ["ACE_AKS74P", 2];
				_crate addWeaponCargo ["ACE_AKS74P_1P29", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL", 2];
				_crate addWeaponCargo ["AK_74", 2];
				_crate addWeaponCargo ["ACE_SVD_Bipod", 2];	//sniper
			};
			case "SERGEANT": {
				_crate addWeaponCargo ["ACE_RMG", 2];	//launcher
				_crate addWeaponCargo ["ACE_RPG22", 2];
				_crate addWeaponCargo ["ACE_RPG27", 2];
				_crate addWeaponCargo ["ACE_RPG29", 2];
				_crate addWeaponCargo ["ACE_RPOM", 2];
				_crate addWeaponCargo ["ACE_RSHG1", 2];
				_crate addWeaponCargo ["Igla", 2];
				_crate addWeaponCargo ["RPG18", 2];
				_crate addWeaponCargo ["RPG7V", 2];
				_crate addWeaponCargo ["ACE_RPK74M", 2];	//ar
				_crate addWeaponCargo ["Makarov", 2];	//pistols
				_crate addWeaponCargo ["MakarovSD", 2];
				_crate addWeaponCargo ["revolver_EP1", 2];
				_crate addWeaponCargo ["ACE_AK103", 2];	//rifles
				_crate addWeaponCargo ["ACE_AK103_1P29", 2];
				_crate addWeaponCargo ["ACE_AK103_GL", 2];
				_crate addWeaponCargo ["ACE_AK103_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AK103_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK104", 2];
				_crate addWeaponCargo ["ACE_AK104_1P29", 2];
				_crate addWeaponCargo ["ACE_AK105", 2];
				_crate addWeaponCargo ["ACE_AK105_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M", 2];
				_crate addWeaponCargo ["ACE_AK74M_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK74M_Kobra_F", 2];
				_crate addWeaponCargo ["ACE_AKS74_GP25", 2];
				_crate addWeaponCargo ["ACE_AKS74_UN", 2];
				_crate addWeaponCargo ["ACE_AKS74P", 2];
				_crate addWeaponCargo ["ACE_AKS74P_1P29", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL", 2];
				_crate addWeaponCargo ["ACE_AKS74P_Kobra", 2];
				_crate addWeaponCargo ["AK_74", 2];
				_crate addWeaponCargo ["ACE_SVD_Bipod", 2];	//sniper
			};
			case "LIEUTENANT": {
				_crate addWeaponCargo ["ACE_RMG", 2];	//launcher
				_crate addWeaponCargo ["ACE_RPG22", 2];
				_crate addWeaponCargo ["ACE_RPG27", 2];
				_crate addWeaponCargo ["ACE_RPG29", 2];
				_crate addWeaponCargo ["ACE_RPG7V_PGO7", 2];
				_crate addWeaponCargo ["ACE_RPOM", 2];
				_crate addWeaponCargo ["ACE_RSHG1", 2];
				_crate addWeaponCargo ["Igla", 2];
				_crate addWeaponCargo ["RPG18", 2];
				_crate addWeaponCargo ["RPG7V", 2];
				_crate addWeaponCargo ["ACE_RPK74M", 2];	//ar
				_crate addWeaponCargo ["PK", 2];	//mg
				_crate addWeaponCargo ["ACE_APS", 2];	//pistols
				_crate addWeaponCargo ["Makarov", 2];
				_crate addWeaponCargo ["MakarovSD", 2];
				_crate addWeaponCargo ["revolver_EP1", 2];
				_crate addWeaponCargo ["ACE_AK103", 2];	//rifles
				_crate addWeaponCargo ["ACE_AK103_1P29", 2];
				_crate addWeaponCargo ["ACE_AK103_GL", 2];
				_crate addWeaponCargo ["ACE_AK103_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AK103_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK103_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK104", 2];
				_crate addWeaponCargo ["ACE_AK104_1P29", 2];
				_crate addWeaponCargo ["ACE_AK104_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK105", 2];
				_crate addWeaponCargo ["ACE_AK105_1P29", 2];
				_crate addWeaponCargo ["ACE_AK105_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK74M", 2];
				_crate addWeaponCargo ["ACE_AK74M_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK74M_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK74M_Kobra_F", 2];
				_crate addWeaponCargo ["ACE_AKS74_GP25", 2];
				_crate addWeaponCargo ["ACE_AKS74_UN", 2];
				_crate addWeaponCargo ["ACE_AKS74P", 2];
				_crate addWeaponCargo ["ACE_AKS74P_1P29", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AKS74P_Kobra", 2];
				_crate addWeaponCargo ["AK_107_kobra", 2];
				_crate addWeaponCargo ["AK_74", 2];
				_crate addWeaponCargo ["AK_74_GL", 2];
				_crate addWeaponCargo ["AK_74_GL_kobra", 2];
				_crate addWeaponCargo ["ACE_SVD_Bipod", 2];	//sniper
				_crate addWeaponCargo ["SVD", 2];
			};
			case "CAPTAIN": {
				_crate addWeaponCargo ["ACE_RMG", 2];	//launcher
				_crate addWeaponCargo ["ACE_RPG22", 2];
				_crate addWeaponCargo ["ACE_RPG27", 2];
				_crate addWeaponCargo ["ACE_RPG29", 2];
				_crate addWeaponCargo ["ACE_RPG7V_PGO7", 2];
				_crate addWeaponCargo ["ACE_RPOM", 2];
				_crate addWeaponCargo ["ACE_RSHG1", 2];
				_crate addWeaponCargo ["Igla", 2];
				_crate addWeaponCargo ["MetisLauncher", 2];
				_crate addWeaponCargo ["RPG18", 2];
				_crate addWeaponCargo ["RPG7V", 2];
				_crate addWeaponCargo ["ACE_RPK74M", 2];	//ar
				_crate addWeaponCargo ["ACE_RPK74M_1P29", 2];
				_crate addWeaponCargo ["PK", 2];	//mg
				_crate addWeaponCargo ["ACE_APS", 2];	//pistols
				_crate addWeaponCargo ["ACE_APSB", 2];
				_crate addWeaponCargo ["Makarov", 2];
				_crate addWeaponCargo ["MakarovSD", 2];
				_crate addWeaponCargo ["revolver_EP1", 2];
				_crate addWeaponCargo ["ACE_AK103", 2];	//rifles
				_crate addWeaponCargo ["ACE_AK103_1P29", 2];
				_crate addWeaponCargo ["ACE_AK103_GL", 2];
				_crate addWeaponCargo ["ACE_AK103_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AK103_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK103_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK104", 2];
				_crate addWeaponCargo ["ACE_AK104_1P29", 2];
				_crate addWeaponCargo ["ACE_AK104_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK105", 2];
				_crate addWeaponCargo ["ACE_AK105_1P29", 2];
				_crate addWeaponCargo ["ACE_AK105_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK74M", 2];
				_crate addWeaponCargo ["ACE_AK74M_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_PSO", 2];
				_crate addWeaponCargo ["ACE_AK74M_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK74M_PSO", 2];
				_crate addWeaponCargo ["ACE_AKS74_GP25", 2];
				_crate addWeaponCargo ["ACE_AKS74_UN", 2];
				_crate addWeaponCargo ["ACE_AKS74P", 2];
				_crate addWeaponCargo ["ACE_AKS74P_1P29", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AKS74P_Kobra", 2];
				_crate addWeaponCargo ["ACE_gr1", 2];
				_crate addWeaponCargo ["ACE_gr1sd", 2];
				_crate addWeaponCargo ["ACE_gr1sdsp", 2];
				_crate addWeaponCargo ["ACE_gr1sp", 2];
				_crate addWeaponCargo ["ACE_oc14", 2];
				_crate addWeaponCargo ["ACE_oc14sp", 2];
				_crate addWeaponCargo ["ACE_Val", 2];
				_crate addWeaponCargo ["ACE_Val_Kobra", 2];
				_crate addWeaponCargo ["AK_107_kobra", 2];
				_crate addWeaponCargo ["AK_107_pso", 2];
				_crate addWeaponCargo ["AK_74", 2];
				_crate addWeaponCargo ["AK_74_GL", 2];
				_crate addWeaponCargo ["AK_74_GL_kobra", 2];
				_crate addWeaponCargo ["ACE_SVD_Bipod", 2];	//sniper
				_crate addWeaponCargo ["SVD", 2];
				_crate addWeaponCargo ["SVD_des_EP1", 2];
			};
			case "MAJOR": {
				_crate addWeaponCargo ["ACE_RMG", 2];	//launcher
				_crate addWeaponCargo ["ACE_RPG22", 2];
				_crate addWeaponCargo ["ACE_RPG27", 2];
				_crate addWeaponCargo ["ACE_RPG29", 2];
				_crate addWeaponCargo ["ACE_RPG7V_PGO7", 2];
				_crate addWeaponCargo ["ACE_RPOM", 2];
				_crate addWeaponCargo ["ACE_RSHG1", 2];
				_crate addWeaponCargo ["Igla", 2];
				_crate addWeaponCargo ["MetisLauncher", 2];
				_crate addWeaponCargo ["RPG18", 2];
				_crate addWeaponCargo ["RPG7V", 2];
				_crate addWeaponCargo ["ACE_RPK74M", 2];	//ar
				_crate addWeaponCargo ["ACE_RPK74M_1P29", 2];
				_crate addWeaponCargo ["Pecheneg", 2];	//mg
				_crate addWeaponCargo ["PK", 2];
				_crate addWeaponCargo ["ACE_APS", 2];	//pistols
				_crate addWeaponCargo ["ACE_APSB", 2];
				_crate addWeaponCargo ["Makarov", 2];
				_crate addWeaponCargo ["MakarovSD", 2];
				_crate addWeaponCargo ["revolver_EP1", 2];
				_crate addWeaponCargo ["Sa61_EP1", 2];
				_crate addWeaponCargo ["ACE_AK103", 2];	//rifles
				_crate addWeaponCargo ["ACE_AK103_1P29", 2];
				_crate addWeaponCargo ["ACE_AK103_GL", 2];
				_crate addWeaponCargo ["ACE_AK103_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AK103_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK103_GL_PSO", 2];
				_crate addWeaponCargo ["ACE_AK103_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK103_PSO", 2];
				_crate addWeaponCargo ["ACE_AK104", 2];
				_crate addWeaponCargo ["ACE_AK104_1P29", 2];
				_crate addWeaponCargo ["ACE_AK104_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK104_PSO", 2];
				_crate addWeaponCargo ["ACE_AK105", 2];
				_crate addWeaponCargo ["ACE_AK105_1P29", 2];
				_crate addWeaponCargo ["ACE_AK105_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK105_PSO", 2];
				_crate addWeaponCargo ["ACE_AK74M", 2];
				_crate addWeaponCargo ["ACE_AK74M_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_PSO", 2];
				_crate addWeaponCargo ["ACE_AK74M_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK74M_PSO", 2];
				_crate addWeaponCargo ["ACE_AKS74_GP25", 2];
				_crate addWeaponCargo ["ACE_AKS74_UN", 2];
				_crate addWeaponCargo ["ACE_AKS74P", 2];
				_crate addWeaponCargo ["ACE_AKS74P_1P29", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AKS74P_Kobra", 2];
				_crate addWeaponCargo ["ACE_AKS74P_PSO", 2];
				_crate addWeaponCargo ["ACE_gr1", 2];
				_crate addWeaponCargo ["ACE_gr1sd", 2];
				_crate addWeaponCargo ["ACE_gr1sdsp", 2];
				_crate addWeaponCargo ["ACE_gr1sp", 2];
				_crate addWeaponCargo ["ACE_oc14", 2];
				_crate addWeaponCargo ["ACE_oc14gl", 2];
				_crate addWeaponCargo ["ACE_oc14glsp", 2];
				_crate addWeaponCargo ["ACE_oc14sp", 2];
				_crate addWeaponCargo ["ACE_Val", 2];
				_crate addWeaponCargo ["ACE_Val_Kobra", 2];
				_crate addWeaponCargo ["AK_107_GL_kobra", 2];
				_crate addWeaponCargo ["AK_107_kobra", 2];
				_crate addWeaponCargo ["AK_107_pso", 2];
				_crate addWeaponCargo ["AK_74", 2];
				_crate addWeaponCargo ["AK_74_GL", 2];
				_crate addWeaponCargo ["AK_74_GL_kobra", 2];
				_crate addWeaponCargo ["ACE_SVD_Bipod", 2];	//sniper
				_crate addWeaponCargo ["ksvk", 2];
				_crate addWeaponCargo ["SVD", 2];
				_crate addWeaponCargo ["SVD_des_EP1", 2];
			};
			case "COLONEL": {
				_crate addWeaponCargo ["ACE_RMG", 2];	//launcher
				_crate addWeaponCargo ["ACE_RPG22", 2];
				_crate addWeaponCargo ["ACE_RPG27", 2];
				_crate addWeaponCargo ["ACE_RPG29", 2];
				_crate addWeaponCargo ["ACE_RPG7V_PGO7", 2];
				_crate addWeaponCargo ["ACE_RPOM", 2];
				_crate addWeaponCargo ["ACE_RSHG1", 2];
				_crate addWeaponCargo ["Igla", 2];
				_crate addWeaponCargo ["MetisLauncher", 2];
				_crate addWeaponCargo ["RPG18", 2];
				_crate addWeaponCargo ["RPG7V", 2];
				_crate addWeaponCargo ["ACE_RPK74M", 2];	//ar
				_crate addWeaponCargo ["ACE_RPK74M_1P29", 2];
				_crate addWeaponCargo ["Pecheneg", 2];	//mg
				_crate addWeaponCargo ["PK", 2];
				_crate addWeaponCargo ["ACE_APS", 2];	//pistols
				_crate addWeaponCargo ["ACE_APSB", 2];
				_crate addWeaponCargo ["Makarov", 2];
				_crate addWeaponCargo ["MakarovSD", 2];
				_crate addWeaponCargo ["revolver_EP1", 2];
				_crate addWeaponCargo ["revolver_gold_EP1", 2];
				_crate addWeaponCargo ["Sa61_EP1", 2];
				_crate addWeaponCargo ["ACE_AK103", 2];	//rifles
				_crate addWeaponCargo ["ACE_AK103_1P29", 2];
				_crate addWeaponCargo ["ACE_AK103_GL", 2];
				_crate addWeaponCargo ["ACE_AK103_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AK103_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK103_GL_PSO", 2];
				_crate addWeaponCargo ["ACE_AK103_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK103_PSO", 2];
				_crate addWeaponCargo ["ACE_AK104", 2];
				_crate addWeaponCargo ["ACE_AK104_1P29", 2];
				_crate addWeaponCargo ["ACE_AK104_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK104_PSO", 2];
				_crate addWeaponCargo ["ACE_AK105", 2];
				_crate addWeaponCargo ["ACE_AK105_1P29", 2];
				_crate addWeaponCargo ["ACE_AK105_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK105_PSO", 2];
				_crate addWeaponCargo ["ACE_AK74M", 2];
				_crate addWeaponCargo ["ACE_AK74M_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK74M_GL_PSO", 2];
				_crate addWeaponCargo ["ACE_AK74M_Kobra", 2];
				_crate addWeaponCargo ["ACE_AK74M_PSO", 2];
				_crate addWeaponCargo ["ACE_AKS74_GP25", 2];
				_crate addWeaponCargo ["ACE_AKS74_UN", 2];
				_crate addWeaponCargo ["ACE_AKS74P", 2];
				_crate addWeaponCargo ["ACE_AKS74P_1P29", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL_1P29", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL_Kobra", 2];
				_crate addWeaponCargo ["ACE_AKS74P_GL_PSO", 2];
				_crate addWeaponCargo ["ACE_AKS74P_Kobra", 2];
				_crate addWeaponCargo ["ACE_AKS74P_PSO", 2];
				_crate addWeaponCargo ["ACE_gr1", 2];
				_crate addWeaponCargo ["ACE_gr1sd", 2];
				_crate addWeaponCargo ["ACE_gr1sdsp", 2];
				_crate addWeaponCargo ["ACE_gr1sp", 2];
				_crate addWeaponCargo ["ACE_oc14", 2];
				_crate addWeaponCargo ["ACE_oc14gl", 2];
				_crate addWeaponCargo ["ACE_oc14glsp", 2];
				_crate addWeaponCargo ["ACE_oc14sd", 2];
				_crate addWeaponCargo ["ACE_oc14sdsp", 2];
				_crate addWeaponCargo ["ACE_oc14sp", 2];
				_crate addWeaponCargo ["ACE_Val", 2];
				_crate addWeaponCargo ["ACE_Val_Kobra", 2];
				_crate addWeaponCargo ["ACE_Val_PSO", 2];
				_crate addWeaponCargo ["AK_107_GL_kobra", 2];
				_crate addWeaponCargo ["AK_107_GL_pso", 2];
				_crate addWeaponCargo ["AK_107_kobra", 2];
				_crate addWeaponCargo ["AK_107_pso", 2];
				_crate addWeaponCargo ["AK_74", 2];
				_crate addWeaponCargo ["AK_74_GL", 2];
				_crate addWeaponCargo ["AK_74_GL_kobra", 2];
				_crate addWeaponCargo ["ACE_SVD_Bipod", 2];	//sniper
				_crate addWeaponCargo ["ksvk", 2];
				_crate addWeaponCargo ["SVD", 2];
				_crate addWeaponCargo ["SVD_des_EP1", 2];
				_crate addWeaponCargo ["SVD_NSPU_EP1", 2];
			};
		};
	} else {
		_crate addWeaponCargo ["ACE_RMG", 2];	//launcher
		_crate addWeaponCargo ["ACE_RPG22", 2];
		_crate addWeaponCargo ["ACE_RPG27", 2];
		_crate addWeaponCargo ["ACE_RPG29", 2];
		_crate addWeaponCargo ["ACE_RPG7V_PGO7", 2];
		_crate addWeaponCargo ["ACE_RPOM", 2];
		_crate addWeaponCargo ["ACE_RSHG1", 2];
		_crate addWeaponCargo ["Igla", 2];
		_crate addWeaponCargo ["MetisLauncher", 2];
		_crate addWeaponCargo ["RPG18", 2];
		_crate addWeaponCargo ["RPG7V", 2];
		_crate addWeaponCargo ["ACE_RPK74M", 2];	//ar
		_crate addWeaponCargo ["ACE_RPK74M_1P29", 2];
		_crate addWeaponCargo ["Pecheneg", 2];	//mg
		_crate addWeaponCargo ["PK", 2];
		_crate addWeaponCargo ["ACE_APS", 2];	//pistols
		_crate addWeaponCargo ["ACE_APSB", 2];
		_crate addWeaponCargo ["Makarov", 2];
		_crate addWeaponCargo ["MakarovSD", 2];
		_crate addWeaponCargo ["revolver_EP1", 2];
		_crate addWeaponCargo ["revolver_gold_EP1", 2];
		_crate addWeaponCargo ["Sa61_EP1", 2];
		_crate addWeaponCargo ["ACE_AK103", 2];	//rifles
		_crate addWeaponCargo ["ACE_AK103_1P29", 2];
		_crate addWeaponCargo ["ACE_AK103_GL", 2];
		_crate addWeaponCargo ["ACE_AK103_GL_1P29", 2];
		_crate addWeaponCargo ["ACE_AK103_GL_Kobra", 2];
		_crate addWeaponCargo ["ACE_AK103_GL_PSO", 2];
		_crate addWeaponCargo ["ACE_AK103_Kobra", 2];
		_crate addWeaponCargo ["ACE_AK103_PSO", 2];
		_crate addWeaponCargo ["ACE_AK104", 2];
		_crate addWeaponCargo ["ACE_AK104_1P29", 2];
		_crate addWeaponCargo ["ACE_AK104_Kobra", 2];
		_crate addWeaponCargo ["ACE_AK104_PSO", 2];
		_crate addWeaponCargo ["ACE_AK105", 2];
		_crate addWeaponCargo ["ACE_AK105_1P29", 2];
		_crate addWeaponCargo ["ACE_AK105_Kobra", 2];
		_crate addWeaponCargo ["ACE_AK105_PSO", 2];
		_crate addWeaponCargo ["ACE_AK74M", 2];
		_crate addWeaponCargo ["ACE_AK74M_1P29", 2];
		_crate addWeaponCargo ["ACE_AK74M_GL", 2];
		_crate addWeaponCargo ["ACE_AK74M_GL_1P29", 2];
		_crate addWeaponCargo ["ACE_AK74M_GL_Kobra", 2];
		_crate addWeaponCargo ["ACE_AK74M_GL_PSO", 2];
		_crate addWeaponCargo ["ACE_AK74M_Kobra", 2];
		_crate addWeaponCargo ["ACE_AK74M_PSO", 2];
		_crate addWeaponCargo ["ACE_AKS74_GP25", 2];
		_crate addWeaponCargo ["ACE_AKS74_UN", 2];
		_crate addWeaponCargo ["ACE_AKS74P", 2];
		_crate addWeaponCargo ["ACE_AKS74P_1P29", 2];
		_crate addWeaponCargo ["ACE_AKS74P_GL", 2];
		_crate addWeaponCargo ["ACE_AKS74P_GL_1P29", 2];
		_crate addWeaponCargo ["ACE_AKS74P_GL_Kobra", 2];
		_crate addWeaponCargo ["ACE_AKS74P_GL_PSO", 2];
		_crate addWeaponCargo ["ACE_AKS74P_Kobra", 2];
		_crate addWeaponCargo ["ACE_AKS74P_PSO", 2];
		_crate addWeaponCargo ["ACE_gr1", 2];
		_crate addWeaponCargo ["ACE_gr1sd", 2];
		_crate addWeaponCargo ["ACE_gr1sdsp", 2];
		_crate addWeaponCargo ["ACE_gr1sp", 2];
		_crate addWeaponCargo ["ACE_oc14", 2];
		_crate addWeaponCargo ["ACE_oc14gl", 2];
		_crate addWeaponCargo ["ACE_oc14glsp", 2];
		_crate addWeaponCargo ["ACE_oc14sd", 2];
		_crate addWeaponCargo ["ACE_oc14sdsp", 2];
		_crate addWeaponCargo ["ACE_oc14sp", 2];
		_crate addWeaponCargo ["ACE_Val", 2];
		_crate addWeaponCargo ["ACE_Val_Kobra", 2];
		_crate addWeaponCargo ["ACE_Val_PSO", 2];
		_crate addWeaponCargo ["AK_107_GL_kobra", 2];
		_crate addWeaponCargo ["AK_107_GL_pso", 2];
		_crate addWeaponCargo ["AK_107_kobra", 2];
		_crate addWeaponCargo ["AK_107_pso", 2];
		_crate addWeaponCargo ["AK_74", 2];
		_crate addWeaponCargo ["AK_74_GL", 2];
		_crate addWeaponCargo ["AK_74_GL_kobra", 2];
		_crate addWeaponCargo ["ACE_SVD_Bipod", 2];	//sniper
		_crate addWeaponCargo ["ksvk", 2];
		_crate addWeaponCargo ["SVD", 2];
		_crate addWeaponCargo ["SVD_des_EP1", 2];
		_crate addWeaponCargo ["SVD_NSPU_EP1", 2];
	};
	_crate addWeaponCargo ["Laserdesignator",1];
	_crate addWeaponCargo ["NVGoggles",1];
	_crate addWeaponCargo ["Binocular_Vector",1];
	_crate addWeaponCargo ["Binocular",1];
	_crate addWeaponCargo ["ACE_YardAge450",1];
	_crate addWeaponCargo ["ACE_Rangefinder_OD",1];
	_crate addWeaponCargo ["ACE_MX2A",1];
	_crate addWeaponCargo ["ACE_DAGR",1];
	_crate addWeaponCargo ["ACE_Earplugs",1];
	_crate addWeaponCargo ["ACE_GlassesBalaklava",1];
	_crate addWeaponCargo ["ACE_GlassesBalaklavaGray",1];
	_crate addWeaponCargo ["ACE_GlassesBalaklavaOlive",1];
	_crate addWeaponCargo ["ACE_GlassesBlackSun",1];
	_crate addWeaponCargo ["ACE_GlassesBlueSun",1];
	_crate addWeaponCargo ["ACE_GlassesGasMask_RU",1];
	_crate addWeaponCargo ["ACE_GlassesLHD_glasses",1];
	_crate addWeaponCargo ["ACE_GlassesSunglasses",1];
	_crate addWeaponCargo ["ACE_GlassesTactical",1];
	_crate addWeaponCargo ["ACE_HuntIR_monitor",1];
	_crate addWeaponCargo ["ACE_Kestrel4500",1];
	_crate addWeaponCargo ["ACE_KeyCuffs",1];
	_crate addWeaponCargo ["ACE_Map_Tools",1];
	_crate addWeaponCargo ["ACE_SpottingScope",1];
	_crate addWeaponCargo ["ACE_WireCutter",1];
	_crate addWeaponCargo ["ACE_Javelin_CLU",1];
	_crate addMagazineCargo ["ACE_Battery_Rangefinder",1];
	_crate addMagazineCargo ["Laserbatteries",1];
	_crate addMagazineCargo ["ACE_RMG", 10];	//launcher
	_crate addMagazineCargo ["ACE_RPG22", 10];
	_crate addMagazineCargo ["ACE_RPG27", 10];
	_crate addMagazineCargo ["ACE_RPG29", 10];
	_crate addMagazineCargo ["ACE_OG7_PGO7", 10];
	_crate addMagazineCargo ["ACE_PG7V_PGO7", 10];
	_crate addMagazineCargo ["ACE_PG7VM", 10];
	_crate addMagazineCargo ["ACE_PG7VM_PGO7", 10];
	_crate addMagazineCargo ["ACE_PG7VR_PGO7", 10];
	_crate addMagazineCargo ["ACE_TBG7V", 10];
	_crate addMagazineCargo ["ACE_TBG7V_PGO7", 10];
	_crate addMagazineCargo ["ACE_RPG7V_PGO7", 10];
	_crate addMagazineCargo ["ACE_RPOM", 10];
	_crate addMagazineCargo ["ACE_RSHG1", 10];
	_crate addMagazineCargo ["ACE_AT13TB", 10];
	_crate addMagazineCargo ["Igla", 10];
	_crate addMagazineCargo ["Strela", 10];
	_crate addMagazineCargo ["AT13", 10];
	_crate addMagazineCargo ["RPG18", 10];
	_crate addMagazineCargo ["RPG7V", 10];
	_crate addMagazineCargo ["RPG7VL", 10];
	_crate addMagazineCargo ["RPG7VR", 10];
	_crate addMagazineCargo ["OG7", 10];
	_crate addMagazineCargo ["ACE_30Rnd_545x39_T_AK", 16];	//ar
	_crate addMagazineCargo ["ACE_45Rnd_545x39_B_AK", 16];
	_crate addMagazineCargo ["ACE_75Rnd_545x39_T_RPK", 16];
	_crate addMagazineCargo ["100Rnd_762x54_PK", 16];	//mg
	_crate addMagazineCargo ["ACE_20Rnd_9x18_APS", 16];	//pistol
	_crate addMagazineCargo ["ACE_20Rnd_9x18_APSB", 16];
	_crate addMagazineCargo ["8Rnd_9x18_Makarov", 16];
	_crate addMagazineCargo ["8Rnd_9x18_MakarovSD", 16];
	_crate addMagazineCargo ["6Rnd_45ACP", 16];
	_crate addMagazineCargo ["10Rnd_B_765x17_Ball", 16];
	_crate addMagazineCargo ["20Rnd_B_765x17_Ball", 16];
	_crate addMagazineCargo ["ACE_30Rnd_762x39_SD_AK47", 16];	//rifle
	_crate addMagazineCargo ["ACE_30Rnd_762x39_T_AK47", 16];
	_crate addMagazineCargo ["ACE_40Rnd_762x39_B_AK47", 16];
	_crate addMagazineCargo ["ACE_40Rnd_762x39_T_AK47", 16];
	_crate addMagazineCargo ["ACE_75Rnd_762x39_B_AK47", 16];
	_crate addMagazineCargo ["ACE_75Rnd_762x39_SD_AK47", 16];
	_crate addMagazineCargo ["ACE_1Rnd_CS_GP25", 16];
	_crate addMagazineCargo ["ACE_1Rnd_HE_GP25P", 16];
	_crate addMagazineCargo ["ACE_SSGreen_GP25", 16];
	_crate addMagazineCargo ["ACE_SSRed_GP25", 16];
	_crate addMagazineCargo ["ACE_SSWhite_GP25", 16];
	_crate addMagazineCargo ["ACE_SSYellow_GP25", 16];
	_crate addMagazineCargo ["ACE_30Rnd_545x39_T_AK", 16];
	_crate addMagazineCargo ["ACE_45Rnd_545x39_B_AK", 16];
	_crate addMagazineCargo ["ACE_75Rnd_545x39_T_RPK", 16];
	_crate addMagazineCargo ["ACE_20Rnd_9x39_B_OC14", 16];
	_crate addMagazineCargo ["ACE_20Rnd_9x39_B_SP6_OC14", 16];
	_crate addMagazineCargo ["10Rnd_762x54_SVD", 16];	//sniper
	_crate addMagazineCargo ["ACE_10Rnd_762x54_T_SVD", 16];
	_crate addMagazineCargo ["5Rnd_127x108_KSVK", 16];
	_crate addMagazineCargo ["ACE_5Rnd_127x108_T_KSVK", 16];
	_crate addMagazineCargo ["pipebomb",20];
	_crate addMagazineCargo ["mineE",20];
};
#endif