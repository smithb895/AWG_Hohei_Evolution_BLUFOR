_psycho = _this select 0;
_id = _this select 2;

_psycho removeAction _id;
if (CB_jump) then {onMapSingleClick "vehicle player setPos _pos; CB_jump = false";};