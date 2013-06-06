#include "setup.sqf"
// by Bon_Inf*
_dragee = _this select 3;
_dragger = _this select 1;

if(isNull _dragee) exitWith{};
if(_dragee distance _dragger > 2.5) exitWith{};

_dragger playMove "acinpknlmstpsraswrfldnon";
sleep 2;
_dragee attachTo [_dragger,[0.1, 1.01, 0]];
__aiSetVar(_dragee) ["dragger",_dragger,true];

_dropaction = _dragger addAction ["Drop body" call XGreyText, (BON_AIS_PATH+"drop_body.sqf"),_dragee, 0, false, true];