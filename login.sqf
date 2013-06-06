waitUntil {(getPlayerUID player) != ""};
_UID = getPlayerUID player;
_validUIDList = [
	"1234567", // Replace with admin UIDs
	"09876545"
	];

if (_UID in _validUIDList) then {
	spectate = player addaction ["Admin Spectate", "gcam.sqf"];
	_psy = [player] execVM "maptrigger.sqf";
	//ID_jumpM = _psycho addAction ["Mapswitch on","mapswitch.sqf",[_psycho],0, false, true];
	//ID_jumpM = player addaction ["Mapswitch", "mapswitch.sqf"];
	//if ((score player) < 225) then {
	//	addscore = player addaction ["Add Score", "addscore.sqf"];
	//};
};