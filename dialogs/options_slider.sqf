﻿//by psycho
disableSerialization;
_dialog = findDisplay 68000;
_slider_air = _dialog displayCtrl 68006;
_slider_ground = _dialog displayCtrl 68005;
_vdist = _dialog displayCtrl 68007;
_avdist = _dialog displayCtrl 68008;

_vpos = (sliderPosition 68005);
_avpos = (sliderPosition 68006);
_vdist ctrlSetText format["%1",(round _vpos)];
_avdist ctrlSetText format["%1",(round _avpos)];

setViewDistance _vpos;