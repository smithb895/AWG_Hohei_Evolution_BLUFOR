//by psycho
private ["_unit","_desc","_list","_grp","_grpzise"];
disableSerialization;
_dialog = findDisplay 70000;
_list = _dialog displayCtrl 70001;
_desc = _dialog displayCtrl 70005;
groups_index = lbCurSel _list;

_unit = EVO_plist select groups_index;

// eigene Gruppe kann nicht verlassen werden wenn zeitgleich leader der Gruppe --> exit
if ((player in units group _unit) and (player == leader group _unit)) exitWith {_desc ctrlSetText localize "STR_i_owngroup"};

// Gruppe verlassen wenn Spieler nicht der Leader ist --> exit
if ((player in units group _unit) and (player != leader group _unit)) exitWith {
	_head = localize "STR_i_info";
	_body = format [localize "STR_i_another_player_dimissed",name player];
	["evo_message",[EVO_brown,_head,_body,"info",leader group _unit]] call XNetCallEvent;
	[player] joinSilent grpNull;
	_txt = localize "STR_d_player_dimissed";
	_txt call XfGlobalChat;
};

if ((player != leader group player) and (isPlayer (leader group player))) exitWith {
	_desc ctrlSetText localize "STR_d_dismiss_first";
};

_grp = group player;
_grpzise = (count units _grp) - 1;
if (_grpzise > 0) then {
	{
		if ((_x != leader _grp) and !(isPlayer _x)) then {
			if (_x != vehicle _x) then {moveOut vehicle _x};
			[_x] joinSilent grpNull;
			_x setDamage 1;
			deleteVehicle _x;
		};
		if ((_x != leader _grp) and (isPlayer _x)) then {[_x] joinSilent grpNull};
		__sleep
	} forEach units _grp;
};

["evo_join_request",[group _unit, player]] call XNetCallEvent;
_head = localize "STR_i_info";
_body = localize "STR_i_request_is_set";
[EVO_blue,_head,_body,"ok"] call EVO_message;
closeDialog 0;