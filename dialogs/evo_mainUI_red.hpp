#include "setup.sqf"
#include "rscBasicDefines.hpp"
//                                   missionConfigFile >> "evo_mainUI"
class evo_mainUI {
	idd = 66000;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] execVM 'dialogs\main_update.sqf'";

	class controlsBackground {
	
		class mainbackground: RscPicture
		{
			idc = -1;
			text = "\ca\ui\data\ui_background_video_ca.paa";
			x = 0.146222;
			y = 0.128152;
			w = 0.879389;
			h = 0.549688;
		};
		class header: RscTitle
		{
			idc = 60001;
			text = $STR_d_mainmenu;
			x = 0.156331;
			y = 0.176654;
			w = 0.687339;
			h = 0.048502;
			style = ST_CENTER;
			colorBackground[] = OA_header_dark;
			colorText[] = Color_GrayLight;
			sizeEx = TextSize_large;
		};
		class info_hint: RscText
		{
			idc = 60002;
			text = "Welcome in Main-Menu";
			x = 0.53125;
			y = 0.249999;
			w = 0.296874;
			h = 0.025;
		};
		class evolution: RscText
		{
			idc = -1;
			colorText[] = Color_Red;
			text = "Hohei Evolution 2 - RED";
			x = 0.658172;
			y = 0.644964;
			w = 0.171875;
			h = 0.0249999;
		};
	};

	class controls {
		class hq: XD_ButtonBase
		{
			idc = 66001;
			text = $STR_d_hq;	//headquarter
			onButtonClick = "['HQ'] execVM 'dialogs\open_maindialogs.sqf',closeDialog 0";
			x = 0.203126;
			y = 0.275;
			w = 0.265626;
			h = 0.1;
		};
		class options: RscShortcutButton
		{
			idc = 66002;
			text = $STR_M04t124;	//options
			onButtonClick = "['Options'] execVM 'dialogs\open_maindialogs.sqf',closeDialog 0";
			x = 0.203126;
			y = 0.6;
			w = 0.1875;
			h = 0.1;
		};
		class grpbutton: RscShortcutButton
		{
			idc = 66003;
			text = $STR_d_groups;	//groups
			onButtonClick = "['Groups'] execVM 'dialogs\open_maindialogs.sqf',closeDialog 0";
			x = 0.203126;
			y = 0.375;
			w = 0.265626;
			h = 0.1;
		};
		class recbutton: RscShortcutButton
		{
			idc = 66004;
			text = $STR_d_recuting;	//recruiting
			onButtonClick = "['Recruiting'] execVM 'dialogs\open_maindialogs.sqf',closeDialog 0";
			x = 0.203126;
			y = 0.325;
			w = 0.265626;
			h = 0.1;
		};
		class smbutton: RscShortcutButton
		{
			idc = 66006;
			text = $STR_d_sms;	//sidemissions
			onButtonClick = "['Sidemissions'] execVM 'dialogs\open_maindialogs.sqf',closeDialog 0";
			x = 0.203126;
			y = 0.425;
			w = 0.265626;
			h = 0.1;
		};
		class adminbutton: RscShortcutButton
		{
			idc = 66007;
			text = $STR_d_admin;	//admin
			onButtonClick = "['evo_admin'] execVM 'dialogs\open_maindialogs.sqf',closeDialog 0";
			x = 0.203126;
			y = 0.474999;
			w = 0.265626;
			h = 0.1;
		};
		class cancel: RscShortcutButton
		{
			idc = 66005;
			text = $STR_d_cancel;	//cancel
			onButtonClick = "closeDialog 0";
			x = 0.46875;
			y = 0.6;
			w = 0.1875;
			h = 0.1;
		};
		class txt_rank: RscText {
			idc = 66008;
			colorText[] = Color_GrayLight;
			text = "dein Rang:";
			x = 0.546875;
			y = 0.375;
			w = 0.140625;
			h = 0.025;
		};
		class txt_playtime: RscText {
			idc = 66009;
			colorText[] = Color_GrayLight;
			text = "Spielzeit:";
			x = 0.546875;
			y = 0.415;
			w = 0.1875;
			h = 0.025;
		};
		class txt_score: RscText {
			idc = 66010;
			colorText[] = Color_GrayLight;
			text = "Supportpunkte:";
			x = 0.546875;
			y = 0.455;
			w = 0.1875;
			h = 0.025;
		};
		class acc_rank: DescriptionTitle {
			idc = 66011;
			text = "Lieutnant";
			x = 0.6575;
			y = 0.375;
			w = 0.1875;
			h = 0.025;
		};
		class acc_playtime: DescriptionTitle {
			idc = 66012;
			text = "hh:mm";
			x = 0.6575;
			y = 0.415;
			w = 0.1875;
			h = 0.025;
		};
		class acc_suppscore: DescriptionTitle {
			idc = 66013;
			text = "1000";
			x = 0.6575;
			y = 0.455;
			w = 0.1875;
			h = 0.025;
		};
		class statusbar: DescriptionTitle {
			idc = 66014;
			sizeEx = 0.035;
			font = SECONDARY_FONT;
			colorText[] = Color_WhiteDark;
			text = "Statusbar";
			x = 0.606358;
			y = 0.32;
			w = 0.140625;
			h = 0.028;
		};
		class frame: DescriptionTitle {
			idc = -1;
			style = ST_FRAME;
			text = "";
			x = 0.509329;
			y = 0.306095;
			w = 0.316023;
			h = 0.246607;
		};
	};
};


