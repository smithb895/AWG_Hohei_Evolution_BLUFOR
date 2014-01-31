//by psycho
private ["_ranknum","_grpzise","_goout"];
disableSerialization;
_dialog = findDisplay 69000;
_list = _dialog displayCtrl 69001;
_description = _dialog displayCtrl 69006;
recruit_index = lbCurSel _list;
_type = ((EVO_RecList select recruit_index) select 0);
_goout = false;

if (player != leader group player) exitWith {
	_description ctrlSetText localize "STR_d_nolead";
};

_grp = group player;
_grpzise = (count units _grp) - 1;	//-1 player self
_ranknum = if ((E_lock == 1) OR ((getPlayerUID player) in Evo_Admins)) then {6} else {rankID player};

switch (_ranknum) do {
	case 0 : {if (_grpzise >= 1) exitWith {_description ctrlSetText localize "STR_M04t99"; _goout = true;}};
	case 1 : {if (_grpzise >= 2) exitWith {_description ctrlSetText localize "STR_M04t99"; _goout = true;}};
	case 2 : {if (_grpzise >= 4) exitWith {_description ctrlSetText localize "STR_M04t99"; _goout = true;}};
	case 3 : {if (_grpzise >= 6) exitWith {_description ctrlSetText localize "STR_M04t99"; _goout = true;}};
	case 4 : {if (_grpzise >= 8) exitWith {_description ctrlSetText localize "STR_M04t99"; _goout = true;}};
	case 5 : {if (_grpzise >= 10) exitWith {_description ctrlSetText localize "STR_M04t99"; _goout = true;}};
	case 6 : {if (_grpzise >= 12) exitWith {_description ctrlSetText localize "STR_M04t99"; _goout = true;}};
	default {};
};
if (!_goout) then {
	_rec = [_type] execVM "client\recruit_ai.sqf";
};