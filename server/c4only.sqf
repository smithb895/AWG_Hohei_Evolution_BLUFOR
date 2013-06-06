// ensures the player uses a satchel to destroy the radio tower.
private ["_bomb","_man","_loop","_radio"];
_radio = _this select 0;
["allow_dam",[_radio,false]] call XNetCallEvent;
_loop = 0;
_bomb = objNull;

while {_loop != 1} do {
	_man = objNull;
	_bomb = objNull;
	sleep 0.5;
	_bomb = (_radio nearObjects ["PipeBomb", 12]) select 0;
	if (!isNull _bomb) then {
		_man = (nearestObjects [_bomb, ["Man"], 5]) select 0;
		WaitUntil {!alive _man || isNull _bomb || isNull _man};
		sleep 0.02;
		if (!alive _man || isNull _man) then {
			deletevehicle _bomb;
		} else {
			["allow_dam",[_radio,true]] call XNetCallEvent;
			_radio setdamage 1;
			["p_add_score",[_man,EVO_radio_score]] call XNetCallEvent;
			_loop = 1;
		};
	};
};