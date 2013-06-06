// by Xeno
#include "setup.sqf"
x_funcs1_compiled = false;

EVO_addfunc_Store = {X_JIPH setVariable [_this select 0, _this select 1]};
EVO_getfunc_Store = {X_JIPH getVariable _this};

["EAST", east] call EVO_addfunc_Store;
["WEST", west] call EVO_addfunc_Store;

X_fnc_arrayPushStack = {
	{(_this select 0) set [count (_this select 0), _x]} foreach (_this select 1);
	(_this select 0)
};

// get a random numer, floored
// parameters: number
// example: _randomint = 30 call XfRandomFloor;
XfRandomFloor = {floor (random _this)};

// shuffles the content of an array
// parameters: array
// example: _myrandomarray = _myNormalArray call XfRandomArray;
XfRandomArray = {
	private ["_ar","_ran_array","_ran"];
	_ar =+ _this;
	_ran_array = [];
	while {count _ar > 0} do {
		_ran = (count _ar) call XfRandomFloor;
		_ran_array set [count _ran_array, _ar select _ran];
		_ar set [_ran, "xfXX_del"];
		_ar = _ar - ["xfXX_del"];
	};
	_ran_array
};

// creates an array with count random indices
// parameters: int (number of entries)
// example: _myrandomindexarray = _numberentries call XfRandomIndexArray;
XfRandomIndexArray = {
	private ["_count","_ran_array"];
	_count = _this;
	_ran_array = [];
	for "_i" from 0 to (_count - 1) do {_ran_array set [count _ran_array, _i]};
	_ran_array = _ran_array call XfRandomArray;
	_ran_array
};
// creates an random array with the given number, with the given array
// parameters: array, number of outgiven parts
// example: _myrandomindexarray = [_mynormalarray,_numberoffoutgivenentries] call XfRandomIndexArray;
PsyfRandomCountedIndexArray = {
	private ["_ran","_array","_ran_array","_num"];
	_array = _this select 0;
	_num = _this select 1;
	_ran_array = (count _array) call XfRandomIndexArray;
	while {count _ran_array > _num} do {
		_ran = (count _ran_array) call XfRandomFloor;
		_ran_array set [_ran, "xfXX_del"];
		_ran_array = _ran_array - ["xfXX_del"];
	};
	_ran_array
};

XfGetConfigGroup = {
	private ["_side","_type","_typeunits","_typegroup","_ret","_config","_cfgn"];
	_side = _this select 0; // "West"
	_type = _this select 1; // "USMC"
	_typeunits = _this select 2; // "Infantry"
	_typegroup = _this select 3;  // "USMC_InfSquad"
	_ret = [];
	
	_config = (configFile >> "CfgGroups" >> _side >> _type >> _typeunits >> _typegroup);
	if (isClass _config) then {
		for "_i" from 0 to (count _config - 1) do {
			_cfgn = _config select _i;
			if (isClass _cfgn) then {_ret set [count _ret, getText (_cfgn >> "vehicle")]};
		};
	};
	_ret
};

#ifdef __ACE__
XfGetAltTankStatus = {
	private ["_c", "_s"];
	_c = [_this, "ace_canmove", true] call XfGetVar;
	_s = [_this, "ace_canshoot", true] call XfGetVar;
	if (!_s && !_c) then {true} else {false}
};
#endif

// direction from one object to another
// parameters: object1, object2
// example: _dir = [tank1, apc1] call XfDirToObj;
XfDirToObj = {
	private ["_o1","_o2","_deg"];
	_o1 = _this select 0;_o2 = _this select 1;
	_deg = ((position _o2 select 0) - (position _o1 select 0)) atan2 ((position _o2 select 1) - (position _o1 select 1));
	if (_deg < 0) then {_deg = _deg + 360};
	_deg
};

// get a random number, floored, from count array
// parameters: array
// example: _randomarrayint = _myarray call XfRandomFloorArray;
XfRandomFloorArray = {floor (random (count _this))};

