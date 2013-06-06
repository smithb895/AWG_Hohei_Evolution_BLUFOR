//by psycho
private ["_mrole","_msize","_mcost","_mtime","_mord"];
disableSerialization;
_dialog = findDisplay 67000;
_description = _dialog displayCtrl 67005;
_supp_costs = _dialog displayCtrl 67009;
_supp_points = _dialog displayCtrl 67010;

_list = _dialog displayCtrl 67003;
support_index = lbCurSel _list;

_mrole = (EVO_SupList select support_index) select 0;
_msize = (EVO_SupList select support_index) select 2;
_mcost = (EVO_SupList select support_index) select 3;
_mtime = (EVO_SupList select support_index) select 4;
_mord = (EVO_SupList select support_index) select 6;

if (!EVO_firemission) then {
	if (support_place_choosen) then {
		if (CB_suppoints >= _mcost) then {
			if(AirportIn distance (getMarkerPos "support_marker_location") < 600) then {
				_description ctrlSetText localize "STR_M04t88";//zu dicht an der base
			} else {
				_rec = [_mrole,_msize,_mtime,_mord] execVM "client\csupport.sqf";
				CB_suppoints = CB_suppoints - _mcost;
				_supp_points ctrlSetText str (CB_suppoints);
			};
		} else {
			_description ctrlSetText format[localize "STR_M04t89",_mcost, CB_suppoints];//zu wenig supportpunkte
		};
	} else {
		_description ctrlSetText localize "STR_M04t90"//keine location gewählt
	};
} else {
	_description ctrlSetText localize "STR_M04t91"//firemission in progress
};
EVO_call_support = false;