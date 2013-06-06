//by psycho
#include "setup.sqf"
if (!isServer) exitWith {};

private ["_killed","_killer"];
_killed = _this select 0;
_killer = _this select 1;

if (E_TK_kill_points < 0) then {
	if ((side (group _killer) == side (group _killed)) and (vehicle _killed != vehicle _killer)) then {
		_killer addScore (E_TK_kill_points + 1);	// +1 point! cause the standard arma2 -1 point for tk's
		_head = localize "STR_i_tk";
		_body = localize "STR_i_tk_b";
		["evo_message",[EVO_brown,_head,_body,"achtung",_killer]] call XNetCallEvent;
	};
};

if (E_max_num_TKs < 999999) then {
	if (!isNull _killer && isPlayer _killer && vehicle _killer != vehicle _killed) then {
		[_killer] call XfTKKickCheck;
	};
};

if (E_max_num_TKs_mhq < 999999) then {
	if (isPlayer _killed && (_killed == driver MHQ || _killed == driver AHQ)) then {
		[_killed] call XfTK_ambu_KickCheck;
	};
};