// get a random item from an array
// parameters: array
// example: _randomval = _myarray call XfRandomArrayVal;
XfRandomArrayVal = {_this select (_this call XfRandomFloorArray)};

// get a random numer, ceiled
// parameters: number
// example: _randomint = 30 call XfRandomCeil;
XfRandomCeil = {ceil (random _this)};

// returns the number of human players currently playing a mission in MP
XPlayersNumber = {(playersNumber east + playersNumber west + playersNumber resistance)};

// gets a random number in a specific range
// parameters: number from, number to (second number must be greater than first)
// example: _random_number = [30,150] call XfGetRandomRange;
XfGetRandomRange = {
	private ["_num1","_num2","_ra"];
	_num1 = _this select 0;_num2 = _this select 1;
	_ra = _num2 - _num1;
	_ra = random _ra;
	(_num1 + _ra)
};

// gets a random integer number in a specific range
// parameters: integer from, integer to (second number must be greater than first)
// example: _random_integer = [30,150] call XfGetRandomRangeInt;
XfGetRandomRangeInt = {
	private ["_num1","_num2","_ra"];
	_num1 = _this select 0;_num2 = _this select 1;
	if (_num1 > _num2) then {_num1 = _this select 1;_num2 = _this select 0};
	_ra = _num2 - _num1;
	_ra = _ra call XfRandomFloor;
	(_num1 + _ra)
};

// compares two arrays, if equal returns true, if not false
// parameters: array1, array2
// example: _isequal = [array1, array2] call XfArrayCompare;
XfArrayCompare = {if (str (_this select 0) == str (_this select 1)) then {true} else {false}};

// get height of object
// parameters: object (no brackets)
// _height = tank1 call XfGetHeight;
XfGetHeight = {position _this select 2};

// set only height of an object
// parameters: object, height
// example: [unit1, 30] call XfSetHeight;
XfSetHeight = {(_this select 0) setPos [position (_this select 0) select 0, position (_this select 0) select 1, (_this select 1)]};

// set only ASL height of an object
// parameters: object, height
// example: [unit1, 30] call XfSetASLHeight;
XfSetASLHeight = {(_this select 0) setPosASL [position (_this select 0) select 0, position (_this select 0) select 1, (_this select 1)]};

// set only ATL height of an object
// parameters: object, height
// example: [unit1, 30] call XfSetATLHeight;
XfSetATLHeight = {(_this select 0) setPosATL [position (_this select 0) select 0, position (_this select 0) select 1, (_this select 1)]};

// get x position of an object
// parameters: object (no brackets)
// _posx = tank1 call XfGetPosX;
XfGetPosX = {position _this select 0};

// set only x position of an object
// parameters: object, x
// example: [unit1, 30] call XfSetPosX;
XfSetPosX = {(_this select 0) setPos [(_this select 1), position (_this select 0) select 1, position (_this select 0) select 2]};

// get y position of an object
// parameters: object (no brackets)
// _posy = tank1 call XfGetPosY;
XfGetPosY = {position _this select 1};

// set only y position of an object
// parameters: object, y
// example: [unit1, 30] call XfSetPosY;
XfSetPosY = {(_this select 0) setPos [position (_this select 0) select 0, (_this select 1), position (_this select 0) select 2]};

// get displayname of an object
// parameters: type of object (string), what (0 = CfgVehicles, 1 = CfgWeapons, 2 = CfgMagazines)
// example: _dispname = ["UAZ", 0] call XfGetDisplayName;
XfGetDisplayName = {
	private ["_obj_name", "_obj_kind", "_cfg"];
	_obj_name = _this select 0;_obj_kind = _this select 1;
	_cfg = switch (_obj_kind) do {case 0: {"CfgVehicles"};case 1: {"CfgWeapons"};case 2: {"CfgMagazines"};};
	getText (configFile >> _cfg >> _obj_name >> "displayName")
};

