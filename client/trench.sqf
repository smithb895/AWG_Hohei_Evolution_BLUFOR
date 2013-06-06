#include "setup.sqf"
if (player in list AirportIn) exitWith {
	_head = localize "STR_a_error";
	_body = localize "STR_a_impossible";
	[EVO_brown,_head,_body,"stop"] call EVO_Message;
};
_id = _this select 2;
player removeaction _id;
deletevehicle ctent;

player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 3.0;
WaitUntil {animationState player != "AinvPknlMstpSlayWrflDnon_medic"};
if (!alive player) exitWith {};

_global_pos = player modelToWorld [-0.7,0.7,0];
_global_dir = direction player;
#ifndef __A2__
	_type = "Fort_EnvelopeSmall_EP1";
#else
	_type = "Fort_EnvelopeSmall";
#endif

_pos = player modeltoworld [0,1,0];
_pos set [2, 0];
_dir = direction player;
ctent = createVehicle [_type, _pos, [], 0, "NONE"];
ctent setdir _dir;
ctent setPos _pos;

__sleep;
_actionId8 = player addAction [localize "STR_a_trench" call XGreyText, "client\trench.sqf",0,1, false, true,"test2"];