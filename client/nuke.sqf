//shroom
_base = _this select 0;
_type = _this select 1;
_crate1 = "#particlesource" createVehicleLocal position _base;
_crate2 = "#particlesource" createVehicleLocal position _base;
_crate3 = "#particlesource" createVehicleLocal position _base;
_crate3b = "#particlesource" createVehicleLocal position _base;
_crate3c = "#particlesource" createVehicleLocal position _base;
switch (_type) do {
	 case 4: {
		//napalm
		_crate1 setParticleCircle [0, [0, 0, 0]];	
		_crate1 setParticleRandom [0, [50.25, 50.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_crate1 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 8, 1, 8], "", "Billboard", 1, 10.5, [0, 0, 0], [0, 0, 0.75], 0, 10, 7.9, 0.075, [1.2, 6, 4, 7], [[1, 1, 1, 1], [0, 0, 0, 0.5], [0.1, 0.1, 0.1, 0.5], [0.1, 0.1, 0.1, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
		_crate1 setDropInterval 0.01;
		sleep 120.0;
	};
	case 5: {
		//gas
		_crate1 setParticleCircle [0, [1, 0, 0]];
		_crate1 setParticleRandom [0, [0.25, 0.25, 0], [5.175, 5.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_crate1 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 8, 1, 8], "", "Billboard", 1, 10.5, [0, 0, 0], [0, 0, 0.75], 0, 10, 7.9, 0.075, [25, 50, 4], [[0.1, 0.3, 0.1, 0.2], [0, 0.3, 0, 0.1], [0, 0.3, 0, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
		_crate1 setDropInterval 0.01;
		sleep 120.0;
	};
	case 6: {
		//nuke
		_pos = position _base;
		NukePos setPos _pos;
		_nuke = "Barrel4" createVehicleLocal _pos;
		_nuke setpos [_pos select 0,_pos select 1,(_pos select 2)+2000];
		//missile
		_crate3b setParticleCircle [0, [0, 0, 0]];
		_crate3b setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_crate3b setParticleParams [["\Ca\Data\cl_exp_cloud02.p3d", 8, 1, 8], "", "Billboard", 1, 6, [0, 0, 0], [0, 0, 3.75], 0, 11, 6.9, 0.075, [1, 2, 0.5], [[0.2, 0.2, 1, 1], [0.0, 0.0, 1, 0.5]], [0.08], 1, 0, "", "", _nuke];
		_crate3b setDropInterval 0.001;
		sleep 20;
		playSound "r_incoming";
		sleep 5;

		// edit by psycho ///////////////////////////////////////////////////////
		if(player distance _nuke < 1500) then {
			"BIS_NuclearExplosion" execVM "client\bis_ew_nuke.sqf";
			"BIS_Earthquake" execVM "client\bis_ew_eq.sqf";
		};
		////////////////////////////////////////////////////////////////////////
		
		//First dome
		_crate3b setParticleCircle [0, [0, 0, 0]];
		_crate3b setParticleRandom [0, [70.25, 70.25, 0], [10.175, 10.175, 0], 0, 0, [0, 0, 0, 0], 0, 0];
		_crate3b setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 8, 4, 8], "", "Billboard", 1, 2.5, [0, 0, 0], [0, 0, -20], 0, 88, 24.9, 0.075, [100], [[1, 1, 1, 1], [1, 1, 1, 0.7], [1, 1, 1, 0], [1, 1, 1, 0]], [0.08, 0.03, 0.08], 2, 0, "", "", XXXOBJECTXXX];
		_crate3b setDropInterval 0.003;	
		//sleep 2.0;
		_i = -20;		
		for "_i" from 0 to 200 do {
			if(_i == 0) then {		
				if(player distance _nuke < 1500) then {
					0 fadeSound 0;
					0 fadeRadio 0;
					titleCut ["","WHITE OUT", 0];
					sleep 2.0;
					titleCut ["","WHITE IN", 0];
					5 fadeSound 0.5;
					playSound "explo_large";
					5 fadeRadio 0.5;
				};
			};
		};
		_crate3c setParticleCircle [10, [0, 0, 0]];
		_crate3c setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_crate3c setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 8, 1, 8], "", "Billboard", 1, 10, [0, 0, 0], [0, 0, 10.1], 0, 7, 9.9, 0.075, [20, 20, 20, 40], [[1, 1, 1, 1], [0, 0, 0, 1], [0, 0, 0, 0.5], [5, 5, 5, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
		_crate3c setDropInterval 0.02;
		_crate3b setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 8, 1, 8], "", "Billboard", 1, 10.5, [0, 0, 200], [0, 0, 4], 0, 38, 24.9, 0.075, [50], [[0.3, 0.1 , 0.0, 1], [0.3, 0.0, 0.0, 0.5], [0.3, 0.3, 0.1, 0.2], [1, 1, 0.1, 0]], [0.08, 0.03, 0.08], 2, 0, "", "", XXXOBJECTXXX];
		sleep 120.0;
	};
	case 8: {
		for [{_loop=0}, {_loop<1}, {_loop=_loop}] do {
			_i = 0;
			while {_i < 3} do {
				_crate1 setParticleCircle [0, [0, 0, 0]];
				_crate1 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
				_crate1 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 8, 1, 8], "", "SpaceObject", 1, 12.5, [0, 0, 10], [10, 0, -10.75], 0, 10, 7.9, 0.075, [0.3, 0.3, 0.3], [[0.9, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
				_crate1 setDropInterval 0.01;
				sleep 1.0;
				_crate1 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 10.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
				_crate1 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 8, 1, 8], "", "SpaceObject", 1, 12.5, [0, 0, 10], [10, 0, -10.75], 0, 10, 7.9, 0.075, [0.3, 0.3, 0.3], [[0.9, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
				sleep 0.5;
				_crate1 setParticleRandom [0, [0.25, 0.25, 0], [10.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
				_crate1 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 8, 1, 8], "", "SpaceObject", 1, 12.5, [0, 0, 10], [10, 0, -10.75], 0, 10, 7.9, 0.075, [0.3, 0.3, 0.3], [[0.1, 0.1, 0.9, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];

				sleep 0.5;
				_crate1 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 10.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
				_crate1 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 8, 1, 8], "", "SpaceObject", 1, 12.5, [0, 0, 10], [10, 0, -10.75], 0, 10, 7.9, 0.075, [0.3, 0.3, 0.3], [[0.1, 0.1, 0.9, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];		
				sleep 0.5;
				_crate1 setParticleRandom [0, [0.25, 0.25, 0], [10.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
				_crate1 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 8, 1, 8], "", "SpaceObject", 1, 12.5, [0, 0, 10], [0, 0, -10.75], 0, 10, 7.9, 0.075, [0.3, 0.3, 0.3], [[0.1, 0.1, 0.9, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];		
				sleep 0.5;
				_i = _i +1;
			};
		};
	};
	default {};
};

deletevehicle _crate1;
deletevehicle _crate2;
deletevehicle _crate3;
deletevehicle _crate3c;
sleep 10;
deletevehicle _crate3b;
deletevehicle _base;
