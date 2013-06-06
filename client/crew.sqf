#include "setup.sqf"
private ["_txt","_msg","_str","_crewa","_vec","_sep","_head","_count","_crew","_unit","_name"];
if (!X_Client) exitWith {};

_crew = (crew vehicle player);
_count = count _crew;
_head = parseText format["<t color='#FFFFCC'>  %1</t>",localize "STR_M04t71"];
_sep = parseText "<br /><br />";
_vec = parseText format["<t size='2.2'><img image='%1'/></t>",getText (configFile >> "CfgVehicles" >> format["%1", typeOf (vehicle player)] >> "picture")];
_crewa = [_vec,_head,_sep];

for "_i" from 0 to _count do {
	_unit = (_crew select _i);
	_name = name _unit;
	if (_name == "Error: No unit") then {_name = localize "STR_M04t72"};
	_str = parseText "<img image='\ca\ui\data\i_cargo_ca.paa'/></t>";
	switch (true) do {
		case (_unit == driver vehicle _unit) : {_str = parseText "<img image='\ca\ui\data\i_driver_ca.paa'/></t>"};
		case (_unit == gunner vehicle _unit) : {_str = parseText "<img image='\ca\ui\data\i_gunner_ca.paa'/></t>"};
		case (_unit == commander vehicle _unit) : {_str = parseText "<img image='\ca\ui\data\i_commander_ca.paa'/></t>"};
	};
	_crewa set [count _crewa, _str];
	_msg = parseText format["<t color='#FFFFFF'>   %1</t><br />",_name];
	_crewa set [count _crewa, _msg];
};
hint composeText _crewa;