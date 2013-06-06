//by psycho
_psycho = _this select 0;
_id = _this select 2;

_psycho removeAction _id;
if (CB_cursorDown) then {
	_target = cursorTarget;
	if (str(_target) != "<NULL-OBJECT>") then {_target allowDammage true; _target setDammage 1};
};
CB_cursorDown = false;