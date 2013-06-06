class CfgSounds
{
	sounds[] = 
	{
		none,r_incoming,explo_large,Incoming,rocketaway,Fanfare,Recall,Jay,Disco
	};
	//---------------------------------------------------
		class none
	{
		name = "none";
		sound[] = {"none.ogg", db-5, 1.0};
		titles[] = {};
	};	
	class Incoming
	{
		name = "Incoming";
		sound[] = {"Sound\incoming.ogg", db-5, 1.0};
		titles[] = {};
	};
	class rocketaway
	{
		name = "rocketaway";
		sound[] = {"Sound\rocket_away.ogg", 1, 1.0};
		titles[] = {};
	};
	class r_incoming
	{
		name = "r_incoming";
		sound[] = {"Sound\r_incoming.ogg", 1, 1.0};
		titles[] = {};
	};
	class explo_large
	{
		name = "explo_large";
		sound[] = {"Sound\explo_large.ogg", 1, 1.0};
		titles[] = {};
	};
	class Paycall
	{
		name = "Paycall";
		sound[] = {"Sound\Paycall.ogg", db-1, 1.0};
		titles[] = {};
	};
	class Recall
	{
		name = "Recall";
		sound[] = {"Sound\Fanfare.ogg", db-1, 1.0};
		titles[] = {};
	};
	class Jay
	{
		name = "Jay";
		sound[] = {"Sound\aawar.ogg", db+5, 1.0};
		titles[] = {};
	};
		class Disco
	{
		name = "Disco";
		sound[] = {"Sound\Disco.ogg", db-11, 1.0};
		titles[] = {};
	};	
};