_psycho = _this select 0;

_psycho removeAction ID_jumpM;
if (CB_jump) then {onMapSingleClick "vehicle player setPos _pos; CB_jump = false";};

if (!(CB_jump)) exitWith {};