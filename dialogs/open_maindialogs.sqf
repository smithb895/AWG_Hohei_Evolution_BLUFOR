//by psycho
_dialog = _this select 0;
call EVO_listBox;
_UID = getPlayerUID player;


switch (_dialog) do {
	case player : {createDialog "evo_mainUI";};
	case "HQ" : {createDialog "evo_hq_request"};
	case "Options" : {createDialog "evo_options"};
	//case "Groups" : {createDialog "evo_groups"};
	case "Recruiting" : {createDialog "evo_recruit"};
	//case "Sidemissions" : {createDialog "evo_sms"};
	if (_UID in Evo_Admins) then {
	case "evo_admin" : {createDialog "evo_admin"};
};
	default {hint format ["Error, You have insufficient rights for: %1",_dialog]};
};