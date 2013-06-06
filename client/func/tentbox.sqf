// by psycho
#include "setup.sqf"
private "_box";
_box = _this select 0;

clearWeaponCargo _box;
clearMagazineCargo _box;
#ifdef __Takistan__
	if (__isBlue) then {
		_box addWeaponCargo ["MAAWS",3];
		_box addWeaponCargo ["Stinger",3];
		_box addWeaponCargo ["G36a_camo",5];
		_box addWeaponCargo ["SCAR_L_CQC_Holo",10];
		_box addWeaponCargo ["M107", 1];
		
		_box addmagazinecargo ["10Rnd_127x99_m107", 10];
		_box addmagazinecargo ["JAVELIN",5];
		_box addmagazinecargo ["30Rnd_556x45_G36",100];
		_box addmagazinecargo ["30Rnd_556x45_Stanag",100];
		_box addmagazinecargo ["Stinger",10];
		_box addmagazinecargo ["MAAWS_HEAT",100];
		_box addmagazinecargo ["pipebomb",3];
	} else {
		_box addWeaponCargo ["RPG18",3];
		_box addWeaponCargo ["RPG7V",3];
		_box addWeaponCargo ["Igla",3];
		_box addWeaponCargo ["G36a_camo",5];
		_box addWeaponCargo ["FN_FAL",10];
		_box addWeaponCargo ["KSVK", 1];
		
		_box addmagazinecargo ["5Rnd_127x108_KSVK", 10];
		_box addmagazinecargo ["AT13",5];
		_box addmagazinecargo ["20Rnd_762x51_FNFAL",100];
		_box addmagazinecargo ["30Rnd_556x45_G36",100];
		_box addmagazinecargo ["Igla",10];
		_box addmagazinecargo ["PG7VL",100];
		_box addmagazinecargo ["pipebomb",3];
	};
#else
	if (__isBlue) then {
		_box addWeaponCargo ["M136",3];
		_box addWeaponCargo ["SMAW",3];
		_box addWeaponCargo ["Stinger",3];
		_box addWeaponCargo ["G36a",5];
		_box addWeaponCargo ["M16A4",10];
		_box addWeaponCargo ["M107", 1];
		
		_box addmagazinecargo ["10Rnd_127x99_m107", 10];
		_box addmagazinecargo ["JAVELIN",5];
		_box addmagazinecargo ["30Rnd_556x45_Stanag",100];
		_box addmagazinecargo ["30Rnd_556x45_G36",100];
		_box addmagazinecargo ["Stinger",10];
		_box addmagazinecargo ["SMAW_HEAA",100];
		_box addmagazinecargo ["pipebomb",3];
	} else {
		_box addWeaponCargo ["RPG18",3];
		_box addWeaponCargo ["RPG7V",3];
		_box addWeaponCargo ["Igla",3];
		_box addWeaponCargo ["G36a",5];
		_box addWeaponCargo ["AK_107_kobra",10];
		_box addWeaponCargo ["KSVK", 1];
		
		_box addmagazinecargo ["5Rnd_127x108_KSVK", 10];
		_box addmagazinecargo ["AT13",5];
		_box addmagazinecargo ["30Rnd_545x39_AK",100];
		_box addmagazinecargo ["30Rnd_556x45_G36",100];
		_box addmagazinecargo ["Igla",10];
		_box addmagazinecargo ["PG7VL",100];
		_box addmagazinecargo ["pipebomb",3];
	};
#endif