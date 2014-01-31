//Free fall HALO script by AWG Wyatt.
//inspired by other scripts that I cant remember the names of...
//Force player out of vehicle and start BIS halo

//add this to the vehicle you want HALO enabled.
//this addAction ["HALO jump", "awg\halo.sqf"];
// This seems to work best on C130Js and fast movers.


//Select unit from execvm input
_unit = _this select 1;

//get position and make ready to call BIS HALO
_pos = getpos _unit;
_pos3 = _pos select 2;

//check altitude
if (_pos3 < 300) then {_unit commandchat 'Insufficient altitude for HALO Jump'; exit;} else {

//Force get out of vehicle without chute.
_unit action ["GetOut", vehicle _unit];

//Start the BIS HALO
[_unit, (_pos3+20)] exec "ca\air2\halo\data\Scripts\HALO_init.sqs";	
_unit commandchat 'Dont forget to deploy parachute via scroll menu';
exit;
};