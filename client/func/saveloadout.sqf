//by psycho
#include "setup.sqf"
if (primaryWeapon player == "" || primaryWeapon player == " ") exitWith {
	_txtpasshead = localize "STR_o_wsfailhead";
	_txtpassbody = localize "STR_o_wsfailbody";
	[EVO_blue,_txtpasshead,_txtpassbody,"stop"] call EVO_Message;
};

EVO_pammo = magazines player;
EVO_pweapons = weapons player;
EVO_pitems = items player;
[0] call loadout;

_txthead = localize "STR_a_lshead";
_txtbody = localize "STR_a_lsbody";
[EVO_blue,_txthead,_txtbody,"ok"] call EVO_Message;