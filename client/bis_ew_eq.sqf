//bis earthquake			<--- angepasst für evo by psycho

Switch (_This) do {
Case "BIS_Earthquake": {
	for [{_n = 1},{_n <= 3},{_n = _n+1}] do {
		_This = Vehicle Player;
		Playsound "eq";
		For "_i" from 0 to 140 do {
			_vx = vectorup _this select 0;
			_vy = vectorup _this select 1;
			_vz = vectorup _this select 2;
			_coef = 0.01 - ((Random 0.0004) * _i);
			_This setvectorup [
				_vx+(-_coef+random (2*_coef)),
				_vy+(-_coef+random (2*_coef)),
				_vz+(-_coef+random (2*_coef))
			];
			sleep (0.01 + random 0.01);
		};
		sleep (5 + Random 10);
	};
};
Default {HintC "Error in Mainfunction";};
};