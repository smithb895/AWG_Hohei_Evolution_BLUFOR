#include "setup.sqf"
private ["_p", "_exit_it","_go_out"];
_p = _this select 1;
_go_out = false;

if (__isBlue and !__OAonly) then {
	_truck = objNull;
	_truck = (nearestObject [vehicle player, EVO_medivacs]);
	if (isNull _truck) then {_go_out = true};
};
if(_go_out) exitWith {
	_head = localize "STR_a_error";
	_body = localize "STR_a_truck2";
	[EVO_brown,_head,_body,"info"] call EVO_Message;
};
if (_p in list AirportIn) exitWith {
	_head = localize "STR_a_error";
	_body = localize "STR_a_impossible";
	[EVO_brown,_head,_body,"stop"] call EVO_Message;
};
_id = _this select 2;
_p removeaction _id;
{deleteVehicle _x} forEach [mtent,mnetz,mbox,mbox2];
_mark = format ["%1mash",(name _p)];
deleteMarker _mark;

_pos = player modeltoworld [0,5,0];
_pos set [2,0];

_helper1 = "HeliHEmpty" createVehicleLocal [_pos select 0, (_pos select 1) + 3, 0];
_helper2 = "HeliHEmpty" createVehicleLocal [_pos select 0, (_pos select 1) - 3, 0];
_helper3 = "HeliHEmpty"createVehicleLocal [(_pos select 0) + 3, _pos select 1, 0];
_helper4 = "HeliHEmpty" createVehicleLocal [(_pos select 0) - 3, _pos select 1, 0];
_exit_it = false;
if ((abs (((getPosASL _helper1) select 2) - ((getPosASL _helper2) select 2)) > 2) || (abs (((getPosASL _helper3) select 2) - ((getPosASL _helper4) select 2)) > 2)) then {
	_head = localize "STR_a_error";
	_body = localize "STR_a_impossible2";
	[EVO_brown,_head,_body,"stop"] call EVO_Message;
	_exit_it = true;
};
for "_mt" from 1 to 4 do {call compile format ["deleteVehicle _helper%1;", _mt]};
if (_exit_it) exitWith {_actionId8 = _p addAction [localize "STR_a_medic" call XGreyText, "client\mash.sqf",1,1, false, true,"test2"];};

_p playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 3;
WaitUntil {animationState _p != "AinvPknlMstpSlayWrflDnon_medic"};

//_mark = format ["%1mash",(name _p)];
mtent = "Mash" createVehicle _pos; __sleep;
mtent setVariable ["EVO_med",_p];
_pos = position mtent;
_pos3 = [(_pos select 0)+3,(_pos select 1)+3,_pos select 2];
_pos4 = [(_pos select 0)+4,(_pos select 1)+5,_pos select 2];

#ifdef __Takistan__
	if (EVO_own_side == "WEST") then {
		mnetz = "Land_CamoNetVar_NATO_EP1" createVehicle (position _p); __sleep;
		mbox = "USBasicAmmunitionBox_EP1" createVehicle _pos3; __sleep;
		mbox2 = "Misc_cargo_cont_net1" createVehicle _pos4; __sleep;
	} else {
		mnetz = "Land_CamoNetVar_EAST_EP1" createVehicle (position _p); __sleep;
		mbox = "TKBasicAmmunitionBox_EP1" createVehicle _pos3; __sleep;
		mbox2 = "Misc_cargo_cont_net1" createVehicle _pos4; __sleep;
	};
#else
	if (EVO_own_side == "WEST") then {
		mnetz = "Land_CamoNetVar_NATO" createVehicle (position _p); __sleep;
		mbox = "USBasicAmmunitionBox" createVehicle _pos3; __sleep;
		mbox2 = "Misc_cargo_cont_net1" createVehicle _pos4; __sleep;
	} else {
		mnetz = "Land_CamoNetVar_EAST" createVehicle (position _p); __sleep;
		mbox = "RUBasicAmmunitionBox" createVehicle _pos3; __sleep;
		mbox2 = "Misc_cargo_cont_net1" createVehicle _pos4; __sleep;
	};
#endif
["transmit_box_content",[mbox]] call XNetCallEvent;

_mssg = format["%1's %2",(name _p), localize "STR_o_hosp"];
#ifdef __BLUE__
	_type = "b_med";
	_color =  "ColorBlue";
#else
	_type = "o_med";
	_color = "ColorRed";
#endif

_mark = [_mark,  _pos, "ICON", _color, [0.8,0.8], _mssg, 0, _type] call XfCreateMarkerGlobal;


_actionId8 = _p addAction [localize "STR_a_medic" call XGreyText, "client\mash.sqf",1,1, false, true,"test2"];