// from warfare
// Returns an average slope value of terrain within passed radius.
// a little bit modified. no need to create a "global" logic, local is enough, etc
// parameters: position, radius
// example: _slope = [the_position, the_radius] call XfGetSlope;
if (isNil "X_SlopeObject") then {X_SlopeObject = "HeliHEmpty" createVehicleLocal [0,0,0]};
XfGetSlope = {
	private ["_position","_radius","_centerHeight","_height","_direction"];
	_position = _this select 0;_radius = _this select 1;
	X_SlopeObject setPos _position;
	_centerHeight = getPosASL X_SlopeObject select 2;
	_height = 0;_direction = 0;
	for "_count" from 0 to 7 do {
		X_SlopeObject setPos [(_position select 0)+((sin _direction)*_radius),(_position select 1)+((cos _direction)*_radius),0];
		_direction = _direction + 45;
		_height = _height + abs (_centerHeight - (getPosASL X_SlopeObject select 2));
	};
	_height / 8
};

// create a global marker, returns created marker
// parameters: marker name, marker pos, marker shape, marker color, marker size;(optional) marker text, marker dir, marker type, marker brush
// example: ["my marker",  position player, "Dot", "ColorBlue", [0.5,0.5]] call XfCreateMarkerGlobal;
XfCreateMarkerGlobal = {
	private ["_m_name","_m_pos","_m_shape","_m_col","_m_size","_m_text","_m_dir","_m_type","_m_brush","_m_alpha","_marker"];
	_m_name = _this select 0;
	_m_pos = _this select 1;
	_m_shape = _this select 2;
	_m_col = _this select 3;
	_m_size = _this select 4;
	_m_text = (if (count _this > 5) then {_this select 5} else {""});
	_m_dir = (if (count _this > 6) then {_this select 6} else {-888888});
	_m_type = (if (count _this > 7) then {_this select 7} else {""});
	_m_brush = (if (count _this > 8) then {_this select 8} else {""});
	_m_alpha = (if (count _this > 9) then {_this select 9} else {0});
	
	_marker = createMarker [_m_name, _m_pos];
	if (_m_shape != "") then {_marker setMarkerShape _m_shape};
	if (_m_col != "") then {_marker setMarkerColor _m_col};
	if (count _m_size > 0) then {_marker setMarkerSize _m_size};
	if (_m_text != "") then {_marker setMarkerText _m_text};
	if (_m_dir != -888888) then {_marker setMarkerDir _m_dir};
	if (_m_type != "") then {_marker setMarkerType _m_type};
	if (_m_brush != "") then {_marker setMarkerBrush _m_brush};
	if (_m_alpha != 0) then {_marker setMarkerAlpha _m_alpha};
	_marker
};

// create a local marker, returns created marker
// parameters: marker name, marker pos, marker shape, marker color, marker size;(optional) marker text, marker dir, marker type, marker brush
// example: ["my marker",  position player, "Dot", "ColorBlue", [0.5,0.5]] call XfCreateMarkerLocal;
XfCreateMarkerLocal = {
	private ["_m_name","_m_pos","_m_shape","_m_col","_m_size","_m_text","_m_dir","_m_type","_m_brush","_m_alpha","_marker"];
	_m_name = _this select 0;
	_m_pos = _this select 1;
	_m_shape = _this select 2;
	_m_col = _this select 3;
	_m_size = _this select 4;
	_m_text = (if (count _this > 5) then {_this select 5} else {""});
	_m_dir = (if (count _this > 6) then {_this select 6} else {-888888});
	_m_type = (if (count _this > 7) then {_this select 7} else {""});
	_m_brush = (if (count _this > 8) then {_this select 8} else {""});
	_m_alpha = (if (count _this > 9) then {_this select 9} else {0});
	
	_marker = createMarkerLocal [_m_name, _m_pos];
	if (_m_shape != "") then {_marker setMarkerShapeLocal _m_shape};
	if (_m_col != "") then {_marker setMarkerColorLocal _m_col};
	if (count _m_size > 0) then {_marker setMarkerSizeLocal _m_size};
	if (_m_text != "") then {_marker setMarkerTextLocal _m_text};
	if (_m_dir != -888888) then {_marker setMarkerDirLocal _m_dir};
	if (_m_type != "") then {_marker setMarkerTypeLocal _m_type};
	if (_m_brush != "") then {_marker setMarkerBrushLocal _m_brush};
	if (_m_alpha != 0) then {_marker setMarkerAlphaLocal _m_alpha};
	_marker
};

