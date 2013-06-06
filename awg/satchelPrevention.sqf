/*
 * Satchel Prevention
 * Author: Anzu
 * Credits: Thanks to Kylania for the awesomeness on the forums!
 * http://forums.bistudio.com/showthread.php?107920-Satchel-activating-trigger&p=1755679&viewfull=1#post1755679
 * 
*/
/*
  In Condition field:
	player in thisList;

  OnAct:
	_nul = player execVM "awg\satchelPrevention.sqf";

  OnDeact:
	player removeEventHandler noSatchels;
*/
noSatchels = player addEventHandler ["fired",{
	if ((_this select 2) == "Pipebombmuzzle") then {
		/*
		_todelete = nearestObjects [player, ["PipeBomb"], 50];
		{
			//if (typeof _x == "pipebomb" or typeof _x == "mine") then {
				deletevehicle _x;
			//}
		} forEach _todelete;
		*/
		player setDammage 1;
		player globalChat format ["%1 HAS BEEN SLAYED FOR PLANTING A SATCHEL IN THE BASE!!!", name player];
		hint "Do not plant satchels in the base!";
	};
}];

