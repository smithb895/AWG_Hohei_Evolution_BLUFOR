//by psycho
#include "setup.sqf"
bancount = 0;
sleep 10;


while {true} do {
	waitUntil {alive player};
	_score_1 = score player;
	sleep 30;
	_score_2 = score player;
	if ((_score_2 + 5) <= _score_1) then {
		waitUntil {alive player};
		disableUserInput true;
		removeallweapons player;
		player allowDamage false;
		player setpos position EVO_jail;
		player setdir 0;
		bancount = bancount + 1;
		_trg = [position EVO_jail, [3, 3, 0, false], [EVO_own_side, "PRESENT", true], ["vehicle player in thisList", "psy = [] spawn {while {vehicle player in thisList} do {playSound 'jay'; sleep 3.6;}};", ""]] call XfCreateTrigger;
		//_trg setSoundEffect ["Jay","Jay","",""];

		if (bancount >= 3) exitWith {hint "press Alt+F4 to escape from prison."};
		if (bancount == 2) then {
			_r_num = rankID player;
			if (_r_num > 0) then {
				_new_r_num = _r_num - 1;
				switch (_new_r_num) do {
					case (5) : {while {score player > 150} do {player addScore -1; sleep 0.1;}};
					case (4) : {while {score player > 95} do {player addScore -1; sleep 0.1;}};
					case (3) : {while {score player > 60} do {player addScore -1; sleep 0.1;}};
					case (2) : {while {score player > 35} do {player addScore -1; sleep 0.1;}};
					default {};
				};
			};
		};
		if (score player >= 10) then {player addScore -10};
		hint "You have been punished for having a negative score. You will regain control after you have served your sentence of 60 seconds.";
		_i = -60;
		while {_i <= 0} do {
			titleText [format ["%1", round _i], "plain down"];
			_i = _i + 1;
			sleep 1;
		};

		sleep 0.4;
		deletevehicle _trg;
		player allowDamage true;
		player setdammage 1;
		disableUserInput false;
	};
};