//by psycho
#include "setup.sqf"
disableSerialization;
_dialog = findDisplay 72000;
_mhqbutton = _dialog displayCtrl 72003;
_ahqbutton = _dialog displayCtrl 72004;
_mhqpic = _dialog displayCtrl 72006;
_ahqpic = _dialog displayCtrl 72007;

_isadmin = if (player getVariable "e_p_isadmin" || isServer) then {true} else {false};
if !(_isadmin) exitWith {_info ctrlSetText localize "STR_d_noadmin"};

_hq = _this select 0;
_str = "";

switch (_hq) do {
	case ("MHQ") : {
		if (isNull MHQ) exitWith {_str = "unknown Object!"};
		if (!alive MHQ) exitWith {_str = localize "STR_d_na"};
		private ["_vec"];
		_vec = MHQ;
		if (!locked _vec) then {
			if (count (crew _vec) > 0) then {
				{_x action ["Eject", vehicle _x]; _x setVeloCity [0,0,0]} forEach (crew _vec);
			}; __sleep;
			if (count (crew _vec) > 0) exitWith {
				[EVO_brown,localize "STR_a_abbort",localize "STR_i_pinside","stop"] call EVO_Message;
			};
			if (count (crew _vec) == 0) then {_vec setVeloCity [0,0,0]};
			["MHQ_is_locked",true] call XNetSetJIP;
			["lock_it", [_vec, true]] call XNetCallEvent;
			"MHQ locked" call XfGlobalChat;
			_mhqbutton ctrlSetText "Unlock MHQ";
			_pic = "pictures\stop.paa";
			_mhqpic ctrlSetStructuredText parseText format["<img image='%1'/>",_pic];
		} else {
			["MHQ_is_locked",false] call XNetSetJIP;
			["lock_it", [_vec, false]] call XNetCallEvent;
			"MHQ unlocked" call XfGlobalChat;
			_mhqbutton ctrlSetText "Lock MHQ";
			_pic = "pictures\ok.paa";
			_mhqpic ctrlSetStructuredText parseText format["<img image='%1'/>",_pic];
		};
	};
	case ("AHQ") : {
		if (isNull AHQ) exitWith {_str = "unknown Object!"};
		if (!alive AHQ) exitWith {_str = localize "STR_d_na"};
		private ["_vec"];
		_vec = AHQ;
		if (!locked _vec) then {
			if (count (crew _vec) > 0) then {
				{_x action ["Eject", vehicle _x]; _x setVeloCity [0,0,0]} forEach ((crew _vec) - [player]);
			}; __sleep;
			if (count (crew _vec) > 0) exitWith {
				[EVO_brown,localize "STR_a_abbort",localize "STR_i_pinside","stop"] call EVO_Message;
			};
			["AHQ_is_locked",true] call XNetSetJIP;
			["lock_it", [_vec, true]] call XNetCallEvent;
			"AHQ locked" call XfGlobalChat;
			_Ahqbutton ctrlSetText "Unlock AHQ";
			_pic = "pictures\stop.paa";
			_ahqpic ctrlSetStructuredText parseText format["<img image='%1'/>",_pic];
		} else {
			["AHQ_is_locked",false] call XNetSetJIP;
			["lock_it", [_vec, false]] call XNetCallEvent;
			"AHQ unlocked" call XfGlobalChat;
			_ahqbutton ctrlSetText "Lock AHQ";
			_pic = "pictures\ok.paa";
			_ahqpic ctrlSetStructuredText parseText format["<img image='%1'/>",_pic];
		};
	};
	default {};
};