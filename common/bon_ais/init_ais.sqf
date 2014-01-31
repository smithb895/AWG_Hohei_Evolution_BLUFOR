#include "setup.sqf"
_unit = _this select 0;

if (isDedicated && isPlayer _unit) exitWith {};
BON_AIS_PATH = "common\bon_ais\";

__cppfln(ais_handledamage,common\bon_ais\func_handleDamage.sqf);

// Damage Tolerance: 1-2=>Low, 3=>Normal, 5=>High, 8=>Very High
bon_ais_rambofactor = 3;


"bon_ais_in_agony" addPublicVariableEventHandler {
	_unit = (_this select 1) select 0;
	_in_agony = (_this select 1) select 1;
	_side = _unit getVariable "bon_ais_side";
	_killer = _unit getVariable "bon_ais_killer";
	//["checkTK", [_unit,_killer]] call XNetCallEvent;
	if (playerSide == _side) then {
		if(_in_agony) then{
			if (isPlayer _killer) then {
				[side _unit,"HQ"] sideChat format["%1 has been downed by %2 and needs help",name _unit,name _killer];
			} else {
				[side _unit,"HQ"] sideChat format["%1 is down and needs help",name _unit];
			};
			//[[_side,"HQ"],format ["%1 has been downed by %2 and needs help.",name _unit,name _killer]] call XfSideChat;
			//[[_side,"HQ"],format [localize "STR_i_bon_down",name _unit]] call XfSideChat;
			_fa_action = _unit addAction [format["<t color='#655EDE'>First Aid to %1</t>",name _unit],(BON_AIS_PATH+"firstaid.sqf"),_unit,10,false,true,"",
				"{not isNull (_target getVariable _x)} count ['healer','dragger'] == 0 && alive _target && vehicle _target == _target
			"];
			_drag_action = _unit addAction [format["<t color='#f0bfbfbf'>Drag %1</t>",name _unit],(BON_AIS_PATH+"drag.sqf"),_unit,10,false,true,"",
				"{not isNull (_target getVariable _x)} count ['healer','dragger'] == 0 && alive _target && vehicle _target == _target
			"];
			__aiSetVar(_unit) ["fa_action",_fa_action];
			__aiSetVar(_unit) ["drag_action",_drag_action];
			[_unit] execFSM (BON_AIS_PATH+"fsm\ais_marker.fsm");
		} else {
			_unit removeAction (_unit getVariable "fa_action");
			_unit removeAction (_unit getVariable "drag_action");
			__aiSetVar(_unit) ["fa_action",nil];
			__aiSetVar(_unit) ["drag_action",nil];
		};
	};
};

__aiSetVar(_unit) ["bon_ais_headhit",0];
__aiSetVar(_unit) ["bon_ais_bodyhit",0];
__aiSetVar(_unit) ["bon_ais_overall",0];
__aiSetVar(_unit) ["bon_ais_unit_died",false];

__sleep;
_handledamage = _unit addEventHandler ["HandleDamage",{_this call ais_handledamage}];
[_unit] execFSM (BON_AIS_PATH+"fsm\ais.fsm");