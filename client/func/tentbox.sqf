// by psycho
#include "setup.sqf"
private "_box";
_box = _this select 0;

clearWeaponCargo _box;
clearMagazineCargo _box;

	if (__isBlue) then {
//rifles
			_box addMagazineCargo["30RND_556X45_STANAG",(round(random 19))];
			_box addMagazineCargo["30RND_556X45_G36",(round(random 19))];
			//under-barrel grenade launchers
			_box addMagazineCargo["1RND_HE_M203",(round(random 11))];
			_box addMagazineCargo["FLAREWHITE_M203",(round(random 15))];
			_box addMagazineCargo["1RND_SMOKE_M203",(round(random 15))];
			//sniper rifles
			_box addMagazineCargo["20RND_556X45_STANAG",(round(random 15))];
			_box addMagazineCargo["20RND_762X51_DMR",(round(random 15))];
			_box addMagazineCargo["5RND_762X51_M24",(round(random 15))];
			_box addMagazineCargo["10RND_127X99_M107",(round(random 15))];
			//machineguns
			_box addMagazineCargo["100RND_556X45_BETACMAG",(round(random 15))];
			_box addMagazineCargo["200RND_556X45_M249",(round(random 15))];
			_box addMagazineCargo["100RND_762X51_M240",(round(random 15))];
			//submachineguns
			_box addMagazineCargo["30RND_9X19_MP5",(round(random 15))];
			//shotguns
			_box addMagazineCargo["8RND_B_BENELI_74SLUG",(round(random 15))];
			//pistols
			_box addMagazineCargo["7RND_45ACP_1911",(round(random 15))];
			_box addMagazineCargo["15RND_9X19_M9",(round(random 15))];
			//launchers
			_box addMagazineCargo["SMAW_HEAA",(ceil(random 15))];
			_box addMagazineCargo["SMAW_HEDP",(ceil(random 15))];
			_box addMagazineCargo["JAVELIN",(round(random 11))];
			_box addMagazineCargo["M136",(ceil(random 20))];
			_box addMagazineCargo["STINGER",(round(random 10))];
			//misc
			_box addMagazineCargo["pipebomb",(round(random 8))];
			_box addMagazineCargo["HandGrenade_West",(ceil(random 8))];
			_box addMagazineCargo["Laserbatteries",(ceil(random 8))];
			_box addWeaponCargo["SmokeShell",(ceil(random 11))];
			_box addWeaponCargo["SmokeShellYellow",(ceil(random 11))];
			_box addWeaponCargo["SmokeShellRed",(ceil(random 11))];
			_box addWeaponCargo["SmokeShellGreen",(ceil(random 11))];
			_box addWeaponCargo["SmokeShellPurple",(ceil(random 11))];
			_box addWeaponCargo["SmokeShellBlue",(ceil(random 11))];
			_box addWeaponCargo["SmokeShellOrange",(ceil(random 11))];
	};
