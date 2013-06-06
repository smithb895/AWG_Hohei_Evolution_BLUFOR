#include "setup.sqf"
_truck = objNull;
_truck = (nearestObject [vehicle player, EVO_reptruck]);
if(isNull _truck) exitWith {
	_head = localize "STR_a_error";
	_body = localize "STR_a_truck";
	[EVO_brown,_head,_body,"info"] call EVO_Message;
};
if (player in list AirportIn) exitWith {
	_head = localize "STR_a_error";
	_body = localize "STR_a_impossible";
	[EVO_brown,_head,_body,"stop"] call EVO_Message;
};
_id = _this select 2;
player removeaction _id;
{deleteVehicle _x} forEach [etent,epad,ebox,ebox2];
_mark = format["%1farp",(name player)];
deleteMarker _mark;
player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 3.0;
WaitUntil {animationState player != "AinvPknlMstpSlayWrflDnon_medic"};
_pos = player modeltoworld [0,5,0];
_pos set [2,0];
epad = "HeliH" createVehicle _pos;
_pos = position epad;
_pos2 = [_pos select 0,(_pos select 1) - 12,_pos select 2];
_pos3 = [(_pos2 select 0)+3,(_pos2 select 1)+3,_pos2 select 2];
#ifdef __Takistan__
	if (EVO_own_side == "WEST") then {
		ebox = "USBasicAmmunitionBox_EP1" createVehicle _pos3; __sleep;
	} else {
		ebox = "TKBasicAmmunitionBox_EP1" createVehicle _pos3; __sleep;
	};
#else
	if (EVO_own_side == "WEST") then {
		ebox = "USBasicAmmunitionBox" createVehicle _pos3; __sleep;
	} else {
		ebox = "RUBasicAmmunitionBox" createVehicle _pos3; __sleep;
	};
#endif
etent = "PowGen_Big" createVehicle _pos2; __sleep;
etent setDir (random 259);
_pos4 = [(_pos select 0)+3,(_pos select 1)+15,_pos select 2];
ebox2 = "Barrels" createVehicle _pos4; __sleep;
["transmit_box_content",[ebox]] call XNetCallEvent;


EVO_EngZone setPos (position player);

_mssg = format["%1's %2",(name player), localize "STR_o_farp"];
#ifdef __BLUE__
	_type = "b_maint";
	_color =  "ColorGreen";
#else
	_type = "o_maint";
	_color = "ColorOrange";
#endif
_mark = [_mark,  _pos, "ICON", _color, [0.8,0.8], _mssg, 0, _type] call XfCreateMarkerGlobal;

_actionId8 = player addAction [localize "STR_a_ing" call XGreyText, "client\farp.sqf",2,1, false, true,"test2"]