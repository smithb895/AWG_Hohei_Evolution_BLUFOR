//by psycho
#include "setup.sqf"
#define __condition1 (vehicle player != player) and !rep_in_progress and !((typeOf (vehicle player)) isKindOf "Air")
#define __condition2 (score player != _tscore) and alive player
private ["_rep_in_progress","_tscore"];
_tscore = 0;
rep_in_progress = false;
_rankmes = localize "STR_M04t82";

_rhint = {
	private ["_sep","_txt","_img","_mesg","_iname","_iimg","_name"];
	_iimg = _this select 0;_iname = _this select 1;_mesg = _this select 2;
	_sep = parseText "<br /><br />";
	_img = parseText format["<t size='2.2'><img image='\CA\warfare2\Images\rank_%1.paa'/></t>",_iimg];
	_name = parseText format["<t color='#FFFFCC'>   %1</t>",_iname];
	_txt = composeText [_img,_name,_sep,_mesg];
	hint _txt;
	playSound "fanfare";	//<--- a2 owned
};

EVO_Repair = {
	private ["_vec","_loop2"];
	if (rep_in_progress) exitWith {};
	_vec = vehicle player;
	if (getDammage _vec > 0 || fuel _vec < 0.95) then {
		if (((_vec in list AirportIn) or (_vec in list farp1) or (_vec in list farp2) or (_vec in list farp3) or (_vec in list reng1) or (_vec in list reng2) or (_vec in list reng3) or (_vec in list reng4)) and speed _vec > -2 and (speed _vec < 2) and (((position _vec) select 2) < 2.0) and (local _vec) and !(_vec in list EVO_helizone) and !(_vec in list EVO_jetzone)) then {
			rep_in_progress = true;
			hint "";
			titleText ["Repair in progress...", "PLAIN DOWN",0.3];
			for [{_loop2=0}, {_loop2<1}, {_loop2=_loop2}] do {
			    if (getDammage _vec > 0) then {_vec setDammage ((getDammage _vec) - 0.0125)};
			    if (Fuel _vec < 1) then {_vec setFuel ((Fuel _vec) + 0.0125)};
			    if(_vec != vehicle player or speed _vec < -2 or speed _vec > 2 or position _vec select 2 > 2.0) then {
					rep_in_progress = false;
					_loop2 = 1;
					titleText [localize "STR_M04t84", "PLAIN DOWN",0.3];
				};
			    hintSilent format ["Damage: %1 %\nFuel: %2 %",round ((getDammage _vec) * 100),round ((Fuel _vec) * 100)];
				if (getDammage _vec == 0 and Fuel _vec == 1) then {_loop2 = 1; rep_in_progress = false;};
				playsound "counter";
				sleep 0.25;
			};
			if (__kind(_vec) "LandVehicle") then {_vec setVehicleAmmo 1};
			rep_in_progress = false;
		};
	};
};

EVO_rankUp = {
	_tscore = score player;
	_uid = getPlayerUID player;
	switch (true) do {
		case (_tscore < EVO_rank1 and rank player != "PRIVATE") : {
			_rname = format["Pvt.%1",name player];
			_hint =  format[_rankmes,_rname];
			["private","PRIVATE",_hint] call _rhint;
			EVO_PlayerSkill = 0.0;	
			player SetSkill EVO_PlayerSkill;
			player setUnitRank "PRIVATE";
		};
		case (_tscore < EVO_rank2 and score player >= EVO_rank1 and rank player != "CORPORAL") : {
			_rname = format["Corp.%1",name player];
			_hint =  format[_rankmes,_rname];
			["corporal","CORPORAL",_hint] call _rhint;
			EVO_PlayerSkill = 0.2;
			player SetSkill EVO_PlayerSkill;
			player setUnitRank "CORPORAL";
		};
		case (_tscore < EVO_rank3 and score player >= EVO_rank2 and rank player != "SERGEANT") : {
			_rname = format["Sgt.%1",name player];
			_hint =  format[_rankmes,_rname];
			["sergeant","SERGEANT",_hint] call _rhint;
			EVO_PlayerSkill = 0.4;
			player SetSkill EVO_PlayerSkill;
			player setUnitRank "SERGEANT";
		};
		case (_tscore < EVO_rank4 and score player >= EVO_rank3 and rank player != "LIEUTENANT") : {
			_rname = format["Ltn.%1",name player];
			_hint =  format[_rankmes,_rname];
			["lieutenant","LIEUTENANT",_hint] call _rhint;
			EVO_PlayerSkill = 0.6;
			player SetSkill EVO_PlayerSkill;
			player setUnitRank "LIEUTENANT";
		};
		case (_tscore < EVO_rank5 and score player >= EVO_rank4 and rank player != "CAPTAIN") : {
			_rname = format["Cpt.%1",name player];
			_hint =  format[_rankmes,_rname];
			["captain","CAPTAIN",_hint] call _rhint;
			EVO_PlayerSkill = 0.8;
			player SetSkill EVO_PlayerSkill;
			player setUnitRank "CAPTAIN";
		};
		case (_tscore < EVO_rank6 and score player >= EVO_rank5 and rank player != "MAJOR") : {
			_rname = format["Mjr.%1",name player];
			_hint =  format[_rankmes,_rname];
			["major","MAJOR",_hint] call _rhint;
			EVO_PlayerSkill = 0.9;
			player SetSkill EVO_PlayerSkill;
			player setUnitRank "MAJOR";
		};
		case (_tscore >= EVO_rank6 and rank player != "COLONEL") : {
			_rname = format["Col.%1",name player];
			_hint =  format[_rankmes,_rname];
			["colonel","COLONEL",_hint] call _rhint;
			EVO_PlayerSkill = 1;
			player SetSkill EVO_PlayerSkill;
			player setUnitRank "COLONEL";
		};
	};
};

while {true} do {
	waitUntil {__condition1 || __condition2};
	if (__condition1) then {[] spawn EVO_Repair;};
	if (__condition2) then {call EVO_rankUp};
	sleep 2.056;
};