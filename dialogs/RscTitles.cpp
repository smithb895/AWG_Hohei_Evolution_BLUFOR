//by psycho
#include "setup.sqf"

#define Color_White					{1, 1, 1, 1}
#define Color_Blue 					{0.2, 0.2, 0.9, 1}
#define TextSize_small 				0.022 //16/768
#define TextSize_normal 			0.024 //19/768
#define TextSize_medium 			0.07 //23/768
#define TextSize_large  			0.11 //44/768

class RscStdText {
	type=0;
	idc=-1;
	style=2; 
	colorBackground[]={0,0,0,0}; 
	colorText[]={1,1,1,1};       
	font="TahomaB";
	size=1;
};
class Border {
    idc			= -1;
    type		= 0;
    style		= 0;
    colorBackground[]	= {0.00, 0.00, 0.00, 0.20};
    colorText[]		= {0.00, 0.00, 0.00, 1.00};
    font		= "TahomaB";
    sizeEx		= 0.023;
    h			= 0.02;
};
class Border2 {
    idc			= -1;
    type		= 0;
    style		= 0;
    colorBackground[]	= {0.00, 0.00, 0.00, 0.50};
    colorText[]		= {0.00, 0.00, 0.00, 1.00};
    font		= "TahomaB";
    sizeEx		= 0.023;
    h			= 0.02;
};
class Border3 {
    idc			= -1;
    type		= 0;
    style		= 0;
    colorBackground[]	= {0.00, 0.00, 0.00, 0.00};
    colorText[]		= {1.00, 1.00, 1.00, 1.00};
    font		= "TahomaB";
    sizeEx		= 0.023;
    h			= 0.02;
};


