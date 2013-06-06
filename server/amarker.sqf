// changed by psycho
// marks enemy planes with a red dot on the map
#include "setup.sqf"
private ["_markerobj","_unitm","_unit","_cone","_ctwo"];
_unit = _this select 0;
_unitm = format ["m" + "%1", _unit];
_markerobj = createMarker [_unitm, [getpos _unit select 0,getpos _unit select 1]];
#ifdef __BLUE__
	_markerobj setMarkerType "o_air";
	_cone = "ColorRedAlpha";
	_ctwo = "ColorRed";
#else
	_markerobj setMarkerType "b_air";
	_cone = "ColorBlue";
	_ctwo = "ColorBlue";
#endif
_markerobj setMarkerColor _cone;
_markerobj setMarkerSize [0.7, 0.7];
_markerobj setMarkerText localize "STR_M04t44";

while {canmove _unit and alive _unit} do {
	_markerobj setMarkerColor _ctwo;
	_markerobj setMarkerPos [getpos _unit select 0,getpos _unit select 1];
	sleep 1.0;
	_markerobj setMarkerColor _cone;
	sleep 1.0;
};
deleteMarker _markerobj;