//     ----------------------------------   missionConfigFile >> "evo_hq_request"
class evo_hq_request {
	idd = 67000;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] execVM 'dialogs\support_update.sqf'";

	class controlsBackground {
	
		class mainbackground: RscPicture
		{
			idc = -1;
			text = "\ca\ui\data\ui_background_video_ca.paa";
			x = 0.146222;
			y = 0.128152;
			w = 0.879389;
			h = 0.549688;
		};
		class header: RscTitle
		{
			idc = -1;
			text = $STR_d_hq;
			x = 0.156331;
			y = 0.176654;
			w = 0.687339;
			h = 0.048502;
			style = ST_CENTER;
			colorBackground[] = OA_header_dark;
			colorText[] = Color_GrayLight;
			sizeEx = TextSize_large;
		};
		class info_hint: RscText
		{
			idc = -1;
			text = "Global Positioning System is Online";
			x = 0.469677;
			y = 0.462;
			w = 0.336367;
			h = 0.0337512;
		};
		class evolution: RscText
		{
			idc = -1;
			colorText[] = Color_Red;
			text = "Hohei Evolution 2 - RED";
			x = 0.658172;
			y = 0.644964;
			w = 0.171875;
			h = 0.0249999;
		};
	};

	class controls {
		class options: RscShortcutButton
		{
			idc = 67001;
			text = $STR_d_back;		//back to mainmenu
			onButtonClick = "[player] execVM 'dialogs\open_maindialogs.sqf',closeDialog 0";
			x = 0.203126;
			y = 0.6;
			w = 0.1875;
			h = 0.1;
		};
		class cancel: RscShortcutButton
		{
			idc = 66005;
			text = $STR_d_cancel;	//cancel
			onButtonClick = "closeDialog 0";
			x = 0.46875;
			y = 0.6;
			w = 0.1875;
			h = 0.1;
		};
		class GPSmap: RscMapControl
		{
			idc = 67002;
			colorBackground[] = {1, 1, 1, 0.6};
			x = 0.469677;
			y = 0.225;
			w = 0.355798;
			h = 0.245743;
			colorOutside[] = {0, 0, 0, 1};
			maxSatelliteAlpha =0;
			alphaFadeStartScale=0;
			alphaFadeEndScale=0;
			class ActiveMarker {
				color[] = {1, 1, 1, 0.8};
				size = 50;
			};
		};
		class avalible_support: XD_UIComboBox 
		{
			idc = 67003;
			onLBSelChanged = "[] execVM 'dialogs\support_update.sqf'";
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			x = 0.176547;
			y = 0.241324;
			w = 0.24;
			h = 0.04;
		};
		class support_pic : HW_RscStructuredText 
		{
			idc = 67004;
			style = 16;
			lineSpacing = 1;
			size = 0.125;
			x = 0.722375;
			y = 0.532334;
			w = 0.0909714;
			h = 0.0970038;
			colorBackground[] = { 1, 1, 1, 0 };
			colorText[] = { 1, 1, 1, 1 };

			class Attributes {
				font = "Zeppelin32";
				color = "#FFFFFF";
				align = "center";
				valign = "middle";
				shadow = true;
				shadowColor = "#000000";
				size = "1";
			};
		};
		class Description : DescriptionTitle
		{
			idc = 67005;
			style = ST_MULTI;
			sizeEx = TextSize_small;
			x = 0.439677;
			y = 0.482;
			w = 0.390625;
			h = 0.058;
			colorText[] = Color_Red;
			text = "";
		};
		class request_support : RscShortcutButton
		{
			idc = 67006;
			text = $STR_d_supprequest;		//requesting
			onButtonClick = "[] execVM 'dialogs\support_request.sqf'";
			x = 0.203126;
			y = 0.498416;
			w = 0.1875;
			h = 0.1;
		};
		class text_cost : RscText
		{
			idc = 67007;
			text = $STR_d_cost;
			x = 0.479785;
			y = 0.558502;
			w = 0.056189;
			h = 0.0266679;
		};
		class text_score : RscText
		{
			idc = 67008;
			text = $STR_d_score;
			x = 0.459568;
			y = 0.590836;
			w = 0.0953654;
			h = 0.0323345;
		};
		class cost : DescriptionTitle
		{
			idc = 67009;
			text = "0";
			x = 0.570756;
			y = 0.558502;
			w = 0.0825;
			h = 0.0266679;
		};
		class score : DescriptionTitle
		{
			idc = 67010;
			text = "0";
			x = 0.570756;
			y = 0.590836;
			w = 0.0825;
			h = 0.0266679;
		};
	};
};

