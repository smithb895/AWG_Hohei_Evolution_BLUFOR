_object = _this select 0;
_light = "#lightpoint" createVehicleLocal getpos _object;
_light setLightBrightness 0.1;
_light setLightColor[0.05, 0.05, 0.05];

while {true} do {
   sleep 0.501;
	_rand   = floor (random 4);
	switch (_rand) do {
	    case 0 : {_light setLightAmbient[0.5,0.0,0.0]};
	    case 1 : {_light setLightAmbient[0.3,0.3,0.0]};
	    case 2 : {_light setLightAmbient[0.0,0.3,0.5]};
	    case 3 : {_light setLightAmbient[0.3,0.0,0.5]};
		defaut {};
	};
};