//this isn't really useful if your server uses verifySignature = 2; in the server.cfg....
// some of the code was found in a life mission... credit for some of the code to them

sleep 15;

fnc_hint = {_code = _this select 0;  hint format["%1", _code];
};


"anticheat" addPublicVariableEventHandler {[_this select 1] call fnc_hint;};

_cfg = configFile >> "CfgPatches";
_patches = [];
for "_i" from 0 to count (_cfg)-1 do
{
	_sel = _cfg select _i;
	if(isClass _sel) then
	{
		_name = configName _sel;
		_patches set[count _patches,_name];
	};
};
// here is the part where we start looking for lazy hackers...

if("DevCon" in _patches) then
{
	hint format["**ShutEmDown Antihack**: %1 is using dev-con to execute scripts... he must be that stupid... Player ID: %2", name player, getPlayerUID player, _code];
	anticheat = _code;
	publicVariable "anticheat";
	disableUserInput true;
diag_log format["**ShutEmDown Antihack**: %1 is another moron who got caught using dev-con Player ID: %2", name player, getPlayerUID player];
player commandchat format ["**ShutEmDown Antihack**:%1 has been caught hacking. PID: %2",name player, getPlayerUID player];

};

[] spawn
{
	while {true} do
	{
		if(!isNil {scroll_m_init_star}) then
		{	
			anticheat = _code;
			publicVariable "anticheat";
//put a note in the logs as well, just in case :)
diag_log format["**ShutEmDown Antihack**:%1 is another moron who got caught using haxx PID: %2", name player, getPlayerUID player];
			sleep 1;
			endMission "Loser";
// lets put a message in commandchat (because it is yellow and more noticable) and a hint...
player commandchat format ["**ShutEmDown Antihack**:%1 has been caught hacking. Player ID %2",name player, getPlayerUID player];		
hint format ["**ShutEmDown Antihack**:%1 is using haxx. Go somewhere else bro... Player ID: %2", name player, getPlayerUID player];
};
		
		if(!isNil {exstr1}) then
		{
			hint format["**ShutEmDown Antihack**:%1 is using haxxx.... Go somewhere else bro... Player ID: %2", name player, getPlayerUID player];
			anticheat = _code;
			publicVariable "anticheat";
diag_log format["**ShutEmDown Antihack**:%1 is another moron who got caught using haxx Player ID: %2", name player, getPlayerUID player];
			sleep 1;
			endMission "Loser";
player commandchat format ["**ShutEmDown Antihack**:%1 has been caught hacking. Player ID %2",name player, getPlayerUID player];		
};
		
		if(!isNil {pathtoscrdir3}) then
		{
			hint format["**ShutEmDown Antihack**:%1 is using haxxx.... Go somewhere else bro...Player ID %2", name player, getPlayerUID player];
			anticheat = _code;
			publicVariable "anticheat";
diag_log format["**ShutEmDown Antihack**:%1 is another moron who got caught using haxxPlayer ID %2", name player, getPlayerUID player];
			sleep 1;
			endMission "Loser";
player commandchat format ["**ShutEmDown Antihack**:%1 has been caught hacking. Player ID: %2.",name player, getPlayerUID player];		
};
		
		if(!isNil {Monky_funcs_inited}) then
		{
			hint format["**ShutEmDown Antihack**:%1 is using haxxx.... Go somewhere else bro...Player ID %2", name player, getPlayerUID player];
			anticheat = _code;
			publicVariable "anticheat";
diag_log format["**ShutEmDown Antihack**:%1 is another moron who got caught using haxxPlayer ID %2", name player, getPlayerUID player];
			sleep 1;
			endMission "Loser";
player commandchat format ["**ShutEmDown Antihack**:%1 has been caught hacking.Player ID %2",name player, getPlayerUID player];		
};
		
		if(!isNil {Monky_initMenu}) then
		{
			hint format["**ShutEmDown Antihack**:%1 is using haxxx.... Go somewhere else bro...Player ID %2", name player, getPlayerUID player];
			anticheat = _code;
			publicVariable "anticheat";
diag_log format["**ShutEmDown Antihack**:%1 is another moron who got caught using haxxPlayer ID %2", name player, getPlayerUID player];
			sleep 1;
			endMission "Loser";
player commandchat format ["**ShutEmDown Antihack**:%1 has been caught hacking.Player ID %2",name player, getPlayerUID player];		
};
		
		if(!isNil {player_zombieCheck}) then
		{
			hint format["**ShutEmDown Antihack**:%1 is using haxxx.... Go somewhere else bro... Player ID: %2", name player, getPlayerUID player];
			anticheat = _code;
			publicVariable "anticheat";
diag_log format["**ShutEmDown Antihack**:%1 is another moron who got caught using haxxPlayer ID %2", name player, getPlayerUID player];
player commandchat format ["**ShutEmDown Antihack**:%1 has been caught hacking.Player ID %2",name player, getPlayerUID player, getPlayerUID player];		
};
		
		if(!isNil {godlol}) then
		{
			hint format["**ShutEmDown Antihack**:%1 is using haxxx.... Go somewhere else bro...Player ID %2", name player, getPlayerUID player];
			anticheat = _code;
			publicVariable "anticheat";
diag_log format["**ShutEmDown Antihack**:%1 is another moron who got caught using haxxPlayer ID %2", name player, getPlayerUID player];
player commandchat format ["**ShutEmDown Antihack**:%1 has been caught hacking.Player ID %2",name player, getPlayerUID player];		
};
		
		if(!isNil {playericons}) then
		{
			hint format["**ShutEmDown Antihack**:%1 is using haxxx.... Go somewhere else bro...Player ID %2", name player, getPlayerUID player];
			anticheat = _code;
			publicVariable "anticheat";
diag_log format["**ShutEmDown Antihack**:%1 is another moron who got caught using haxxPlayer ID %2", name player, getPlayerUID player];
player commandchat format ["**ShutEmDown Antihack**:%1 has been caught hacking.Player ID %2",name player, getPlayerUID player];		
};
		
		if(!isNil {abcdefGEH}) then
		{
			hint format["**ShutEmDown Antihack**:%1 is using haxxx.... Go somewhere else bro...Player ID %2", name player, getPlayerUID player];
			anticheat = _code;
			publicVariable "anticheat";
diag_log format["**ShutEmDown Antihack**:%1 is another moron who got caught using haxx. Player ID %2", name player, getPlayerUID player];
player commandchat format ["**ShutEmDown Antihack**:%1 has been caught hacking. Player ID %2",name player, getPlayerUID player];		
};
		
		if(!isNil {wierdo}) then
		{
			hint format["**ShutEmDown Antihack**:%1 is using haxxx.... Go somewhere else bro... Player ID %2", name player, getPlayerUID player];
			anticheat = _code;
			publicVariable "anticheat";
diag_log format["**ShutEmDown Antihack**:%1 is another moron who got caught using haxx. Player ID %2", name player, getPlayerUID player];
player commandchat format ["**ShutEmDown Antihack**:%1 has been caught hacking. Player ID %2",name player, getPlayerUID player];		
};
		
		if(!isNil {go_invisible_infiSTAR}) then
		{
			hint format["**ShutEmDown Antihack**:%1 is using haxxx.... Go somewhere else bro... Player ID %2", name player, getPlayerUID player];
			anticheat = _code;
			publicVariable "anticheat";
diag_log format["**ShutEmDown Antihack**:%1 is another moron who got caught using haxx Player ID %2", name player, getPlayerUID player];
player commandchat format ["**ShutEmDown Antihack**:%1 has been caught hacking. Player ID %2",name player, getPlayerUID player];		
};
		
		if(!isNil {serverObjectMonitor}) then
		{
			hint format["**ShutEmDown Antihack**:%1 is using haxxx.... Go somewhere else bro... Player ID %2", name player, getPlayerUID player];
			anticheat = _code;
			publicVariable "anticheat";
diag_log format["**ShutEmDown Antihack**:%1 is another moron who got caught using haxx Player ID %2", name player, getPlayerUID player];
player commandchat format ["**ShutEmDown Antihack**:%1 has been caught hacking. Player ID %2",name player, getPlayerUID player];		
};
		
		if(!isNil {enamearr}) then
		{
			 hint format["**ShutEmDown Antihack**:%1 is using haxxx.... Go somewhere else bro... Player ID %2", name player, getPlayerUID player];
			anticheat = _code;
			publicVariable "anticheat";
diag_log format["**ShutEmDown Antihack**:%1 is another moron who got caught using haxx Player ID %2", name player, getPlayerUID player];
player commandchat format ["**ShutEmDown Antihack**:%1 has been caught hacking. Player ID %2",name player, getPlayerUID player];		
};
		if(!isNil {initarr3}) then
		{
			hint format["**ShutEmDown Antihack**:%1 is using haxxx.... Go somewhere else bro... Player ID %2", name player, getPlayerUID player];
			anticheat = _code;
			publicVariable "anticheat";
diag_log format["**ShutEmDown Antihack**:%1 is another moron who got caught using haxx Player ID %2", name player, getPlayerUID player];
player commandchat format ["**ShutEmDown Antihack**:%1 has been caught hacking.",name player, getPlayerUID player];		
};
		
		if(!isNil {locdb}) then
		{
			hint format["**ShutEmDown Antihack**:%1 is using haxxx.... Go somewhere else bro...Player ID %2", name player, getPlayerUID player];
			anticheat = _code;
			publicVariable "anticheat";
diag_log format["**ShutEmDown Antihack**:%1 is another moron who got caught using haxx Player ID %2", name player, getPlayerUID player];
player commandchat format ["**ShutEmDown Antihack**:%1 has been caught hacking.Player ID %2",name player, getPlayerUID player];		
};
		
		if(!isNil {sCode}) then
		{
			hint format["**ShutEmDown Antihack**:%1 is using haxxx.... Go somewhere else bro...Player ID %2", name player, getPlayerUID player];
			anticheat = _code;
			publicVariable "anticheat";
diag_log format["**ShutEmDown Antihack**:%1 is another moron who got caught using haxx Player ID %2", name player, getPlayerUID player];
player commandchat format ["**ShutEmDown Antihack**:%1 has been caught hacking. Player ID %2",name player, getPlayerUID player];		
};
		
		if(!isNil {infAmmoIndex}) then
		{
			hiny format["**ShutEmDown Antihack**:%1 is using haxxx.... Go somewhere else bro... Player ID %2", name player, getPlayerUID player];
			anticheat = _code;
			publicVariable "anticheat";
diag_log format["**ShutEmDown Antihack**:%1 is another moron who got caught using haxx Player ID %2", name player, getPlayerUID player];
player commandchat format ["**ShutEmDown Antihack**:%1 has been caught hacking.",name player, getPlayerUID player];
		};
		
		if(!isNil {nukeDONEstar}) then
		{
			hint format["**ShutEmDown Antihack**:%1 is using haxxx.... Go somewhere else bro... Player ID %2", name player, getPlayerUID player];
			anticheat = _code;
			publicVariable "anticheat";
diag_log format["**ShutEmDown Antihack**:%1 is another moron who got caught using haxx Player ID %2", name player, getPlayerUID player];
player commandchat format ["**ShutEmDown Antihack**:%1 has been caught hacking Player. ID %2",name player, getPlayerUID player];
		};

else {

hint format ["**ShutEmDown Antihack**:%1 has encountered an error while his addons were being checked.Player ID %2",name player, getPlayerUID player];
player commandchat format ["**ShutEmDown Antihack**:%1 has encountered an error while his addons were being checked.Player ID %2",name player, getPlayerUID player];
diag_log format["**ShutEmDown Antihack**:%1 encountered a problem while his addons were being checked.Player ID %2", name player, getPlayerUID player];		
		sleep 10;
	};
};


	