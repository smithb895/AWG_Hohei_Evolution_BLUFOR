// by Xeno, edited by Grimes 
private ["_state", "_vec", "_hud", "_control", "_chopttype", "_hudoff", "_nobjects", "_nearest", "_dummy", "_chdispx", "_nx", "_ny", "_px", "_py", "_control2", "_angle", "_a", "_b", "_dif", "_chdispx2", "_controlxx"];

_X_Chopper_Welcome = {};

disableSerialization;

if (d_show_chopper_welcome) then {
	d_rsc_end = true;
	
	d_xxvllist = [];

	_X_Chopper_Welcome = {
		private ["_state", "_vec", "_welcome_str1", "_welcome_str2", "_welcome_str3", "_welcome_str4", "_end_welcome", "_hud", "_control"];
		disableSerialization;
		d_rsc_end = false;
		_state = _this select 0;
		_vec = _this select 1;
		_welcome_str1 = format ["Welcome aboard, %1!", name player];

		switch (_state) do {
			case 0: {
				_welcome_str2 = "This is a normal lift chopper.";
				_welcome_str3 = "It can lift almost any vehicle.";
			};
			default {
				_welcome_str2 = "This is a normal chopper.";
				_welcome_str3 = "It is not able to lift anything.";
			};
		};
		
		_end_welcome = time + 5;
		67322 cutRsc["chopper_hud", "PLAIN"];
		_hud = uiNamespace getVariable "DCHOP_HUD";
		while {vehicle player != player && alive player && player == driver _vec} do {
			_control = _hud displayCtrl 64438;
			_control ctrlSetText _welcome_str1;
			_control = _hud displayCtrl 64439;
			_control ctrlSetText _welcome_str2;
			_control = _hud displayCtrl 64440;
			_control ctrlSetText _welcome_str3;
			_control = _hud displayCtrl 64441;
			_control ctrlSetText _welcome_str4;
			if (time >= _end_welcome) exitWith {};
			sleep 0.431;
		};
		67322 cutRsc ["DOM_RscNothing", "PLAIN",1];
		d_rsc_end = true;
	};
};

_ui_forward = "\CA\ui\data\ui_tankdir_forward_ca.paa";
_ui_back = "\CA\ui\data\ui_tankdir_back_ca.paa";
_ui_left = "\CA\ui\data\ui_tankdir_left_ca.paa";
_ui_right = "\CA\ui\data\ui_tankdir_right_ca.paa";
_ui_tohigh = "\CA\ui\data\tankdir_turret_ca.paa";
_ui_ok = "\CA\ui\data\ui_tankdir_tower_ca.paa";