//     ----------------------------------   missionConfigFile >> "evo_options"
class evo_options {
	idd = 68000;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] execVM 'dialogs\options_update.sqf'";

	class controlsBackground {
			class mainbackground: RscPicture
		{
			idc = -1;
			text = "\ca\ui\data\ui_background_video_ca.paa";
			x = 0.146222;
			y = 0.128152;
			w = 0.879389;
			h = 0.549688;
		};
		class header: RscTitle
		{
			idc = -1;
			text = $STR_d_options;
			x = 0.156331;
			y = 0.176654;
			w = 0.687339;
			h = 0.048502;
			style = ST_CENTER;
			colorBackground[] = OA_header_dark;
			colorText[] = Color_GrayLight;
			sizeEx = TextSize_large;
		};
		class info_hint: RscText
		{
			idc = -1;
			text = $STR_d_cgs;	//client side graphic settings
			x = 0.35;
			y = 0.49;
			w = 0.36;
			h = 0.034;
		};
		class evolution: RscText
		{
			idc = -1;
			colorText[] = Color_Red;
			text = "Hohei Evolution 2 - RED";
			x = 0.658172;
			y = 0.644964;
			w = 0.171875;
			h = 0.0249999;
		};
	};
	
	class controls {
		class options: RscShortcutButton
		{
			idc = 67001;
			text = $STR_d_back;		//back to mainmenu
			onButtonClick = "[player] execVM 'dialogs\open_maindialogs.sqf',closeDialog 0";
			x = 0.203126;
			y = 0.6;
			w = 0.1875;
			h = 0.1;
		};
		class cancel: RscShortcutButton
		{
			idc = 66005;
			text = $STR_d_cancel;	//cancel
			onButtonClick = "closeDialog 0";
			x = 0.46875;
			y = 0.6;
			w = 0.1875;
			h = 0.1;
		};
		class RscText_1003: RscText
		{
			idc = 68001;
			colorText[] = Color_WhiteDark;
			text = $STR_d_avdist;
			x = 0.1875;
			y = 0.45;
			w = 0.15625;
			h = 0.025;
		};
		class RscText_1004: RscText
		{
			idc = 68002;
			colorText[] = Color_WhiteDark;
			text = $STR_d_vdist;
			x = 0.1875;
			y = 0.4;
			w = 0.15625;
			h = 0.025;	
		};
		class RscText_1005: RscText
		{
			idc = 68003;
			colorText[] = Color_WhiteDark;
			text = $STR_d_grass;
			x = 0.358489;
			y = 0.241324;
			w = 0.148016;
			h = 0.0320867;
		};
		class RscText_1006: RscText
		{
			idc = 68004;
			colorText[] = Color_WhiteDark;
			text = $STR_d_Environment;
			x = 0.5;
			y = 0.241324;
			w = 0.148016;
			h = 0.0320867;
		};
		class RscSlider_1900: RscSlider
		{
			idc = 68005;
			onSliderPosChanged = "[] execVM 'dialogs\options_slider.sqf'";
			x = 0.359375;
			y = 0.4;
			w = 0.353221;
			h = 0.0264201;
		};
		class RscSlider_1901: RscSlider
		{
			idc = 68006;
			onSliderPosChanged = "[] execVM 'dialogs\options_slider.sqf'";
			x = 0.359375;
			y = 0.45;
			w = 0.353221;
			h = 0.0264201;
		};
		class RscText_1007: DescriptionTitle
		{
			idc = 68007;
			text = "1000";
			x = 0.712267;
			y = 0.4;
			w = 0.078125;
			h = 0.035;
		};
		class RscText_1008: DescriptionTitle
		{
			idc = 68008;
			text = "3000";
			x = 0.712267;
			y = 0.45;
			w = 0.078125;
			h = 0.035;
		};
		class request_support : RscShortcutButton
		{
			idc = 68009;
			text = "Ok";		//ok
			onButtonClick = "[] execVM 'dialogs\options_savesettings.sqf'";
			x = 0.203126;
			y = 0.525001;
			w = 0.22;
			h = 0.1;
		};
		class fix_headbug : RscShortcutButton
		{
			idc = 680091;
			text = "Fix Headbug";		//fix headbug
			onButtonClick = "closeDialog 0; player spawn XsFixHeadBug;";
			x = 0.46875;
			y = 0.525001;
			w = 0.22;
			h = 0.1;
		};			
		class RscButton_1600: RscButton
		{
			idc = 68010;
			text = "Low";
			onButtonClick = "setTerrainGrid 50";
			x = 0.358489;
			y = 0.273658;
			w = 0.0771274;
			h = 0.0278369;
		};
		class RscButton_1601: RscButton
		{
			idc = 68011;
			text = "Mid";
			onButtonClick = "setTerrainGrid 25";
			x = 0.358489;
			y = 0.305992;
			w = 0.0771274;
			h = 0.0278369;
		};
		class RscButton_1602: RscButton
		{
			idc = 68012;
			text = "High";
			onButtonClick = "setTerrainGrid 1";
			x = 0.358489;
			y = 0.338327;
			w = 0.0771274;
			h = 0.0278369;
		};
		class RscButton_1603: RscButton
		{
			idc = 68013;
			text = "On";
			onButtonClick = "enableEnvironment true";
			x = 0.5;
			y = 0.273658;
			w = 0.0771274;
			h = 0.0278369;
		};
		class RscButton_1604: RscButton
		{
			idc = 68014;
			text = "Off";
			onButtonClick = "enableEnvironment false";
			x = 0.5;
			y = 0.305992;
			w = 0.0771274;
			h = 0.0278369;
		};
		class info_system: RscText
		{
			idc = 68004;
			colorText[] = Color_WhiteDark;
			text = "Game Tips";
			x = 0.640625;
			y = 0.241324;
			w = 0.155706;
			h = 0.034605;
		};
		class info_on: RscButton
		{
			idc = 68013;
			onButtonClick = "EVO_info_system_state = true";
			text = "On";
			x = 0.656249;
			y = 0.273658;
			w = 0.0771274;
			h = 0.027837;
		};
		class info_off: RscButton
		{
			idc = 68013;
			onButtonClick = "EVO_info_system_state = false";
			text = "Off";
			x = 0.656249;
			y = 0.305992;
			w = 0.0771274;
			h = 0.027837;
		};	
	};
};


