#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_3DSTATIC			20
#define CT_3DACTIVETEXT		21
#define CT_3DLISTBOX		22
#define CT_3DHTML			23
#define CT_3DSLIDER			24
#define CT_3DEDIT			25
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0c
#define ST_TYPE           0xF0
#define ST_SINGLE         0
#define ST_MULTI          16
#define ST_TITLE_BAR      32
#define ST_PICTURE        48
#define ST_FRAME          64
#define ST_BACKGROUND     80
#define ST_GROUP_BOX      96
#define ST_GROUP_BOX2     112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE   144
#define ST_WITH_RECT      160
#define ST_LINE           176
#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20
#define ST_TITLE          ST_TITLE_BAR + ST_CENTER
#define FontHTML			"Zeppelin32"
#define FontM				"Zeppelin32"
#define Dlg_ROWS			36
#define Dlg_COLS			90
#define Dlg_CONTROLHGT		((100/Dlg_ROWS)/100)
#define Dlg_COLWIDTH		((100/Dlg_COLS)/100)
#define Dlg_TEXTHGT_MOD		0.9
#define Dlg_ROWSPACING_MOD	1.3
#define Dlg_ROWHGT			(Dlg_CONTROLHGT*Dlg_ROWSPACING_MOD)
#define Dlg_TEXTHGT			(Dlg_CONTROLHGT*Dlg_TEXTHGT_MOD)
#define UILEFT				0
#define UICOMBO				4
#define DEFAULTFONT			"Bitstream"

#define ReadAndWrite 0
#define ProcTextWhite "#(argb,8,8,3)color(1,1,1,1)"
#define ProcTextEmpty "#(argb,8,8,3)color(1,1,1,0)"
#define ProcTextBlack "#(argb,8,8,3)color(0,0,0,1)"
#define ProcTextGray "#(argb,8,8,3)color(0.3,0.3,0.3,1)"
#define ProcTextRed "#(argb,8,8,3)color(1,0,0,1)"
#define ProcTextGreen "#(argb,8,8,3)color(0,1,0,1)"
#define ProcTextBlue "#(argb,8,8,3)color(0,0,1,1)"

//Colors
#define Color_KackG 				{0.36, 0.4, 0.38, 1}		// kaki-grau
#define Color_KackY					{0.8, 0.7, 0.6, 1}			// kaki-gelb
#define Color_KackB 				{0.51, 0.48, 0.46, 1}		// kaki oa-style
#define Color_WhiteDark 			{1, 1, 1, 0.5}
#define Color_White					{1, 1, 1, 1}
#define Color_Black 				{0, 0, 0, 1}
#define Color_Gray 					{1, 1, 1, 0.5}
#define Color_GrayLight 			{0.6, 0.6, 0.6, 1}
#define Color_GrayDark 				{0.2, 0.2, 0.2, 1}
#define Color_DarkRed 				{0.5, 0.1, 0, 0.5}
#define Color_Green 				{0.8, 0.9, 0.4, 1}
#define Color_Orange 				{0.9, 0.45, 0.1, 1}
#define Color_Red 					{0.9, 0.2, 0.2, 1}
#define Color_Blue 					{0.2, 0.2, 0.9, 1}
#define Color_NoColor				{0, 0, 0, 0}
#define XCTextBlack					colorText[] = {1, 1, 1, 1}
#define XCTextBI					colorText[] = {0.543, 0.5742, 0.4102, 1}
#define XCTextHud					colorText[] = {0.543, 0.5742, 0.4102, 0.9}
#define XCMainCapt					colorText[] = {0.543, 0.5742, 0.4102, 1.0}

//Colors background
#define CA_UI_background_2 			{0.6, 0.6, 0.6, 0.4}			// hellgrau transparent
#define CA_UI_background           	{0.023529, 0, 0.0313725, 1}		// fast schwarz
#define Color_MainBack 				{1, 1, 1, 0.9}					// vergilbtes weiss
#define CA_UI_element_background 	{1, 1, 1, 0.7}					// dunkel weiss
#define CA_UI_help_background 		{0.2, 0.1, 0.1, 0.7}			// rost rotbraun
#define CA_UI_title_background		{0.24, 0.47, 0.07, 1.0}			// grün
#define CA_UI_green					{0.84,1,0.55,1}					// gelb-grün gift
#define OA_header_dark				{0,0,0,0.5}						// oa schwarz transparent

//Font Size
#define TextSize_IGUI_normal 		0.023 // test //19/768
#define TextSize_small 				0.022 //16/768
#define TextSize_normal 			0.024 //19/768
#define TextSize_medium 			0.027 //23/768
#define TextSize_large  			0.057 //44/768

#define IDCPLAYER 5200
#define IDCUNDEFINED -1
#define SECONDARY_FONT "Bitstream"





class RscSlider {
	type = CT_SLIDER;
	style = 1024;
	w = 0.24;
	h = 0.03;
	color[] = Color_White;
	//colorActive[] = Color_White;
};


//-----------------------------------------------------------
class RscText {
	access = 0;
	idc = -1;
	type = CT_STATIC;
	style = ST_LEFT;
	w = 0.1; 
	h = 0.05;
	font = "Zeppelin32";
	sizeEx = TextSize_IGUI_normal;
	colorBackground[] = Color_NoColor;
	colorText[] = Color_KackG;
	text = "";
};
class HW_RscText {
	idc = -1;
	type = CT_STATIC;
	style = ST_CENTER;
	text = "";
	font = "Zeppelin32";
	sizeEx = 0.023;
	colorBackground[] = { 1, 1, 1, 0.3 };
	colorText[] = { 0, 0, 0, 1 };
	x = 0.8;
	y = 0.1;
	w = 0.2;
	h = 0.05;
};

class RscTextSmall: RscText {
	h = 0.03;
	sizeEx = TextSize_small;
};