XfGetAliveUnits = {({alive _x} count _this)};

XfGetAliveUnitsGrp = {({alive _x} count (units _this))};

XfGetAliveCrew = {({alive _x} count (crew _this))};

XfGetVehicleEmpty = {({alive _x} count (crew _this)) == 0};

XfGetAllAlive = {
	private "_ret";
	_ret = [];
	{if (alive _x) then {_ret set [count _ret, _x]}} forEach (units _this);
	_ret
};

XfDirTo = {
	/************************************************************
		Direction To
		By Andrew Barron

	Parameters: [object or position 1, object or position 2]

	Returns the compass direction from object/position 1 to
	object/position 2. Return is always >=0 <360.

	Example: [player, getpos dude] call BIS_fnc_dirTo
	************************************************************/
	private ["_pos1","_pos2","_ret"];
	_pos1 = _this select 0; _pos2 = _this select 1;

	if(typename _pos1 == "OBJECT") then {_pos1 = getpos _pos1};
	if(typename _pos2 == "OBJECT") then {_pos2 = getpos _pos2};

	_ret = ((_pos2 select 0) - (_pos1 select 0)) atan2 ((_pos2 select 1) - (_pos1 select 1));
	if (_ret < 0) then {_ret = _ret + 360};
	_ret
};

XfGetParachuteSide = {
	private "_ret";
	_ret = if (typeName _this == "STRING") then {
		switch (_this) do {
			case "EAST": {"ParachuteEast"};
			case "WEST": {"ParachuteWest"};
			case "GUER": {"ParachuteG"};
			case "CIV": {"ParachuteC"};
		}
	} else {
		switch (_this) do {
			case east: {"ParachuteEast"};
			case west: {"ParachuteWest"};
			case resistance: {"ParachuteG"};
			case civilian: {"ParachuteC"};
		}
	};
	_ret
};

XfCreateTrigger = {
	//example: 	[_pos, [0, 0, 0, false],["NONE", "PRESENT", true], ["", "", ""]] call XfCreateTrigger;
	private ["_pos", "_trigarea", "_trigact", "_trigstatem", "_trigger"];
	_pos = _this select 0;
	_trigarea = _this select 1;
	_trigact = _this select 2;
	_trigstatem = _this select 3;
	_trigger = createTrigger ["EmptyDetector" ,_pos];
	_trigger setTriggerArea _trigarea;
	_trigger setTriggerActivation _trigact;
	_trigger setTriggerStatements _trigstatem;
	_trigger
};

XfGetVar = {
	private "_r";
	_r = (_this select 0) getVariable (_this select 1);
	if (isNil "_r") then {_this select 2} else {_r}
};

X_fnc_returnConfigEntry = {
	/*
		File: returnConfigEntry.sqf
		Author: Joris-Jan van 't Land

		Description:
		Explores parent classes in the run-time config for the value of a config entry.
		
		Parameter(s):
		_this select 0: starting config class (Config)
		_this select 1: queried entry name (String)
		
		Returns:
		Number / String - value of the found entry
	*/
	if ((count _this) < 2) exitWith {nil};
	private ["_config", "_entryName"];
	_config = _this select 0;
	_entryName = _this select 1;
	if ((typeName _config) != (typeName configFile)) exitWith {nil};
	if ((typeName _entryName) != (typeName "")) exitWith {nil};
	private ["_entry", "_value"];
	_entry = _config >> _entryName;
	if (((configName (_config >> _entryName)) == "") && (!((configName _config) in ["CfgVehicles", "CfgWeapons", ""]))) then {
		[inheritsFrom _config, _entryName] call X_fnc_returnConfigEntry;
	} else {
		if (isNumber _entry) then {
			_value = getNumber _entry;
		} else {
			if (isText _entry) then {_value = getText _entry};
		};
	};
	if (isNil "_value") exitWith {nil};
	_value
};

