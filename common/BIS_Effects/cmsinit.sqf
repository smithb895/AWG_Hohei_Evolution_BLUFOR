_pl = _this select 0;
_am = _this select 1;
_en = _this select 2;
if (NUX_AIRSYS_WSOUND) then {
	_pl vehicleRadio "RIMissile";
};
if (NUX_AIRSYS_FLARE) then 
{
	[_pl] call mflares;
};