//     ----------------------------------   missionConfigFile >> "evo_recruit"
class evo_recruit {
	idd = 69000;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] execVM 'dialogs\recruit_update.sqf'";

	class controlsBackground {
	
		class mainbackground: RscPicture
		{
			idc = -1;
			text = "\ca\ui\data\ui_background_video_ca.paa";
			x = 0.146222;
			y = 0.128152;
			w = 0.879389;
			h = 0.549688;
		};
		class header: RscTitle
		{
			idc = -1;
			text = $STR_d_recruit;
			x = 0.156331;
			y = 0.176654;
			w = 0.687339;
			h = 0.048502;
			style = ST_CENTER;
			colorBackground[] = OA_header_dark;
			colorText[] = Color_GrayLight;
			sizeEx = TextSize_large;
		};
		class info_hint: RscText
		{
			idc = -1;
			text = $STR_d_rechint;
			x = 0.44946;
			y = 0.597003;
			w = 0.336367;
			h = 0.0337512;
		};
		class evolution: RscText
		{
			idc = -1;
			colorText[] = Color_Red;
			text = "Hohei Evolution 2 - RED";
			x = 0.658172;
			y = 0.644964;
			w = 0.171875;
			h = 0.0249999;
		};
		class hint2: RscText
		{
			idc = -1;
			text = $STR_d_rech2;
			x = 0.671834;
			y = 0.225155;
			w = 0.336367;
			h = 0.0337512;
		};
	};

	class controls {
		class options: RscShortcutButton
		{
			idc = 67001;
			text = $STR_d_back;		//back to mainmenu
			onButtonClick = "[player] execVM 'dialogs\open_maindialogs.sqf',closeDialog 0";
			x = 0.203126;
			y = 0.6;
			w = 0.1875;
			h = 0.1;
		};
		class cancel: RscShortcutButton
		{
			idc = 66005;
			text = $STR_d_cancel;	//cancel
			onButtonClick = "closeDialog 0";
			x = 0.46875;
			y = 0.6;
			w = 0.1875;
			h = 0.1;
		};
		class avalible_recruits: XD_UIComboBox 
		{
			idc = 69001;
			onLBSelChanged = "[] execVM 'dialogs\recruit_update.sqf'";
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			x = 0.176547;
			y = 0.241324;
			w = 0.25;
			h = 0.04;
		};
		class recruit_pic1 : HW_RscStructuredText 
		{
			idc = 69002;
			style = 16;
			lineSpacing = 1;
			size = 0.125;
			x = 0.469677;
			y = 0.289825;
			w = 0.111187;
			h = 0.129339;
			colorBackground[] = { 1, 1, 1, 0 };
			colorText[] = { 1, 1, 1, 1 };

			class Attributes {
				font = "Zeppelin32";
				color = "#FFFFFF";
				align = "center";
				valign = "middle";
				shadow = true;
				shadowColor = "#000000";
				size = "1.3";
			};
		};
		class recruit_pic2 : HW_RscStructuredText 
		{
			idc = 69003;
			style = 16;
			lineSpacing = 1;
			size = 0.11;
			x = 0.609375;
			y = 0.259999;
			w = 0.1875;
			h = 0.15;
			colorBackground[] = { 1, 1, 1, 0 };
			colorText[] = { 1, 1, 1, 1 };
			class Attributes {
				font = "Zeppelin32";
				color = "#FFFFFF";
				align = "center";
				valign = "middle";
				shadow = true;
				shadowColor = "#000000";
				size = "0.8";
			};
		};
		class recruit_pic3 : HW_RscStructuredText
		{
			idc = 69004;
			style = 16;
			lineSpacing = 1;
			size = 0.11;
			x = 0.421875;
			y = 0.259999;
			w = 0.1875;
			h = 0.15;
			colorBackground[] = { 1, 1, 1, 0 };
			colorText[] = { 1, 1, 1, 1 };
			class Attributes {
				font = "Zeppelin32";
				color = "#FFFFFF";
				align = "center";
				valign = "middle";
				shadow = true;
				shadowColor = "#000000";
				size = "0.8";
			};
		};
		class recuting : RscShortcutButton
		{
			idc = 69005;
			text = $STR_d_recuting;		//requesting
			onButtonClick = "[] execVM 'dialogs\recruit_now.sqf'";
			x = 0.203126;
			y = 0.474999;
			w = 0.203125;
			h = 0.1;
		};
		class derecuting : RscShortcutButton
		{
			idc = 690051;
			text = $STR_d_derecuting;		//dismiss
			onButtonClick = "[] execVM 'dialogs\dismiss_now.sqf'";
			x = 0.203126;
			y = 0.53096;
			w = 0.203125;
			h = 0.1;
		};
		class Description : DescriptionTitle
		{
			idc = 69006;
			style = ST_MULTI;
			sizeEx = TextSize_small;
			x = 0.406249;
			y = 0.525001;
			w = 0.406251;
			h = 0.075;
			colorText[] = Color_Red;
			text = "";
		};
		class text_accnum : RscText
		{
			idc = 69007;
			text = $STR_d_accainum;
			x = 0.421875;
			y = 0.425;
			w = 0.296874;
			h = 0.025;
		};
		class text_maxnum : RscText
		{
			idc = 69008;
			text = $STR_d_maxainum;
			x = 0.421875;
			y = 0.474999;
			w = 0.296874;
			h = 0.025;
		};
		class acc: DescriptionTitle
		{
			idc = 69009;
			text = "0";
			x = 0.625001;
			y = 0.425;
			w = 0.046875;
			h = 0.025;
		};
		class max: DescriptionTitle
		{
			idc = 69010;
			text = "1";
			x = 0.625001;
			y = 0.474999;
			w = 0.046875;
			h = 0.025;
		};
	};
};

