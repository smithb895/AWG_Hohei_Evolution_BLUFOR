//by psycho
_dialog = _this select 0;
call EVO_listBox;

switch (_dialog) do {
	case player : {createDialog "evo_mainUI";};
	case "HQ" : {createDialog "evo_hq_request"};
	case "Options" : {createDialog "evo_options"};
	case "Groups" : {createDialog "evo_groups"};
	case "Recruiting" : {createDialog "evo_recruit"};
	case "Sidemissions" : {createDialog "evo_sms"};
	case "evo_admin" : {createDialog "evo_admin"};
	default {hint format ["error, default dialog = %1",_dialog]};
};