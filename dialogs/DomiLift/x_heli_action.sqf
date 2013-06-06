// by Xeno, edited by Grimes 
private ["_vehicle","_caller","_id"];

_vehicle = _this select 0;
_caller = _this select 1;
_id = _this select 2;

if (_caller == driver _vehicle) then {
	_vehicle removeAction _id;
	_vehicle setVariable ["D_Vehicle_Attached", true];
};