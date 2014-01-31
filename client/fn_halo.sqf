
//Free fall HALO script by Wyatt.
//inspired by other scripts that I cant remember the names of...
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
	//Define the position variable
	_position = _this select 0;

	//move the player to the position of the click
	//player setpos [_this select 0];	
	player setpos _position;		

	//Fancy fade out 
	If (local player && isPlayer player) then	{
		cutText ["", "BLACK OUT",0.1];
	};

	//Call the built-in ARMA2 HALO
	[player, 5000] exec "ca\air2\halo\data\Scripts\HALO_init.sqs";		//[player, altitude]

	//Fancy fade in 
	If (local player && isPlayer player) then	{
		sleep 2;
		cutText ["", "BLACK IN",0.5];
		forcemap false;
		sleep 0.5;



	/*

		//Altimeter
		while 
		{
		(getPos player select 2) > 400} do {hintsilent parseText format["<t color='#FFFFFF' shadow='1' shadowColor='#000000' underline='true'>Altitude<br/></t><t color='#66F4F0' size='1.4'>%1</t>",(getPos player select 2)];
		sleep 0.1;
		};

		while 
		{
		(getPos player select 2) > 10} do {hintsilent parseText format["<t color='#FFFFFF'  shadow='1' shadowColor='#000000' underline='true'>Altitude<br/></t><t color='#66F4F0' size='1.4'>%1</t><br/><t shadow='1' shadowColor='#000000' color='#D5780D' underline='false' size='1'>LOW ALTITUDE</t>",(getPos player select 2)];
		sleep 0.1;
		};
		hintsilent "";*/
		
	};
} else {
	if (_allowjump == 0) then {
		player commandchat "You cannot bring Satchel Charges or Rocket Launchers on a HALO jump.";
	} else {
		player commandchat "You must be inside the base to HALO jump";
	};
};
ID_Halo_Action = player addAction [localize "STR_a_halo" call XGreyText, "client\parajump.sqf",0,1, false, true,"test2"];