class RscTitles {
	titles[] ={"Evo_color_blue_1","Evo_color_blue_2","Evo_color_red_1","Evo_color_red_2","screen","DOM_RscNothing","chopper_lift_hud2","chopper_lift_hud","chopper_hud"};
	class Evo_color_blue_1 {
		idd=-1;
		movingEnable = true;
		duration=10;
		fadein=5;
		fadeout=0;
		name = "Evo_color_blue_1";	
		controls[]= {Picture};	
		class Picture : RscPicture {
			x = 0.3; 
			y = 0.2; 
			w = 0.5; 
			h = 0.08;//0.05
			text = "pictures\evo_blue.paa";
			sizeEx = 0.04;	
			style = 48;
		};
	};
	class Evo_color_blue_2 {
	  	idd=-3;
	  	movingEnable=true;
	  	duration=18;
	  	fadein=0;
		fadout=3;
	  	name="Evo_color_blue_2";
	  	controls[]={Picture,Picture2};
		class Picture : RscPicture {
			x = 0.3; 
			y = 0.2; 
			w = 0.5; 
			h = 0.08;//0.05
			text = "pictures\evo_blue.paa";
			sizeEx = 0.04;	
			style = 48;
		};
		class Picture2 : RscPicture {
			x = 0.73; 
			y = 0.115; 
			w = 0.16; 
			h = 0.16;//0.05
			text = "pictures\blue_small.paa";
			sizeEx = 0.04;	
			style = 48;
		};
	};
	class Evo_color_red_1 {
		idd=-1;
		movingEnable = true;
		duration=10;
		fadein=5;
		fadeout=0;
		name = "Evo_color_red_1";	
		controls[]= {Picture};	
		class Picture : RscPicture {
			x = 0.3; 
			y = 0.2; 
			w = 0.5; 
			h = 0.08;//0.05
			text = "pictures\evo_red.paa";
			sizeEx = 0.04;	
			style = 48;
		};
	};
	class Evo_color_red_2 {
	  	idd=-3;
	  	movingEnable=true;
	  	duration=18;
	  	fadein=0;
		fadout=3;
	  	name="Evo_color_red_2";
	  	controls[]={Picture,Picture2};
		class Picture : RscPicture {
			x = 0.3; 
			y = 0.2; 
			w = 0.5; 
			h = 0.08;//0.05
			text = "pictures\evo_red.paa";
			sizeEx = 0.04;	
			style = 48;
		};
		class Picture2 : RscPicture {
			x = 0.73; 
			y = 0.115; 
			w = 0.16; 
			h = 0.16;//0.05
			text = "pictures\red_small.paa";
			sizeEx = 0.04;	
			style = 48;
		};
	};
#ifdef __OA__
	class screen {
		idd=-1; 
		movingEnable=1; 
		duration=10e10; 
		fadein=0;
		fadeout=1;
		name="Screen"; 
		onload = "uinamespace setvariable ['str_screen',_this select 0];";
		class controls {
			class screen_0: RscPicture {
				idc = 1000;
				text="pictures\screen_dirt_ca.paa";
				x=safezoneX;
				y=safezoneY;
				w=0;
				h=0;	  
			};
			class screen_1: screen_0 {idc = 1001; text="pictures\screen_blood_1_ca.paa";};
			class screen_2: screen_0 {idc = 1002; text="pictures\screen_blood_2_ca.paa";};
			class screen_3: screen_0 {idc = 1003; text="pictures\screen_blood_3_ca.paa";};
			class screen_4: screen_0 {idc = 1004; text="pictures\screen_blood_1_ca.paa";};
			class screen_5: screen_0 {idc = 1005; text="pictures\screen_blood_2_ca.paa";};
			class screen_6: screen_0 {idc = 1006; text="pictures\screen_blood_3_ca.paa";};
		};
	};
#else
	class screen {
		idd=-1; 
		movingEnable=1; 
		duration=10e10; 
		fadein=0;
		fadeout=1;
		name="Screen"; 
		onload = "uinamespace setvariable ['str_screen',_this select 0];";
		/*
		class controlsbackground {
			class vignette: RscPicture {
				idc = -1;
				text="ca\missions_ew\img\vignette_ca.paa";
				x=safezoneX;
				y=safezoneY;
				w=safezoneW;
				h=safezoneH;
				colortext[] = {1,1,1,0.7};
			};
		};*/
		class controls {
			class screen_0: RscPicture {
				idc = 1000;
				text="ca\missions_ew\img\screen_dirt_ca.paa";
				x=safezoneX;
				y=safezoneY;
				w=0;
				h=0;	  
			};
			class screen_1: screen_0 {idc = 1001; text="ca\missions_ew\img\screen_blood_1_ca.paa";};
			class screen_2: screen_0 {idc = 1002; text="ca\missions_ew\img\screen_blood_2_ca.paa";};
			class screen_3: screen_0 {idc = 1003; text="ca\missions_ew\img\screen_blood_3_ca.paa";};
			class screen_4: screen_0 {idc = 1004; text="ca\missions_ew\img\screen_blood_1_ca.paa";};
			class screen_5: screen_0 {idc = 1005; text="ca\missions_ew\img\screen_blood_2_ca.paa";};
			class screen_6: screen_0 {idc = 1006; text="ca\missions_ew\img\screen_blood_3_ca.paa";};
		};
	};
#endif


//----ch hud

