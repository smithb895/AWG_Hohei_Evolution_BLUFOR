if (!isServer) exitWith {};
execVM "server\handle_vehicles.sqf";
execVM "server\air_defence.sqf";
execVM "server\check_base.sqf";

sleep 10;
[] execVM "server\set_maintarget.sqf";