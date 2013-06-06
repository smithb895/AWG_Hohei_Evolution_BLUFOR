//by psycho
#include "setup.sqf"
EVO_SupList = [];
EVO_RecList = [];
EVO_SM_List = [[]];
_ranknum = if (E_lock == 1) then {6} else {rankID player};

switch (_ranknum) do {
	case (0) : {
		#ifdef __Takistan__
		if (EVO_own_side == "WEST") then {
		EVO_RecList = [];
		} else {
		};
		#else
		if (EVO_own_side == "WEST") then {
		EVO_RecList = [];
		} else {
		};
		#endif
		EVO_SupList = [[localize "STR_M04t104",localize "STR_M04t105",10,5,10,"pictures\ammo.paa",1]];
		EVO_SM_List = [["none","higher rank required","pictures\stop.paa",0,0]];
	};
	case (1) : {
		#ifdef __Takistan__
		if (EVO_own_side == "WEST") then {
			EVO_RecList = [];
		} else {
			EVO_RecList = [];
		};
		#else
		if (EVO_own_side == "WEST") then {
			EVO_RecList = [];
		} else {
			EVO_RecList = [];
		};
		#endif
		EVO_SupList = [[localize "STR_M04t104",localize "STR_M04t105",10,5,10,"pictures\ammo.paa",1]];
		EVO_SM_List = [[localize "STR_M04t16_0",localize "STR_M04t17_1","pictures\sabotage.paa",10,1]];
	};
	case (2) : {
		#ifdef __Takistan__
		if (EVO_own_side == "WEST") then {
			EVO_RecList = [["US_Soldier_Crew_EP1", ["US_Soldier_Crew_EP1"] call EVO_GetGuns],
			["US_Soldier_Medic_EP1", ["US_Soldier_Medic_EP1"] call EVO_GetGuns],
			["US_Soldier_EP1", ["US_Soldier_EP1"] call EVO_GetGuns],
			["US_Soldier_GL_EP1", ["US_Soldier_GL_EP1"] call EVO_GetGuns],
			["US_Soldier_AT_EP1", ["US_Soldier_AT_EP1"] call EVO_GetGuns]];
		} else {
			EVO_RecList = [["TK_Soldier_Crew_EP1", ["TK_Soldier_Crew_EP1"] call EVO_GetGuns],
			["TK_Soldier_Medic_EP1", ["TK_Soldier_Medic_EP1"] call EVO_GetGuns],
			["TK_Soldier_EP1", ["TK_Soldier_EP1"] call EVO_GetGuns],
			["TK_Soldier_GL_EP1", ["TK_Soldier_GL_EP1"] call EVO_GetGuns],
			["TK_Soldier_AT_EP1", ["TK_Soldier_AT_EP1"] call EVO_GetGuns]];
		};
		#else
		if (EVO_own_side == "WEST") then {
			EVO_RecList = [["USMC_Soldier_Crew", ["USMC_Soldier_Crew"] call EVO_GetGuns],
			["USMC_Soldier_Medic", ["USMC_Soldier_Medic"] call EVO_GetGuns],
			["USMC_Soldier", ["USMC_Soldier"] call EVO_GetGuns],
			["USMC_Soldier_GL", ["USMC_Soldier_GL"] call EVO_GetGuns],
			["USMC_Soldier_AT", ["USMC_Soldier_AT"] call EVO_GetGuns]];
		} else {
			EVO_RecList = [["RU_Soldier_Crew", ["RU_Soldier_Crew"] call EVO_GetGuns],
			["RU_Soldier_Medic", ["RU_Soldier_Medic"] call EVO_GetGuns],
			["RU_Soldier", ["RU_Soldier"] call EVO_GetGuns],
			["RU_Soldier_GL", ["RU_Soldier_GL"] call EVO_GetGuns],
			["RU_Soldier_AT", ["RU_Soldier_AT"] call EVO_GetGuns]];
		};
		#endif
		EVO_SupList = [[localize "STR_M04t104",localize "STR_M04t105",10,5,10,"pictures\ammo.paa",1],
			[localize "STR_M04t106",localize "STR_M04t107",10,20,10,"pictures\airstrike.paa",2],		
			["HMMWV SOV","HMMWV SOV",10,20,10,"pictures\hmvee.paa",8],
			[localize "STR_M04t108",localize "STR_M04t109",50,40,20,"pictures\arty.paa",3]
		];
		EVO_SM_List = [[localize "STR_M04t16_0",localize "STR_M04t17_1","pictures\sabotage.paa",10,1],
		[localize "STR_M04t6_1",localize "STR_M04t7_1","pictures\offensive.paa",10,3]];
	};
	case (3) : {
		#ifdef __Takistan__
		if (EVO_own_side == "WEST") then {
			EVO_RecList = [["US_Soldier_Crew_EP1", ["US_Soldier_Crew_EP1"] call EVO_GetGuns],
			["US_Soldier_Medic_EP1", ["US_Soldier_Medic_EP1"] call EVO_GetGuns],
			["US_Soldier_EP1", ["US_Soldier_EP1"] call EVO_GetGuns],
			["US_Soldier_GL_EP1", ["US_Soldier_GL_EP1"] call EVO_GetGuns],
			["US_Soldier_AT_EP1", ["US_Soldier_AT_EP1"] call EVO_GetGuns],
			["US_Soldier_Sniper_EP1", ["US_Soldier_Sniper_EP1"] call EVO_GetGuns],
			["US_Soldier_TL_EP1", ["US_Soldier_TL_EP1"] call EVO_GetGuns],
			["US_Soldier_MG_EP1", ["US_Soldier_MG_EP1"] call EVO_GetGuns]];
		} else {
			EVO_RecList = [["TK_Soldier_Crew_EP1", ["TK_Soldier_Crew_EP1"] call EVO_GetGuns],
			["TK_Soldier_Medic_EP1", ["TK_Soldier_Medic_EP1"] call EVO_GetGuns],
			["TK_Soldier_EP1", ["TK_Soldier_EP1"] call EVO_GetGuns],
			["TK_Soldier_GL_EP1", ["TK_Soldier_GL_EP1"] call EVO_GetGuns],
			["TK_Soldier_AT_EP1", ["TK_Soldier_AT_EP1"] call EVO_GetGuns],
			["TK_Soldier_Sniper_EP1", ["TK_Soldier_Sniper_EP1"] call EVO_GetGuns],
			["TK_Soldier_SL_EP1", ["TK_Soldier_SL_EP1"] call EVO_GetGuns],
			["TK_Soldier_MG_EP1", ["TK_Soldier_MG_EP1"] call EVO_GetGuns]];
		};
		#else
		if (EVO_own_side == "WEST") then {
			EVO_RecList = [["USMC_Soldier_Crew", ["USMC_Soldier_Crew"] call EVO_GetGuns],
			["USMC_Soldier_Medic", ["USMC_Soldier_Medic"] call EVO_GetGuns],
			["USMC_Soldier", ["USMC_Soldier"] call EVO_GetGuns],
			["USMC_Soldier_GL", ["USMC_Soldier_GL"] call EVO_GetGuns],
			["USMC_Soldier_AT", ["USMC_Soldier_AT"] call EVO_GetGuns],
			["USMC_SoldierS_Sniper", ["USMC_SoldierS_Sniper"] call EVO_GetGuns],
			["USMC_Soldier_TL", ["USMC_Soldier_TL"] call EVO_GetGuns],
			["USMC_Soldier_MG", ["USMC_Soldier_MG"] call EVO_GetGuns]];
		} else {
			EVO_RecList = [["RU_Soldier_Crew", ["RU_Soldier_Crew"] call EVO_GetGuns],
			["RU_Soldier_Medic", ["RU_Soldier_Medic"] call EVO_GetGuns],
			["RU_Soldier", ["RU_Soldier"] call EVO_GetGuns],
			["RU_Soldier_GL", ["RU_Soldier_GL"] call EVO_GetGuns],
			["RU_Soldier_AT", ["RU_Soldier_AT"] call EVO_GetGuns],
			["RU_Soldier_Sniper", ["RU_Soldier_Sniper"] call EVO_GetGuns],
			["RU_Soldier_SL", ["RU_Soldier_SL"] call EVO_GetGuns],
			["RU_Soldier_MG", ["RU_Soldier_MG"] call EVO_GetGuns]];
		};
		#endif
		EVO_SupList = [[localize "STR_M04t104",localize "STR_M04t105",10,5,10,"pictures\ammo.paa",1],
			[localize "STR_M04t106",localize "STR_M04t107",10,20,10,"pictures\airstrike.paa",2],		
			["HMMWV SOV","HMMWV SOV",10,20,10,"pictures\hmvee.paa",8],
			[localize "STR_M04t108",localize "STR_M04t109",50,40,20,"pictures\arty.paa",3],
			[localize "STR_M04t110",localize "STR_M04t111",50,70,20,"pictures\bomb.paa",4]
		];
		EVO_SM_List = [[localize "STR_M04t16_0",localize "STR_M04t17_1","pictures\sabotage.paa",10,1],
		[localize "STR_M04t6_1",localize "STR_M04t7_1","pictures\offensive.paa",10,3],
		[localize "STR_M04t20",localize "STR_M04t21_0","pictures\sabotage.paa",15,4]];
	};
	case (4) : {
		#ifdef __Takistan__
		if (EVO_own_side == "WEST") then {
			EVO_RecList = [["US_Soldier_Crew_EP1", ["US_Soldier_Crew_EP1"] call EVO_GetGuns],
			["US_Soldier_Medic_EP1", ["US_Soldier_Medic_EP1"] call EVO_GetGuns],
			["US_Soldier_EP1", ["US_Soldier_EP1"] call EVO_GetGuns],
			["US_Soldier_GL_EP1", ["US_Soldier_GL_EP1"] call EVO_GetGuns],
			["US_Soldier_AT_EP1", ["US_Soldier_AT_EP1"] call EVO_GetGuns],
			["US_Soldier_Sniper_EP1", ["US_Soldier_Sniper_EP1"] call EVO_GetGuns],
			["US_Soldier_TL_EP1", ["US_Soldier_TL_EP1"] call EVO_GetGuns],
			["US_Soldier_MG_EP1", ["US_Soldier_MG_EP1"] call EVO_GetGuns],
			["US_Soldier_LAT_EP1", ["US_Soldier_LAT_EP1"] call EVO_GetGuns],
			["US_Soldier_HAT_EP1", ["US_Soldier_HAT_EP1"] call EVO_GetGuns],
			["US_Soldier_AA_EP1", ["US_Soldier_AA_EP1"] call EVO_GetGuns]];
		} else {
			EVO_RecList = [["TK_Soldier_Crew_EP1", ["TK_Soldier_Crew_EP1"] call EVO_GetGuns],
			["TK_Soldier_Medic_EP1", ["TK_Soldier_Medic_EP1"] call EVO_GetGuns],
			["TK_Soldier_EP1", ["TK_Soldier_EP1"] call EVO_GetGuns],
			["TK_Soldier_GL_EP1", ["TK_Soldier_GL_EP1"] call EVO_GetGuns],
			["TK_Soldier_AT_EP1", ["TK_Soldier_AT_EP1"] call EVO_GetGuns],
			["TK_Soldier_Sniper_EP1", ["TK_Soldier_Sniper_EP1"] call EVO_GetGuns],
			["TK_Soldier_SL_EP1", ["TK_Soldier_SL_EP1"] call EVO_GetGuns],
			["TK_Soldier_MG_EP1", ["TK_Soldier_MG_EP1"] call EVO_GetGuns],
			["TK_Soldier_LAT_EP1", ["TK_Soldier_LAT_EP1"] call EVO_GetGuns],
			["TK_Soldier_HAT_EP1", ["TK_Soldier_HAT_EP1"] call EVO_GetGuns],
			["TK_Soldier_AA_EP1", ["TK_Soldier_AA_EP1"] call EVO_GetGuns]];
		};
		#else
		if (EVO_own_side == "WEST") then {
			EVO_RecList = [["USMC_Soldier_Crew", ["USMC_Soldier_Crew"] call EVO_GetGuns],
			["USMC_Soldier_Medic", ["USMC_Soldier_Medic"] call EVO_GetGuns],
			["USMC_Soldier", ["USMC_Soldier"] call EVO_GetGuns],
			["USMC_Soldier_GL", ["USMC_Soldier_GL"] call EVO_GetGuns],
			["USMC_Soldier_AT", ["USMC_Soldier_AT"] call EVO_GetGuns],
			["USMC_SoldierS_Sniper", ["USMC_SoldierS_Sniper"] call EVO_GetGuns],
			["USMC_Soldier_TL", ["USMC_Soldier_TL"] call EVO_GetGuns],
			["USMC_Soldier_MG", ["USMC_Soldier_MG"] call EVO_GetGuns],
			["USMC_Soldier_LAT", ["USMC_Soldier_LAT"] call EVO_GetGuns],
			["USMC_Soldier_HAT", ["USMC_Soldier_HAT"] call EVO_GetGuns],
			["USMC_Soldier_AA", ["USMC_Soldier_AA"] call EVO_GetGuns]];
		} else {
			EVO_RecList = [["RU_Soldier_Crew", ["RU_Soldier_Crew"] call EVO_GetGuns],
			["RU_Soldier_Medic", ["RU_Soldier_Medic"] call EVO_GetGuns],
			["RU_Soldier", ["RU_Soldier"] call EVO_GetGuns],
			["RU_Soldier_GL", ["RU_Soldier_GL"] call EVO_GetGuns],
			["RU_Soldier_AT", ["RU_Soldier_AT"] call EVO_GetGuns],
			["RU_Soldier_Sniper", ["RU_Soldier_Sniper"] call EVO_GetGuns],
			["RU_Soldier_SL", ["RU_Soldier_SL"] call EVO_GetGuns],
			["RU_Soldier_MG", ["RU_Soldier_MG"] call EVO_GetGuns],
			["RU_Soldier_LAT", ["RU_Soldier_LAT"] call EVO_GetGuns],
			["RU_Soldier_HAT", ["RU_Soldier_HAT"] call EVO_GetGuns],
			["RU_Soldier_AA", ["RU_Soldier_AA"] call EVO_GetGuns]];
		};
		#endif
		EVO_SupList = [[localize "STR_M04t104",localize "STR_M04t105",10,5,10,"pictures\ammo.paa",1],
			[localize "STR_M04t106",localize "STR_M04t107",10,20,10,"pictures\airstrike.paa",2],		
			["HMMWV SOV","HMMWV SOV",10,20,10,"pictures\hmvee.paa",8],
			[localize "STR_M04t108",localize "STR_M04t109",50,40,20,"pictures\arty.paa",3],
			[localize "STR_M04t110",localize "STR_M04t111",50,70,20,"pictures\bomb.paa",4],
			[localize "STR_M04t112",localize "STR_M04t113",100,80,30,"pictures\arty.paa",5]
		];
		EVO_SM_List = [[localize "STR_M04t16_0",localize "STR_M04t17_1","pictures\sabotage.paa",10,1],
		[localize "STR_M04t6_1",localize "STR_M04t7_1","pictures\offensive.paa",10,3],
		[localize "STR_M04t20",localize "STR_M04t21_0","pictures\sabotage.paa",15,4],
		[localize "STR_M04t24",localize "STR_M04t25_0","pictures\defend.paa",15,6]];
	};
	case (5) : {
		#ifdef __Takistan__
		if (EVO_own_side == "WEST") then {
			EVO_RecList = [["US_Soldier_Crew_EP1", ["US_Soldier_Crew_EP1"] call EVO_GetGuns],
			["US_Delta_Force_Medic_EP1", ["US_Delta_Force_Medic_EP1"] call EVO_GetGuns],
			["US_Soldier_EP1", ["US_Soldier_EP1"] call EVO_GetGuns],
			["US_Soldier_GL_EP1", ["US_Soldier_GL_EP1"] call EVO_GetGuns],
			["US_Soldier_AT_EP1", ["US_Soldier_AT_EP1"] call EVO_GetGuns],
			["US_Soldier_Sniper_EP1", ["US_Soldier_Sniper_EP1"] call EVO_GetGuns],
			["US_Delta_Force_TL_EP1", ["US_Delta_Force_TL_EP1"] call EVO_GetGuns],
			["US_Soldier_MG_EP1", ["US_Soldier_MG_EP1"] call EVO_GetGuns],
			["US_Soldier_LAT_EP1", ["US_Soldier_LAT_EP1"] call EVO_GetGuns],
			["US_Soldier_HAT_EP1", ["US_Soldier_HAT_EP1"] call EVO_GetGuns],
			["US_Soldier_AA_EP1", ["US_Soldier_AA_EP1"] call EVO_GetGuns],
			["US_Delta_Force_Night_EP1", ["US_Delta_Force_Night_EP1"] call EVO_GetGuns],
			["US_Delta_Force_SD_EP1", ["US_Delta_Force_SD_EP1"] call EVO_GetGuns],
			["US_Delta_Force_Assault_EP1", ["US_Delta_Force_Assault_EP1"] call EVO_GetGuns]];
		} else {
			EVO_RecList = [["TK_Soldier_Crew_EP1", ["TK_Soldier_Crew_EP1"] call EVO_GetGuns],
			["TK_Soldier_Medic_EP1", ["TK_Soldier_Medic_EP1"] call EVO_GetGuns],
			["TK_Soldier_EP1", ["TK_Soldier_EP1"] call EVO_GetGuns],
			["TK_Soldier_GL_EP1", ["TK_Soldier_GL_EP1"] call EVO_GetGuns],
			["TK_Soldier_AT_EP1", ["TK_Soldier_AT_EP1"] call EVO_GetGuns],
			["TK_Soldier_Sniper_EP1", ["TK_Soldier_Sniper_EP1"] call EVO_GetGuns],
			["TK_Soldier_SL_EP1", ["TK_Soldier_SL_EP1"] call EVO_GetGuns],
			["TK_Soldier_MG_EP1", ["TK_Soldier_MG_EP1"] call EVO_GetGuns],
			["TK_Soldier_LAT_EP1", ["TK_Soldier_LAT_EP1"] call EVO_GetGuns],
			["TK_Soldier_HAT_EP1", ["TK_Soldier_HAT_EP1"] call EVO_GetGuns],
			["TK_Soldier_AA_EP1", ["TK_Soldier_AA_EP1"] call EVO_GetGuns],
			["TK_Special_Forces_TL_EP1", ["TK_Special_Forces_TL_EP1"] call EVO_GetGuns],
			["TK_Special_Forces_EP1", ["TK_Special_Forces_EP1"] call EVO_GetGuns],
			["TK_Soldier_Night_1_EP1", ["TK_Soldier_Night_1_EP1"] call EVO_GetGuns]];
		};
		#else
		if (EVO_own_side == "WEST") then {
			EVO_RecList = [["USMC_Soldier_Crew", ["USMC_Soldier_Crew"] call EVO_GetGuns],
			["FR_Corpsman", ["FR_Corpsman"] call EVO_GetGuns],
			["USMC_Soldier", ["USMC_Soldier"] call EVO_GetGuns],
			["USMC_Soldier_GL", ["USMC_Soldier_GL"] call EVO_GetGuns],
			["USMC_Soldier_AT", ["USMC_Soldier_AT"] call EVO_GetGuns],
			["USMC_SoldierS_Sniper", ["USMC_SoldierS_Sniper"] call EVO_GetGuns],
			["FR_Commander", ["FR_Commander"] call EVO_GetGuns],
			["USMC_Soldier_MG", ["USMC_Soldier_MG"] call EVO_GetGuns],
			["USMC_Soldier_LAT", ["USMC_Soldier_LAT"] call EVO_GetGuns],
			["USMC_Soldier_HAT", ["USMC_Soldier_HAT"] call EVO_GetGuns],
			["USMC_Soldier_AA", ["USMC_Soldier_AA"] call EVO_GetGuns],
			["FR_R", ["FR_R"] call EVO_GetGuns],
			["FR_Sapper", ["FR_Sapper"] call EVO_GetGuns],
			["FR_Assault_GL", ["FR_Assault_GL"] call EVO_GetGuns],
			["FR_Assault_R", ["FR_Assault_R"] call EVO_GetGuns]];
		} else {
			EVO_RecList = [["RU_Soldier_Crew", ["RU_Soldier_Crew"] call EVO_GetGuns],
			["RU_Soldier_Medic", ["RU_Soldier_Medic"] call EVO_GetGuns],
			["RU_Soldier", ["RU_Soldier"] call EVO_GetGuns],
			["RU_Soldier_GL", ["RU_Soldier_GL"] call EVO_GetGuns],
			["RU_Soldier_AT", ["RU_Soldier_AT"] call EVO_GetGuns],
			["RU_Soldier_Sniper", ["RU_Soldier_Sniper"] call EVO_GetGuns],
			["RU_Soldier_SL", ["RU_Soldier_SL"] call EVO_GetGuns],
			["RU_Soldier_MG", ["RU_Soldier_MG"] call EVO_GetGuns],
			["RU_Soldier_LAT", ["RU_Soldier_LAT"] call EVO_GetGuns],
			["RU_Soldier_HAT", ["RU_Soldier_HAT"] call EVO_GetGuns],
			["RU_Soldier_AA", ["RU_Soldier_AA"] call EVO_GetGuns],
			["RUS_Commander", ["RUS_Commander"] call EVO_GetGuns],
			["RUS_Soldier1", ["RUS_Soldier1"] call EVO_GetGuns],
			["RUS_Soldier_Sab", ["RUS_Soldier_Sab"] call EVO_GetGuns]];
		};
		#endif
		EVO_SupList = [[localize "STR_M04t104",localize "STR_M04t105",10,5,10,"pictures\ammo.paa",1],
			[localize "STR_M04t106",localize "STR_M04t107",10,20,10,"pictures\airstrike.paa",2],		
			["HMMWV SOV","HMMWV SOV",10,20,10,"pictures\hmvee.paa",8],
			[localize "STR_M04t108",localize "STR_M04t109",50,40,20,"pictures\arty.paa",3],
			[localize "STR_M04t110",localize "STR_M04t111",50,70,20,"pictures\bomb.paa",4],
			[localize "STR_M04t112",localize "STR_M04t113",100,80,30,"pictures\arty.paa",5],
			[localize "STR_M04t114",localize "STR_M04t115",150,120,40,"pictures\chemical.paa",6]
		];
		EVO_SM_List = [[localize "STR_M04t16_0",localize "STR_M04t17_1","pictures\sabotage.paa",10,1],
		[localize "STR_M04t6_1",localize "STR_M04t7_1","pictures\offensive.paa",10,3],
		[localize "STR_M04t20",localize "STR_M04t21_0","pictures\sabotage.paa",15,4],
		[localize "STR_M04t24",localize "STR_M04t25_0","pictures\defend.paa",15,6],
		[localize "STR_M04t37_0",localize "STR_M04t38_0","pictures\defend.paa",20,7]];
	};
	case (6) : {
		#ifdef __Takistan__
		if (EVO_own_side == "WEST") then {
			EVO_RecList = [["US_Soldier_Crew_EP1", ["US_Soldier_Crew_EP1"] call EVO_GetGuns],
			["US_Delta_Force_Medic_EP1", ["US_Delta_Force_Medic_EP1"] call EVO_GetGuns],
			["US_Soldier_EP1", ["US_Soldier_EP1"] call EVO_GetGuns],
			["US_Soldier_GL_EP1", ["US_Soldier_GL_EP1"] call EVO_GetGuns],
			["US_Soldier_AT_EP1", ["US_Soldier_AT_EP1"] call EVO_GetGuns],
			["US_Soldier_Sniper_EP1", ["US_Soldier_Sniper_EP1"] call EVO_GetGuns],
			["US_Delta_Force_TL_EP1", ["US_Delta_Force_TL_EP1"] call EVO_GetGuns],
			["US_Soldier_MG_EP1", ["US_Soldier_MG_EP1"] call EVO_GetGuns],
			["US_Soldier_LAT_EP1", ["US_Soldier_LAT_EP1"] call EVO_GetGuns],
			["US_Soldier_HAT_EP1", ["US_Soldier_HAT_EP1"] call EVO_GetGuns],
			["US_Soldier_AA_EP1", ["US_Soldier_AA_EP1"] call EVO_GetGuns],
			["US_Delta_Force_Night_EP1", ["US_Delta_Force_Night_EP1"] call EVO_GetGuns],
			["US_Delta_Force_SD_EP1", ["US_Delta_Force_SD_EP1"] call EVO_GetGuns],
			["US_Delta_Force_Assault_EP1", ["US_Delta_Force_Assault_EP1"] call EVO_GetGuns],
			["GER_Soldier_EP1", ["GER_Soldier_EP1"] call EVO_GetGuns],
			["GER_Soldier_Medic_EP1", ["GER_Soldier_Medic_EP1"] call EVO_GetGuns],
			["GER_Soldier_MG_EP1", ["GER_Soldier_MG_EP1"] call EVO_GetGuns],
			["GER_Soldier_Scout_EP1", ["GER_Soldier_Scout_EP1"] call EVO_GetGuns],
			["GER_Soldier_TL_EP1", ["GER_Soldier_TL_EP1"] call EVO_GetGuns]];
		} else {
			EVO_RecList = [["TK_Soldier_Crew_EP1", ["TK_Soldier_Crew_EP1"] call EVO_GetGuns],
			["TK_Soldier_Medic_EP1", ["TK_Soldier_Medic_EP1"] call EVO_GetGuns],
			["TK_Soldier_EP1", ["TK_Soldier_EP1"] call EVO_GetGuns],
			["TK_Soldier_GL_EP1", ["TK_Soldier_GL_EP1"] call EVO_GetGuns],
			["TK_Soldier_AT_EP1", ["TK_Soldier_AT_EP1"] call EVO_GetGuns],
			["TK_Soldier_Sniper_EP1", ["TK_Soldier_Sniper_EP1"] call EVO_GetGuns],
			["TK_Soldier_SL_EP1", ["TK_Soldier_SL_EP1"] call EVO_GetGuns],
			["TK_Soldier_MG_EP1", ["TK_Soldier_MG_EP1"] call EVO_GetGuns],
			["TK_Soldier_LAT_EP1", ["TK_Soldier_LAT_EP1"] call EVO_GetGuns],
			["TK_Soldier_HAT_EP1", ["TK_Soldier_HAT_EP1"] call EVO_GetGuns],
			["TK_Soldier_AA_EP1", ["TK_Soldier_AA_EP1"] call EVO_GetGuns],
			["TK_Special_Forces_TL_EP1", ["TK_Special_Forces_TL_EP1"] call EVO_GetGuns],
			["TK_Special_Forces_EP1", ["TK_Special_Forces_EP1"] call EVO_GetGuns],
			["TK_Soldier_Night_1_EP1", ["TK_Soldier_Night_1_EP1"] call EVO_GetGuns],
			["TK_Soldier_SniperH_EP1", ["TK_Soldier_SniperH_EP1"] call EVO_GetGuns],
			["TK_Soldier_Sniper_Night_EP1", ["TK_Soldier_Sniper_Night_EP1"] call EVO_GetGuns],
			["TK_Soldier_TWS_EP1", ["TK_Soldier_TWS_EP1"] call EVO_GetGuns],
			["TK_Special_Forces_MG_EP1", ["TK_Special_Forces_MG_EP1"] call EVO_GetGuns],
			["TK_Soldier_Spotter_EP1", ["TK_Soldier_Spotter_EP1"] call EVO_GetGuns]];
		};
		#else
		if (EVO_own_side == "WEST") then {
			EVO_RecList = [["USMC_Soldier_Crew", ["USMC_Soldier_Crew"] call EVO_GetGuns],
			["FR_Corpsman", ["FR_Corpsman"] call EVO_GetGuns],
			["USMC_Soldier", ["USMC_Soldier"] call EVO_GetGuns],
			["USMC_Soldier_GL", ["USMC_Soldier_GL"] call EVO_GetGuns],
			["USMC_Soldier_AT", ["USMC_Soldier_AT"] call EVO_GetGuns],
			["USMC_SoldierS_Sniper", ["USMC_SoldierS_Sniper"] call EVO_GetGuns],
			["FR_Commander", ["FR_Commander"] call EVO_GetGuns],
			["USMC_Soldier_MG", ["USMC_Soldier_MG"] call EVO_GetGuns],
			["USMC_Soldier_LAT", ["USMC_Soldier_LAT"] call EVO_GetGuns],
			["USMC_Soldier_HAT", ["USMC_Soldier_HAT"] call EVO_GetGuns],
			["USMC_Soldier_AA", ["USMC_Soldier_AA"] call EVO_GetGuns],
			["FR_R", ["FR_R"] call EVO_GetGuns],
			["FR_Sapper", ["FR_Sapper"] call EVO_GetGuns],
			["FR_Assault_GL", ["FR_Assault_GL"] call EVO_GetGuns],
			["FR_Assault_R", ["FR_Assault_R"] call EVO_GetGuns],
			["FR_AR", ["FR_AR"] call EVO_GetGuns],
			["GER_Soldier_EP1", ["GER_Soldier_EP1"] call EVO_GetGuns],
			["GER_Soldier_Medic_EP1", ["GER_Soldier_Medic_EP1"] call EVO_GetGuns],
			["GER_Soldier_MG_EP1", ["GER_Soldier_MG_EP1"] call EVO_GetGuns],
			["GER_Soldier_Scout_EP1", ["GER_Soldier_Scout_EP1"] call EVO_GetGuns],
			["GER_Soldier_TL_EP1", ["GER_Soldier_TL_EP1"] call EVO_GetGuns]];
		} else {
			EVO_RecList = [["RU_Soldier_Crew", ["RU_Soldier_Crew"] call EVO_GetGuns],
			["RU_Soldier_Medic", ["RU_Soldier_Medic"] call EVO_GetGuns],
			["RU_Soldier", ["RU_Soldier"] call EVO_GetGuns],
			["RU_Soldier_GL", ["RU_Soldier_GL"] call EVO_GetGuns],
			["RU_Soldier_AT", ["RU_Soldier_AT"] call EVO_GetGuns],
			["RU_Soldier_Sniper", ["RU_Soldier_Sniper"] call EVO_GetGuns],
			["RU_Soldier_SL", ["RU_Soldier_SL"] call EVO_GetGuns],
			["RU_Soldier_MG", ["RU_Soldier_MG"] call EVO_GetGuns],
			["RU_Soldier_LAT", ["RU_Soldier_LAT"] call EVO_GetGuns],
			["RU_Soldier_HAT", ["RU_Soldier_HAT"] call EVO_GetGuns],
			["RU_Soldier_AA", ["RU_Soldier_AA"] call EVO_GetGuns],
			["RUS_Commander", ["RUS_Commander"] call EVO_GetGuns],
			["RUS_Soldier1", ["RUS_Soldier1"] call EVO_GetGuns],
			["RUS_Soldier_Sab", ["RUS_Soldier_Sab"] call EVO_GetGuns],
			["MVD_Soldier", ["MVD_Soldier"] call EVO_GetGuns],
			["MVD_Soldier_AT", ["MVD_Soldier_AT"] call EVO_GetGuns],
			["MVD_Soldier_GL", ["MVD_Soldier_GL"] call EVO_GetGuns],
			["MVD_Soldier_MG", ["MVD_Soldier_MG"] call EVO_GetGuns],
			["MVD_Soldier_Sniper", ["MVD_Soldier_Sniper"] call EVO_GetGuns],
			["MVD_Soldier_Marksman", ["MVD_Soldier_Marksman"] call EVO_GetGuns]];
		};
		#endif
		if (E_icbm == 1) then {
			EVO_SupList = [[localize "STR_M04t104",localize "STR_M04t105",10,5,10,"pictures\ammo.paa",1],
				[localize "STR_M04t106",localize "STR_M04t107",10,20,10,"pictures\airstrike.paa",2],		
				["HMMWV SOV","HMMWV SOV",10,20,10,"pictures\hmvee.paa",8],
				[localize "STR_M04t108",localize "STR_M04t109",50,40,20,"pictures\arty.paa",3],
				[localize "STR_M04t110",localize "STR_M04t111",50,70,20,"pictures\bomb.paa",4],
				[localize "STR_M04t112",localize "STR_M04t113",100,80,30,"pictures\arty.paa",5],
				[localize "STR_M04t114",localize "STR_M04t115",150,120,40,"pictures\chemical.paa",6],
				[localize "STR_M04t116",localize "STR_M04t117",200,300,60,"pictures\nuke.paa",7]
				];
		} else {
			EVO_SupList = [[localize "STR_M04t104",localize "STR_M04t105",10,5,10,"pictures\ammo.paa",1],
				[localize "STR_M04t106",localize "STR_M04t107",10,20,10,"pictures\airstrike.paa",2],		
				["HMMWV SOV","HMMWV SOV",10,20,10,"pictures\hmvee.paa",8],
				[localize "STR_M04t108",localize "STR_M04t109",50,40,20,"pictures\arty.paa",3],
				[localize "STR_M04t110",localize "STR_M04t111",50,70,20,"pictures\bomb.paa",4],
				[localize "STR_M04t112",localize "STR_M04t113",100,80,30,"pictures\arty.paa",5],
				[localize "STR_M04t114",localize "STR_M04t115",150,120,40,"pictures\chemical.paa",6]
				];		
		};
		EVO_SM_List = [[localize "STR_M04t16_0",localize "STR_M04t17_1","pictures\sabotage.paa",10,1],
		[localize "STR_M04t6_1",localize "STR_M04t7_1","pictures\offensive.paa",10,3],
		[localize "STR_M04t20",localize "STR_M04t21_0","pictures\sabotage.paa",15,4],
		[localize "STR_M04t24",localize "STR_M04t25_0","pictures\defend.paa",15,6],
		[localize "STR_M04t37_0",localize "STR_M04t38_0","pictures\defend.paa",20,7],
		[localize "STR_M04t12",localize "STR_M04t13_1","pictures\offensive.paa",30,9]];
	};
};