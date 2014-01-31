//by psycho
#include "setup.sqf"
private ["_mr_available","_mr_text","_dir","_txthead"];
if (!X_Clinet) exitWith {};
_txthead = localize "STR_i_info";
if (vehicle player != player) exitWith {_txtbody = localize "STR_i_tel1"; [EVO_brown,_txthead,_txtbody,"stop"] call EVO_Message};
_is_swimmer = if ((animationState player) in ["aswmpercmstpsnonwnondnon","aswmpercmstpsnonwnondnon_aswmpercmrunsnonwnondf","aswmpercmrunsnonwnondf_aswmpercmstpsnonwnondnon","aswmpercmrunsnonwnondf","aswmpercmsprsnonwnondf","aswmpercmwlksnonwnondf"]) then {true} else {false};
if (_is_swimmer) exitWith {localize "STR_i_tel2" call XfGlobalChat};
_action = _this select 3;
_dir = random 359;
_mr_available = true;
_mr_text = "";

_by_beaming = {
	titletext ["", "BLACK IN"];
	#ifndef __A2__
	_nobs =	nearestObjects [player, ["USBasicWeapons_EP1","USSpecialWeapons_EP1","TKBasicWeapons_EP1","TKSpecialWeapons_EP1","LocalBasicAmmunitionBox","M1133_MEV_EP1","BMP2_HQ_TK_EP1"], 30];
	#else
	_nobs =	nearestObjects [player, ["USSpecialWeaponsBox","USBasicWeaponsBox","RUBasicAmmunitionBox","RUSpecialWeaponsBox","LocalBasicAmmunitionBox","LAV25_HQ","BTR90_HQ"], 30];
	#endif
	{player reveal _x} forEach _nobs;
};

switch _action do {
	case 0:	{ //back to base
		if (E_Basebeam == 1) then {
			call _by_beaming;
			player SetPos [(getPos Evo_Baseflag_MHQ select 0)-5*sin(_dir),(getPos Evo_Baseflag_MHQ select 1)-5*cos(_dir)];
		} else {
			_txthead = localize "STR_i_info";
			_txtbody = localize "STR_n_avalible";
			[EVO_brown,_txthead,_txtbody,"info"] call EVO_Message;
		};
	};
	case 1:	{ //to mhq
		if (E_Mhqbeam == 1) then {
			switch (true) do {
				case (__XJIPGetVar(mr1_in_air)): {
					_mr_text = localize "STR_i_mhq1";
					_mr_available = false;
				};
				case (speed MHQ > 10): {
					_mr_text = localize "STR_i_mhq2";
					_mr_available = false;
				};
				case (surfaceIsWater [(position MHQ) select 0,(position MHQ) select 1]): {
					_mr_text = localize "STR_i_mhq3";
					_mr_available = false;
				};
				case (!(if (!isNil {MHQ getVariable "ace_canmove"}) then {MHQ call ace_v_alive} else {alive MHQ})): {
					_mr_text = localize "STR_i_mhqbroken";
					_mr_available = false;
				};
			};
			if (_mr_available) then {
				_global_pos = MHQ modelToWorld [0,-5,0];
				_global_dir = direction MHQ;
				player setPosATL [_global_pos select 0, _global_pos select 1, 0]; player setDir _global_dir;
				call _by_beaming;
			};
			if (!_mr_available) then {
				_txthead = localize "STR_i_info";
				_txtbody = _mr_text;
				[EVO_brown,_txthead,_txtbody,"info"] call EVO_Message;
			};
		} else {
			_txthead = localize "STR_i_info";
			_txtbody = localize "STR_n_avalible";
			[EVO_brown,_txthead,_txtbody,"info"] call EVO_Message;
		};
	};
	case 2:	{ //to ahq
		if (E_Mhqbeam == 1) then {
			switch (true) do {
				case (surfaceIsWater [(position AHQ) select 0,(position AHQ) select 1]): {
					_mr_text = localize "STR_i_ahq1";
					_mr_available = false;
				};
				case (!(if (!isNil {AHQ getVariable "ace_canmove"}) then {AHQ call ace_v_alive} else {alive AHQ})): {
					_mr_text = localize "STR_i_ahqbroken";
					_mr_available = false;
				};
			};
			if (_mr_available) then {
				if (__XJIPGetVar(AHQ_is_locked)) then {
					_global_pos = AHQ modelToWorld [-5,-2,0];
					_global_dir = direction AHQ;
					player setPosATL [_global_pos select 0, _global_pos select 1, 0]; player setDir _global_dir;				
				} else {
					player moveinCargo AHQ;
				};
			call _by_beaming;
			};
			if (!_mr_available) then {
				_txthead = localize "STR_i_info";
				_txtbody = _mr_text;
				[EVO_brown,_txthead,_txtbody,"info"] call EVO_Message;
			};
		} else {
			_txthead = localize "STR_i_info";
			_txtbody = localize "STR_n_avalible";
			[EVO_brown,_txthead,_txtbody,"info"] call EVO_Message;
		};
	};
	case 3:	{ //to farp Alpha
		player SetPos [(getMarkerPos "Marker_Farp_Alpha" select 0)-5*sin(_dir),(getMarkerPos "Marker_Farp_Alpha" select 1)-5*cos(_dir)];
	};
	case 4:	{ //to farp Bravo
		player SetPos [(getMarkerPos "Marker_Farp_Bravo" select 0)-5*sin(_dir),(getMarkerPos "Marker_Farp_Bravo" select 1)-5*cos(_dir)];
	};
	case 5:	{ //to farp Charley
		player SetPos [(getMarkerPos "Marker_Farp_Charly" select 0)-5*sin(_dir),(getMarkerPos "Marker_Farp_Charly" select 1)-5*cos(_dir)];
	};
};