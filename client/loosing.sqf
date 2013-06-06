//by psycho
// be aware! - this script will execute from every machine!!!
#include "setup.sqf"

sleep 5;
0 fadeMusic 0.5;
#ifdef __OA__
playMusic "EP1_Track03D";
#else
playMusic "Track20_Badlands";
#endif
sleep 10;
if (dialog) then {closeDialog 0};
sleep 0.5;
TitleRsc ["loosing_end4_text", "plain", 1.5];
sleep 10;
titleCut ["","black faded", 6];
sleep 8;
endMission "END4";
forceEnd;