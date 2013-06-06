//by psycho
disableSerialization;
_dialog = findDisplay 68000;
_slider_air = _dialog displayCtrl 68006;
_slider_ground = _dialog displayCtrl 68005;

_vpos = (sliderPosition 68005);
_avpos = (sliderPosition 68006);
EVO_vdist = _vpos;
EVO_avdist = _avpos;
setViewDistance _vpos;
closeDialog 0;