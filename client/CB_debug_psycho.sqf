//by psycho
//for ingame debugging

if (!(local player) and (!((name Player == "Psychobastard") or (name Player == "cB.Razor")))) exitWith {};

_psycho = _this select 0;
CB_jump = false;
CB_noD = false;
CB_cursorDown = false;


for [{_loop=0}, {_loop<1}, {_loop=_loop}] do {
waitUntil {alive _psycho};
sleep 2;

	if (!CB_jump) then {
		CB_jump = true;
		_ID_jumpM = _psycho addAction ["Mapswitch On" call XRedText,"tcb_scripts\actions\CB_mapswitch.sqf",[_psycho],0, false, true];
		onMapSingleClick "";
	};
	if (!CB_noD) then {
		CB_noD = true;
		_ID_noD = _psycho addAction ["no dammage" call XRedText,"tcb_scripts\actions\CB_noD.sqf",[_psycho],0, false, true];
	};
	if (!CB_cursorDown) then {
		CB_cursorDown = true;
		_ID_cursorDown = _psycho addAction ["destroy CursorTarget" call XRedText,"tcb_scripts\actions\CB_destroyCursor.sqf",[_psycho],0, false, true];
	};
};