//     ----------------------------------   missionConfigFile >> "evo_groups"
class evo_groups {
	idd = 70000;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] execVM 'dialogs\groups_update.sqf'";

	class controlsBackground {
	
		class mainbackground: RscPicture
		{
			idc = -1;
			text = "\ca\ui\data\ui_background_video_ca.paa";
			x = 0.146222;
			y = 0.128152;
			w = 0.879389;
			h = 0.549688;
		};
		class header: RscTitle
		{
			idc = -1;
			text = $STR_d_groups;
			x = 0.156331;
			y = 0.176654;
			w = 0.687339;
			h = 0.048502;
			style = ST_CENTER;
			colorBackground[] = OA_header_dark;
			colorText[] = Color_GrayLight;
			sizeEx = TextSize_large;
		};
		class info_hint: RscText
		{
			idc = -1;
			text = $STR_d_grphint;
			x = 0.359375;
			y = 0.6;
			w = 0.46875;
			h = 0.025;
		};
		class evolution: RscText
		{
			idc = -1;
			colorText[] = Color_Red;
			text = "Hohei Evolution 2 - RED";
			x = 0.658172;
			y = 0.644964;
			w = 0.171875;
			h = 0.0249999;
		};
	};

	class controls {
		class options: RscShortcutButton
		{
			idc = 67001;
			text = $STR_d_back;		//back to mainmenu
			onButtonClick = "[player] execVM 'dialogs\open_maindialogs.sqf',closeDialog 0";
			x = 0.203126;
			y = 0.6;
			w = 0.1875;
			h = 0.1;
		};
		class cancel: RscShortcutButton
		{
			idc = 66005;
			text = $STR_d_cancel;	//cancel
			onButtonClick = "closeDialog 0";
			x = 0.46875;
			y = 0.6;
			w = 0.1875;
			h = 0.1;
		};
		class avalible_groups: XD_UIComboBox 
		{
			idc = 70001;
			onLBSelChanged = "[] execVM 'dialogs\groups_update.sqf'";
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			x = 0.176547;
			y = 0.241324;
			w = 0.30;
			h = 0.04;
		};
		class rank_pic : HW_RscStructuredText 
		{
			idc = 70002;
			style = 16;
			lineSpacing = 1;
			size = 0.11;
			x = 0.484375;
			y = 0.25;
			w = 0.111187;
			h = 0.129339;
			colorBackground[] = { 1, 1, 1, 0 };
			colorText[] = { 1, 1, 1, 1 };
			class Attributes {
				font = "Zeppelin32";
				color = "#FFFFFF";
				align = "center";
				valign = "middle";
				shadow = true;
				shadowColor = "#000000";
				size = "1.0";
			};
		};
		class join : XD_ButtonBase
		{
			idc = 70003;
			text = $STR_d_join;		//join
			onButtonClick = "[] execVM 'dialogs\groups_joining.sqf'";
			x = 0.203126;
			y = 0.518416;
			w = 0.453125;
			h = 0.1;
		};
		class infos: DescriptionTitle
		{
			idc = 70004;
			text = "";
			x = 0.4375;
			y = 0.375;
			w = 0.375001;
			h = 0.075;
		};
		class Description : DescriptionTitle
		{
			idc = 70005;
			style = ST_MULTI;
			sizeEx = TextSize_small;
			x = 0.406249;
			y = 0.45;
			w = 0.406251;
			h = 0.1;
			colorText[] = Color_Red;
			text = "";
		};
	};
};


