_pl = _this select 0;
//_am = _this select 1;

if (player getvariable "NUX_AIRSYS_MFLARES") exitwith {};

if ((NUX_AIRSYS_FLARE)) then
{
	switch (typeof vehicle _pl) do 
	{
		case ("Su25_CDF") : 
		{
			for [{_i=0},{_i<5},{_i=_i+1}] do 
			{
				_pl action ["useWeapon", vehicle _pl,driver vehicle _pl,5];
				sleep 0.24;
			};
		};
		case ("AV8B") : 
		{
			for [{_i=0},{_i<5},{_i=_i+1}] do 
			{
				_pl action ["useWeapon", vehicle _pl,driver vehicle _pl,6];
				sleep 0.24;
			};
			
		};
		case ("AV8B2") : 
		{
			for [{_i=0},{_i<5},{_i=_i+1}] do 
			{
				_pl action ["useWeapon", vehicle _pl,driver vehicle _pl,9];
				sleep 0.24;
			};
		};
		case ("A10") : 
		{
			for [{_i=0},{_i<5},{_i=_i+1}] do 
			{
				_pl action ["useWeapon", vehicle _pl,driver vehicle _pl,10];
				sleep 0.24;
			};
		};
		case ("F35B") : 
		{
			for [{_i=0},{_i<5},{_i=_i+1}] do 
			{
				_pl action ["useWeapon", vehicle _pl,driver vehicle _pl,7];
				sleep 0.24;
			};
		};
		case ("MV22") : 
		{
			for [{_i=0},{_i<5},{_i=_i+1}] do 
			{
				_pl action ["useWeapon", vehicle _pl,driver vehicle _pl,0];
				sleep 0.24;
			};
		};
		case ("C130J") : 
		{
			for [{_i=0},{_i<6},{_i=_i+1}] do 
			{
				_pl action ["useWeapon", vehicle _pl,driver vehicle _pl,0];
				sleep 0.24;
			};

		};
		case ("AH1Z") : 
		{
			for [{_i=0},{_i<5},{_i=_i+1}] do 
			{
				_pl action ["useWeapon", vehicle _pl,gunner vehicle _pl,9];
				sleep 0.24;
			}

			
		};
		case ("Mi24_D") : 
		{
			for [{_i=0},{_i<5},{_i=_i+1}] do 
			{
				_pl action ["useWeapon", vehicle _pl,gunner vehicle _pl,8];
				sleep 0.24;
			};
		
		};
			//case ("UH1Y") : {_vinit='this execvm "scripts\heliinit.sqf";';};
	};
	
};	
sleep 0.5;
	

player setvariable ["NUX_AIRSYS_MFLARES",false];


