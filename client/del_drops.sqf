//by psycho
#include "setup.sqf"
// Deletes a support ammo box after a while. 
_unit = _this select 0;
_mrk = format["amo%1",time];

#ifdef __BLUE__
_color = "ColorBlue";
#else
_color = "ColorRed";
#endif

_mkr = [_mrk, position _unit, "ICON", _color, [0.5,0.5], localize "STR_M04t43", 0, "mil_box"] call XfCreateMarkerGlobal;
sleep 1800;
deletevehicle _unit;
deletemarker _mkr;