//     ----------------------------------   missionConfigFile >> "evo_admin"
class evo_admin {
	idd = 72000;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] execVM 'dialogs\admin_update.sqf'";

	class controlsBackground {
	
		class mainbackground: RscPicture
		{
			idc = -1;
			text = "\ca\ui\data\ui_background_video_ca.paa";
			x = 0.146222;
			y = 0.128152;
			w = 0.879389;
			h = 0.549688;
		};
		class header: RscTitle
		{
			idc = -1;
			text = $STR_d_admin;
			x = 0.156331;
			y = 0.176654;
			w = 0.687339;
			h = 0.048502;
			style = ST_CENTER;
			colorBackground[] = OA_header_dark;
			colorText[] = Color_GrayLight;
			sizeEx = TextSize_large;
		};
		class evolution: RscText {
			idc = -1;
			colorText[] = Color_Red;
			text = "Hohei Evolution 2 - RED";
			x = 0.658172;
			y = 0.644964;
			w = 0.171875;
			h = 0.0249999;
		};
	};

	class controls {
		class options: RscShortcutButton
		{
			idc = 67001;
			text = $STR_d_back;		//back to mainmenu
			onButtonClick = "[player] execVM 'dialogs\open_maindialogs.sqf',closeDialog 0";
			x = 0.203126;
			y = 0.6;
			w = 0.1875;
			h = 0.1;
		};
		class cancel: RscShortcutButton
		{
			idc = 66005;
			text = $STR_d_cancel;	//cancel
			onButtonClick = "closeDialog 0";
			x = 0.46875;
			y = 0.6;
			w = 0.1875;
			h = 0.1;
		};
		class info_hint: DescriptionTitle
		{
			idc = 72001;
			style = ST_MULTI;
			sizeEx = TextSize_normal;
			x = 0.421874;
			y = 0.524999;
			w = 0.406252;
			h = 0.1;
			colorText[] = Color_Red;
			text = "";
		};
		class RscShortcutButton_1702: RscShortcutButton
		{
			idc = 72002;
			onButtonClick = "closeDialog 0, [player] execVM 'dialogs\admin_start_spectating.sqf'";

			text = "Spectating";
			x = 0.203126;
			y = 0.225;
			w = 0.252863;
			h = 0.105037;
			tooltip = "start spectating modus";
		};
		class RscShortcutButton_1703: RscShortcutButton
		{
			idc = 72003;
			onButtonClick = "['MHQ'] execVM 'dialogs\admin_handle_hq.sqf'";

			text = "Unlock MHQ";
			x = 0.203125;
			y = 0.35;
			w = 0.224026;
			h = 0.107555;
			tooltip = "lock or unlock the MHQ";
		};
		class RscShortcutButton_1704: RscShortcutButton
		{
			idc = 72004;
			onButtonClick = "['AHQ'] execVM 'dialogs\admin_handle_hq.sqf'";

			text = "Unlock AHQ";
			x = 0.203125;
			y = 0.425;
			w = 0.224026;
			h = 0.105037;
			tooltip = "lock or unlock the AHQ";
		};
		//class avalible_players: RscIGUIListBox
		class avalible_players: XD_UIComboBox
		{
			idc = 72005;
			onLBSelChanged = "[] execVM 'dialogs\admin_update.sqf'";
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			sizeEx = 0.027;
			x = 0.531249;
			y = 0.250001;
			w = 0.25;
			h = 0.04;
		};
		class lockpic_mhq : HW_RscStructuredText 
		{
			idc = 72006;
			style = 16;
			lineSpacing = 1;
			size = 0.035;
			x = 0.420444;
			y = 0.38;
			w = 0.0625;
			h = 0.075;
			colorBackground[] = { 1, 1, 1, 0 };
			colorText[] = { 1, 1, 1, 1 };
			text = "<img image='pictures\ok.paa'/>";

			class Attributes {
				font = "Zeppelin32";
				color = "#FFFFFF";
				align = "center";
				valign = "middle";
				shadow = true;
				shadowColor = "#000000";
				size = "1.0";
			};
		};
		class lockpic_ahq : HW_RscStructuredText 
		{
			idc = 72007;
			style = 16;
			lineSpacing = 1;
			size = 0.035;

			x = 0.420196;
			y = 0.46;
			w = 0.0625;
			h = 0.075;
			colorBackground[] = { 1, 1, 1, 0 };
			colorText[] = { 1, 1, 1, 1 };
			text = "<img image='pictures\ok.paa'/>";

			class Attributes {
				font = "Zeppelin32";
				color = "#FFFFFF";
				align = "center";
				valign = "middle";
				shadow = true;
				shadowColor = "#000000";
				size = "1.0";
			};
		};
		class button_kick: RscShortcutButton
		{
			idc = 72008;
			onButtonClick = "[] execVM 'dialogs\admin_kick_player.sqf'";

			text = "Kick Player";
			x = 0.515625;
			y = 0.425;
			w = 0.250941;
			h = 0.107555;
			tooltip = "kick selected Player from the Server";
		};
		class txt_score: RscText
		{
			idc = -1;
			colorText[] = Color_WhiteDark;
			text = "Score:";
			x = 0.515625;
			y = 0.340;
			w = 0.158252;
			h = 0.0294888;
		};
		class txt_rank: RscText
		{
			idc = -1;
			colorText[] = Color_WhiteDark;
			text = "Rank:";
			x = 0.515625;
			y = 0.375;
			w = 0.158252;
			h = 0.0294888;
		};
		class txt_tk: RscText
		{
			idc = -1;
			colorText[] = Color_WhiteDark;
			text = "Teamkills:";
			x = 0.515625;
			y = 0.41;
			w = 0.135182;
			h = 0.0244522;
		};
		class show_score: DescriptionTitle
		{
			idc = 72012;
			text = "";
			x = 0.65625;
			y = 0.340;
			w = 0.076;
			h = 0.0294888;
		};
		class show_rank: DescriptionTitle
		{
			idc = 72013;
			text = "";
			x = 0.65625;
			y = 0.375;
			w = 0.137105;
			h = 0.0294888;
		};
		class show_tk: DescriptionTitle
		{
			idc = 72014;
			text = "";
			x = 0.65625;
			y = 0.41;
			w = 0.076;
			h = 0.0294888;
			tooltip = "only kills with his own gun was counted";
		};
	};
};