class RscTitle: RscText {
	style = ST_CENTER;
	colorBackground[] = OA_header_dark;
	colorText[] = Color_GrayLight;
	x = 0.15;
	y = 0.06;
	w = 0.5;
	h= 0.5;
	sizeEx = TextSize_large;
};
class DescriptionTitle: RscText
{
	idc = 2010;
	style = ST_MULTI + ST_CENTER;
	x = 0.39;
	y = 0.62;
	w = 0.55;
	h = 0.04;
	sizeEx = TextSize_medium;
	colorText[] = Color_White;
	lineSpacing = 1;
	text = ;
};
//-------------------------------------------------
class RscPicture
{
	access = ReadAndWrite;
	idc = -1;
	type = CT_STATIC;
	style = ST_PICTURE;
	colorBackground[] = Color_NoColor;
	colorText[] = Color_White;
	font = "Zeppelin32";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
};
class HW_RscPicture {
	idc = -1; 
	type = CT_STATIC;
	style = ST_PICTURE;
	colorBackground[] = { };
	colorText[] = { };
	font = "Zeppelin32";
	sizeEx = 0.023;
	x = 0.0; y = 0.2;
	w = 0.2; h = 0.2;
	text = "";
};


class RscActiveText
{
	access = ReadAndWrite;
	type = CT_ACTIVETEXT;
	style = ST_CENTER;
	h = 0.05;
	w = 0.15;
	font = "Zeppelin32";
	sizeEx = TextSize_IGUI_normal;
	color[] = Color_Black;
	colorActive[] = CA_UI_green;
	soundEnter[] = {"", 0.1, 1};
	soundPush[] = {"", 0.1, 1};
	soundClick[] = {"", 0.1, 1};
	soundEscape[] = {"", 0.1, 1};
	text = "";
	default = 0;
};

class RscListBox {
	type = 5;
	style = 0 + 0x10;
	font = "Zeppelin32";
	sizeEx = 0.03921;
	color[] = {1, 1, 1, 1};
	colorText[] = {0.95, 0.95, 0.95, 1};
	colorScrollbar[] = {0.95, 0.95, 0.95, 1};
	colorSelect[] = {0.023529, 0, 0.0313725, 1};
	colorSelect2[] = {0.023529, 0, 0.0313725, 1};
	colorSelectBackground[] = {0.58, 0.1147, 0.1108, 1};
	colorSelectBackground2[] = {0.58, 0.1147, 0.1108, 1};
	period = 1;
	colorBackground[] = {0, 0, 0, 1};
	maxHistoryDelay = 1.0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};
class HW_RscListBox {
	type = 5;
	style = 0 + 0x10;
	font = "Zeppelin32";
	sizeEx = 0.03921;
	color[] = {1, 1, 1, 1};
	colorText[] = {0.95, 0.95, 0.95, 1};
	colorScrollbar[] = {0.95, 0.95, 0.95, 1};
	colorSelect[] = {0.023529, 0, 0.0313725, 1};
	colorSelect2[] = {0.023529, 0, 0.0313725, 1};
	colorSelectBackground[] = {0.58, 0.1147, 0.1108, 1};
	colorSelectBackground2[] = {0.58, 0.1147, 0.1108, 1};
	period = 1;
	colorBackground[] = {0, 0, 0, 1};
	maxHistoryDelay = 1.0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};
class HW_RscGUIListBox : HW_RscListBox {
	color[] = {1, 1, 1, 1};
	colorText[] = {1, 1, 1, 0.75};
	colorScrollbar[] = {0.95, 0.95, 0.95, 1};
	colorSelect[] = {0.95, 0.95, 0.95, 1};
	colorSelect2[] = {0.95, 0.95, 0.95, 1};
	colorSelectBackground[] = {0.6, 0.839, 0.47, 0.3};
	colorSelectBackground2[] = {0.6, 0.839, 0.47, 1};
	period = 0;
	colorBackground[] = {0, 0, 0, 1};
	sizeEx = 0.035;
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui\data\igui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\igui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\igui_arrow_top_ca.paa";
		border = "\ca\ui\data\igui_border_scroll_ca.paa";
	};
};

//Standard button.
class RscButton {
	// common control items
	access = ReadAndWrite;
	type = CT_BUTTON;
	style = ST_LEFT;
	x = 0; y = 0;
	w = 0.3; h = 0.1;
	// text properties
	text = "";
	font = "Zeppelin32";
	sizeEx = 0.024;
	colorText[] = {0.9, 0.9, 0.9, 1};
	colorDisabled[] = {0.4, 0.4, 0.4, 1};
	colorBackground[] = {0.6, 0.6, 0.2, 0.5};
	colorBackgroundActive[] = {0.6, 0.6, 0.1, 1};
	colorBackgroundDisabled[] = {0.58, 0.1147, 0.1108, 1};
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorFocused[] = {0.2, 0.2, 0, 1};
	colorShadow[] = {0.023529, 0, 0.0313725, 1};
	colorBorder[] = {0.023529, 0, 0.0313725, 1};
	borderSize = 0.003; // when negative, the border is on the right side of background
	soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
	soundPush[] = {"\ca\ui\data\sound\new1",0,0};
	soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
	soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
};
class HW_RscButton {
	idc = -1;
	type = CT_BUTTON;
	style = ST_CENTER;
	default = false;
	font = "Zeppelin32";
	sizeEx = 0.05;
	colorText[] = { 0, 0, 0, 1 };
	colorFocused[] = { 0.2, 0.5, 1, 1 }; // border color for focused state
	colorDisabled[] = { 1, 0, 0, 0.7 }; // text color for disabled state
	colorBackground[] = { 0.8, 0.8, 0.8, 0.8 };
	colorBackgroundDisabled[] = { 1, 1, 1, 0.5 }; // background color for disabled state
	colorBackgroundActive[] = { 0.9, 0.9, 0.9, 1 }; // background color for active state
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorShadow[] = { 0, 0, 0, 0.5 };
	colorBorder[] = { 0, 0, 0, 1 };
	borderSize = 0;
	soundEnter[] = { "", 0, 1 }; // no sound
	soundPush[] = { "buttonpushed.ogg", 0.1, 1 };
	soundClick[] = { "", 0, 1 }; // no sound
	soundEscape[] = { "", 0, 1 }; // no sound 
	x = 0.4;
	y = 0.475;
	w = 0.2;
	h = 0.05;
	text = "Empty";
	action = "";
};
class RscIGUIListBox : RscListBox {
	color[] = {1, 1, 1, 1};
	colorText[] = {1, 1, 1, 0.75};
	colorScrollbar[] = {0.95, 0.95, 0.95, 1};
	colorSelect[] = {0, 0, 0, 0.9};
	colorSelect2[] = {0, 0, 0, 0.9};
	colorSelectBackground[] = {1, 1, 1, 0.75};
	colorSelectBackground2[] = {1, 1, 1, 0.75};
	period = 0;
	colorBackground[] = {0, 0, 0, 1};
	sizeEx = 0.035;
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui\data\igui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\igui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\igui_arrow_top_ca.paa";
		border = "\ca\ui\data\igui_border_scroll_ca.paa";
	};
};
class RscShortcutButton {
	type = 16;
	idc = -1;
	style = 0;
	default = 0;
	w = 0.183825;
	h = 0.104575;
	color[] = {0.95, 0.95, 0.95, 1};
	color2[] = {1, 1, 1, 0.4};
	colorBackground[] = {1, 1, 1, 1};
	colorbackground2[] = {1, 1, 1, 0.4};
	colorDisabled[] = {1, 1, 1, 0.25};
	periodFocus = 1.2;
	periodOver = 0.8;
	
