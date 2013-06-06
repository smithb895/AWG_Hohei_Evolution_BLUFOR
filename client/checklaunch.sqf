// by psycho
private ["_p","_id"];
_p = player;
_id = _this select 2;

if (!isNil "CB_setfire" and (!CB_setfire)) then {
	[] spawn CB_checklaunch;
	_p removeAction _id; 
} else {
	(localize "STR_i_twait") call XfGlobalChat;
};