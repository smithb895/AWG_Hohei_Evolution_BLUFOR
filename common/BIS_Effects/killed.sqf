private ["_v","_int"];
_v = _this select 0;
if (_v iskindof "helicopter" || _v iskindof "plane") exitWith {
	["d_AirD", _v] call XNetCallEvent;
};
if (_v iskindof "tank") exitWith {
	_int = (fuel _v) * (8 + random 2);
	[_v,_int] spawn BIS_Effects_Secondaries;
};
if (_v iskindof "car" || _v iskindof "ship") exitWith {
	_int = (fuel _v)*(5 + random 1);
	[_v,_int] spawn BIS_Effects_Secondaries;
	if ((random _int) > 2.8) then {_b = createVehicle ["SmallSecondary", getpos _v, [], 0, "NONE"]};
};