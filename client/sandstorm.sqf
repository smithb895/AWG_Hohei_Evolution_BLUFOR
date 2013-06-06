#include "setup.sqf"
// by psycho
//sanddustscript for evo-oa
#define __condition_sand (vehicle player in list sandstorm1 || vehicle player in list sandstorm2)
private ["_ct","_brightness","_contrast","_offset","_blendintensity","_colorintensity","_overCast","_p"];

if (!X_Client) exitWith {};
_p = player;

_sanddust = 		//---spawn dusty clouds
{
	_obj = vehicle player;
	_pos = position _obj;
	_color = [1.0, 0.8, 0.4];
	_alpha = 0.1 + random 0.05;

	_Wave = "#particlesource" createVehicleLocal getpos player;
	_Wave setParticleParams 
	[
	/*Sprite*/				["\Ca\Data\ParticleEffects\Universal\Universal", 16, 7, 48], "", 
	/*Type*/					"Billboard", 
	/*TimmerPer*/				5, 
	/*Lifetime*/				20/2, 
	/*Position*/				[0, 0, 0],
	/*MoveVelocity*/			[0, 0, 0], 
	/*Simulation*/				0, 2, 1, 0, 
	/*Scale*/				[50, 100], 
	/*Color*/					[_color + [0], _color + [_alpha], _color + [0]],
	/*AnimSpeed*/			[1,0.5],

	/*randDirPeriod*/			0.1,		//zeit in sek der änderung
	/*randDirIntesity*/			1,			//geschwindigkeit in m/s

	/*onTimerScript*/			"",
	/*DestroyScript*/			"",
	/*Object*/				_obj
	];

	_Wave setParticleCircle [50, [-40, -40, 2.5]];
	_Wave setDropInterval 0.01;

	waitUntil {!__condition_sand};
	deleteVehicle _wave;
};


//---deep color effects
_colors = {
	_ct = 0.5;
	_brightness_max = 1.008;
	_brightness = 1.000;
	_contrast_max = 1.40;
	_contrast = 1.00;
	_offset_max = -0.05;
	_offset = 0.00;
	_blendintensity_max = 0.30;
	_blendintensity = 0.00;
	_colorintensity_max = 0.85;
	_colorintensity = 1.00;

	while {_brightness <= _brightness_max} do {
		if (!__condition_sand) exitWith {};
		_brightness = _brightness+0.02; sleep _ct;"colorCorrections" ppeffectenable true;
		"colorCorrections" ppeffectadjust [_brightness, _contrast, _offset, [0.4, 0.3, 0.2, _blendintensity], [1, 0.8, 0.2, _colorintensity], [1, 1, 1, 1]];
		"colorCorrections" ppEffectCommit 0;
	};
	while {_contrast <= _contrast_max} do {
		if (!__condition_sand) exitWith {};
		_contrast = _contrast+0.05; sleep _ct;"colorCorrections" ppeffectenable true;
		"colorCorrections" ppeffectadjust [_brightness, _contrast, _offset, [0.4, 0.3, 0.2, _blendintensity], [1, 0.8, 0.2, _colorintensity], [1, 1, 1, 1]];
		"colorCorrections" ppEffectCommit 0;
	};
	while {_offset >= _offset_max} do {
		if (!__condition_sand) exitWith {};
		_offset = _offset-0.01; sleep _ct;"colorCorrections" ppeffectenable true;
		"colorCorrections" ppeffectadjust [_brightness, _contrast, _offset, [0.4, 0.3, 0.2, _blendintensity], [1, 0.8, 0.2, _colorintensity], [1, 1, 1, 1]];
		"colorCorrections" ppEffectCommit 0;
	};
	while {_blendintensity <= _blendintensity_max} do {
		_blendintensity = _blendintensity+0.05; sleep _ct;"colorCorrections" ppeffectenable true;
		"colorCorrections" ppeffectadjust [_brightness, _contrast, _offset, [0.4, 0.3, 0.2, _blendintensity], [1, 0.8, 0.2, _colorintensity], [1, 1, 1, 1]];
		"colorCorrections" ppEffectCommit 0;
	};
	while {_colorintensity >= _colorintensity_max} do {
		if (!__condition_sand) exitWith {};
		_colorintensity = _colorintensity-0.05; sleep _ct;"colorCorrections" ppeffectenable true;
		"colorCorrections" ppeffectadjust [_brightness, _contrast, _offset, [0.4, 0.3, 0.2, _blendintensity], [1, 0.8, 0.2, _colorintensity], [1, 1, 1, 1]];
		"colorCorrections" ppEffectCommit 0;
	};
	//unsharpness
	while {__condition_sand} do {
		"dynamicblur" ppeffectenable true;
		_rand1 = 0.3 + (random 0.3);
		"dynamicblur" ppeffectadjust [0.2 +(random 0.4)];
		"dynamicblur" ppeffectcommit _rand1;
		sleep _rand1;
		"dynamicblur" ppeffectadjust [random 0.02];
		"dynamicblur" ppeffectcommit 0.2+(random 2);
		sleep 5 + (random 8);
	};
};

