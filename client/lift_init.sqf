#include "setup.sqf"
sleep 5.32;

__cppfln(x_checkhelipilot,dialogs\DomiLift\x_checkhelipilot.sqf);
__cppfln(x_checkhelipilotout,dialogs\DomiLift\x_checkhelipilotout.sqf);
__cppfln(x_initvec,dialogs\DomiLift\x_initvec.sqf);

[] spawn {sleep 2;{_x call x_initvec;sleep 0.01} forEach vehicles};
execVM "dialogs\DomiLift\x_chop_hud.sqf";