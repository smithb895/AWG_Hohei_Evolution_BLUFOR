//scriptname "EW screen.sqf";
/*
	File: screen.sqf
	Author: Karel Moricky

	Description:
	Screen Effects

	Parameter(s):
	_this select 0: Intensity (0-1)
	_this select 1: (Optional) Dirt
*/
disableserialization;

_int = _this select 0;
_dirt = if (count _this > 1) then {_this select 1} else {false};

if (isnil {uinamespace getvariable "str_screen"}) then {uinamespace setvariable ["str_screen",displaynull]};
if (isnull (uinamespace getvariable "str_screen")) then {1918 cutrsc ["screen","plain"]};
_display = uinamespace getvariable "str_screen";


if (!_dirt) then {
	//--- Select free layer
	_control = controlnull;
	for "_i" from 1001 to 1006 do {
		_c = _display displayctrl _i;
		_f = ctrlfade _c;
		_p = ctrlposition _c;
		if ((_p select 3) == 0) then {_f = 1};
		if (_f == 1) exitwith {_control = _c};
	};
	if (isnull _control) exitwith {};
	//--- Select position
	_w = safezoneW * _int;
	_h = _w / 0.75;
	_pos = [((safezoneX - _w/2) + random (safezoneW)),((safezoneY - _h/2) + random (safezoneH)),_w,_h];
	//--- Fade out (0s)
	_control ctrlsetposition _pos;
	_control ctrlsetfade 1;
	_control ctrlcommit 0;
	//--- Fade in (0.1s)
	_control ctrlsetfade 0;
	_control ctrlcommit 0.1;
	waituntil {ctrlcommitted _control};
	sleep 3;
	//--- Fade out (random 5-15s)
	_control ctrlsetfade 1;
	_control ctrlcommit (5 + random 10);
	waituntil {ctrlcommitted _control};
	//--- Reset
	if (ctrlfade _control == 0) then {
		_control ctrlsetposition [0,0,0,0];
		_control ctrlcommit 0;
	};
} else {
	_control = _display displayctrl 1000;
	_pos = [safezoneX,safezoneY,safezoneW,safezoneH];
	//--- Fade out (0s)
	_control ctrlsetposition _pos;
	_control ctrlsetfade 1;
	_control ctrlcommit 0;
	//--- Fade in (0.2s)
	_control ctrlsetfade 0;
	_control ctrlcommit 0.2;
	waituntil {ctrlcommitted _control};
	sleep 3;
	//--- Fade out (random 5-10s)
	_control ctrlsetfade 1;
	_control ctrlcommit (5 + random 5);
	waituntil {ctrlcommitted _control};

};