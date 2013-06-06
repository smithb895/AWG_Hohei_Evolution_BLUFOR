//by psycho
// executed by requested player
private ["_a"];
_a = _this select 3;

if ((_a select 1) == 1) then {
	[(_a select 0)] join (group player);
	_head = localize "STR_i_info";
	_body = localize "STR_i_accept";
	["evo_message",[EVO_brown,_head,_body,"ok",(_a select 0)]] call XNetCallEvent;
} else {
	_head = localize "STR_i_info";
	_body = localize "STR_i_nopos";
	["evo_message",[EVO_brown,_head,_body,"stop",(_a select 0)]] call XNetCallEvent;
};

player removeAction evo_id1;
player removeAction evo_id2;