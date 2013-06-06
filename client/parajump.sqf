#include "setup.sqf"
private ["_realpos"];
player removeAction (_this select 2);

if (!(player in list AirportIn)) exitWith {
	_head = localize "STR_a_error";
	_body = localize "STR_a_impossible3";
	[EVO_brown,_head,_body,"stop"] call EVO_Message;
	_actionId9 = player addAction [localize "STR_a_halo" call XGreyText, "client\parajump.sqf",0,1, false, true,"test2"];
};

#ifdef __ACE__
if !(player hasWeapon "ACE_ParachutePack") exitWith {
	_head = localize "STR_a_error";
	_body = localize "STR_a_nopara";
	[EVO_brown,_head,_body,"stop"] call EVO_Message;
	_actionId9 = player addAction [localize "STR_a_halo" call XGreyText, "client\parajump.sqf",0,1, false, true,"test2"];
};
#endif

global_jump_pos = [];

if (__A2only) then {
	(localize "STR_i_openmap") call XfGlobalChat;
	if (visibleMap) then {onMapSingleclick "global_jump_pos = _pos"};
} else {
	openMap [true, false];
	(localize "STR_i_openmap2") call XfGlobalChat;
	if (visibleMap) then {onMapSingleclick "global_jump_pos = _pos"};
};

waitUntil {(count global_jump_pos > 0) || !alive player};
onMapSingleclick "";
if (alive player) then {
	if (count global_jump_pos > 0) then {
		_realpos = [global_jump_pos, 200] call XfGetRanJumpPoint;
		openMap [false, false];
		[_realpos] execVM 'client\jump.sqf';
	};
};