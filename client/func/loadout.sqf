//by Xeno - changed by psycho for evo
#include "setup.sqf"
private ["_p", "_id", "_rtype", "_oabackpackmags", "_oabackpackweaps", "_ubp", "_ubackp", "_hasruck", "_ruckmags", "_ruckweapons", "_backwep", "_ident", "_primw", "_muzzles", "_bp", "_mags", "_mcount", "_forEachIndex", "_weaps"];
_rtype = _this select 0;

if (_rtype == 0) then { // player died
_p = player;
#ifndef __A2__
	_oabackpackmags = [[],[]];
	_oabackpackweaps = [[],[]];
	_ubp = unitBackpack _p;
	_ubackp = if (!isNull _ubp) then {typeOf _ubp} else {""};
	if (_ubackp != "") then {
		_oabackpackmags = getMagazineCargo _ubp;
		_oabackpackweaps = getWeaponCargo _ubp;
	};
	__pSetVar ["respawn_oabackpackmags", _oabackpackmags];
	__pSetVar ["respawn_oabackpackweaps", _oabackpackweaps];
	__pSetVar ["respawn_ubackp", _ubackp];
#endif

#ifdef __ACE__
	_hasruck = false;
	_ruckmags = [];
	_ruckweapons = [];
	if ([_p] call ACE_fnc_HasRuck) then {
		_ruckmags = __pGetVar(ACE_RuckMagContents);
		_hasruck = true;
		_ruckweapons = __pGetVar(ACE_RuckWepContents);
	};
	_backwep = __pGetVar(ACE_weapononback);
	_ident = __pGetVar(ACE_Identity);
	if (!isNil "_hasruck") then {__pSetVar ["respawn_hasruck", _hasruck]};
	if (!isNil "_ruckmags") then {__pSetVar ["respawn_ruckmags", _ruckmags]};
	if (!isNil "_ruckweapons") then {__pSetVar ["respawn_ruckweapons", _ruckweapons]};
	if (!isNil "_backwep") then {__pSetVar ["respawn_backwep", _backwep]};
	if (!isNil "_ident") then {__pSetVar ["respawn_ident", _ident]};
#endif
	__pSetVar ["respawn_weapons", EVO_pweapons];
	__pSetVar ["respawn_magazines", EVO_pammo];
	__pSetVar ["respawn_items", EVO_pitems];
} else { // _rtype = 1, player has respawned
#ifndef __A2__
	removeBackpack player;
#endif
	_p = player;
	removeAllItems _p;
	removeAllWeapons _p;
	{__addmx} forEach __pGetVar(respawn_magazines);
	{__addwx} forEach __pGetVar(respawn_weapons);
	{if !(_p hasWeapon _x) then {__addwx}} forEach __pGetVar(respawn_items);
	_primw = primaryWeapon _p;
	if (_primw != "") then {
		_p selectWeapon _primw;
		_muzzles = getArray(configFile>>"cfgWeapons" >> _primw >> "muzzles");
		_p selectWeapon (_muzzles select 0);
	};
#ifndef __A2__
	_ubackp = __pGetVar(respawn_ubackp);
	if (_ubackp != "") then {
		if (!isNull (unitBackpack _p)) then {removeBackpack _p};
		_p addBackpack _ubackp;
		_bp = unitBackpack _p;
		clearMagazineCargo _bp;
		clearWeaponCargo _bp;
		_oabackpackmags = __pGetVar(respawn_oabackpackmags);
		_oabackpackweaps = __pGetVar(respawn_oabackpackweaps);
		if (count (_oabackpackmags select 0) > 0) then {
			_mags = _oabackpackmags select 0;
			_mcount = _oabackpackmags select 1;
			{_bp addMagazineCargo [_x, _mcount select _forEachIndex]} forEach _mags;
		};
		if (count (_oabackpackweaps select 0) > 0) then {
			_weaps = _oabackpackweaps select 0;
			_mcount = _oabackpackweaps select 1;
			{_bp addWeaponCargo [_x, _mcount select _forEachIndex]} forEach _weaps;
		};
	};
#endif
	"RadialBlur" ppEffectAdjust [0.0, 0.0, 0.0, 0.0];
	"RadialBlur" ppEffectCommit 0;
	"RadialBlur" ppEffectEnable false;
#ifdef __ACE__
	_hasruck = __pGetVar(respawn_hasruck);
	if (_hasruck) then {
		_ruckmags = __pGetVar(respawn_ruckmags);
		_ruckweapons = __pGetVar(respawn_ruckweapons);
		if (!isNil "_ruckmags") then {__pSetVar ["ACE_RuckMagContents", _ruckmags]};
		if (!isNil "_ruckweapons") then {__pSetVar ["ACE_RuckWepContents", _ruckweapons]};
	};
	_backwep = __pGetVar(respawn_backwep);
	if (!isNil "_backwep") then {if ((typeName _backwep) == "STRING") then {__pSetVar ["ACE_weapononback", _backwep]}};
	ACE_MvmtFV = 0;ACE_FireFV = 0;ACE_WoundFV = 0;ACE_FV = 0;
	ACE_Heartbeat = [0,20];ACE_Blackout = 0;ACE_Breathing = 0;
	[] spawn {
		private "_ident";
		waitUntil {!dialog};
		sleep 5;
		_ident = __pGetVar(respawn_ident);
		if (_ident != "") then {
			["ace_sys_goggles_setident2", [player, _ident]] call CBA_fnc_globalEvent;
			__pSetVar ["ACE_Identity",_ident];
		};
	};
#endif
};