//by psycho
private ["_p","_ubp","_nodo","_num"];
_p = player;
_ubp = unitBackpack _p;
_nodo = false;
_pweps = weapons _p;
_num = count _pweps;

for [{_i = 0},{_i <= (_num - 1)},{_i = _i+1}] do {
	if ((_pweps select _i) in EVO_launchers) then {
		_nodo = true;
	};
};
if (_nodo) exitWith {
	_txtpasshead = localize "STR_o_wsfailhead";
	_txtpassbody = localize "STR_o_bpfail";
	[EVO_brown,_txtpasshead,_txtpassbody,"stop"] call EVO_Message;
};
if (!isNull _ubp) then {
	removeBackpack _p;
};
_p addBackPack (bon_getbackpack_backpacks select bon_getbackpack_index);
execVM "client\func\saveloadout.sqf";