//by psycho
private ["_killer","_player"];
_player = _this select 0;
_killer = _this select 1;

if(!(isPlayer _killer) and (side _killer == side _player)) then {
	_txtpasshead = localize "STR_M04t85";
	_txtpassbody = format[localize "STR_M04t87",name (leader _killer)];
	[EVO_grey,_txtpasshead,_txtpassbody] call BIS_EVO_Message;
};

if ((date select 3) < 4 or (date select 3) > 20) then {camUseNVG false} else {camUseNVG false};

_camera = "camera" camCreate [(position _player select 0)-0.75, (position _player select 1)-0.75,(position _player select 2) + 0.5];
_camera cameraEffect ["internal","back"];
_camera camSetFOV 1;
_camera camSetTarget vehicle _player;
if (vehicle player != player) then {
	_camera camSetRelPos [0,10,1];
} else {
	_camera camSetRelPos [0,2,1]
};
_camera camCommit 0;
waitUntil {camCommitted _camera}; // Look at player
sleep 2.0;

if (!(isNull vehicle _killer) and _killer != _player) then {
	_camera camSetTarget vehicle _killer;
} else {
	_camera camSetTarget vehicle _player;
};
_camera camSetFOV 0.2;
_camera camCommit 4;
waitUntil {camCommitted _camera}; //look at killer
Sleep 3.0;

titleCut["", "BLACK out",2];
Sleep 2.0;

_camera camPreparePos position player;
_camera camPrepareFOV 1;
_camera camCommitPrepared 0;

player cameraEffect ["terminate","back"];
camUseNVG false;
camDestroy _camera;
titleCut["", "BLACK in",2];
sleep 2.1;