while {true} do {
	waitUntil {alive player};
	waitUntil {sleep random 0.3;vehicle player != player};
	_vec = vehicle player;
	while {vehicle player != player} do {
		if (player == driver _vec) then {
			if (_vec isKindOf "Helicopter" && !(_vec isKindOf "ParachuteBase") && !(_vec isKindOf "BIS_Steerable_Parachute")) then {
				_chopttype = _vec getVariable "d_choppertype";
				if (isNil "_chopttype") then {_chopttype = -1};
				if (d_show_chopper_welcome) then {
					if (_chopttype > -1) then {
						[_chopttype,_vec] spawn _X_Chopper_Welcome;
						sleep 0.321;
						waitUntil {d_rsc_end};
					};
				};
				if (_chopttype in [0,1]) then {
					if (isNil {_vec getVariable "D_Vehicle_Attached"}) then {_vec setVariable ["D_Vehicle_Attached", false]};
					_search_height = 0;
					_lift_height = 0;
					_possible_types = _vec getVariable "d_lift_types";
					_search_height = 50;
					_lift_height = 50;
					_hudoff = true;
					while {vehicle player != player && alive player && player == driver _vec} do {
						if (d_chophud_on) then {
							_hudoff = false;
							_nobjects = nearestObjects [_vec, ["LandVehicle","Air"],_search_height];
							_nearest = objNull;
							if (count _nobjects > 0) then {
								_dummy = _nobjects select 0;
								if (_dummy == _vec) then {
									if (count _nobjects > 1) then {_nearest = _nobjects select 1};
								} else {
									_nearest = _dummy;
								};
								_lift_height = 11;
							};
							
							_check_cond = false;
							if (_chopttype == 1) then {
								_check_cond = (!(isNull _nearest) && (damage _nearest >= 1) && ((typeof _nearest) in _possible_types));
							} else {
								_check_cond = (!isNull _nearest && ((typeof _nearest) in _possible_types) && ((position _vec) select 2 > 2.5));
							};
							
							sleep 0.001;
							
							if (_check_cond) then {
								67321 cutRsc ["chopper_lift_hud", "PLAIN"];
								_chdispx = uiNamespace getVariable "DCHOP_LIFT_HUD";
								_control = _chdispx displayCtrl 64440;
								_control ctrlSetText "Lift Chopper";
								
								_type_name = [typeof _nearest,0] call XfGetDisplayName;
								_control = _chdispx displayCtrl 64438;
								if (!(_vec getVariable "D_Vehicle_Attached")) then {
									_control ctrlSetText format ["Type: %1", _type_name];
								} else {
									_control ctrlSetText format ["Lifting %1", _type_name];
								};
								_control = _chdispx displayCtrl 64439;
								if (getText (configFile >> "CfgVehicles" >> typeof _nearest >> "picture") != "picturestaticobject") then {
									_control ctrlSetText getText (configFile >> "CfgVehicles" >> typeof _nearest >> "picture");
								} else {
									_control ctrlSetText "";
								};
								
								if (!(_vec getVariable "D_Vehicle_Attached")) then {
									_control = _chdispx displayCtrl 64441;
									_control ctrlSetText format ["Dist to vec: %1", _vec distance _nearest];
									_nearest_pos = position _nearest;
									_pos_vec = position _vec;
									_nx = _nearest_pos select 0;_ny = _nearest_pos select 1;_px = _pos_vec select 0;_py = _pos_vec select 1;
									if ((_px <= _nx + 10 && _px >= _nx - 10) && (_py <= _ny + 10 && _py >= _ny - 10) && (_pos_vec select 2 < _lift_height)) then {
										_control = _chdispx displayCtrl 64448;
										_control ctrlSetText _ui_ok;
									} else {
										_control = _chdispx displayCtrl 64442;
										if ((position _vec) select 2 >= _lift_height) then {
											_control ctrlSetText "Too high";
										} else {
											_control ctrlSetText "";
										};
										_control2 = _chdispx displayCtrl 64447;
										_control2 ctrlSetText _ui_tohigh;
										_angle = 0; _a = ((_nearest_pos select 0) - (_pos_vec select 0));_b = ((_nearest_pos select 1) - (_pos_vec select 1));
										if (_a != 0 || _b != 0) then {_angle = _a atan2 _b}; 
										
										_dif = (_angle - direction _vec);
										if (_dif < 0) then {_dif = 360 + _dif};
										if (_dif > 180) then {_dif = _dif - 360};
										_angle = _dif;
										_control2 = _chdispx displayCtrl 64444;
										if (_angle >= -70 && _angle <= 70) then {
											_control2 ctrlSetText _ui_forward;
										} else {
											_control2 ctrlSetText "";
										};
										_control2 = _chdispx displayCtrl 64446;
										if (_angle >= 20 && _angle <= 160) then {
											_control2 ctrlSetText _ui_right;
										} else {
											_control2 ctrlSetText "";
										};
										_control2 = _chdispx displayCtrl 64443;
										if (_angle <= -110 || _angle >= 110) then {
											_control2 ctrlSetText _ui_back;
										} else {
											_control2 ctrlSetText "";
										};
										_control2 = _chdispx displayCtrl 64445;
										if (_angle <= -20 && _angle >= -160) then {
											_control2 ctrlSetText _ui_left;
										} else {
											_control2 ctrlSetText "";
										};
										sleep 0.001;
									};
								} else {
									_control = _chdispx displayCtrl 64441;
									_control ctrlSetText format ["Dist attached to ground: %1", (position _nearest) select 2];
									_control = _chdispx displayCtrl 64442;
									_control ctrlSetText "Attached";
									sleep 0.001;
								};
							} else {
								67321 cutRsc ["DOM_RscNothing", "PLAIN"];
								67322 cutRsc ["chopper_lift_hud2", "PLAIN"];
								_chdispx2 = uiNamespace getVariable "DCHOP_HUD2";
								_controlxx = _chdispx2 displayCtrl 61422;
								_controlxx ctrlSetText (switch (_chopttype) do {
									case 0: {"Lift Chopper"};
								});
							};
						} else {
							if (!_hudoff) then {
								_hudoff = true;
								67321 cutRsc ["DOM_RscNothing", "PLAIN"];
								67322 cutRsc ["DOM_RscNothing", "PLAIN"];
							};
						};
						sleep 0.231;
					};
					67321 cutRsc ["DOM_RscNothing", "PLAIN"];
					67322 cutRsc ["DOM_RscNothing", "PLAIN"];
				} else {
					67322 cutRsc ["chopper_lift_hud2", "PLAIN"];
					_chdispx2 = uiNamespace getVariable "DCHOP_HUD2";
					while {vehicle player != player && alive player && player == driver _vec} do {
						if (typeOf _vec in EVO_f_attackhelis) then {
							_control = _chdispx2 displayCtrl 61422;
							_control ctrlSetText "Attack Chopper";
							sleep 0.421;						
						} else {
							_control = _chdispx2 displayCtrl 61422;
							_control ctrlSetText "Normal Chopper";
							sleep 0.421;
						};
					};
					67322 cutRsc ["DOM_RscNothing", "PLAIN"];
				};
			};
		};
		sleep 0.432;
	};
	waitUntil {sleep random 0.2;vehicle player == player};	
};