//     ----------------------------------   missionConfigFile >> "evo_sms"
class evo_sms {
	idd = 71000;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] execVM 'dialogs\sms_update.sqf'";

	class controlsBackground {
	
		class mainbackground: RscPicture
		{
			idc = -1;
			text = "\ca\ui\data\ui_background_video_ca.paa";
			x = 0.146222;
			y = 0.128152;
			w = 0.879389;
			h = 0.549688;
		};
		class header: RscTitle
		{
			idc = -1;
			text = $STR_d_sms;
			x = 0.156331;
			y = 0.176654;
			w = 0.687339;
			h = 0.048502;
			style = ST_CENTER;
			colorBackground[] = OA_header_dark;
			colorText[] = Color_GrayLight;
			sizeEx = TextSize_large;
		};
		class info_hint: RscText
		{
			idc = -1;
			text = $STR_d_smhint;
			x = 0.296875;
			y = 0.6;
			w = 0.53125;
			h = 0.025;
		};
		class evolution: RscText
		{
			idc = -1;
			colorText[] = Color_Red;
			text = "Hohei Evolution 2 - RED";
			x = 0.658172;
			y = 0.644964;
			w = 0.171875;
			h = 0.0249999;
		};
	};

	class controls {
		class options: RscShortcutButton
		{
			idc = 67001;
			text = $STR_d_back;		//back to mainmenu
			onButtonClick = "[player] execVM 'dialogs\open_maindialogs.sqf',closeDialog 0";
			x = 0.203126;
			y = 0.6;
			w = 0.1875;
			h = 0.1;
		};
		class cancel: RscShortcutButton
		{
			idc = 66005;
			text = $STR_d_cancel;	//cancel
			onButtonClick = "closeDialog 0";
			x = 0.46875;
			y = 0.6;
			w = 0.1875;
			h = 0.1;
		};
		class avalible_groups: XD_UIComboBox 
		{
			idc = 71001;
			onLBSelChanged = "[] execVM 'dialogs\sms_update.sqf'";
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			x = 0.176547;
			y = 0.241324;
			w = 0.25;
			h = 0.04;
		};
		class sm_pic : HW_RscStructuredText 
		{
			idc = 71002;
			style = 16;
			lineSpacing = 1;
			size = 0.125;
			x = 0.439352;
			y = 0.241324;
			w = 0.111187;
			h = 0.129339;
			colorBackground[] = { 1, 1, 1, 0 };
			colorText[] = { 1, 1, 1, 1 };
			class Attributes {
				font = "Zeppelin32";
				color = "#FFFFFF";
				align = "center";
				valign = "middle";
				shadow = true;
				shadowColor = "#000000";
				size = "1.0";
			};
		};
		class getit : RscShortcutButton
		{
			idc = 71003;
			text = $STR_d_accept;		//join
			onButtonClick = "[] execVM 'dialogs\sms_access.sqf'";
			x = 0.203126;
			y = 0.518416;
			w = 0.453125;
			h = 0.1;
		};
		class infos1: DescriptionTitle
		{
			idc = 71004;
			text = "";
			x = 0.52;
			y = 0.225155;
			w = 0.203125;
			h = 0.025;
		};
		class infos2: DescriptionTitle
		{
			idc = 71005;
			text = "";
			colorText[] = Color_GrayLight;
			x = 0.45;
			y = 0.26;
			w = 0.35;
			h = 0.225;
		};
		class text_b : DescriptionTitle
		{
			idc = 71007;
			text = $STR_d_smbounty;
			x = 0.55;
			y = 0.5;
			w = 0.140625;
			h = 0.025;
		};
		class b: DescriptionTitle
		{
			idc = 71006;
			text = "0";
			x = 0.66;
			y = 0.5;
			w = 0.0625;
			h = 0.025;
		};
	};
};


