//by psycho
private ["_unit","_leader","_grp"];
_unit = _this select 0;
_leader = leader _grp;

waitUntil {(!isPlayer _leader) || (!alive _unit)};
if (alive _unit) then {
	sleep (random 2.67);
	_grpa = units _grp;
	_num = count _grpa;
	if (vehicle _unit != _unit) then {moveOut _unit};
	_unit setpos [(random 5),(random 5),0];
	_unit setDamage 1;
	deleteVehicle _unit;
	if (_num <= 1) then {deleteGroup _grp};
};