	class HitZone {
		left = 0.004;
		top = 0.029;
		right = 0.004;
		bottom = 0.029;
	};
	
	class ShortcutPos {
		left = 0.004;
		top = 0.026;
		w = 0.0392157;
		h = 0.0522876;
	};
	
	class TextPos {
		left = 0.05;
		top = 0.034;
		right = 0.005;
		bottom = 0.005;
	};
	animTextureNormal = "\ca\ui\data\ui_button_normal_ca.paa";
	animTextureDisabled = "\ca\ui\data\ui_button_disabled_ca.paa";
	animTextureOver = "\ca\ui\data\ui_button_over_ca.paa";
	animTextureFocused = "\ca\ui\data\ui_button_focus_ca.paa";
	animTexturePressed = "\ca\ui\data\ui_button_down_ca.paa";
	animTextureDefault = "\ca\ui\data\ui_button_default_ca.paa";
	textureNoShortcut = "";
	period = 0.4;
	font = "Zeppelin32";
	size = 0.03521;
	sizeEx = 0.03521;
	text = "";
	soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
	soundPush[] = {"\ca\ui\data\sound\new1",0,0};
	soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
	soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
	action = "";
	
	class Attributes {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	
	class AttributesImage {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
	};
};
class RscIGUIShortcutButton : RscShortcutButton {
	w = 0.183825;
	h = 0.0522876;
	style = 2;
	color[] = {1, 1, 1, 1};
	color2[] = {1, 1, 1, 0.85};
	colorBackground[] = {1, 1, 1, 1};
	colorbackground2[] = {1, 1, 1, 0.85};
	colorDisabled[] = {1, 1, 1, 0.4};
	
	class HitZone {
		left = 0.002;
		top = 0.003;
		right = 0.002;
		bottom = 0.016;
	};
	
	class ShortcutPos {
		left = -0.006;
		top = -0.007;
		w = 0.0392157;
		h = 0.0522876;
	};
	
	class TextPos {
		left = 0.02;
		top = 0.0;
		right = 0.002;
		bottom = 0.016;
	};
	animTextureNormal = "\ca\ui\data\igui_button_normal_ca.paa";
	animTextureDisabled = "\ca\ui\data\igui_button_disabled_ca.paa";
	animTextureOver = "\ca\ui\data\igui_button_over_ca.paa";
	animTextureFocused = "\ca\ui\data\igui_button_focus_ca.paa";
	animTexturePressed = "\ca\ui\data\igui_button_down_ca.paa";
	animTextureDefault = "\ca\ui\data\igui_button_normal_ca.paa";
	animTextureNoShortcut = "\ca\ui\data\igui_button_normal_ca.paa";
	
	class Attributes {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "center";
		shadow = "true";
	};
};
class RscShortcutButtonMain {
	idc = -1;
	style = 0;
	default = 0;
	w = 0.313726;
	h = 0.104575;
	color[] = {0.8784,0.8471,0.651,1};
	colorDisabled[] = {1,1,1,0.25};
	class HitZone
	{
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};
	class ShortcutPos
	{
		left = 0.0204;
		top = 0.026;
		w = 0.0392157;
		h = 0.0522876;
	};
	class TextPos
	{
		left = 0.08;
		top = 0.034;
		right = 0.005;
		bottom = 0.005;
	};
	animTextureNormal = "\ca\ui\data\ui_button_main_normal_ca.paa";
	animTextureDisabled = "\ca\ui\data\ui_button_main_disabled_ca.paa";
	animTextureOver = "\ca\ui\data\ui_button_main_over_ca.paa";
	animTextureFocused = "\ca\ui\data\ui_button_main_focus_ca.paa";
	animTexturePressed = "\ca\ui\data\ui_button_main_down_ca.paa";
	animTextureDefault = "\ca\ui\data\ui_button_main_normal_ca.paa";
	period = 0.5;
	font = "Zeppelin32";
	size = 0.03921;
	sizeEx = 0.03921;
	text = "";
	soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
	soundPush[] = {"\ca\ui\data\sound\new1",0,0};
	soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
	soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
	action = "";
	class Attributes
	{
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = "false";
	};
	class AttributesImage
	{
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "false";
	};
};


//---------------------------------------------------------------
class RscStructuredText
{
	access = ReadAndWrite;
	type = CT_STRUCTURED_TEXT;
	idc = -1;
	style = 0;
	h = 0.05;
	text = "";
	size = TextSize_IGUI_normal;
	colorText[] = Color_Black;
	class Attributes
	{
		font = "Zeppelin32";
		color = "#ffffff";
		align = "center";
		shadow = true;
	};
};
class HW_RscStructuredText {
	idc = -1;
	type = CT_STRUCTURED_TEXT;
	style = ST_LEFT;
	colorBackground[] = { 1, 1, 1, 1 };
	x = 0.1; y = 0.1;
	w = 0.3; h = 0.1;	
	size = 0.018;
	text = "";
	class Attributes {
		font = "Zeppelin32";
		color = "#FFFFFF";
		align = "left";
		valign = "middle";
		shadow = true;
		shadowColor = "#000000";
		size = "2.25";
	};
};


class RscControlsGroup
{
  type = CT_CONTROLS_GROUP;
  idc = -1;
  style = 0;
  x = 0; y = 0;
  w = 1; h = 1;