//---back to deffault colors
_no_colors = {
	_ct = 0.5;
	_brightness = 1.008;
	_brightness_normal = 1.000;
	_contrast = 1.40;
	_contrast_normal = 1.00;
	_offset = -0.05;
	_offset_normal = 0.00;
	_blendintensity = 0.30;
	_blendintensity_normal = 0.00;
	_colorintensity = 0.85;
	_colorintensity_normal = 1.00;

	while {_brightness >= _brightness_normal} do {
		_brightness = _brightness-0.02; sleep _ct;"colorCorrections" ppeffectenable true;
		"colorCorrections" ppeffectadjust [_brightness, _contrast, _offset, [0.4, 0.3, 0.2, _blendintensity], [1, 0.8, 0.2, _colorintensity], [1, 1, 1, 1]];
		"colorCorrections" ppEffectCommit 0;
	};
	while {_contrast >= _contrast_normal} do {
		_contrast = _contrast-0.05; sleep _ct;
		"colorCorrections" ppeffectadjust [_brightness, _contrast, _offset, [0.4, 0.3, 0.2, _blendintensity], [1, 0.8, 0.2, _colorintensity], [1, 1, 1, 1]];
		"colorCorrections" ppEffectCommit 0;
	};
	while {_offset <= _offset_normal} do {
		_offset = _offset+0.01; sleep _ct;
		"colorCorrections" ppeffectadjust [_brightness, _contrast, _offset, [0.4, 0.3, 0.2, _blendintensity], [1, 0.8, 0.2, _colorintensity], [1, 1, 1, 1]];
		"colorCorrections" ppEffectCommit 0;
	};
	while {_blendintensity >= _blendintensity_normal} do {
		_blendintensity = _blendintensity-0.05; sleep _ct;
		"colorCorrections" ppeffectadjust [_brightness, _contrast, _offset, [0.4, 0.3, 0.2, _blendintensity], [1, 0.8, 0.2, _colorintensity], [1, 1, 1, 1]];
		"colorCorrections" ppEffectCommit 0;
	};
	while {_colorintensity <= _colorintensity_normal} do {
		_colorintensity = _colorintensity+0.05; sleep _ct;
		"colorCorrections" ppeffectadjust [_brightness, _contrast, _offset, [0.4, 0.3, 0.2, _blendintensity], [1, 0.8, 0.2, _colorintensity], [1, 1, 1, 1]];
		"colorCorrections" ppEffectCommit 0;
	};
	"colorCorrections" ppeffectenable false;
};

// bring sand in players eyes
_unsharpness = {
	private ["_rand1"];
	while {__condition_sand} do {
		"dynamicblur" ppeffectenable true;
		_rand1 = 0.3 + (random 0.3);
		"dynamicblur" ppeffectadjust [0.2 +(random 0.4)];
		"dynamicblur" ppeffectcommit _rand1;
		sleep _rand1;
		"dynamicblur" ppeffectadjust [random 0.02];
		"dynamicblur" ppeffectcommit 0.2+(random 2);
		sleep 5 + (random 8);
	};
};

//ensure that it not rainy
_norain = {
	while {__condition_sand} do {
		2 setRain 0.0;
		sleep 5;
	};
};

//---back to deffault viewdistance
_deffaultViewDistance = {
	private ["_i","_loop2"];
	_i = 100;
	for [{_loop2=0}, {_loop2>=10}, {_loop2=_loop2+1}] do {
		if (__condition_sand) then {_loop2 = 11};
		_actdist = viewDistance;
		if (_actdist >= EVO_vdist) then {_loop2 = 11};
		setViewDistance (_actdist + _i);
		sleep 1;
	};
};

//---lower the viewdistance
_lowViewDistance = {
	private ["_i","_loop"];
	_i = 100;
	for [{_loop=0}, {_loop>=10}, {_loop = _loop + 1}] do {
		if (!__condition_sand) then {_loop = 11};
		_actdist = viewDistance;
		setViewDistance (_actdist - _i);
		sleep 1;
	};
};

//---wind and windound
_wind_sound = {
	private ["_delay","_ran"];
	While {__condition_sand} do {
		setwind [0.201112,0.204166,true];
		_ran = ceil random 5;
		playsound format ["wind_%1",_ran];
		setwind [0.201112*2,0.204166*2,false];
		sleep (random 1);
		_delay = 3 + random 5;
		sleep _delay;
	};
};





//----conditioner
for [{_loop=0}, {_loop<1}, {_loop=_loop}] do {
	waitUntil {__condition_sand};
	if ((speed vehicle player) > 100) then {
		8 setOvercast 0.85;
	} else {
		if ((speed vehicle player) > 25) then {
			15 setOvercast 0.85;
		} else {
			if ((speed vehicle player) < 25) then {
				25 setOvercast 0.85;
			};
		};
	};
	[] spawn _norain;
	[] spawn _lowViewDistance;
	[] spawn _wind_sound;
	sleep 0.1;
	//[] spawn _colors;
	[] spawn _sanddust;
	[] spawn _unsharpness;

	waitUntil {!__condition_sand || !alive player};
	[] spawn _deffaultViewDistance;
	setwind [0.101112,0.104166,false];
	2 setRain 0.0;
	"dynamicblur" ppeffectenable false;
	
	_overCast = X_JIPH getVariable "e_overcast";
	if (alive player) then {
		if ((speed vehicle player) > 100) then {
			8 setOvercast _overCast;
		} else {
			if ((speed vehicle player) > 25) then {
				15 setOvercast _overCast;
			} else {
				if ((speed vehicle player) < 25) then {
					25 setOvercast _overCast;
				};
			};
		};
	} else {
		waitUntil {alive player};
		if (!__condition_sand) then {
			0 setOverCast _overCast;
		};
	};
	//[] spawn _no_colors;
	sleep 3.421;
};