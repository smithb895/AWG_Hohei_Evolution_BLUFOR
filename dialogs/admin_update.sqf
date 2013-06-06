//by psycho
#include "setup.sqf"
disableSerialization;
_dialog = findDisplay 72000;
_info = _dialog displayCtrl 72001;
_mhqbutton = _dialog displayCtrl 72003;
_ahqbutton = _dialog displayCtrl 72004;
_list = _dialog displayCtrl 72005;
_mhqpic = _dialog displayCtrl 72006;
_ahqpic = _dialog displayCtrl 72007;
_score = _dialog displayCtrl 72012;
_rank = _dialog displayCtrl 72013;
_tks = _dialog displayCtrl 72014;

//_bool = player getVariable "e_p_isadmin";
_bool = if (player getVariable "e_p_isadmin" || isServer) then {true} else {false};
//if (isNil "_bool") then {_bool = false};

if (_bool) then {
	_info ctrlSetText localize "STR_d_adminhint";
} else {
	_info ctrlSetText localize "STR_d_noadmin";
};


if(isNil "group_index") then {group_index = 0};
lbClear _list;
_i = 0;
EVO_plist = [];
_desc ctrlSetText "";
{
	if ((isPlayer _x) and (side _x == side player)) then {
		EVO_plist set [count EVO_plist, _x];
	};
} forEach playableUnits;

while {_i < count EVO_plist} do {
	_unit = EVO_plist select _i;
	_name = name _unit;
	_list lbAdd _name;
	_i = _i + 1;
};
if(lbCurSel _list < 0) then {
	_list lbSetCurSel group_index;
} else {
	group_index = lbCurSel _list;
};
_selected = EVO_plist select (group_index max 0);


if (__XJIPGetVar(MHQ_is_locked)) then {
	_mhqbutton ctrlSetText "Unlock MHQ";
	_pic = "pictures\stop.paa";
	_mhqpic ctrlSetStructuredText parseText format["<img image='%1'/>",_pic];
} else {
	_mhqbutton ctrlSetText "Lock MHQ";
	_pic = "pictures\ok.paa";
	_mhqpic ctrlSetStructuredText parseText format["<img image='%1'/>",_pic];
};
if (__XJIPGetVar(AHQ_is_locked)) then {
	_ahqbutton ctrlSetText "Unlock AHQ";
	_pic = "pictures\stop.paa";
	_ahqpic ctrlSetStructuredText parseText format["<img image='%1'/>",_pic];
} else {
	_ahqbutton ctrlSetText "Lock AHQ";
	_pic = "pictures\ok.paa";
	_ahqpic ctrlSetStructuredText parseText format["<img image='%1'/>",_pic];
};

_score ctrlSetText str(score _selected);
_ranking = _selected call EVO_get_players_jip_rank;
_rank ctrlSetText _ranking;
_uid = getPlayerUID _selected;
_p = EVO_client_event_holder getVariable _uid;
_numtk = _p select 2;
_tks ctrlSetText str(_numtk);