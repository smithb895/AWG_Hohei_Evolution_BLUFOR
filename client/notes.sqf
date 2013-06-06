//by psycho
#include "setup.sqf"
if !(X_Client) exitWith {};

//notes
_log = player createDiaryRecord ["Diary", ["Role-related skills", "
Each character has a special skill. This is applicable under certain conditions. For example, pioneers can build FARP's and medics a MASH.<br/>
The following is a list of the capabilities:<br/>
- Pionieer : erect FARP<br/>
- Medic : erect MASH<br/>
- AA-Soldier : erect AA-Pod<br/>
- Grenadier : erect static grenade launcher<br/>
- AT-Specialist : erect static missile launcher<br/>
- Spotter : erect artillery<br/>
- Machinegunner : erect MG-Pod<br/>
- Special Forces : HALO<br/>"]];

_log = player createDiaryRecord ["Diary", ["The Officer", "
This is only a secondary goal. In every town there is an officer who should be arrested. There are a reward."]];

_log = player createDiaryRecord ["Diary", ["The Radiotower", "
Only if the radio tower of the opponent is destroyed, the city can be freed. The enemy uses the radio tower to call for his gain. Without the tower, he will soon have to give up.<br/>
In most cases the tower can only be destroyed with satchels!"]];
#ifdef __BLUE__
_log = player createDiaryRecord ["Diary", ["Free the town", "
<img image='pictures\evo_blue.paa'/><br/><br/>
This is your only primary target. To clear the town the radiotower must be destroyed just like all vehicles.<br/>
Chance of infantry can survive, what will emerge after the liberation."]];
#else
_log = player createDiaryRecord ["Diary", ["Free the town", "
<img image='pictures\evo_red.paa'/><br/><br/>
This is your only primary target. To clear the town the radiotower must be destroyed just like all vehicles.<br/>
Chance of infantry can survive, what will emerge after the liberation."]];
#endif


//////lobby settings
private ["_par10","_par9","_par8","_par7","_par6","_title_5_1","_par5","_par4","_par3","_par2","_par1"];
_par1 = switch (true) do {
#ifdef __Takistan__
	case (E_Towns ==1) : {"Evo Standard Route (9)"};
	case (E_Towns ==2) : {"North-South Route (10)"};
	case (E_Towns ==3) : {"random all (23)"};
	case (E_Towns ==4) : {"1 random town"};
	case (E_Towns ==5) : {"3 random towns"};
	case (E_Towns ==6) : {"5 random towns"};
	case (E_Towns ==7) : {"8 random towns"};
#else
	case (E_Towns ==1) : {"Evo Standard Route (9)"};
	case (E_Towns ==2) : {"Coast Route"};
	case (E_Towns ==3) : {"random all (24)"};
	case (E_Towns ==4) : {"1 random town"};
	case (E_Towns ==5) : {"3 random towns"};
	case (E_Towns ==6) : {"5 random towns"};
	case (E_Towns ==7) : {"8 random towns"};
#endif
};
_par2 = switch (true) do {
	case (E_loadout == 0) : {"Original unit loadout"};
	case (E_loadout == 1) : {"Evolution settings loadout"};
};
_par3 = switch (true) do {
	case (E_Mtime == 3) : {"03:00"};
	case (E_Mtime == 5) : {"05:00"};
	case (E_Mtime == 7) : {"07:00"};
	case (E_Mtime == 10) : {"10:00"};
	case (E_Mtime == 13) : {"13:00"};
	case (E_Mtime == 16) : {"16:00"};
	case (E_Mtime == 19) : {"19:00"};
	case (E_Mtime == 21) : {"21:00"};
	case (E_Mtime == 0) : {"00:00"};
};
_par4 = switch (true) do {
	case (E_with_respawn_dlg == 1) : {"yes"};
	case (E_with_respawn_dlg == 0) : {"without"};
};
_par4_4 = switch (true) do {
	case (E_weather == 1) : {"Yes, with weather effects"};
	case (E_weather == 0) : {"No changing weather"};
};
#ifdef __Chernarus__
_par4_5 = switch (true) do {
	case (E_WithWinterWeather == 1) : {"yes"};
	case (E_WithWinterWeather == 0) : {"without"};
};
#endif
#ifdef __Takistan__
	_title_5_1 = "Sandstorms";
#else
	_title_5_1 = "Foggy Clouds";
#endif
_par5 = switch (true) do {
	case (E_weathereffects == 1) : {"yes"};
	case (E_weathereffects == 0) : {"without"};
};
_par6 = switch (true) do {
	case (E_lock == 0) : {"Locked"};
	case (E_lock == 1) : {"Unlocked"};
	case (E_lock == 2) : {"Vehicles Locked Only"};
	case (E_lock == 3) : {"Equipment Locked Only"};
};
_par7 = switch (true) do {
	case (E_diffparam == 1) : {"Easy"};
	case (E_diffparam == 2) : {"Normal"};
	case (E_diffparam == 3) : {"Hard"};
	case (E_diffparam == 4) : {"Extreme"};
};
_par8 = switch (true) do {
	case (E_need_satchel == 0) : {"every weapon can destroy the radio tower"};
	case (E_need_satchel == 1) : {"only satchels can destroy a radio tower"};
	case (E_need_satchel == 2) : {"multiple satchels are needed to destroy the radio tower"};
};
_par9 = switch (true) do {
	case (E_max_amburespawn ==0) : {"never - no respawn of MHQ or AHQ"};
	case (E_max_amburespawn ==2) : {"2 times"};
	case (E_max_amburespawn ==5) : {"5 times"};
	case (E_max_amburespawn ==10) : {"10 times"};
	case (E_max_amburespawn ==20) : {"20 times"};
	case (E_max_amburespawn ==99999) : {"no restriction"};
};
_par10 = switch (true) do {
	case (E_fastTime ==0) : {"normal 24h day"};
	case (E_fastTime ==1) : {"12h day"};
	case (E_fastTime ==2) : {"6h day"};
	case (E_fastTime ==3) : {"3h day"};
};
#ifndef __A2__
_par11 = switch (true) do {
	case (E_arty_comp ==0) : {"computer is disabled"};
	case (E_arty_comp ==1) : {"computer is enabled"};
};
#endif
_par12 = switch (true) do {
	case (E_TK_kill_points ==0) : {"disabled"};
	case (E_TK_kill_points ==-1) : {"-1 point"};
	case (E_TK_kill_points ==-2) : {"-2 points"};
	case (E_TK_kill_points ==-5) : {"-5 points"};
};
_par13 = switch (true) do {
	case (E_max_num_TKs ==999999) : {"disabled"};
	case (E_max_num_TKs ==2) : {"2 Teamkills"};
	case (E_max_num_TKs ==3) : {"3 Teamkills"};
	case (E_max_num_TKs ==5) : {"5 Teamkills"};
	case (E_max_num_TKs ==10) : {"10 Teamkills"};
	case (E_max_num_TKs ==20) : {"20 Teamkills"};
};
_par14 = switch (true) do {
	case (E_max_num_TKs_mhq ==999999) : {"disabled"};
	case (E_max_num_TKs_mhq ==2) : {"2 destroyed MHQ/AHQ"};
	case (E_max_num_TKs_mhq ==3) : {"3 destroyed MHQ/AHQ"};
	case (E_max_num_TKs_mhq ==5) : {"5 destroyed MHQ/AHQ"};
	case (E_max_num_TKs_mhq ==10) : {"10 destroyed MHQ/AHQ"};
};
_par15 = switch (true) do {
	case (E_icbm == 1) : {"enabled"};
	case (E_icbm == 0) : {"disabled"};
};

_subject = player createDiarySubject ["settings", "Lobby Settings"];
_log = player createDiaryRecord ["settings", ["Evo Towns", _par1]];
_log = player createDiaryRecord ["settings", ["Start-Weapon Loadout", _par2]];
_log = player createDiaryRecord ["settings", ["Start time of day", _par3]];
_log = player createDiaryRecord ["settings", ["with Teleporter-Dialog by respawn?", _par4]];
_log = player createDiaryRecord ["settings", ["Weather effects?", _par4_4]];
#ifdef __Chernarus__
_log = player createDiaryRecord ["settings", ["Winterweather?", _par4_5]];
#endif
_log = player createDiaryRecord ["settings", [_title_5_1, _par5]];
_log = player createDiaryRecord ["settings", ["Rank version", _par6]];
_log = player createDiaryRecord ["settings", ["Troop Size Defense", _par7]];
_log = player createDiaryRecord ["settings", ["Satchels need to destroy Radiotowers?", _par8]];
_log = player createDiaryRecord ["settings", ["Respawns of MHQ and AHQ?", _par9]];
_log = player createDiaryRecord ["settings", ["Fasttime", _par10]];
#ifndef __A2__
_log = player createDiaryRecord ["settings", ["Artillery Computer", _par11]];
#endif
_log = player createDiaryRecord ["settings", ["negative Score for Teamkills", _par12]];
_log = player createDiaryRecord ["settings", ["Number of Teamkills for Autokick", _par13]];
_log = player createDiaryRecord ["settings", ["Number of destroyed mobile spawn for Autokick", _par14]];
_log = player createDiaryRecord ["settings", ["ICBM support avalible?", _par15]];


//////credits
_subject = player createDiarySubject ["made", "Credits"];

_log = player createDiaryRecord ["made", ["Contact", "
<img image='pictures\info.paa'/><br/>
You can report bugs and any suggestions on dev-heaven... follow the link:<br/>
http://dev-heaven.net/projects/hohei-evo"]];

_log = player createDiaryRecord ["made", ["Thank You...", "<br/>
...to:<br/>
- for first mission design: Kiljoy<br/>
- for the good teamwork in 2010: Razor<br/>
- for external scripts and functions:<br/>
--> backpack dialog - BonInf*<br/>
--> x-functions, vehicle-lift-system and these great netcode - Xeno<br/>
--> BI-functions - BIS<br/>
--> snow script - Ruebe<br/>
--> BTK Cargo Drop - sxp2high<br/>
--> Spectating script - Kegetys<br/>
--> Injury System - Bon_Inf*<br/>
- for the game OFP, ArmA and ArmA2 - Bohemia Interactive Simulation<br/>
- to devheaven for the webspace<br/>
- to the hole Combat Group community and especially to Iridium for Beta testing and intensive bug reporting<br/><br/>
...and all the others i have forgotten here!<br/>
"]];

_log = player createDiaryRecord ["made", ["made by", "<br/>
- Original Evolution for ArmA1 by Kiljoy (in 2007?)<br/>
- first fine working ArmA2 port by Razor in 2009<br/>
- complete reworked for ArmA2 and OA by Psychobastard in 2011<br/>
- Version number: 2.064.045"]];

//for jips
notes_done = true;