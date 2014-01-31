//by psycho
disableSerialization;
_dialog = findDisplay 69000;
_list = _dialog displayCtrl 69001;
_previewpicture = _dialog displayCtrl 69002;
_primarypicture = _dialog displayCtrl 69003;
_secondarypicture = _dialog displayCtrl 69004;
_accgroup = _dialog displayCtrl 69009;
_maxgroup = _dialog displayCtrl 69010;


if(isNil "recruit_index") then {recruit_index = 0};
lbClear _list;
_i = 0;
while {_i < count EVO_RecList} do {
	_name = ((EVO_RecList select _i) select 1) select 0;
	_pic = ((EVO_RecList select _i) select 1) select 3;
	_list lbAdd _name;
	_list lbSetPicture [_i, _pic];
	_i = _i + 1;
};
if(lbCurSel _list < 0) then {
	_list lbSetCurSel recruit_index;
} else {
	recruit_index = lbCurSel _list;
};

_grp = group player;
_grpzise = (count units _grp) - 1;	//-1 player self
_accgroup ctrlSetText str (_grpzise);
if (player == leader group player) then {
	_ranknum = if ((E_lock == 1) OR ((getPlayerUID player) in Evo_Admins)) then {6} else {rankID player};
	switch (_ranknum) do {
		case 0 : {_maxgroup ctrlSetText str (1)};
		case 1 : {_maxgroup ctrlSetText str (2)};
		case 2 : {_maxgroup ctrlSetText str (4)};
		case 3 : {_maxgroup ctrlSetText str (6)};
		case 4 : {_maxgroup ctrlSetText str (8)};
		case 5 : {_maxgroup ctrlSetText str (10)};
		case 6 : {_maxgroup ctrlSetText str (12)};
		default {};
	};
} else {
	_maxgroup ctrlSetText "0";
};

_selected = EVO_RecList select (recruit_index max 0);
_pic1 = (_selected select 1) select 3;
_previewpicture ctrlSetStructuredText parseText format["<img image='%1' />",_pic1];
_pic2 = (_selected select 1) select 1;
_primarypicture ctrlSetStructuredText parseText format["<img image='%1' />",_pic2];
_pic3 = (_selected select 1) select 2;
_secondarypicture ctrlSetStructuredText parseText format["<img image='%1' />",_pic3];