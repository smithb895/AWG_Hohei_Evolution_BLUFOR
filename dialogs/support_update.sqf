//by psycho
disableSerialization;
_dialog = findDisplay 67000;
_list = _dialog displayCtrl 67003;
_previewpicture = _dialog displayCtrl 67004;
_description = _dialog displayCtrl 67005;
_supp_costs = _dialog displayCtrl 67009;
_supp_points = _dialog displayCtrl 67010;

mpklk = {
	private ["_mzise","_pos"];
	_pos = _this select 0;
	"support_marker_location" setMarkerPosLocal _pos;
	support_place_choosen = true;
	_mzise = EVO_client_event_holder getVariable "EVO_supp_markerzise";
	bmark setMarkerSizeLocal [_mzise, _mzise];
};
support_place_choosen = false;
onMapSingleClick "[_pos] call mpklk";

if(isNil "support_index") then {support_index = 0};
lbClear _list;
_i = 0;
while {_i < count EVO_SupList} do {
	_name = (EVO_SupList select _i) select 0;
	_pic = (EVO_SupList select _i) select 5;
	_list lbAdd _name;
	_list lbSetPicture [_i, _pic];
	_i = _i + 1;
};
if(lbCurSel _list < 0) then {
	_list lbSetCurSel support_index;
} else {
	support_index = lbCurSel _list;
};
_selected = EVO_SupList select (support_index max 0);
_pic = _selected select 5;
_previewpicture ctrlSetStructuredText parseText format["<img image='%1' />",_pic];
_supp_points ctrlSetText str (CB_suppoints);
_cost = (EVO_SupList select support_index) select 3;
_supp_costs ctrlSetText str (_cost);
_msize = (EVO_SupList select support_index) select 2;
EVO_client_event_holder setVariable ["EVO_supp_markerzise", _msize];