X_fnc_returnVehicleTurrets = {
	/*
		File: fn_returnVehicleTurrets.sqf
		Author: Joris-Jan van 't Land

		Description:
		Function return the path to all turrets and sub-turrets in a vehicle.

		Parameter(s):
		_this select 0: vehicle config entry (Config)

		Returns:
		Array of Scalars and Arrays - path to all turrets
	*/
	if ((count _this) < 1) exitWith {[]};
	private ["_entry"];
	_entry = _this select 0;
	if ((typeName _entry) != (typeName configFile)) exitWith {[]};
	private ["_turrets", "_turretIndex"];
	_turrets = [];
	_turretIndex = 0;
	for "_i" from 0 to ((count _entry) - 1) do {
		private ["_subEntry"];
		_subEntry = _entry select _i;
		if (isClass _subEntry) then {
			private ["_hasGunner"];
			_hasGunner = [_subEntry, "hasGunner"] call X_fnc_returnConfigEntry;
			if (!(isNil "_hasGunner")) then {
				if (_hasGunner == 1) then {
					_turrets set [count _turrets, _turretIndex];
					if (isClass (_subEntry >> "Turrets")) then {
						_turrets set [count _turrets, [_subEntry >> "Turrets"] call X_fnc_returnVehicleTurrets];
					} else {
						_turrets set [count _turrets, []];
					};
				};
			};
			_turretIndex = _turretIndex + 1;
		};
	};
	_turrets
};

x_handleDeadVeh = {
	private ["_v","_type","_dir","_pos","_vel","_dv","_dummyvehicle"];
	_v = _this select 0;
	_type = typeOf _v;
	_dir = direction _v;
	_pos = position _v;
	_vel = velocity _v;
	{deleteVehicle _x} forEach ([_v] + crew _v);
	_dv = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
	_dv setDir _dir;
	_dv setPos _pos;
	_dv setVelocity _vel;
	_dv setFuel 0;
	_dv setDamage 1;
	dead_list set [count dead_list, _dummyvehicle];
	__addDead(_dv)
};

EVO_Lock = {if (E_vehiclelock == 1) then {["lock_it",[_this,true]] call XNetCallEvent} else {["lock_it",[_this,false]] call XNetCallEvent}};

EVO_Mrew = {
	private ["_p","_reward"];
	_p = if (!isPlayer _this) then {_this getVariable "EVO_med"} else {_this};
	switch (toUpper rank _p) do {
		case "PRIVATE" : {_reward = 2};
		case "CORPORAL" : {_reward = 4};
		case "SERGEANT" : {_reward = 6};
		case "LIEUTENANT" : {_reward = 8};
		case "CAPTAIN" : {_reward = 10};
		case "MAJOR" : {_reward = 12};
		case "COLONEL" : {_reward = 14};
	};
	{["p_add_score",[_x,_reward]] call XNetCallEvent} forEach units group _p;
	["reward_ttext",[_reward,localize "STR_i_medr",_p]] call XNetCallEvent;
};

EVO_Erew = {
	private ["_reward","_p"];
	_p = _this getVariable "EVO_ing";
		switch (toUpper rank _p) do {
			case "PRIVATE" : {_reward = 2};
			case "CORPORAL" : {_reward = 4};
			case "SERGEANT" : {_reward = 6};
			case "LIEUTENANT" : {_reward = 8};
			case "CAPTAIN" : {_reward = 10};
			case "MAJOR" : {_reward = 12};
			case "COLONEL" : {_reward = 14};
		};
	{["p_add_score",[_x,_reward]] call XNetCallEvent} forEach units group _p;
	["reward_ttext",[_reward,localize "STR_i_engr",_p]] call XNetCallEvent;
};

x_funcs1_compiled = true;