//by psycho
#include "setup.sqf"
private ["_list"];
_list = AirportIn;
_borderm = "enemy_scanner1";
#ifdef __BLUE__
_color1 = "ColorBlue";
_color2 = "ColorRed";
#else
_color1 = "ColorRed";
_color2 = "ColorBlue";
#endif
_borderm setMarkerColor _color1;
_side = EVO_enemy_side call EVO_getfunc_Store;

_enemys_in = {
	_txthead = localize "STR_i_headEin";
	_txtbody = localize "STR_i_bodyEin";
	["evo_message",[EVO_grey,_head,_body,"achtung",player]] call XNetCallEvent;
};
_enemys_out = {
	_txthead = localize "STR_i_headEout";
	_txtbody = localize "STR_i_bodyEout";
	["evo_message",[EVO_grey,_head,_body,"ok",player]] call XNetCallEvent;
};

[] spawn {
	while {true} do {
		waitUntil {(_side countSide list _list) > 0};
		_borderm setMarkerColor _color2;
		[] call _enemys_in;
		waitUntil {(_side countSide list _list) < 1};
		_borderm setMarkerColor _color1;
		[] call _enemys_out;
	};
};