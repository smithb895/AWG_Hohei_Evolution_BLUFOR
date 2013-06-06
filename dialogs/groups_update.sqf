//by psycho
private ["_pic","_name"];
disableSerialization;
_dialog = findDisplay 70000;
_list = _dialog displayCtrl 70001;
_rankpicture = _dialog displayCtrl 70002;
_button = _dialog displayCtrl 70003;
_description = _dialog displayCtrl 70004;
_desc = _dialog displayCtrl 70005;

if(isNil "group_index") then {group_index = 0};
lbClear _list;
_i = 0;
EVO_plist = [];
_desc ctrlSetText "";
{
	if ((isPlayer _x) and (_x == leader _x) and (side _x == side player)) then {
		EVO_plist set [count EVO_plist, _x];
	};
} forEach playableUnits;

while {_i < count EVO_plist} do {
	_pic = "";
	_unit = EVO_plist select _i;
	_name = name _unit;
	_rank = _unit call EVO_get_players_jip_rank;
	switch (toUpper _rank) do {
		case "PRIVATE": {_pic = "\CA\warfare2\Images\rank_private.paa"};
		case "CORPORAL": {_pic = "\CA\warfare2\Images\rank_corporal.paa"};
		case "SERGEANT": {_pic = "\CA\warfare2\Images\rank_sergeant.paa"};
		case "LIEUTENANT": {_pic = "\CA\warfare2\Images\rank_lieutenant.paa"};
		case "CAPTAIN": {_pic = "\CA\warfare2\Images\rank_captain.paa"};
		case "MAJOR": {_pic = "\CA\warfare2\Images\rank_major.paa"};
		case "COLONEL": {_pic = "\CA\warfare2\Images\rank_colonel.paa"};
	};
	_list lbAdd _name;
	_list lbSetPicture [_i, _pic];
	_i = _i + 1;
};
if(lbCurSel _list < 0) then {
	_list lbSetCurSel group_index;
} else {
	group_index = lbCurSel _list;
};

_pic = "";
_selected = EVO_plist select (group_index max 0);
if (player in units group _selected) then {
	_button ctrlSetText localize "STR_d_leavegrp";
};
_rank = _selected call EVO_get_players_jip_rank;
switch (toUpper _rank) do {
	case "PRIVATE": {_pic = "\CA\warfare2\Images\rank_private.paa"};
	case "CORPORAL": {_pic = "\CA\warfare2\Images\rank_corporal.paa"};
	case "SERGEANT": {_pic = "\CA\warfare2\Images\rank_sergeant.paa"};
	case "LIEUTENANT": {_pic = "\CA\warfare2\Images\rank_lieutenant.paa"};
	case "CAPTAIN": {_pic = "\CA\warfare2\Images\rank_captain.paa"};
	case "MAJOR": {_pic = "\CA\warfare2\Images\rank_major.paa"};
	case "COLONEL": {_pic = "\CA\warfare2\Images\rank_colonel.paa"};
};
_rankpicture ctrlSetStructuredText parseText format["<img image='%1' />",_pic];
_description ctrlSetText format ["Leader: %1 : Member: %2",name _selected, count units _selected];