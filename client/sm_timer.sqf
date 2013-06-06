//by psycho
private ["_time","_txtpasshead","_txtpassbody"];
_time = _this select 0;
_txtpasshead = localize "STR_M04t3_2";
_txtpassbody = localize "STR_M04t4";

while {_time >= 0} do {
	sleep 1.00;
	if (_time == 300) then {[EVO_brown,_txtpasshead,_txtpassbody,"info"] call EVO_Message};
	if (_time == 0 or not alive player) then {EVO_Onmission = false};	
	if (not EVO_Onmission) then {_time = 0};
	_time = _time - 1;
};