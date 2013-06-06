private ["_psycho"];
_psycho = _this select 0;
_id = _this select 2;

_psycho removeAction _id;
if (CB_noD) then {["allow_dam",[_psycho,false]] call XNetCallEvent;};