	class chopper_hud {
		idd=-1;
		movingEnable = true;
		fadein = 0;
		fadeout = 1;
		duration = 1e+011;
		name="chopper_hud";
		onLoad="uiNamespace setVariable ['DCHOP_HUD', _this select 0]";
		class controls {
			class vehicle_hud_start {
				type = 0;
				idc = 64438;
				style = 0;
				x = 0.3;y = 0.3;w = 0.6;h = 0.4;
				font = "Zeppelin32";
				sizeEx = 0.04;
				colorText[] = {1.0, 1.0, 1.0, 0.9};
				colorBackground[]={0,0,0,0};
				text = "";
			};
			class vehicle_hud_start2: vehicle_hud_start {
				idc = 64439;
				y = 0.37;w = 0.4;
				sizeEx = 0.03;
			};
			class vehicle_hud_start3: vehicle_hud_start {
				idc = 64440;
				y = 0.43;w = 0.5;
				sizeEx = 0.03;
			};
			class vehicle_hud_start4: vehicle_hud_start {
				idc = 64441;
				y = 0.49;w = 0.5;
				sizeEx = 0.03;
			};
		};
	};
	class chopper_lift_hud {
		idd=-1;
		movingEnable = true;
		fadein = 0;
		fadeout = 0;
		duration = 1e+011;
		name="chopper_lift_hud";
		onLoad="uiNamespace setVariable ['DCHOP_LIFT_HUD', _this select 0]";
		class controls {
			class chopper_hud_background {
				idc = 64437;
				type = 0;
				XCTextBlack;
				font = "Bitstream";
				colorBackground[] = {0, 0.3, 0, 0.1};
				text = "";
				style = 128;
				sizeEx = 0.015;
				x = 0.3;y = 0.4;w = 0.42;h = 0.4;
			};
			class chopper_hud_type {
				type = 0;
				idc = 64438;
				style = 0;
				x = 0.31;y = 0.73;w = 0.42;h = 0.1;
				font = "Zeppelin32";
				sizeEx = 0.02;
				XCTextHud;
				colorBackground[]={0,0,0,0};
				text = "";
			};
			class chopper_hud_icon {
				type = 0;
				idc = 64439;
				style = 48;
				x = 0.62;y = 0.723;w = 0.083;h = 0.07;
				font = "Zeppelin32";
				sizeEx = 0.02;
				XCTextHud;
				colorBackground[] = {0,0,0,0};
				text = "";
			};
			class chopper_hud_edge {
				type = 0;
				idc = 64440;
				style = 0;
				x = 0.80;y = 0.005;w = 0.42;h = 0.1;
				font = "Zeppelin32";
				sizeEx = 0.02;
				XCTextHud;
				colorBackground[]={0,0,0,0};
				text = "";
			};
			class chopper_hud_dist {
				type = 0;
				idc = 64441;
				style = 0;
				x = 0.31;y = 0.37;w = 0.25;h = 0.1;
				font = "Zeppelin32";
				sizeEx = 0.02;
				XCTextHud;
				colorBackground[]={0,0,0,0};
				text = "";
			};
			class chopper_hud_height {
				type = 0;
				idc = 64442;
				style = 0;
				x = 0.6;y = 0.37;w = 0.2;h = 0.1;
				font = "Zeppelin32";
				sizeEx = 0.02;
				XCTextHud;
				colorBackground[]={0,0,0,0};
				text = "";
			};
			class chopper_hud_back {
				type = 0;
				idc = 64443;
				style = 48;
				x = 0.45;y = 0.6;w = 0.1;h = 0.1;
				font = "Zeppelin32";
				sizeEx = 0.02;
				XCTextHud;
				colorBackground[]={0,0,0,0};
				text = "";
			};
			class chopper_hud_forward {
				type = 0;
				idc = 64444;
				style = 48;
				x = 0.45;y = 0.5;w = 0.1;h = 0.1;
				font = "Zeppelin32";
				sizeEx = 0.02;
				XCTextHud;
				colorBackground[]={0,0,0,0};
				text = "";
			};
			class chopper_hud_left {
				type = 0;
				idc = 64445;
				style = 48;
				x = 0.4;y = 0.55;w = 0.1;h = 0.1;
				font = "Zeppelin32";
				sizeEx = 0.02;
				XCTextHud;
				colorBackground[]={0,0,0,0};
				text = "";
			};
			class chopper_hud_right {
				type = 0;
				idc = 64446;
				style = 48;
				x = 0.5;y = 0.55;w = 0.1;h = 0.1;
				font = "Zeppelin32";
				sizeEx = 0.02;
				XCTextHud;
				colorBackground[]={0,0,0,0};
				text = "";
			};
			class chopper_hud_middle {
				type = 0;
				idc = 64447;
				style = 48;
				x = 0.45;y = 0.55;w = 0.1;h = 0.1;
				font = "Zeppelin32";
				sizeEx = 0.02;
				XCTextHud;
				colorBackground[]={0,0,0,0};
				text = "";
			};
			class chopper_hud_icon2{
				type = 0;
				idc = 64448;
				style = 48;
				x = 0.458;y = 0.56;w = 0.083;h = 0.07;
				font = "Zeppelin32";
				sizeEx = 0.02;
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,0};
				text = "";
			};
		};
	};
	class chopper_lift_hud2 {
		idd=-1;
		movingEnable = true;
		fadein = 0;
		fadeout = 0;
		duration = 1e+011;
		name="chopper_hud2";
		onLoad="uiNamespace setVariable ['DCHOP_HUD2', _this select 0]";
		class controls {
			class chopper_hud_type {
				type = 0;
				idc = 61422;
				style = 0;
				x = 0;y = 0.005;w = 0.42;h = 0.1;
				font = "Zeppelin32";
				sizeEx = 0.02;
				XCTextHud;
				colorBackground[]={0,0,0,0};
				text = "";
			};
		};
	};
	class DOM_RscNothing {
		idd = -1;
		movingEnable = 0;
		duration = 0.5;
		fadein = 0;
		fadeout = 1.5;
		name = "DOM_RscNothing";
		class controls {
			class DOM_RscNothing_BG2 {
				idc = 2;
				type = 0;
				style = 48;
				colorBackground[] = {0, 0, 0, 0};
				XCTextBlack;
				font = "Bitstream";
				sizeEx = 0.023;
				x = "SafeZoneX";y = "SafeZoneY";w = "SafeZoneW + 0.05";h = "SafeZoneH + 0.05";
				text = "";
			};
		};
	};
	
	class FrameHandlerRsc {
		idd = -1;
		movingEnable = 1;
		enableSimulation = 1;
		enableDisplay = 1;
		duration = 1e+011;
		fadein  = 0;
		fadeout = 0;
		name = "FrameHandlerRsc";
		class controlsBackground {
			class dummy_map : Dummy_Map {
				x = -1;y = -1;w = 0;h = 0;
				onDraw = "call xfperFrame";
			};
		};
		class objects {};
		class controls {};
	};



	class topic_dyk_laser {
	  	idd=-1;
	  	movingEnable=0;
	  	duration=12;  
	  	fadein=2;     
	  	name="topic_dyk_laser";
	  	controls[] = {Titel,lasertarget};
		class Titel : RscStdText {
			text = "Topic: Did you know...";
			colorText[] = Color_Blue;       
			sizeEx = TextSize_large;	  	  	
			x = -0.8;
			y = -0.75;
			w = 1;
			h = 1;	  
		};
		class body : RscStdText {
			text = "...you can earn points if you give a pilot with guided bombs a target per laser designator.";
			colorText[] = Color_White;       
			sizeEx = TextSize_medium;	  	  	
			x = -0.6;
			y = -0.65;
			w = 2;
			h = 1;
		};
	};
	class topic_dyk_shipping {
	  	idd=-1;
	  	movingEnable=0;
	  	duration=12;  
	  	fadein=2;     
	  	name="topic_dyk_shipping";
	  	controls[] = {Titel,body};
		class Titel : RscStdText {
			text = "Topic: Did you know...";
			colorText[] = Color_Blue;       
			sizeEx = TextSize_large;	  	  	
			x = -0.8;
			y = -0.75;
			w = 1;
			h = 1;
		};
		class body : RscStdText {
			text = "...you can earn points if you ship other players from your Base to the Battlefield.";
			colorText[] = Color_White;       
			sizeEx = TextSize_medium;	  	  	
			x = -0.6;
			y = -0.65;
			w = 2;
			h = 1;
		};
	};
	class topic_dyk_box {
	  	idd=-1;
	  	movingEnable=0;
	  	duration=12;  
	  	fadein=2;     
	  	name="topic_dyk_box";
	  	controls[] = {Titel,body};
		class Titel : RscStdText {
			text = "Topic: Did you know...";
			colorText[] = Color_Blue;       
			sizeEx = TextSize_large;	  	  	
			x = -0.8;
			y = -0.75;
			w = 1;
			h = 1;
		};
		class body : RscStdText {
			text = "...you can load nearly any stuff in the planes and choppers to ship them over the map.";
			colorText[] = Color_White;       
			sizeEx = TextSize_medium;	  	  	
			x = -0.6;
			y = -0.65;
			w = 2;
			h = 1;
		};
	};
	class topic_dyk_eng1 {
	  	idd=-1;
	  	movingEnable=0;
	  	duration=12;  
	  	fadein=2;     
	  	name="topic_dyk_eng1";
	  	controls[] = {Titel,body};
		class Titel : RscStdText {
			text = "Topic: Did you know...";
			colorText[] = Color_Blue;       
			sizeEx = TextSize_large;	  	  	
			x = -0.8;
			y = -0.75;
			w = 1;
			h = 1;
		};
		class body : RscStdText {
			text = "...as Engineer you can build a FARP to repair other vehicles. You need a repair truck.";
			colorText[] = Color_White;       
			sizeEx = TextSize_medium;	  	  	
			x = -0.6;
			y = -0.65;
			w = 2;
			h = 1;
		};
	};
	class topic_dyk_eng2 {
	  	idd=-1;
	  	movingEnable=0;
	  	duration=12;  
	  	fadein=2;     
	  	name="topic_dyk_eng2";
	  	controls[] = {Titel,body};
		class Titel : RscStdText {
			text = "Topic: Did you know...";
			colorText[] = Color_Blue;       
			sizeEx = TextSize_large;	  	  	
			x = -0.8;
			y = -0.75;
			w = 1;
			h = 1;
		};
		class body : RscStdText {
			text = "...as Engineer you can earn points if you repair destroyed vehicles with your FARP.";
			colorText[] = Color_White;       
			sizeEx = TextSize_medium;	  	  	
			x = -0.6;
			y = -0.65;
			w = 2;
			h = 1;
		};
	};
	class topic_dyk_med1 {
	  	idd=-1;
	  	movingEnable=0;
	  	duration=12;  
	  	fadein=2;     
	  	name="topic_dyk_med1";
	  	controls[] = {Titel,body};
		class Titel : RscStdText {
			text = "Topic: Did you know...";
			colorText[] = Color_Blue;       
			sizeEx = TextSize_large;	  	  	
			x = -0.8;
			y = -0.75;
			w = 1;
			h = 1;
		};
		class body : RscStdText {
			text = "...as Medic you earn points for healing other players.";
			colorText[] = Color_White;       
			sizeEx = TextSize_medium;	  	  	
			x = -0.6;
			y = -0.65;
			w = 2;
			h = 1;
		};
	};
	class topic_dyk_med2 {
	  	idd=-1;
	  	movingEnable=0;
	  	duration=12;  
	  	fadein=2;     
	  	name="topic_dyk_med2";
	  	controls[] = {Titel,body};
		class Titel : RscStdText {
			text = "Topic: Did you know...";
			colorText[] = Color_Blue;       
			sizeEx = TextSize_large;	  	  	
			x = -0.8;
			y = -0.75;
			w = 1;
			h = 1;
		};
		class body : RscStdText {
			text = "...as Medic you can build up a MASH if you have a MEV in your range.";
			colorText[] = Color_White;       
			sizeEx = TextSize_medium;	  	  	
			x = -0.6;
			y = -0.65;
			w = 2;
			h = 1;
		};
	};
	class topic_dyk_hq {
	  	idd=-1;
	  	movingEnable=0;
	  	duration=12;  
	  	fadein=2;     
	  	name="topic_dyk_hq";
	  	controls[] = {Titel,body};
		class Titel : RscStdText {
			text = "Topic: Did you know...";
			colorText[] = Color_Blue;       
			sizeEx = TextSize_large;	  	  	
			x = -0.8;
			y = -0.75;
			w = 1;
			h = 1;
		};
		class body : RscStdText {
			text = "...you can call the headquarters for support and other tasks.";
			colorText[] = Color_White;       
			sizeEx = TextSize_medium;	  	  	
			x = -0.6;
			y = -0.65;
			w = 2;
			h = 1;
		};
	};
	class topic_dyk_rt {
	  	idd=-1;
	  	movingEnable=0;
	  	duration=12;  
	  	fadein=2;     
	  	name="topic_dyk_rt";
	  	controls[] = {Titel,body};
		class Titel : RscStdText {
			text = "Topic: Did you know...";
			colorText[] = Color_Blue;       
			sizeEx = TextSize_large;	  	  	
			x = -0.8;
			y = -0.75;
			w = 1;
			h = 1;
		};
		class body : RscStdText {
			text = "...if you blow up the enemys radio tower you earn a lot of extra points.";
			colorText[] = Color_White;       
			sizeEx = TextSize_medium;	  	  	
			x = -0.6;
			y = -0.65;
			w = 2;
			h = 1;
		};
	};
	class topic_dyk_rank {
	  	idd=-1;
	  	movingEnable=0;
	  	duration=12;  
	  	fadein=2;     
	  	name="topic_dyk_rank";
	  	controls[] = {Titel,body};
		class Titel : RscStdText {
			text = "Topic: Did you know...";
			colorText[] = Color_Blue;       
			sizeEx = TextSize_large;	  	  	
			x = -0.8;
			y = -0.75;
			w = 1;
			h = 1;
		};
		class body : RscStdText {
			text = "...with a higher rank you can use more weapons and stronger vehicles.";
			colorText[] = Color_White;       
			sizeEx = TextSize_medium;	  	  	
			x = -0.6;
			y = -0.65;
			w = 2;
			h = 1;
		};
	};
	class topic_dyk_tomi {
	  	idd=-1;
	  	movingEnable=0;
	  	duration=12;  
	  	fadein=2;     
	  	name="topic_dyk_tomi";
	  	controls[] = {Titel,body};
		class Titel : RscStdText {
			text = "Topic: Did you know...";
			colorText[] = Color_Blue;       
			sizeEx = TextSize_large;	  	  	
			x = -0.8;
			y = -0.75;
			w = 1;
			h = 1;
		};
		class body : RscStdText {
			text = "...if you are an Captain you can call every 15 minutes a new tomahawk.";
			colorText[] = Color_White;       
			sizeEx = TextSize_medium;	  	  	
			x = -0.6;
			y = -0.65;
			w = 2;
			h = 1;
		};
	};


	
	
	class topic_dykv_supply {
	  	idd=-1;
	  	movingEnable=0;
	  	duration=12;  
	  	fadein=2;     
	  	name="topic_dykv_supply";
	  	controls[] = {Titel,body};
		class Titel : RscStdText {
			text = "Topic: Did you know...";
			colorText[] = Color_Blue;       
			sizeEx = TextSize_large;	  	  	
			x = -0.8;
			y = -0.75;
			w = 1;
			h = 1;
		};
		class body : RscStdText {
			text = "...supply trucks are usefull for some special actions for example to build up a FARP.";
			colorText[] = Color_White;       
			sizeEx = TextSize_medium;	  	  	
			x = -0.6;
			y = -0.65;
			w = 2;
			h = 1;
		};
	};
	class topic_dykv_airbomb {
	  	idd=-1;
	  	movingEnable=0;
	  	duration=12;  
	  	fadein=2;     
	  	name="topic_dykv_airbomb";
	  	controls[] = {Titel,body};
		class Titel : RscStdText {
			text = "Topic: Did you know...";
			colorText[] = Color_Blue;       
			sizeEx = TextSize_large;	  	  	
			x = -0.8;
			y = -0.75;
			w = 1;
			h = 1;
		};
		class body : RscStdText {
			text = "...jets and attack choppers are very valuable and need round about over a half hour for an respawn.";
			colorText[] = Color_White;       
			sizeEx = TextSize_medium;	  	  	
			x = -0.6;
			y = -0.65;
			w = 2;
			h = 1;
		};
	};
	class topic_dyk_achop {
	  	idd=-1;
	  	movingEnable=0;
	  	duration=12;  
	  	fadein=2;     
	  	name="topic_dyk_achop";
	  	controls[] = {Titel,body,body2};
		class Titel : RscStdText {
			text = "Topic: Did you know...";
			colorText[] = Color_Blue;       
			sizeEx = TextSize_large;	  	  	
			x = -0.8;
			y = -0.75;
			w = 1;
			h = 1;
		};
		class body : RscStdText {
			text = "...be carefull with your strong weapons.";
			colorText[] = Color_White;       
			sizeEx = TextSize_medium;	  	  	
			x = -0.8;
			y = -0.65;
			w = 2;
			h = 1;
		};
		class body2 : RscStdText {
			text = "To many team kills and you where kicked automatically from the server!";
			colorText[] = Color_White;       
			sizeEx = TextSize_medium;	  	  	
			x = -0.6;
			y = -0.6;
			w = 2;
			h = 1;
		};
	};

	class loosing_end4_text {
	  	idd=-1;
	  	movingEnable=0;
	  	duration=12;  
	  	fadein=2;     
	  	name="loosing_end4_text";
	  	controls[] = {Titel,body};
		class Titel : RscStdText {
			text = "We are loosing this battle...";
			colorText[] = Color_Red;       
			sizeEx = TextSize_large;	  	  	
			x = -0.8;
			y = -0.75;
			w = 1;
			h = 1;
		};
		class body : RscStdText {
			text = "Reason is we have loose all our mobile spawns and cant reach the frontline.";
			colorText[] = Color_White;       
			sizeEx = TextSize_medium;	  	  	
			x = -0.6;
			y = -0.65;
			w = 2;
			h = 1;
		};
	};	
	

};