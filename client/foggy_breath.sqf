// Foggy breath 20110122
// modified by Xeno
// remodified by psycho
#include "setup.sqf"
#define __condition_fog (vehicle player in list foggy1 || vehicle player in list foggy2)
#define __condition_night (daytime > 20.50 || daytime < 4.15)
#define __condition_winter (X_JIPH getVariable 'e_winterw' == 1)
private ["_unit", "_int","_source","_fog","_pos","_ps"];
if (!X_Client || EVO_breath_script_in_progress) exitWith {};
_unit = _this select 0;
_int = _this select 1; //intensity of fog (0 to 1)
EVO_breath_script_in_progress = true;

	
while {(alive _unit && __condition_fog) || (alive _unit && __condition_night) || (alive _unit && __condition_winter)} do {
	sleep (2 + random 2);
	_source = "logic" createVehicleLocal (getpos _unit);
	_fog = "#particlesource" createVehicleLocal getpos _source;
	_fog setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 12, 13,0],
	"",
	"Billboard",
	0.5,
	0.5,
	[0,0,0],
	[0, 0.2, -0.2],
	1, 1.275,	1, 0.2,
	[0, 0.2,0],
	[[1,1,1, _int], [1,1,1, 0.01], [1,1,1, 0]],
	[1000],
	1,
	0.04,
	"",
	"",
	_source];
	_fog setParticleRandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
	_fog setDropInterval 0.001;
	_source attachto [_unit,[0,0.15,0], "neck"];
	sleep 0.5;
	deletevehicle _source;
	deleteVehicle _fog;
};

EVO_breath_script_in_progress = false;
deletevehicle _source;
deleteVehicle _fog;