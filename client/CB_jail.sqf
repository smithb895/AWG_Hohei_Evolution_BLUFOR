//by psycho
if (not (local player)) exitwith {};
private ["_loop","_loop2","_score","_scoreact","_i"];
_score = score player;

banana = {
while {alive player} do {
		playSound "Jay";
		sleep 3.6;
	};
};

jail_in = {
	waitUntil {alive player};
	disableUserInput true;
	removeallweapons player;
	sleep 0.01;
	player setpos position jail;
	player setdir 0;
	//[] exec "tcb_scripts\licht.sqs";
	bancount = bancount + 1;
	[] spawn banana;

	if (bancount == 2) exitWith {hint "press Alt+F4 to escape from prison.";};
	hint "You have been punished for having a negitive score. You will regain control after you have served your sentence of 60 seconds.";
	_i = -60;

	while {_i < 0} do {
		titleText [format ["%1",_i],"plain down"];
		_i = _i + 1;
		sleep 1;
	};

	sleep 0.4;
	player setdammage 1;
	disableUserInput false;
};



for [{_loop=0}, {_loop<1}, {_loop=_loop}] do {
	sleep 1;
	_score = score player;
	for [{_loop2=0}, {_loop2<120}, {_loop2=_loop2+1}] do {
		sleep 1;
		_scoreact = score player;
		if (_scoreact < 0) then {
			if (not (_scoreact == _score)) then {_loop = 1; _loop2 = 120; [player] call jail_in};
			if (_scoreact == _score) then {
				while {score player != 0} do {
					player addScore 1;
					sleep 0.2;
				};
				_score = score player;
				_scoreact = score player;
				_loop2 = 120;
			};
		};
		if (_scoreact+5 <= _score) then {
			if (score player >= 10) then {player addScore -10;};
			_loop = 1;
			_loop2 = 120;
			[player] call jail_in;
		};
		if (not (alive player)) exitWith {_loop = 1; _loop2 = 120;};
	};
	if (not (alive player)) exitWith {_loop = 1; _loop2 = 120;};
};