//by Bon_Inf*
#define BON_BACKPACK_DIALOG 220000
#define BON_BACKPACK_PICTURE 220001
#define BON_BACKPACK_EQUIPBUTTON 220002
#define BON_BACKPACK_LIST 220003
disableSerialization;

WaitUntil{dialog};

_dialog = findDisplay BON_BACKPACK_DIALOG;
_ctrl = _dialog displayCtrl BON_BACKPACK_PICTURE;
_list = _dialog displayCtrl BON_BACKPACK_LIST;

//#include "backpacks.sqf"
if(isNil "bon_getbackpack_index") then {bon_getbackpack_index = 0};


if(lbSize _list == 0) then {
	{
		_name = getText (configFile >> "CfgVehicles" >> _x >> "displayname");
		_list lbAdd _name;
	} foreach bon_getbackpack_backpacks;
};
if(lbCurSel _list < 0) then {_list lbSetCurSel bon_getbackpack_index} else {bon_getbackpack_index = lbCurSel _list};



_backpack = bon_getbackpack_backpacks select (bon_getbackpack_index max 0);

_picture = getText (configFile >> "CfgVehicles" >> _backpack >> "picture");
_ctrl ctrlSetStructuredText parseText format["<img image='%1' />",_picture];