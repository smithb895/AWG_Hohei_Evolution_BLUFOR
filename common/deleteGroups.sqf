//by psycho
_grp = _this select 0;
_allunits = units _grp;
_count = count _allunits;
_Vehicles = [];
_i = 0;

while {_i < _count} do {
	_unit = (_allunits select _i);
	_vec = vehicle _unit;
	if (!(_vec isKindOf "Man") and !(_vec in _Vehicles)) then {
		_Vehicles = _Vehicles + [_vec];
	};
	_i=_i+1;
};

if (!(isNil "_allunits") and (_count > 0)) then {
	{
		_x action ["Eject",vehicle _x];
		_x setDamage 1;
		deletevehicle _x;
	} forEach units _grp;
};

{if(count crew _x == 0) then {deletevehicle _x}} forEach _Vehicles;
deleteGroup _grp;