//     ----------------------------------   missionConfigFile >> "TeleportModule"
class TeleportModule {
	idd = -1;
	movingEnable = false;
	objects[] = {};
	onLoad="uiNamespace setVariable ['X_TELE_DIALOG', _this select 0];_test = 0 spawn x_teleupdate_dlg";
	class controlsBackground {
		class bg1 : RscBG {
			x = "SafeZoneX";
			y = "SafeZoneY";
			w = "SafeZoneW";
			h = "SafeZoneH";
			idc = 100101;
			colorBackground[] = {0.106, 0.133, 0.102, 1};
		};
	};
	class controls {
		class respawn: RscShortcutButton {
			idc = 100102;
			text = "Teleport"; 
			action = "0 execVM 'dialogs\tele\x_beam_tele.sqf'";
			x = 0.625;
			y = 0.67;
			w = 0.3;
			default = true;
		};
		class cancelb: XD_ButtonBase {
			idc = 100103;
			text = "Cancel"; 
			action = "CloseDialog 0";
			x = "SafeZoneX + 0.05";
			y = 0.91;
			w = 0.3;
		};
		class BaseButton: XD_ButtonBase {
			idc = 100107;
			text = "Base"; 
			action = "[0] execVM 'dialogs\tele\x_update_target.sqf'";
			x = 0.625;
			y = 0.34;
			w = 0.3;
		};
		class Mr1Button: XD_ButtonBase {
			idc = 100108;
			text = "jump to MHQ";
			action = "[1] execVM 'dialogs\tele\x_update_target.sqf'";
			x = 0.625;
			y = 0.41;
			w = 0.3;
		};
		class Mr2Button: XD_ButtonBase {
			idc = 100109;
			text = "jump to AHQ";
			action = "[2] execVM 'dialogs\tele\x_update_target.sqf'";
			x = 0.625;
			y = 0.48;
			w = 0.3;
		};
		class Tdestination : SXRscText {
			idc = 100110;
			x = 0.625;
			y = 0.55;
			w = 0.3;
			h = 0.1;
			sizeEx = 0.025;
			text = "";
		};
		class dtext : RscText {
			x = 0.80;
			y = 0.92;
			w = 0.3;
			h = 0.1;
			font = "Zeppelin32";
			sizeEx = 0.03921;
			colorText[] = Color_Red;
			text = "Hohei Evolution 2 - RED";
		};
		class maprespawn : XD_RscMapControl {
			idc = 100104;
			x = 0.07;
			y = 0.27;
			w	= 0.51;
			h	= 0.5;
			colorBackground[] = {1, 1, 1, 1};
		};
		class mr1inair : SXRscText {
			idc = 100105;
			x = 0.623;
			y = 0.75;
			w = 0.3;
			h = 0.1;
			sizeEx = 0.02;
			text = "";
		};
		class mr2inair : SXRscText {
			idc = 100106;
			x = 0.623;
			y = 0.772;
			w = 0.3;
			h = 0.1;
			sizeEx = 0.02;
			text = "";
		};
		class respawncaption : SXRscText {
			idc = 100111;
			x = 0.35;
			y = 0.07;
			w = 0.6;
			h = 0.2;
			font = "Zeppelin32";
			sizeEx = 0.03921;
			XCTextBI;
			text = "Select Teleport Destination";
		};
		class changepos : SXRscText {
			idc = 100112;
			x = 0.155;
			y = 0.72;
			w = 0.6;
			h = 0.2;
			font = "Zeppelin32";
			sizeEx = 0.03921;
			XCTextBI;
			text = "Changing position... Stand by!";
		};
	};
};