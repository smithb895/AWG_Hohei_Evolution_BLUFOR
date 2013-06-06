//by psycho
disableSerialization;
_dialog = findDisplay 991;
_rank = _dialog displayCtrl 1009;
_playtime = _dialog displayCtrl 66012;
_supp_points = _dialog displayCtrl 66013;

sleep 0.02;
_rank ctrlSetText (rank player);
_supp_points ctrlSetText str (CB_suppoints);

_timestr = (time / 3600) call EVO_timetostring;
_playtime ctrlSetText _timestr;