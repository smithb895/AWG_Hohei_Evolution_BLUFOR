// The Short intro
private ["_camstart","_camera"];
#include "setup.sqf"
titleCut["", "BLACK IN", 2];
__waitpl;
enableRadio false;
showCinemaBorder false;
"dynamicblur" ppeffectenable true;
"dynamicblur" ppeffectadjust [3];
"dynamicblur" ppeffectcommit 0;
"dynamicblur" ppeffectadjust [0];
"dynamicblur" ppeffectcommit 3;

#ifndef __OA__
playMusic "Short01_Defcon_Three";
#else
playMusic "EP1_Track01D";
#endif
if (daytime > 20.50 || daytime < 4.15) then {camUseNVG false};

_camstart =  EVO_cam_prepare;
_camera = "camera" CamCreate [(position _camstart select 0), (position _camstart select 1) + 1, 50];
_camera cameraEffect ["internal","back"];
waitUntil {preloadCamera position _camstart};
_camera camSetTarget player;
_camera camPrepareFOV 1.00;
_camera camCommitPrepared 0;
waitUntil {camCommitted _camera};
sleep 0.5;

_camera camSetTarget player;
_camera camSetPos [(position EVO_cam1 select 0), (position EVO_cam1 select 1) , 10];
_camera camPrepareFOV 1.00;
_camera camCommit 12;
#ifdef __BLUE__
TitleRsc["Evo_color_blue_1","PLAIN"];
#else
TitleRsc["Evo_color_red_1","PLAIN"];
#endif
sleep 3;
playSound "counter";
#ifdef __BLUE__
TitleRsc["Evo_color_blue_2","PLAIN"];
#else
TitleRsc["Evo_color_red_2","PLAIN"];
#endif
sleep 0.03;
playSound "counter";
sleep 0.04;
playSound "counter";
sleep 2;
#ifndef __A2__
[localize "STR_welcome", name player, "the Evolution must go on!"] spawn BI_fnc_infoText;
#endif
sleep 4;
titleCut ["","Withe out",0.6];
sleep 0.5;
waitUntil {camCommitted _camera};

_camera camPrepareTarget position player;
_camera camSetPos [(position EVO_cam2 select 0), (position EVO_cam2 select 1) , 3];
_camera camCommit 0;
waitUntil {camCommitted _camera};

_camera camSetTarget player;
_camera camSetPos [(position player select 0), (position player select 1), 1.5];
titleCut ["","Withe in",0.8];
sleep 0.4;
_camera camPrepareFOV 1.00;
_camera camCommit 6.6;
sleep 3;
titleCut ["","Withe out",0.6];
waitUntil {camCommitted _camera};

player cameraEffect ["terminate","back"];
camDestroy _camera;
titleCut ["","Withe in",0.8];
sleep 0.4;
EVO_intro_done = true;

enableRadio true;
"dynamicBlur" ppEffectEnable false;
sleep 15;
(localize "STR_welcome2") call XfGlobalChat;
sleep 40;
(localize "STR_welcome3") call XfGlobalChat;