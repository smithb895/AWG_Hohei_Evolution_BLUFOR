// Prevents A players AI from driving A vehicle the player does no have the required rank for.
_unit = _this select 0;

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do {
	waitUntil {(!alive _unit) || (((vehicle _unit) != _unit) and (_unit == driver (vehicle _unit)))};
	if (alive _unit) then {
		_vec = vehicle _unit;
		[_unit] call EVO_ranked_boarding_check;
	} else {
		_loop = 1;
	};
	sleep 0.58;
};