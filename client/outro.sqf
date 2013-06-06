//by psycho
#include "setup.sqf"
private ["_vp", "_pos", "_val", "_light", "_rand", "_state"];

if (!X_Client) exitWith {};
if (vehicle Player != player) then {moveOut player};
_vp = vehicle Player;
removeallweapons _vp;
_vp setDamage 0;
_vp allowDamage false;
0 setFog 0.9;
setViewDistance 300;

_XfGetRanPointCircleOld = {
	private ["_center", "_radius", "_center_x", "_center_y", "_ret_val", "_co", "_angle", "_x1", "_y1"];
	_center = _this select 0;_radius = _this select 1;
	_center_x = _center select 0;_center_y = _center select 1;
	_ret_val = [];
	for "_co" from 0 to 99 do {
		_angle = floor (random 360);
		_x1 = _center_x - ((random _radius) * sin _angle);
		_y1 = _center_y - ((random _radius) * cos _angle);
		if (!(surfaceiswater [_x1, _y1])) then {_ret_val = [_x1, _y1, 0]};
		if (count _ret_val != 0) exitWith {};
	};
	_ret_val
};

#ifdef __Takistan__
	_pos = [88.023224,2785.4063,0];	//pos takistan
#else
	_pos = [6533.9546,5599.6831,0]; // pos chernarus
#endif

_ps = "#particlesource" createVehicleLocal _pos;
_ps setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 10, [0, 0, -6], [0, 0, 0], 1, 1.275, 1, 0, [4], [[1, 1, 1, 0], [1, 1, 1, 0.04], [1, 1, 1, 0]], [1000], 1, 0, "", "", nul];
_ps setParticleRandom [3, [40, 40, 0], [0, 0, 0], 2, 0.5, [0, 0, 0, 0.1], 0, 0];
_ps setParticleCircle [0.1, [0, 0, 0]];
_ps setDropInterval 0.01;


_lightshow = {
	private ["_l"];
	_l = _this select 0;
	while {true} do {
	  sleep 0.501;
	_rand = 4 call XfRandomFloor;
		switch (_rand) do {
			case 0:{_l setLightAmbient [0.5,0.0,0.0]};
			case 1:{_l setLightAmbient [0.3,0.3,0.0]};
			case 2:{_l setLightAmbient [0.0,0.3,0.5]};
			case 3:{_l setLightAmbient [0.3,0.0,0.5]};    
		};
	};
};
	
for "_i" from 0 to 8 do {
	_val = [_pos, 20] call _XfGetRanPointCircleOld;
	_light = "#lightpoint" createVehicleLocal _val;
	[_light,5] call XfSetHeight;
	_light setLightBrightness 0.2;
	_light setLightColor [0.05, 0.05, 0.05];
	[_light] spawn _lightshow;
};

_point = [_pos, 13] call _XfGetRanPointCircleOld;
titletext ["", "BLACK IN",1];
setDate [2011, 7, 28, 0, 0];
_vp setPos _point;
 
 0 fadeSound 0.7;
[] spawn {
	while {true} do {
		playSound "disco";
		sleep 7;
	};
};

while {true} do {
	titletext ["Victory!", "Plain",10];
	_ra = ["ActsPercMstpSnonWnonDnon_DancingStefan","ActsPercMstpSnonWnonDnon_DancingDuoIvan","ActsPercMstpSnonWnonDnon_DancingDuoStefan"] call XfRandomArray;
	_vp playMove (_ra select 0);
	sleep 3;
	_state = animationState _vp;
	waitUntil {(animationState _vp != _state) or (__XJIPGetVar(EVO_end_is_near))};
	if (__XJIPGetVar(EVO_end_is_near)) then {EVO_real_end = true};
};
