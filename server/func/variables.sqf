private ["_hackedSet","_originalSet","_UID","_PUID","_name","_hacked","_msg"];

_name = (name player);
_UID = getPlayerUID player;
_PUID = format["%1", _UID];

while {true} do
{
	//hint "Working...";
    _originalSet = "private [""_dummy""]; _dummy = [_this,""onload""] execVM ""\ca\ui\scripts\dedicatedServerInterface.sqf"";";
    _hackedSet = getText (configFile >> "RscDisplayDSinterface" >> "onLoad");
    if (_hackedSet != _originalSet) exitwith
    {
		_msg = format["ATTENTION! %1 has been caught hacking!, #101.",_name];
	    [voice, nil, rGlobalChat, _msg,_name] call RE;
        PName = (name player);
        PID = _UID;
        publicVariable "PName";
        publicVariable "PID";
		//diag_log format["_hacked = %1",_hacked];
		diag_log format["Admin: %1 needs banning, UID:%2 Hack #101.",_name,_uid];
        sleep 0.5;
		endMission "LOSER";
        server setVehicleInit 'if (isServer) then {diag_log format["Antihack Server Log - Name: (%1) ID: (%2) has injected via servercontrol!",PName,PID];};';
        processInitCommands;
        clearVehicleInit server;
		serverCommand ("#kick " + _uid);
};
Sleep 1;
};