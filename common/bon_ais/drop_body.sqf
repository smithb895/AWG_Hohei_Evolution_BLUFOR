#include "setup.sqf"
_dragee	= _this select 3; 
_dragger = _this select 1;
_dropaction = _this select 2;

detach _dragger;
detach _dragee;

_dragger playAction "released";
__aiSetVar(_dragee) ["dragger",ObjNull,true];

_dragger removeAction _dropaction;
_dropaction = nil;