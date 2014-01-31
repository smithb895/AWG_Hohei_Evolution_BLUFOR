_weapons = ["M136","SMAW","Javelin","Stinger","RPG7V","Strela","RPG18","MetisLauncher","Igla"];
_magazines = ["M136","SMAW_HEAA","SMAW_HEDP","Javelin","Stinger","PG7V","PG7VL","PG7VR","OG7","Strela","RPG18","AT13","Igla","TimeBomb","PipeBomb"];
_playerweapons = weapons player;
_playermags = magazines player;
_allowjump = 1;
if ({_x in _weapons} foreach (_playerweapons)) then {
	_allowjump = 0;
};
if ({_x in _magazines} foreach (_playermags)) then {
	_allowjump = 0;
};
if (((vehicle player) in list halobase) AND (_allowjump == 1)) then {
	player commandchat "Open map and click to set target location";
	player removeaction ID_Halo_Action;
	onMapSingleClick "null = [_pos] execvm ""client\fn_halo.sqf""; onMapSingleClick """"; true;";
} else {
	if (_allowjump == 0) then {
		player commandchat "You cannot bring Satchel Charges or Rocket Launchers on a HALO jump.";
	} else {
		player commandchat "You must be inside the base to HALO jump";
	};
};

exit;