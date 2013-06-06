//player addscore 300

//BETA TEST
_pscore = 1;
while {(score player) < 250} do
{
	if (isServer) then {
		player addScore _pscore; // for hosted environment
	} else {
		paddscore = [player, _pscore]; publicVariable "paddscore";
	};
};
player removeaction addscore