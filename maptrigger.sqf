_psycho = _this select 0;
_debug = true;
CB_jump = false;


for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
waitUntil {alive _psycho};
sleep 2;

	if (!(CB_jump)) then		//activate position change per mapclick
	{
		CB_jump = true;
		ID_jumpM = _psycho addAction ["<t color=""#00B7FF"">" + "Mapswitch on","mapswitch.sqf",[_psycho],-100, false, true];
		onMapSingleClick "";
	};
};