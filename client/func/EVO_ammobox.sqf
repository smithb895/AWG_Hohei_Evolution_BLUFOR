//by psycho
#include "setup.sqf"
private ["_vec","_rank"];
_rank = rank player;
_vec = _this select 0;
clearWeaponCargo _vec;
clearMagazineCargo _vec;

#ifdef __Chernarus__
if ((E_lock == 0 or E_lock == 3) && !((getPlayerUID player) in Evo_Admins)) then {
		switch (_rank) do {
			 case "PRIVATE": {
//pistols
//_vec AddWeaponCargo ["Colt1911", 1];
_vec AddWeaponCargo ["M9", 1];
//_vec AddWeaponCargo ["M9SD", 1];
//rifles
//_vec AddWeaponCargo ["G36_C_SD_eotech", 1];
//_vec AddWeaponCargo ["G36a", 1];
_vec AddWeaponCargo ["G36C", 1];
//_vec AddWeaponCargo ["G36K", 1];
_vec AddWeaponCargo ["M4A1", 1];
_vec AddWeaponCargo ["M4A1_Aim", 1];
_vec AddWeaponCargo ["M4A1_Aim_camo", 1];
//_vec AddWeaponCargo ["M4A1_Aim_SD_camo", 1];
//_vec AddWeaponCargo ["M4A1_HWS_GL", 1];
//_vec AddWeaponCargo ["M4A1_HWS_GL_SD_Camo", 1];
//_vec AddWeaponCargo ["M4A1_RCO_GL", 1];
//_vec AddWeaponCargo ["M8_carbine", 1];
//_vec AddWeaponCargo ["M8_carbineGL", 1];
_vec AddWeaponCargo ["M8_compact", 1];
_vec AddWeaponCargo ["M8_sharpshooter", 1];
_vec AddWeaponCargo ["M16A2", 1];
//_vec AddWeaponCargo ["M16A2GL", 1];
_vec AddWeaponCargo ["M16A4", 1];
//_vec AddWeaponCargo ["M16A4_ACG", 1];
//_vec AddWeaponCargo ["M16A4_ACG_GL", 1];
//_vec AddWeaponCargo ["M16A4_GL", 1];
_vec AddWeaponCargo ["MP5A5", 1];
//_vec AddWeaponCargo ["MP5SD", 1];
//shotguns
//_vec AddWeaponCargo ["M1014", 1];
//Snipers
//_vec AddWeaponCargo ["DMR", 1];
//_vec AddWeaponCargo ["M4SPR", 1];
_vec AddWeaponCargo ["M24", 1];
_vec AddWeaponCargo ["M40A3", 1];
//_vec AddWeaponCargo ["M107", 1];
//Light Machine Guns
//_vec AddWeaponCargo ["M8_SAW", 1];
_vec AddWeaponCargo ["M240", 1];
//_vec AddWeaponCargo ["M249", 1];
//_vec AddWeaponCargo ["MG36", 1];
//_vec AddWeaponCargo ["Mk_48", 1];
//Luanchers
//_vec AddWeaponCargo ["Javelin", 1];
_vec AddWeaponCargo ["M136", 1];
//_vec AddWeaponCargo ["SMAW", 1];
//_vec AddWeaponCargo ["Stinger", 1];
			
			};
			 case "CORPORAL": {				
//pistols
_vec AddWeaponCargo ["Colt1911", 1];
_vec AddWeaponCargo ["M9", 1];
//_vec AddWeaponCargo ["M9SD", 1];
//rifles
//_vec AddWeaponCargo ["G36_C_SD_eotech", 1];
_vec AddWeaponCargo ["G36a", 1];
_vec AddWeaponCargo ["G36C", 1];
_vec AddWeaponCargo ["G36K", 1];
_vec AddWeaponCargo ["M4A1", 1];
_vec AddWeaponCargo ["M4A1_Aim", 1];
_vec AddWeaponCargo ["M4A1_Aim_camo", 1];
//_vec AddWeaponCargo ["M4A1_Aim_SD_camo", 1];
//_vec AddWeaponCargo ["M4A1_HWS_GL", 1];
//_vec AddWeaponCargo ["M4A1_HWS_GL_SD_Camo", 1];
//_vec AddWeaponCargo ["M4A1_RCO_GL", 1];
_vec AddWeaponCargo ["M8_carbine", 1];
//_vec AddWeaponCargo ["M8_carbineGL", 1];
_vec AddWeaponCargo ["M8_compact", 1];
_vec AddWeaponCargo ["M8_sharpshooter", 1];
_vec AddWeaponCargo ["M16A2", 1];
//_vec AddWeaponCargo ["M16A2GL", 1];
_vec AddWeaponCargo ["M16A4", 1];
//_vec AddWeaponCargo ["M16A4_ACG", 1];
//_vec AddWeaponCargo ["M16A4_ACG_GL", 1];
//_vec AddWeaponCargo ["M16A4_GL", 1];
_vec AddWeaponCargo ["MP5A5", 1];
//_vec AddWeaponCargo ["MP5SD", 1];
//shotguns
_vec AddWeaponCargo ["M1014", 1];
//Snipers
//_vec AddWeaponCargo ["DMR", 1];
//_vec AddWeaponCargo ["M4SPR", 1];
_vec AddWeaponCargo ["M24", 1];
_vec AddWeaponCargo ["M40A3", 1];
//_vec AddWeaponCargo ["M107", 1];
//Light Machine Guns
_vec AddWeaponCargo ["M8_SAW", 1];
_vec AddWeaponCargo ["M240", 1];
//_vec AddWeaponCargo ["M249", 1];
_vec AddWeaponCargo ["MG36", 1];
//_vec AddWeaponCargo ["Mk_48", 1];				
_vec addWeaponCargo ["SMAW",1];
_vec addWeaponCargo ["M136",1];
_vec AddWeaponCargo ["Stinger", 1];
			//launcher ammo
			_vec addMagazineCargo["SMAW_HEAA",50];
			_vec addMagazineCargo["SMAW_HEDP",50];
			_vec addMagazineCargo["STINGER",50];
			_vec addMagazineCargo["100RND_556X45_BETACMAG",50];  
			_vec addMagazineCargo["200RND_556X45_M249",50];  
			_vec addMagazineCargo["8RND_B_BENELI_74SLUG",50];  
			_vec addMagazineCargo["7RND_45ACP_1911",50];  
			};
			 case "SERGEANT": {
//pistols
_vec AddWeaponCargo ["Colt1911", 1];
_vec AddWeaponCargo ["M9", 1];
_vec AddWeaponCargo ["M9SD", 1];
//rifles
_vec AddWeaponCargo ["G36_C_SD_eotech", 1];
_vec AddWeaponCargo ["G36a", 1];
_vec AddWeaponCargo ["G36C", 1];
_vec AddWeaponCargo ["G36K", 1];
_vec AddWeaponCargo ["M4A1", 1];
_vec AddWeaponCargo ["M4A1_Aim", 1];
_vec AddWeaponCargo ["M4A1_Aim_camo", 1];
_vec AddWeaponCargo ["M4A1_Aim_SD_camo", 1];
//_vec AddWeaponCargo ["M4A1_HWS_GL", 1];
//_vec AddWeaponCargo ["M4A1_HWS_GL_SD_Camo", 1];
//_vec AddWeaponCargo ["M4A1_RCO_GL", 1];
_vec AddWeaponCargo ["M8_carbine", 1];
//_vec AddWeaponCargo ["M8_carbineGL", 1];
_vec AddWeaponCargo ["M8_compact", 1];
_vec AddWeaponCargo ["M8_sharpshooter", 1];
_vec AddWeaponCargo ["M16A2", 1];
//_vec AddWeaponCargo ["M16A2GL", 1];
_vec AddWeaponCargo ["M16A4", 1];
_vec AddWeaponCargo ["M16A4_ACG", 1];
//_vec AddWeaponCargo ["M16A4_ACG_GL", 1];
//_vec AddWeaponCargo ["M16A4_GL", 1];
_vec AddWeaponCargo ["MP5A5", 1];
_vec AddWeaponCargo ["MP5SD", 1];
//shotguns
_vec AddWeaponCargo ["M1014", 1];
//Snipers
_vec AddWeaponCargo ["DMR", 1];
//_vec AddWeaponCargo ["M4SPR", 1];
_vec AddWeaponCargo ["M24", 1];
_vec AddWeaponCargo ["M40A3", 1];
//_vec AddWeaponCargo ["M107", 1];
//Light Machine Guns
_vec AddWeaponCargo ["M8_SAW", 1];
_vec AddWeaponCargo ["M240", 1];
//_vec AddWeaponCargo ["M249", 1];
_vec AddWeaponCargo ["MG36", 1];
_vec AddWeaponCargo ["Mk_48", 1];			 
_vec addWeaponCargo ["SMAW",1];
_vec addWeaponCargo ["M136",1];
_vec addWeaponCargo ["Stinger",1];
			//suppressed ammo
			_vec addMagazineCargo["30RND_556X45_STANAGSD",50];
			_vec addMagazineCargo["30RND_556X45_G36SD",50];
			_vec addMagazineCargo["30RND_9X19_MP5SD",50];
			_vec addMagazineCargo["15RND_9X19_M9SD",50];
			//launcher ammo
			_vec addMagazineCargo["SMAW_HEAA",50];
			_vec addMagazineCargo["SMAW_HEDP",50];
			_vec addMagazineCargo["STINGER",50];
			_vec addMagazineCargo["100RND_556X45_BETACMAG",50];  
			_vec addMagazineCargo["200RND_556X45_M249",50];  
			_vec addMagazineCargo["8RND_B_BENELI_74SLUG",50];  
			_vec addMagazineCargo["7RND_45ACP_1911",50];  
			_vec addMagazineCargo["20RND_762X51_DMR",50];  
			};
			 case "LIEUTENANT": {
//pistols
_vec AddWeaponCargo ["Colt1911", 1];
_vec AddWeaponCargo ["M9", 1];
_vec AddWeaponCargo ["M9SD", 1];
//rifles
_vec AddWeaponCargo ["G36_C_SD_eotech", 1];
_vec AddWeaponCargo ["G36a", 1];
_vec AddWeaponCargo ["G36C", 1];
_vec AddWeaponCargo ["G36K", 1];
_vec AddWeaponCargo ["M4A1", 1];
_vec AddWeaponCargo ["M4A1_Aim", 1];
_vec AddWeaponCargo ["M4A1_Aim_camo", 1];
_vec AddWeaponCargo ["M4A1_Aim_SD_camo", 1];
_vec AddWeaponCargo ["M4A1_HWS_GL", 1];
_vec AddWeaponCargo ["M4A1_HWS_GL_SD_Camo", 1];
_vec AddWeaponCargo ["M4A1_RCO_GL", 1];
_vec AddWeaponCargo ["M8_carbine", 1];
_vec AddWeaponCargo ["M8_carbineGL", 1];
_vec AddWeaponCargo ["M8_compact", 1];
_vec AddWeaponCargo ["M8_sharpshooter", 1];
_vec AddWeaponCargo ["M16A2", 1];
_vec AddWeaponCargo ["M16A2GL", 1];
_vec AddWeaponCargo ["M16A4", 1];
_vec AddWeaponCargo ["M16A4_ACG", 1];
_vec AddWeaponCargo ["M16A4_ACG_GL", 1];
_vec AddWeaponCargo ["M16A4_GL", 1];
_vec AddWeaponCargo ["MP5A5", 1];
_vec AddWeaponCargo ["MP5SD", 1];
//shotguns
_vec AddWeaponCargo ["M1014", 1];
//Snipers
_vec AddWeaponCargo ["DMR", 1];
_vec AddWeaponCargo ["M4SPR", 1];
_vec AddWeaponCargo ["M24", 1];
_vec AddWeaponCargo ["M40A3", 1];
//_vec AddWeaponCargo ["M107", 1];
//Light Machine Guns
_vec AddWeaponCargo ["M8_SAW", 1];
_vec AddWeaponCargo ["M240", 1];
_vec AddWeaponCargo ["M249", 1];
_vec AddWeaponCargo ["MG36", 1];
_vec AddWeaponCargo ["Mk_48", 1];
_vec addWeaponCargo ["SMAW",1];
_vec addWeaponCargo ["M136",1];
_vec addWeaponCargo ["Stinger",1];
_vec addWeaponCargo ["JAVELIN",1];	
			//under-barrel grenade launchers
			_vec addMagazineCargo["1RND_HE_M203",50];
			_vec addMagazineCargo["FLAREWHITE_M203",50];
			_vec addMagazineCargo["FLAREGREEN_M203",50];
			_vec addMagazineCargo["FLARERED_M203",50];
			_vec addMagazineCargo["FLAREYELLOW_M203",50];
			_vec addMagazineCargo["1RND_SMOKE_M203",50];
			_vec addMagazineCargo["1RND_SMOKEGREEN_M203",50];
			_vec addMagazineCargo["1RND_SMOKERED_M203",50];
			_vec addMagazineCargo["1RND_SMOKEYELLOW_M203",50];	
			//suppressed ammo
			_vec addMagazineCargo["30RND_556X45_STANAGSD",50];
			_vec addMagazineCargo["15RND_9X19_M9SD",50];
			_vec addMagazineCargo["30RND_556X45_G36SD",50];	 
			_vec addMagazineCargo["30RND_9X19_MP5SD",50];
			//launcher ammo
			_vec addMagazineCargo["SMAW_HEAA",50];
			_vec addMagazineCargo["SMAW_HEDP",50];
			_vec addMagazineCargo["JAVELIN",50];
			_vec addMagazineCargo["STINGER",50];
			_vec addMagazineCargo["100RND_556X45_BETACMAG",50];  
			_vec addMagazineCargo["200RND_556X45_M249",50];  
			_vec addMagazineCargo["8RND_B_BENELI_74SLUG",50];  
			_vec addMagazineCargo["7RND_45ACP_1911",50];  
			_vec addMagazineCargo["20RND_762X51_DMR",50];  
			};
			 case "CAPTAIN": {
//pistols
_vec AddWeaponCargo ["Colt1911", 1];
_vec AddWeaponCargo ["M9", 1];
_vec AddWeaponCargo ["M9SD", 1];
//rifles
_vec AddWeaponCargo ["G36_C_SD_eotech", 1];
_vec AddWeaponCargo ["G36a", 1];
_vec AddWeaponCargo ["G36C", 1];
_vec AddWeaponCargo ["G36K", 1];
_vec AddWeaponCargo ["M4A1", 1];
_vec AddWeaponCargo ["M4A1_Aim", 1];
_vec AddWeaponCargo ["M4A1_Aim_camo", 1];
_vec AddWeaponCargo ["M4A1_Aim_SD_camo", 1];
_vec AddWeaponCargo ["M4A1_HWS_GL", 1];
_vec AddWeaponCargo ["M4A1_HWS_GL_SD_Camo", 1];
_vec AddWeaponCargo ["M4A1_RCO_GL", 1];
_vec AddWeaponCargo ["M8_carbine", 1];
_vec AddWeaponCargo ["M8_carbineGL", 1];
_vec AddWeaponCargo ["M8_compact", 1];
_vec AddWeaponCargo ["M8_sharpshooter", 1];
_vec AddWeaponCargo ["M16A2", 1];
_vec AddWeaponCargo ["M16A2GL", 1];
_vec AddWeaponCargo ["M16A4", 1];
_vec AddWeaponCargo ["M16A4_ACG", 1];
_vec AddWeaponCargo ["M16A4_ACG_GL", 1];
_vec AddWeaponCargo ["M16A4_GL", 1];
_vec AddWeaponCargo ["MP5A5", 1];
_vec AddWeaponCargo ["MP5SD", 1];
//shotguns
_vec AddWeaponCargo ["M1014", 1];
//Snipers
_vec AddWeaponCargo ["DMR", 1];
_vec AddWeaponCargo ["M4SPR", 1];
_vec AddWeaponCargo ["M24", 1];
_vec AddWeaponCargo ["M40A3", 1];
_vec AddWeaponCargo ["M107", 1];
//Light Machine Guns
_vec AddWeaponCargo ["M8_SAW", 1];
_vec AddWeaponCargo ["M240", 1];
_vec AddWeaponCargo ["M249", 1];
_vec AddWeaponCargo ["MG36", 1];
_vec AddWeaponCargo ["Mk_48", 1];			 
_vec addWeaponCargo ["SMAW",1];
_vec addWeaponCargo ["M136",1];
_vec addWeaponCargo ["Stinger",1];
_vec addWeaponCargo ["JAVELIN",1];
			//under-barrel grenade launchers
			_vec addMagazineCargo["1RND_HE_M203",50];
			_vec addMagazineCargo["FLAREWHITE_M203",50];
			_vec addMagazineCargo["FLAREGREEN_M203",50];
			_vec addMagazineCargo["FLARERED_M203",50];
			_vec addMagazineCargo["FLAREYELLOW_M203",50];
			_vec addMagazineCargo["1RND_SMOKE_M203",50];
			_vec addMagazineCargo["1RND_SMOKEGREEN_M203",50];
			_vec addMagazineCargo["1RND_SMOKERED_M203",50];
			_vec addMagazineCargo["1RND_SMOKEYELLOW_M203",50];
			//suppressed ammo
			_vec addMagazineCargo["30RND_556X45_STANAGSD",50];
			_vec addMagazineCargo["30RND_556X45_G36SD",50];
			_vec addMagazineCargo["30RND_9X19_MP5SD",50];
			_vec addMagazineCargo["15RND_9X19_M9SD",50];
			//launcher ammo
			_vec addMagazineCargo["SMAW_HEAA",50];
			_vec addMagazineCargo["SMAW_HEDP",50];
			_vec addMagazineCargo["JAVELIN",50];
			_vec addMagazineCargo["STINGER",50];
			_vec addMagazineCargo["100RND_556X45_BETACMAG",50];  
			_vec addMagazineCargo["200RND_556X45_M249",50];  
			_vec addMagazineCargo["8RND_B_BENELI_74SLUG",50];  
			_vec addMagazineCargo["7RND_45ACP_1911",50];  
			_vec addMagazineCargo["20RND_762X51_DMR",50];  
			_vec addMagazineCargo["10RND_127X99_M107",50];  
			};
			 case "MAJOR": {
//pistols
_vec AddWeaponCargo ["Colt1911", 1];
_vec AddWeaponCargo ["M9", 1];
_vec AddWeaponCargo ["M9SD", 1];
//rifles
_vec AddWeaponCargo ["G36_C_SD_eotech", 1];
_vec AddWeaponCargo ["G36a", 1];
_vec AddWeaponCargo ["G36C", 1];
_vec AddWeaponCargo ["G36K", 1];
_vec AddWeaponCargo ["M4A1", 1];
_vec AddWeaponCargo ["M4A1_Aim", 1];
_vec AddWeaponCargo ["M4A1_Aim_camo", 1];
_vec AddWeaponCargo ["M4A1_Aim_SD_camo", 1];
_vec AddWeaponCargo ["M4A1_HWS_GL", 1];
_vec AddWeaponCargo ["M4A1_HWS_GL_SD_Camo", 1];
_vec AddWeaponCargo ["M4A1_RCO_GL", 1];
_vec AddWeaponCargo ["M8_carbine", 1];
_vec AddWeaponCargo ["M8_carbineGL", 1];
_vec AddWeaponCargo ["M8_compact", 1];
_vec AddWeaponCargo ["M8_sharpshooter", 1];
_vec AddWeaponCargo ["M16A2", 1];
_vec AddWeaponCargo ["M16A2GL", 1];
_vec AddWeaponCargo ["M16A4", 1];
_vec AddWeaponCargo ["M16A4_ACG", 1];
_vec AddWeaponCargo ["M16A4_ACG_GL", 1];
_vec AddWeaponCargo ["M16A4_GL", 1];
_vec AddWeaponCargo ["MP5A5", 1];
_vec AddWeaponCargo ["MP5SD", 1];
//shotguns
_vec AddWeaponCargo ["M1014", 1];
//Snipers
_vec AddWeaponCargo ["DMR", 1];
_vec AddWeaponCargo ["M4SPR", 1];
_vec AddWeaponCargo ["M24", 1];
_vec AddWeaponCargo ["M40A3", 1];
_vec AddWeaponCargo ["M107", 1];
//Light Machine Guns
_vec AddWeaponCargo ["M8_SAW", 1];
_vec AddWeaponCargo ["M240", 1];
_vec AddWeaponCargo ["M249", 1];
_vec AddWeaponCargo ["MG36", 1];
_vec AddWeaponCargo ["Mk_48", 1];
_vec addWeaponCargo ["SMAW",1];
_vec addWeaponCargo ["M136",1];
_vec addWeaponCargo ["Stinger",1];
_vec addWeaponCargo ["JAVELIN",1];		
			//under-barrel grenade launchers
			_vec addMagazineCargo["1RND_HE_M203",50];
			_vec addMagazineCargo["FLAREWHITE_M203",50];
			_vec addMagazineCargo["FLAREGREEN_M203",50];
			_vec addMagazineCargo["FLARERED_M203",50];
			_vec addMagazineCargo["FLAREYELLOW_M203",50];
			_vec addMagazineCargo["1RND_SMOKE_M203",50];
			_vec addMagazineCargo["1RND_SMOKEGREEN_M203",50];
			_vec addMagazineCargo["1RND_SMOKERED_M203",50];
			_vec addMagazineCargo["1RND_SMOKEYELLOW_M203",50];	
			//suppressed ammo
			_vec addMagazineCargo["30RND_556X45_STANAGSD",50];
			_vec addMagazineCargo["30RND_556X45_G36SD",50]; 
			_vec addMagazineCargo["30RND_9X19_MP5SD",50];
			_vec addMagazineCargo["15RND_9X19_M9SD",50];
			//launcher ammo
			_vec addMagazineCargo["SMAW_HEAA",50];
			_vec addMagazineCargo["SMAW_HEDP",50];
			_vec addMagazineCargo["JAVELIN",50];
			_vec addMagazineCargo["STINGER",50];
			_vec addMagazineCargo["100RND_556X45_BETACMAG",50];  
			_vec addMagazineCargo["200RND_556X45_M249",50];  
			_vec addMagazineCargo["8RND_B_BENELI_74SLUG",50];  
			_vec addMagazineCargo["7RND_45ACP_1911",50];  
			_vec addMagazineCargo["20RND_762X51_DMR",50];  
			_vec addMagazineCargo["10RND_127X99_M107",50];  
			};
			 case "COLONEL": {
//pistols
_vec AddWeaponCargo ["Colt1911", 1];
_vec AddWeaponCargo ["M9", 1];
_vec AddWeaponCargo ["M9SD", 1];
//rifles
_vec AddWeaponCargo ["G36_C_SD_eotech", 1];
_vec AddWeaponCargo ["G36a", 1];
_vec AddWeaponCargo ["G36C", 1];
_vec AddWeaponCargo ["G36K", 1];
_vec AddWeaponCargo ["M4A1", 1];
_vec AddWeaponCargo ["M4A1_Aim", 1];
_vec AddWeaponCargo ["M4A1_Aim_camo", 1];
_vec AddWeaponCargo ["M4A1_Aim_SD_camo", 1];
_vec AddWeaponCargo ["M4A1_HWS_GL", 1];
_vec AddWeaponCargo ["M4A1_HWS_GL_SD_Camo", 1];
_vec AddWeaponCargo ["M4A1_RCO_GL", 1];
_vec AddWeaponCargo ["M8_carbine", 1];
_vec AddWeaponCargo ["M8_carbineGL", 1];
_vec AddWeaponCargo ["M8_compact", 1];
_vec AddWeaponCargo ["M8_sharpshooter", 1];
_vec AddWeaponCargo ["M16A2", 1];
_vec AddWeaponCargo ["M16A2GL", 1];
_vec AddWeaponCargo ["M16A4", 1];
_vec AddWeaponCargo ["M16A4_ACG", 1];
_vec AddWeaponCargo ["M16A4_ACG_GL", 1];
_vec AddWeaponCargo ["M16A4_GL", 1];
_vec AddWeaponCargo ["MP5A5", 1];
_vec AddWeaponCargo ["MP5SD", 1];
//shotguns
_vec AddWeaponCargo ["M1014", 1];
//Snipers
_vec AddWeaponCargo ["DMR", 1];
_vec AddWeaponCargo ["M4SPR", 1];
_vec AddWeaponCargo ["M24", 1];
_vec AddWeaponCargo ["M40A3", 1];
_vec AddWeaponCargo ["M107", 1];
//Light Machine Guns
_vec AddWeaponCargo ["M8_SAW", 1];
_vec AddWeaponCargo ["M240", 1];
_vec AddWeaponCargo ["M249", 1];
_vec AddWeaponCargo ["MG36", 1];
_vec AddWeaponCargo ["Mk_48", 1];
_vec addWeaponCargo ["SMAW",1];
_vec addWeaponCargo ["M136",1];
_vec addWeaponCargo ["Stinger",1];
_vec addWeaponCargo ["JAVELIN",1];		
			//under-barrel grenade launchers
			_vec addMagazineCargo["1RND_HE_M203",50];
			_vec addMagazineCargo["FLAREWHITE_M203",50];
			_vec addMagazineCargo["FLAREGREEN_M203",50];
			_vec addMagazineCargo["FLARERED_M203",50];
			_vec addMagazineCargo["FLAREYELLOW_M203",50];
			_vec addMagazineCargo["1RND_SMOKE_M203",50];
			_vec addMagazineCargo["1RND_SMOKEGREEN_M203",50];
			_vec addMagazineCargo["1RND_SMOKERED_M203",50];
			_vec addMagazineCargo["1RND_SMOKEYELLOW_M203",50];	
			//suppressed ammo
			_vec addMagazineCargo["30RND_556X45_STANAGSD",50];
			_vec addMagazineCargo["30RND_556X45_G36SD",50]; 
			_vec addMagazineCargo["30RND_9X19_MP5SD",50];
			_vec addMagazineCargo["15RND_9X19_M9SD",50];
			//launcher ammo
			_vec addMagazineCargo["SMAW_HEAA",50];
			_vec addMagazineCargo["SMAW_HEDP",50];
			_vec addMagazineCargo["JAVELIN",50];
			_vec addMagazineCargo["STINGER",50];
			_vec addMagazineCargo["100RND_556X45_BETACMAG",50];  
			_vec addMagazineCargo["200RND_556X45_M249",50];  
			_vec addMagazineCargo["8RND_B_BENELI_74SLUG",50];  
			_vec addMagazineCargo["7RND_45ACP_1911",50];  
			_vec addMagazineCargo["20RND_762X51_DMR",50];  
			_vec addMagazineCargo["10RND_127X99_M107",50];  
			};
		};
	} else {	
//pistols
_vec AddWeaponCargo ["Colt1911", 1];
_vec AddWeaponCargo ["M9", 1];
_vec AddWeaponCargo ["M9SD", 1];
//rifles
_vec AddWeaponCargo ["G36_C_SD_eotech", 1];
_vec AddWeaponCargo ["G36a", 1];
_vec AddWeaponCargo ["G36C", 1];
_vec AddWeaponCargo ["G36K", 1];
_vec AddWeaponCargo ["M4A1", 1];
_vec AddWeaponCargo ["M4A1_Aim", 1];
_vec AddWeaponCargo ["M4A1_Aim_camo", 1];
_vec AddWeaponCargo ["M4A1_Aim_SD_camo", 1];
_vec AddWeaponCargo ["M4A1_HWS_GL", 1];
_vec AddWeaponCargo ["M4A1_HWS_GL_SD_Camo", 1];
_vec AddWeaponCargo ["M4A1_RCO_GL", 1];
_vec AddWeaponCargo ["M8_carbine", 1];
_vec AddWeaponCargo ["M8_carbineGL", 1];
_vec AddWeaponCargo ["M8_compact", 1];
_vec AddWeaponCargo ["M8_sharpshooter", 1];
_vec AddWeaponCargo ["M16A2", 1];
_vec AddWeaponCargo ["M16A2GL", 1];
_vec AddWeaponCargo ["M16A4", 1];
_vec AddWeaponCargo ["M16A4_ACG", 1];
_vec AddWeaponCargo ["M16A4_ACG_GL", 1];
_vec AddWeaponCargo ["M16A4_GL", 1];
_vec AddWeaponCargo ["MP5A5", 1];
_vec AddWeaponCargo ["MP5SD", 1];
//shotguns
_vec AddWeaponCargo ["M1014", 1];
//Snipers
_vec AddWeaponCargo ["DMR", 1];
_vec AddWeaponCargo ["M4SPR", 1];
_vec AddWeaponCargo ["M24", 1];
_vec AddWeaponCargo ["M40A3", 1];
_vec AddWeaponCargo ["M107", 1];
//Light Machine Guns
_vec AddWeaponCargo ["M8_SAW", 1];
_vec AddWeaponCargo ["M240", 1];
_vec AddWeaponCargo ["M249", 1];
_vec AddWeaponCargo ["MG36", 1];
_vec AddWeaponCargo ["Mk_48", 1];
_vec addWeaponCargo ["SMAW",1];
_vec addWeaponCargo ["M136",1];
_vec addWeaponCargo ["Stinger",1];
_vec addWeaponCargo ["JAVELIN",1];
			//under-barrel grenade launchers
			_vec addMagazineCargo["1RND_HE_M203",50];
			_vec addMagazineCargo["FLAREWHITE_M203",50];
			_vec addMagazineCargo["FLAREGREEN_M203",50];
			_vec addMagazineCargo["FLARERED_M203",50];
			//_vec addMagazineCargo["FLAREYELLOW_M203",50];
			_vec addMagazineCargo["1RND_SMOKE_M203",50];
			_vec addMagazineCargo["1RND_SMOKEGREEN_M203",50];
			_vec addMagazineCargo["1RND_SMOKERED_M203",50];
			//_vec addMagazineCargo["1RND_SMOKEYELLOW_M203",50];
			//suppressed ammo
			_vec addMagazineCargo["30RND_556X45_STANAGSD",50];
			_vec addMagazineCargo["30RND_556X45_G36SD",50];
			_vec addMagazineCargo["30RND_9X19_MP5SD",50];
			_vec addMagazineCargo["15RND_9X19_M9SD",50];
			//launcher ammo
			_vec addMagazineCargo["SMAW_HEAA",50];
			_vec addMagazineCargo["SMAW_HEDP",50];
			_vec addMagazineCargo["JAVELIN",50];
			_vec addMagazineCargo["STINGER",50];
			_vec addMagazineCargo["100RND_556X45_BETACMAG",50];  
			_vec addMagazineCargo["200RND_556X45_M249",50];  
			_vec addMagazineCargo["8RND_B_BENELI_74SLUG",50];  
			_vec addMagazineCargo["7RND_45ACP_1911",50];  
			_vec addMagazineCargo["20RND_762X51_DMR",50];  
			_vec addMagazineCargo["10RND_127X99_M107",50];  
	};
			_vec addMagazineCargo["15RND_9X19_M9",50];
			_vec addMagazineCargo["5RND_762X51_M24",50]; 
			_vec addMagazineCargo["M136",50]; 
			_vec addMagazineCargo["30RND_556X45_STANAG",50];
			_vec addMagazineCargo["30RND_556X45_G36",50]; 
			_vec addMagazineCargo["20RND_556X45_STANAG",50];
			_vec addMagazineCargo["100RND_762X51_M240",50];
			_vec addMagazineCargo["30RND_9X19_MP5",50];
			_vec addMagazineCargo["pipebomb",50];
			_vec addWeaponCargo["Laserdesignator",50];
			_vec addMagazineCargo["Laserbatteries",50];
			_vec addWeaponCargo["Binocular",50];
			_vec addWeaponCargo["ItemMap",50];
			_vec addWeaponCargo["ItemGPS",50];
			_vec addWeaponCargo["NVGoggles",50];
			_vec addMagazineCargo["SmokeShell",50];
			//_vec addMagazineCargo["SmokeShellYellow",50];
			_vec addMagazineCargo["SmokeShellRed",50];
			_vec addMagazineCargo["SmokeShellGreen",50];
			//_vec addMagazineCargo["SmokeShellPurple",50];
			//_vec addMagazineCargo["SmokeShellBlue",50];
			//_vec addMagazineCargo["SmokeShellOrange",50];
#endif