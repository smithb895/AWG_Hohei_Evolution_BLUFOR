#define BON_BACKPACK_DIALOG 220000
#define BON_BACKPACK_PICTURE 220001
#define BON_BACKPACK_EQUIPBUTTON 220002
#define BON_BACKPACK_LIST 220003

							//missionConfigFile >> "getBackpackDialog"
class getBackpackDialog {
	idd = BON_BACKPACK_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] execVM 'dialogs\dialog_update.sqf'";


	class controlsBackground {

		class Mainback : HW_RscPicture {
			idc = 0;
			x = 0.2; y = 0.25;
			w = 0.9; h = 0.6;
			text = "\ca\ui\data\ui_background_video_ca.paa";
		};
		
		class Title : RscTitle {
			idc = -1;
			moving = false;
			colorBackground[] = { 0, 0, 0, 0 };
			colorText[] = { 1, 1, 1, 1 };
			x = 0.225;
			y = 0.31;
			w = 0.3;
			h = 0.03;
			sizeEx = 0.03;
			text = $STR_d_backp;
		};

		class infohint: RscText
		{
			idc = -1;
			moving = false;
			colorBackground[] = { 0, 0, 0, 0 };
			colorText[] = { 0.5, 0.5, 0.5, 1 };
			text = $STR_d_backpi;
			x = 0.506444;
			y = 0.35;
			w = 0.3;
			h = 0.015;
		};

		class BackpackPicture : HW_RscStructuredText {
			idc = BON_BACKPACK_PICTURE;
			style = ST_MULTI;
			x = 0.11; y = 0.45;
			w = 1.2; h = 1.0;
			colorBackground[] = { 1, 1, 1, 0 };
			colorText[] = { 1, 1, 1, 1 };
			lineSpacing = 1;
			size = 0.125;
			class Attributes {
				font = "Zeppelin32";
				color = "#FFFFFF";
				align = "center";
				valign = "middle";
				shadow = true;
				shadowColor = "#000000";
				size = "2.25";
			};
		};

	};


	class controls {

		class Unitlist: HW_RscGUIListBox {
			idc = BON_BACKPACK_LIST;
			default = 1;
			x = 0.21; y = 0.35;
			w = 0.275; h = 0.4925;
			colorSelect[] = {0, 0, 0, 0.9};
			colorSelect2[] = {0, 0, 0, 0.9};
			colorSelectBackground[] = {1, 1, 1, 0.75};
			colorSelectBackground2[] = {1, 1, 1, 0.75};
			onLBDblClick = "";
			onLBSelChanged = "[] execVM 'dialogs\dialog_update.sqf'";
			rowHeight = 0.025;
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			maxHistoryDelay = 10;
			canDrag = 0;
			xcolumn1 = "0.1f";
			xcolumn2 = "0.25f";
			xcolumn3 = "0.85f";		
		};

		class EquipButton : HW_RscButton {
			idc = BON_BACKPACK_EQUIPBUTTON;
			x = 0.075; y = 0.4;
			w = 1.0; h = 1.0;
			colorText[] = { 0, 0, 0, 0 };
			colorFocused[] = { 0, 0, 0, 0 };
			colorDisabled[] = { 0, 0, 0, 0 };
			colorBackground[] = { 0, 0, 0, 0 };
			colorBackgroundDisabled[] = { 0, 0, 0, 0 };
			colorBackgroundActive[] = { 0, 0, 0, 0 };
			colorShadow[] = { 0, 0, 0, 0 };
			colorBorder[] = { 0, 0, 0, 0 };
			soundEnter[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			soundPush[] = {"\ca\ui\data\sound\new1", 0.09, 1};
			soundClick[] = {"\ca\ui\data\sound\mouse3", 0.07, 1};
			soundEscape[] = {"\ca\ui\data\sound\mouse1", 0.09, 1};
			text = "";
			onButtonClick = "execVM 'dialogs\backpack_equip.sqf', closeDialog 0";			
		};
		
		class button_abort: RscShortcutButton
		{
			idc = 220021;
			onButtonClick = "closeDialog 0";

			text = $STR_d_cancel;
			x = 0.598034;
			y = 0.735277;
			w = 0.196068;
			h = 0.117638;
		};
	};
};