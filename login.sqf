waitUntil {(getPlayerUID player) != ""};
_UID = getPlayerUID player;

if (_UID in Evo_Admins) then {
	spectate = player addaction ["<t color=""#00B7FF"">" + "Admin Spectate", "gcam.sqf", "", -100];
	_psy = [player] execVM "maptrigger.sqf";
	//diag_log format ["Admin %1 has logged in - ArmA 2 Key: %2", name player, _uid];
	//ID_jumpM = _psycho addAction ["Mapswitch on","mapswitch.sqf",[_psycho],0, false, true];
	//ID_jumpM = player addaction ["Mapswitch", "mapswitch.sqf"];
};