//by psycho
private ["_grp","_joiner"];
_grp = _this select 0;
_joiner = _this select 1;

if (request_is_set) exitWith {
	_head = localize "STR_a_abbort";
	_body = localize "STR_i_nopos";
	["evo_message",[EVO_brown,_head,_body,"stop",_joiner]] call XNetCallEvent;
};
request_is_set = true;

_mess = format ["Recruit %1", name _joiner];
_mess1 = localize "STR_a_reject";
_head = localize "STR_i_requ";
_body = format [localize "STR_i_jrequ",name _joiner];
[EVO_blue,_head,_body,"info"] call EVO_Message;

_vec = vehicle player;
evo_id1 = _vec addAction [_mess call XYellowText, "client\accept_join_request.sqf",[_joiner,1],99, true, true];
evo_id2 = _vec addAction [_mess1 call XYellowText, "client\accept_join_request.sqf",[_joiner,0],99, true, true];

sleep 30.0;
request_is_set = false;
_vec removeAction evo_id1;
_vec removeAction evo_id2;
if (group _joiner != group player) then {
	_head = localize "STR_i_info";
	_body = localize "STR_i_nopos";
	["evo_message",[EVO_brown,_head,_body,"stop",(_a select 0)]] call XNetCallEvent;
};