  class VScrollbar
  {
    color[] = Color_Black;
    width = 0.021;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = false;	    
  };

  class HScrollbar
  {
    color[] = Color_Black;
    height = 0.028;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = false;	    
  };

  class Controls {};
};




//Preddefinovano pro viceropouziti v dialogu
class Vendor_Mainback: RscPicture
{
	idc = -1;
	//type = 0;
	//style = CT_EDIT;
	//style = ST_PICTURE;
	x = 0.35; y = 0.8;
	w = 0.3; h = 0.2;
	text ="\ca\ui\data\ui_gradient_start_gs.paa";
	colorText[] = {1, 1, 1, 0.9};
	//text = "\ca\ui\data\ui_gradient_end_gs.paa";
	colorbackground[] = CA_UI_background;
};


class Vendor_Title: Vendor_Mainback
{
	x = 0.29; y = 0.38;
	w = 0.56; h = 0.57;
	text ="\ca\ui\data\ui_gradient_title_gs.paa";
};


class Vendor_TRev: Vendor_Mainback
{
	x = 0.29; y = 0.38;
	w = 0.56; h = 0.57;
};
class Vendor_Mainback_2: Vendor_Mainback
{
	x = 0.35; y = 0.8;
	w = 0.3; h = 0.2;
	text = "\ca\ui\data\ui_gradient_middle_gs.paa";
};


class Vendor_Mainback_3: Vendor_Mainback
{
	x = 0.35; y = 0.8;
	w = 0.3; h = 0.2;
	text = "\ca\ui\data\ui_gradient_end_gs.paa";
};



class RscMapControl 
{
	access = ReadAndWrite;
	type = 101;
	idc = 51;
	style = 48;
	colorBackground[] = {1, 1, 1, 1};
	colorText[] = {0, 0, 0, 1};
	font = "TahomaB";
	sizeEx = 0.04;
	colorSea[] = {0.56, 0.8, 0.98, 0.5};
	colorForest[] = {0.6, 0.8, 0.2, 0.5};
	colorRocks[] = {0.5, 0.5, 0.5, 0.5};
	colorCountlines[] = {0.65, 0.45, 0.27, 0.5};
	colorMainCountlines[] = {0.65, 0.45, 0.27, 1};
	colorCountlinesWater[] = {0, 0.53, 1, 0.5};
	colorMainCountlinesWater[] = {0, 0.53, 1, 1};
	colorForestBorder[] = {0.4, 0.8, 0, 1};
	colorRocksBorder[] = {0.5, 0.5, 0.5, 1};
	colorPowerLines[] = {0, 0, 0, 1};
	colorRailWay[] = {0.8, 0.2, 0.3, 1};
	colorNames[] = {0, 0, 0, 1};
	colorInactive[] = {1, 1, 1, 0.5};
	colorLevels[] = {0, 0, 0, 1};
	fontLabel = "TahomaB";
	sizeExLabel = 0.04;
	fontGrid = "TahomaB";
	sizeExGrid = 0.04;
	fontUnits = "TahomaB";
	sizeExUnits = 0.04;
	fontNames = "TahomaB";
	sizeExNames = 0.04;
	fontInfo = "TahomaB";
	sizeExInfo = 0.04;
	fontLevel = "TahomaB";
	sizeExLevel = 0.04;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	stickX[] = {0.2, {"Gamma", 1, 1.5}};
	stickY[] = {0.2, {"Gamma", 1, 1.5}};
	ptsPerSquareSea = 6;
	ptsPerSquareTxt = 8;
	ptsPerSquareCLn = 8;
	ptsPerSquareExp = 8;
	ptsPerSquareCost = 8;
	ptsPerSquareFor = "4.0f";
	ptsPerSquareForEdge = "10.0f";
	ptsPerSquareRoad = 2;
	ptsPerSquareObj = 10;
	showCountourInterval = "true";
		
		class Task 
		{
		  icon = "#(argb,8,8,3)color(0,1,0,1)";
		  iconCreated = "#(argb,8,8,3)color(1,1,1,1)";
		  iconCanceled = "#(argb,8,8,3)color(0,0,1,1)";
		  iconDone = "#(argb,8,8,3)color(0,0,0,1)";
		  iconFailed = "#(argb,8,8,3)color(1,0,0,1)";
		  colorCreated[] = {1,1,1,1};
		  colorCanceled[] = {1,1,1,1};
		  colorDone[] = {1,1,1,1};
		  colorFailed[] = {1,1,1,1};
		  color[] = {1,1,1,1};
		  size = 18;
		  importance = 1;
		  coefMin = 1;
		  coefMax = 1;
		
		};	
		class CustomMark {
			icon = "\ca\ui\data\map_waypoint_ca.paa";
			color[] = {1, 1, 1, 1};
			size = 18;
			importance = 1;
			coefMin = 1;
			coefMax = 1;
		};
					
			
		class Legend {
			x = 0;
			y = 0;
			w = 0;
			h = 0;
			font = "Zeppelin32";
			sizeEx = 0.0151;
			colorBackground[] = {1, 1, 1, 0.3};
			color[] = {0, 0, 0, 1};
		};
		
