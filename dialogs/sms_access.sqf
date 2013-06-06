//by psycho
private ["_type","_bounty"];
disableSerialization;
_dialog = findDisplay 71000;
_list = _dialog displayCtrl 71001;
sm_index = lbCurSel _list;

_bounty = (EVO_SM_List select sm_index) select 3;
_type = (EVO_SM_List select sm_index) select 4;
_launch = [player,_type,_bounty] execVM "dialogs\select_sm.sqf";