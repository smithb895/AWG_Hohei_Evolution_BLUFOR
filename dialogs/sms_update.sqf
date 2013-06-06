//by psycho
disableSerialization;
_dialog = findDisplay 71000;
_list = _dialog displayCtrl 71001;
_smpicture = _dialog displayCtrl 71002;
_description1 = _dialog displayCtrl 71004;
_description2 = _dialog displayCtrl 71005;
_bounty = _dialog displayCtrl 71006;

if(isNil "sm_index") then {sm_index = 0};
lbClear _list;
_i = 0;

while {_i < count EVO_SM_List} do {
	_name = (EVO_SM_List select _i) select 0;
	_pic = (EVO_SM_List select _i) select 2;
	_list lbAdd _name;
	_list lbSetPicture [_i, _pic];
	_i = _i + 1;
};

if(lbCurSel _list < 0) then {
	_list lbSetCurSel sm_index;
} else {
	sm_index = lbCurSel _list;
};

_selected = EVO_SM_List select (sm_index max 0);
_pic = _selected select 2;
_smpicture ctrlSetStructuredText parseText format["<img image='%1' />",_pic];
_description1 ctrlSetText (_selected select 0);
_description2 ctrlSetText (_selected select 1);
_bounty ctrlSetText str (_selected select 3);