		class Bunker {
			icon = "\ca\ui\data\map_bunker_ca.paa";
			color[] = {1, 1, 1, 1};
			size = 14;
			importance = 1.5 * 14 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Bush {
			icon = "\ca\ui\data\map_bush_ca.paa";
			color[] = {0, 0.3, 0, 1};
			size = 14;
			importance = 0.2 * 14 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class BusStop {
			icon = "\ca\ui\data\map_busstop_ca.paa";
			color[] = {1, 1, 1, 1};
			size = 10;
			importance = 1 * 10 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Command {
			icon = "\ca\ui\data\map_waypoint_ca.paa";
			color[] = {1, 1, 1, 1};
			size = 18;
			importance = 1;
			coefMin = 1;
			coefMax = 1;
		};
		
		class Cross {
			icon = "\ca\ui\data\map_cross_ca.paa";
			color[] = {1, 1, 1, 1};
			size = 16;
			importance = 0.7 * 16 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Fortress {
			icon = "\ca\ui\data\map_bunker_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 16;
			importance = 2 * 16 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Fuelstation {
			icon = "\ca\ui\data\map_fuelstation_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 16;
			importance = 2 * 16 * 0.05;
			coefMin = 0.75;
			coefMax = 4;
		};
		
		class Fountain {
			icon = "\ca\ui\data\map_fountain_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 12;
			importance = 1 * 12 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Hospital {
			icon = "\ca\ui\data\map_hospital_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 16;
			importance = 2 * 16 * 0.05;
			coefMin = 0.5;
			coefMax = 4;
		};
		
		class Chapel {
			icon = "\ca\ui\data\map_chapel_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 16;
			importance = 1 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;
		};
		
		class Church {
			icon = "\ca\ui\data\map_church_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 16;
			importance = 2 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;
		};
		
		class Lighthouse {
			icon = "\ca\ui\data\map_lighthouse_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 20;
			importance = 3 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;
		};
		
		class Quay {
			icon = "\ca\ui\data\map_quay_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 16;
			importance = 2 * 16 * 0.05;
			coefMin = 0.5;
			coefMax = 4;
		};
		
		class Rock {
			icon = "\ca\ui\data\map_rock_ca.paa";
			color[] = {0.78, 0, 0.05, 1};
			size = 12;
			importance = 0.5 * 12 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Ruin {
			icon = "\ca\ui\data\map_ruin_ca.paa";
			color[] = {0.78, 0, 0.05, 1};
			size = 16;
			importance = 1.2 * 16 * 0.05;
			coefMin = 1;
			coefMax = 4;
		};
		
		class SmallTree {
			icon = "\ca\ui\data\map_smalltree_ca.paa";
			color[] = {0.55, 0.64, 0.43, 1};
			size = 12;
			importance = 0.6 * 12 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Stack {
			icon = "\ca\ui\data\map_stack_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 20;
			importance = 2 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;
		};
		
		class Tree {
			icon = "\ca\ui\data\map_tree_ca.paa";
			color[] = {0.55, 0.64, 0.43, 1};
			size = 12;
			importance = 0.9 * 16 * 0.05;
			coefMin = 0.25;
			coefMax = 4;
		};
		
		class Tourism {
			icon = "\ca\ui\data\map_tourism_ca.paa";
			color[] = {0.78, 0, 0.05, 1};
			size = 16;
			importance = 1 * 16 * 0.05;
			coefMin = 0.7;
			coefMax = 4;
		};
		
		class Transmitter {
			icon = "\ca\ui\data\map_transmitter_ca.paa";
			color[] = {0.78, 0, 0.05, 1};
			size = 20;
			importance = 2 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;
		};
		
		class ViewTower {
			icon = "\ca\ui\data\map_viewtower_ca.paa";
			color[] = {0.78, 0, 0.05, 1};
			size = 16;
			importance = 2.5 * 16 * 0.05;
			coefMin = 0.5;
			coefMax = 4;
		};
		
		class Watertower {
			icon = "\ca\ui\data\map_watertower_ca.paa";
			color[] = {0, 0.35, 0.7, 1};
			size = 32;
			importance = 1.2 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;
		};
		
		class Waypoint {
			icon = "\ca\ui\data\map_waypoint_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 32;
			importance = 1.2 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;			
		};
		
		class WaypointCompleted {
			icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
			color[] = {0, 0, 0, 1};
			size = 32;
			importance = 1.2 * 16 * 0.05;
			coefMin = 0.9;
			coefMax = 4;			
	};
};

class XD_RscMapControl {
	idc = -1;
	type=101;
	style=48;
	x = 0;
	y = 0;
	w = 1;
	h = 1;	
	colorBackground[] = {1, 1, 1, 1};
	colorText[] = {0, 0, 0, 1};
	colorSea[] = {0.56, 0.8, 0.98, 0.5};
	colorForest[] = {0.6, 0.8, 0.2, 0.5};
	colorRocks[] = {0.5, 0.5, 0.5, 0.5};
	colorCountlines[] = {0.65, 0.45, 0.27, 0.5};
	colorMainCountlines[] = {0.65, 0.45, 0.27, 1};
	colorCountlinesWater[] = {0, 0.53, 1, 0.5};
	colorMainCountlinesWater[] = {0, 0.53, 1, 1};
	colorForestBorder[] = {0.4, 0.8, 0, 1};
	colorRocksBorder[] = {0.5, 0.5, 0.5, 1};
	colorPowerLines[] = {0, 0, 0, 1};
	colorNames[] = {0, 0, 0, 1};
	colorInactive[] = {1, 1, 1, 0.5};
	colorLevels[] = {0, 0, 0, 1};
	colorRailWay[] = {0, 0, 0, 1};
	colorOutside[] = {0, 0, 0, 1};
	font = "TahomaB";
	sizeEx = 0.04;
	stickX[] = {0.2, {"Gamma", 1, 1.5}};
	stickY[] = {0.2, {"Gamma", 1, 1.5}};
	ptsPerSquareSea = 6;
	ptsPerSquareTxt = 8;
	ptsPerSquareCLn = 8;
	ptsPerSquareExp = 8;
	ptsPerSquareCost = 8;
	ptsPerSquareFor = "4.0f";
	ptsPerSquareForEdge = "10.0f";
	ptsPerSquareRoad = 2;
	ptsPerSquareObj = 10;
	fontLabel = "Zeppelin32";
	sizeExLabel = 0.034;
	fontGrid = "Zeppelin32";
	sizeExGrid = 0.034;
	fontUnits = "Zeppelin32";
	sizeExUnits = 0.034;
	fontNames = "Zeppelin32";
	sizeExNames = 0.056;
	fontInfo = "Zeppelin32";
	sizeExInfo = 0.034;
	fontLevel = "Zeppelin32";
	sizeExLevel = 0.034;
	maxSatelliteAlpha = 0;
	alphaFadeStartScale = 1.0; 
	alphaFadeEndScale = 1.1;
	showCountourInterval=2;
	scaleDefault = 0.1;
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	text = "#(argb,8,8,3)color(1,1,1,1)";
	default = false;
	class CustomMark {
		icon = "\ca\ui\data\map_waypoint_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Legend {
		x = -1;
		y = -1;
		w = 0.340;
		h = 0.152;
		font = "Zeppelin32";
		sizeEx = 0.03921;
		colorBackground[] = {0.906, 0.901, 0.88, 0.8};
		color[] = {0, 0, 0, 1};
	};
	class Bunker {
		icon = "\ca\ui\data\map_bunker_ca.paa";
		color[] = {0, 0.9, 0, 1};
		size = 14;
		importance = "1.5 * 14 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Bush {
		icon = "\ca\ui\data\map_bush_ca.paa";
		color[] = {0.55, 0.64, 0.43, 1};
		size = 14;
		importance = "0.2 * 14 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class BusStop {
		icon = "\ca\ui\data\map_busstop_ca.paa";
		color[] = {0, 0, 1, 1};
		size = 10;
		importance = "1 * 10 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Command {
		icon = "\ca\ui\data\map_waypoint_ca.paa";
		color[] = {0, 0.9, 0, 1};
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Cross {
		icon = "\ca\ui\data\map_cross_ca.paa";
		color[] = {0, 0.9, 0, 1};
		size = 16;
		importance = "0.7 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Fortress {
		icon = "\ca\ui\data\map_bunker_ca.paa";
		color[] = {0, 0.9, 0, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Fuelstation {
		icon = "\ca\ui\data\map_fuelstation_ca.paa";
		color[] = {0, 0.9, 0, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.75;
		coefMax = 4;
	};
	class Fountain {
		icon = "\ca\ui\data\map_fountain_ca.paa";
		color[] = {0, 0.35, 0.7, 1};
		size = 12;
		importance = "1 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Hospital {
		icon = "\ca\ui\data\map_hospital_ca.paa";
		color[] = {0.78, 0, 0.05, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.5;
		coefMax = 4;
	};
	class Chapel {
		icon = "\ca\ui\data\map_chapel_ca.paa";
		color[] = {0, 0.9, 0, 1};
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class Church {
		icon = "\ca\ui\data\map_church_ca.paa";
		color[] = {0, 0.9, 0, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.900000;
		coefMax = 4;
	};
	class Lighthouse {
		icon = "\ca\ui\data\map_lighthouse_ca.paa";
		color[] = {0.78, 0, 0.05, 1};
		size = 20;
		importance = "3 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class Quay {
		icon = "\ca\ui\data\map_quay_ca.paa";
		color[] = {0, 0.9, 0, 1};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.5;
		coefMax = 4;
	};
	class Rock {
		icon = "\ca\ui\data\map_rock_ca.paa";
		color[] = {0, 0.9, 0, 1};
		size = 12;
		importance = "0.5 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Ruin {
		icon = "\ca\ui\data\map_ruin_ca.paa";
		color[] = {0.78, 0, 0.05, 1};
		size = 16;
		importance = "1.2 * 16 * 0.05";
		coefMin = 1;
		coefMax = 4;
	};
	class SmallTree {
		icon = "\ca\ui\data\map_smalltree_ca.paa";
		color[] = {0.55, 0.64, 0.43, 1};
		size = 12;
		importance = "0.6 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Stack {
		icon = "\ca\ui\data\map_stack_ca.paa";
		color[] = {0, 0.9, 0, 1};
		size = 20;
		importance = "2 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class Tree {
		icon = "\ca\ui\data\map_tree_ca.paa";
		color[] = {0.55, 0.64, 0.43, 1};
		size = 12;
		importance = "0.9 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Tourism {
		icon = "\ca\ui\data\map_tourism_ca.paa";
		color[] = {0.78, 0, 0.05, 1};
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.700000;
		coefMax = 4;
	};
	class Transmitter {
		icon = "\ca\ui\data\map_transmitter_ca.paa";
		color[] = {0, 0.9, 0, 1};
		size = 20;
		importance = "2 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class ViewTower {
		icon = "\ca\ui\data\map_viewtower_ca.paa";
		color[] = {0, 0.9, 0, 1};
		size = 16;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.5;
		coefMax = 4;
	};
	class Watertower {
		icon = "\ca\ui\data\map_watertower_ca.paa";
		color[] = {0, 0.35, 0.7, 1};
		size = 32;
		importance = "1.2 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class Waypoint {
		icon = "\ca\ui\data\map_waypoint_ca.paa";
		size = 20;
		color[] = {0, 0.9, 0, 1};
		importance = "1.2 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class Task {
		icon = "\ca\ui\data\ui_taskstate_current_CA.paa";
		iconCreated = "\ca\ui\data\ui_taskstate_new_CA.paa";
		iconCanceled = "#(argb,8,8,3)color(0,0,0,0)";
		iconDone = "\ca\ui\data\ui_taskstate_done_CA.paa";
		iconFailed = "\ca\ui\data\ui_taskstate_failed_CA.paa";
		color[] = {0.863,0.584,0,1};
		colorCreated[] = {0.95,0.95,0.95,1};
		colorCanceled[] = {0.606,0.606,0.606,1};
		colorDone[] = {0.424,0.651,0.247,1};
		colorFailed[] = {0.706,0.0745,0.0196,1};
		size = 27;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class WaypointCompleted {
		icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
		size = 20;
		color[] = {0, 0.9, 0, 1};
		importance = "1.2 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class ActiveMarker {
		icon = "\ca\ui\data\map_waypoint_completed_ca.paa";
		size = 20;
		color[] = {0, 0.9, 0, 1};
		importance = "1.2 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
};

//----------- define ch--------------------------------------
class SXRscText {
	type = CT_STATIC;
	idc = -1;
	style = ST_LEFT;
	colorBackground[] = {0, 0, 0, 0};
	XCTextBlack;
	font = FontM;
	sizeEx = 0.015;
};
class RscBG: SXRscText {
	type = CT_STATIC;
	idc = -1;
	style = ST_LEFT;
	colorBackground[] = {0.02, 0.11, 0.27, 0.7};
	colorText[] = {1, 1, 1, 0};
	font = FontM;
	sizeEx = 0.015;
	text="";
};
class RscNavButton:RscButton {
	w=0.1;
	h=0.04;
	x=0.90;
};
class SXRscListBox {
	type = 5;
	style = 0;
	idc = -1;
	colorBackground[] = {0.2,0.35,0.2,1};
	colorSelect[] = {0.2,0.4,0.2,1};
	colorSelectBackground[] = {0.3,0.6,0.3,1};
	colorText[] = {0.5,0.75,0.5,1};
	font = "Bitstream";
	sizeEx = 0.029;
	rowHeight = 0.03;
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 10;
	w = 0.275;
	h = 0.04;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	colorScrollbar[] = {0.95,0.95,0.95,1};
	period = 1;
	default = false;
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	class ScrollBar {
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};
class XD_RscPicture {
	type = CT_STATIC;
	idc = -1;
	style = ST_PICTURE;
	x = 0.1;
	y = 0.1;
	w = 0.4;
	h = 0.2;
	sizeEx = Dlg_TEXTHGT;
	colorBackground[] = {0, 0, 0, 0};
	XCTextBlack;
	font = FontM;
	text = "";
};
class XD_LinkButtonBase {
	idc = -1;
	type = CT_BUTTON;
	style = ST_CENTER;
	default = false;
	font = "Zeppelin32";
	sizeEx = 0.029;
	XCTextBlack;
	colorFocused[] = {1, 1, 1, 0};
	colorDisabled[] = {0, 0, 1, 0.7};
	colorBackground[] = {1, 1, 1, 0};
	colorBackgroundDisabled[] = {1, 1, 1, 0.5};
	colorBackgroundActive[] = {1, 1, 1, 0};
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorShadow[] = {1, 1, 1, 0};
	colorBorder[] = {1, 1, 1, 0};
	borderSize = 0;
	soundEnter[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
	soundPush[] = {"\ca\ui\data\sound\new1", 0.09, 1};
	soundClick[] = {"\ca\ui\data\sound\mouse3", 0.07, 1};
	soundEscape[] = {"\ca\ui\data\sound\mouse1", 0.09, 1};
	x = 0.06;
	y = 0.11;
	w = 0.15;
	h = 0.1;
	text = "";
	action = "";
};

class XD_UIList {
	w = 0.275;
	h = 0.04;
	colorSelect[] = {0.023529,0,0.0313725,1};
	colorText[] = {0.023529,0,0.0313725,1};
	colorBackground[] = {0.95,0.95,0.95,1};
	colorSelectBackground[] = {0.543,0.5742,0.4102,1};
	colorScrollbar[] = {0.023529,0,0.0313725,1};
	arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	color[] = {0,0,0,0.6};
	colorActive[] = {0,0,0,1};
	colorDisabled[] = {0,0,0,0.3};
	font = "Zeppelin32";
	sizeEx = 0.029;
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 1;
	default = false;
	class ScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
};
class XD_UIComboBox:XD_UIList {
	type = UICOMBO;
	style = 0;
	idc = -1;
	sizeEx = 0.025;
	wholeHeight = 0.3;
};
class X3_RscText {
	access = ReadAndWrite;
	type = CT_STATIC;
	idc = -1;
	style = ST_CENTER;
	w = 0.05;
	h = 0.05;
	font = "Zeppelin32";
	sizeEx = 0.032;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {0.643, 0.5742, 0.4102, 1};
	text = "";
};
class XC_RscText {
	type = CT_STATIC;
	idc = -1;
	style = ST_LEFT;
	x = 0.0;
	y = 0.0;
	w = 0.3;
	h = 0.03;
	sizeEx = 0.023;
	colorBackground[] = {0.5, 0.5, 0.5, 0.75};
	colorText[] = {0, 0, 0, 1};
	font = "Zeppelin32";
	text = "";
};
class XC_SliderH {
	idc = -1;
	type = 43;
	style = "0x400 + 0x10";
	x = 0;
	y = 0;
	h = 0.029412;
	w = 0.4;
	default = false;
	color[] = {1, 1, 1, 0.4};
	colorActive[] = {1, 1, 1, 1};
	colorDisabled[] = {1, 1, 1, 0.2};
	arrowEmpty = "\ca\ui\data\ui_arrow_left_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_left_active_ca.paa";
	border = "\ca\ui\data\ui_border_frame_ca.paa";
	thumb = "\ca\ui\data\ui_slider_bar_ca.paa";
};
class XD_ButtonBase {
	idc = -1;
	type = 16;
	style = 0;
	text = "";
	action = "";
	x = 0.0; 
	y = 0.0;
	w = 0.23;
	h = 0.104575;
	size = 0.03521;
	sizeEx = 0.03521;
	color[] = {0.543, 0.5742, 0.4102, 1};
	color2[] = {0.95, 0.95, 0.95, 1};
	colorBackground[] = {1, 1, 1, 1};
	colorbackground2[] = {1, 1, 1, 0.4};
	colorDisabled[] = {1, 1, 1, 0.25};
	periodFocus = 1.2;
	periodOver = 0.8;
	default = false;
	class HitZone {
		left = 0.004;
		top = 0.029;
		right = 0.004;
		bottom = 0.029;
	};
	class ShortcutPos {
		left = 0.004;
		top = 0.026;
		w = 0.0392157;
		h = 0.0522876;
	};
	class TextPos {
		left = 0.05;
		top = 0.034;
		right = 0.005;
		bottom = 0.005;
	};
	textureNoShortcut = "";
	animTextureNormal = "\ca\ui\data\ui_button_normal_ca.paa";
	animTextureDisabled = "\ca\ui\data\ui_button_disabled_ca.paa";
	animTextureOver = "\ca\ui\data\ui_button_over_ca.paa";
	animTextureFocused = "\ca\ui\data\ui_button_focus_ca.paa";
	animTexturePressed = "\ca\ui\data\ui_button_down_ca.paa";
	animTextureDefault = "\ca\ui\data\ui_button_default_ca.paa";
	period = 0.4;
	font = "Zeppelin32";
	soundEnter[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
	soundPush[] = {"\ca\ui\data\sound\new1", 0.09, 1};
	soundClick[] = {"\ca\ui\data\sound\mouse3", 0.07, 1};
	soundEscape[] = {"\ca\ui\data\sound\mouse1", 0.09, 1};
	class Attributes {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	class AttributesImage {
		font = "Zeppelin32";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
};

class Dummy_Map {
	idc = -1;
	type=100;
	style=48;
	x = 0;y = 0;w = 1;h = 1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {0,0,0,0};
	colorSea[] = {0,0,0,0};
	colorForest[] = {0,0,0,0};
	colorRocks[] = {0,0,0,0};
	colorCountlines[] = {0,0,0,0};
	colorMainCountlines[] = {0,0,0,0};
	colorCountlinesWater[] = {0,0,0,0};
	colorMainCountlinesWater[] = {0,0,0,0};
	colorForestBorder[] = {0,0,0,0};
	colorRocksBorder[] = {0,0,0,0};
	colorPowerLines[] = {0,0,0,0};
	colorNames[] = {0,0,0,0};
	colorInactive[] = {0,0,0,0};
	colorLevels[] = {0,0,0,0};
	colorRailWay[] = {0,0,0,0};
	colorOutside[] = {0,0,0,0};
	font = "TahomaB";
	sizeEx = 0.00;
	stickX[] = {0.0,{"Gamma", 1, 1}};
	stickY[] = {0.0,{"Gamma", 1, 1}};
	ptsPerSquareSea = 0;
	ptsPerSquareTxt = 0;
	ptsPerSquareCLn = 0;
	ptsPerSquareExp = 0;
	ptsPerSquareCost = 0;
	ptsPerSquareFor = "0f";
	ptsPerSquareForEdge = "0f";
	ptsPerSquareRoad = 0;
	ptsPerSquareObj = 0;
	fontLabel = "Zeppelin32";
	sizeExLabel = 0.0;
	fontGrid = "Zeppelin32";
	sizeExGrid = 0.0;
	fontUnits = "Zeppelin32";
	sizeExUnits = 0.0;
	fontNames = "Zeppelin32";
	sizeExNames = 0.0;
	fontInfo = "Zeppelin32";
	sizeExInfo = 0.0;
	fontLevel = "Zeppelin32";
	sizeExLevel = 0.0;
    scaleMax = 1;
    scaleMin = 0.125;
	text = "";
	maxSatelliteAlpha = 0;
	alphaFadeStartScale = 1;
	alphaFadeEndScale = 1.0;
	showCountourInterval=1;
	scaleDefault = 2;
    class Task {
		icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 1;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
        iconCreated = "";
        iconCanceled = "";
        iconDone = "";
        iconFailed = "";
        colorCreated[] = {0,0,0,0};
        colorCanceled[] = {0,0,0,0};
        colorDone[] = {0,0,0,0};
        colorFailed[] = {0,0,0,0};
    };
    class CustomMark {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 1;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class Legend {
        x = "SafeZoneX";
        y = "SafeZoneY";
        w = 0.340000;
        h = 0.152000;
        font = "Zeppelin32";
        sizeEx = 0.039210;
        colorBackground[] = {0,0,0,0};
        color[] = {0,0,0,0};
    };
    class Bunker {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 14;
        importance = "1.5 * 14 * 0.05";
        coefMin = 0.250000;
        coefMax = 4;
    };
    class Bush {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 14;
        importance = "0.2 * 14 * 0.05";
        coefMin = 0.250000;
        coefMax = 4;
    };
    class BusStop {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 12;
        importance = "1 * 10 * 0.05";
        coefMin = 0.250000;
        coefMax = 4;
    };
    class Command {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 18;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class Cross {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        size = 16;
        color[] = {0,0,0,0};
        importance = "0.7 * 16 * 0.05";
        coefMin = 0.250000;
        coefMax = 4;
    };
    class Fortress {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        size = 16;
        color[] = {0,0,0,0};
        importance = "2 * 16 * 0.05";
        coefMin = 0.250000;
        coefMax = 4;
    };
    class Fuelstation {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        size = 16;
        color[] = {0,0,0,0};
        importance = "2 * 16 * 0.05";
        coefMin = 0.750000;
        coefMax = 4;
    };
    class Fountain {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 11;
        importance = "1 * 12 * 0.05";
        coefMin = 0.250000;
        coefMax = 4;
    };
    class Hospital {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 16;
        importance = "2 * 16 * 0.05";
        coefMin = 0.500000;
        coefMax = 4;
    };
    class Chapel {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 16;
        importance = "1 * 16 * 0.05";
        coefMin = 0.900000;
        coefMax = 4;
    };
    class Church {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        size = 16;
        color[] = {0,0,0,0};
        importance = "2 * 16 * 0.05";
        coefMin = 0.900000;
        coefMax = 4;
    };
    class Lighthouse {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        size = 14;
        color[] = {0,0,0,0};
        importance = "3 * 16 * 0.05";
        coefMin = 0.900000;
        coefMax = 4;
    };
    class Quay {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        size = 16;
        color[] = {0,0,0,0};
        importance = "2 * 16 * 0.05";
        coefMin = 0.500000;
        coefMax = 4;
    };
    class Rock {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 12;
        importance = "0.5 * 12 * 0.05";
        coefMin = 0.250000;
        coefMax = 4;
    };
    class Ruin {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        size = 16;
        color[] = {0,0,0,0};
        importance = "1.2 * 16 * 0.05";
        coefMin = 1;
        coefMax = 4;
    };
    class SmallTree {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 12;
        importance = "0.6 * 12 * 0.05";
        coefMin = 0.250000;
        coefMax = 4;
    };
    class Stack {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        size = 20;
        color[] = {0,0,0,0};
        importance = "2 * 16 * 0.05";
        coefMin = 0.900000;
        coefMax = 4;
    };
    class Tree {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 12;
        importance = "0.9 * 16 * 0.05";
        coefMin = 0.250000;
        coefMax = 4;
    };
    class Tourism {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 16;
        importance = "1 * 16 * 0.05";
        coefMin = 0.700000;
        coefMax = 4;
    };
    class Transmitter {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 20;
        importance = "2 * 16 * 0.05";
        coefMin = 0.900000;
        coefMax = 4;
    };
    class ViewTower {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 16;
        importance = "2.5 * 16 * 0.05";
        coefMin = 0.500000;
        coefMax = 4;
    };
    class Watertower {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 20;
        importance = "1.2 * 16 * 0.05";
        coefMin = 0.900000;
        coefMax = 4;
    };
    class Waypoint {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 16;
        importance = "2.5 * 16 * 0.05";
        coefMin = 0.500000;
        coefMax = 4;
    };
    class WaypointCompleted {
        icon = "\ca\ui\data\clear_empty_ca.paa";
        color[] = {0,0,0,0};
        size = 16;
        importance = "2.5 * 16 * 0.05";
        coefMin = 0.500000;
        coefMax = 4;
    };
    class ActiveMarker {
        color[] = {0,0,0,0};
        size = 1;
    };
};