﻿// edit by psycho
#include "setup.sqf"
private ["_aid","_hhe","_objs","_pos","_tmp","_vec"];
_aid = _this select 2;
player removeAction _aid;
_objs = _this select 3;
_vec = _objs select 0;

_pos = position _vec;
_hhe = createVehicle ["HeliHEmpty", _pos, [], 0, "NONE"];
_tmp = position _hhe;
_vec setPos _tmp;
deleteVehicle _hhe;