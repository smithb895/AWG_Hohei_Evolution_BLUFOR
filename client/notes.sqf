//by psycho
#include "setup.sqf"
if !(X_Client) exitWith {};

// Only put stuff relevant to the players in this changelog

_log = player createDiaryRecord ["Diary", ["Changelog", "<br/>
-------------------------------------------------<br/>
------------  V5.98 Alpha to V5.98 Beta <br/>
-------------------------------------------------<br/>
<br/>
- Number of player slots increased to 40.
<br/>
- Added option to play 15 random towns.
<br/>
<br/>
<br/>
<br/>
<br/>
-------------------------------------------------<br/>
------------  V5.96 Alpha to V5.98 Alpha <br/>
-------------------------------------------------<br/>
<br/>
- The AI Number of Infantry spawns has been increased 48 to 64.
<br/>
- AI minimal random skill level has been increased from 0.2 to 0.6.
<br/>
<br/>
<br/>
<br/>
<br/>
-------------------------------------------------<br/>
------------  V5.95 Beta to V5.96 Alpha <br/>
-------------------------------------------------<br/>
<br/>
- The AI system has been improved, the AI units are now smarter and faster reacting to combat.
<br/>
<br/>
<br/>
<br/>
-------------------------------------------------<br/>
------------  V5.9 Beta to V5.93 Beta <br/>
-------------------------------------------------<br/>
<br/>
- EVO Red Version 5 now exists.<br/>
<br/>
<br/>
<br/>
-------------------------------------------------<br/>
------------  V5.8 Beta to V5.9 Beta <br/>
-------------------------------------------------<br/>
<br/>
- The revive system now indicates if someone was killed by friendly fire.<br/>
- Fixed an issue with markers for downed players.<br/>
- Reviving downed players now awards points to the healer.<br/>
<br/>
<br/>
<br/>
-------------------------------------------------<br/>
------------  V5.7 Beta to V5.8 Beta <br/>
-------------------------------------------------<br/>
<br/>
- Fixed not being able to lift some CDF vehicles at base.<br/>
- Fixed a bug with capturing the enemy officer and unarmed soldiers, should work properly now.<br/>
<br/>
<br/>
<br/>
-------------------------------------------------<br/>
------------  V5.6 Beta to V5.7 Beta <br/>
-------------------------------------------------<br/>
<br/>
- Fixed some instances where the player could end up with their controls compeltely locked up.<br/>
- Re-enabled the revive script since it no longer will lock up the player's controls.<br/>
- Changed the helicopter service point at base to accept two helicopters at once.<br/>
<br/>
<br/>
<br/>
-------------------------------------------------<br/>
------------  V5.5 Beta to V5.6 Beta <br/>
-------------------------------------------------<br/>
<br/>
- Fixed respawn times on the AHQ and MHQ (They were bugged and respawned nearly instantly).<br/>
- Spotters can now deploy artillery pieces that can actually work as artillery pieces.<br/>
- Artillery pieces now have access to ArmA 2's artillery targeting system.<br/>
<br/>
<br/>
<br/>
-------------------------------------------------<br/>
------------  V5.4 Beta to V5.5 Beta <br/>
-------------------------------------------------<br/>
<br/>
- Players that have the rank of corporal or higher now have access to stinger missiles.<br/>
<br/>
<br/>
<br/>
-------------------------------------------------<br/>
------------  V5.3 Beta to V5.4 Beta <br/>
-------------------------------------------------<br/>
<br/>
- Capturing an enemy officer now rewards you with 10 points instead of 6.<br/>
- The main base has been upgraded with anti-air defenses.<br/>
- OPFOR ZSU-23 Shilkas will now sometimes appear in the AO.<br/>
- The commander of the enemy's artillery battalions has been replaced with someone else who is smart enough not to send long-range artillery into close combat environments.<br/>
<br/>
<br/>
<br/>
-------------------------------------------------<br/>
------------  V5.2 Beta to V5.3 Beta <br/>
-------------------------------------------------<br/>
<br/>
- Some of the vehicle rank requirements have been updated. Check the rank requirements note for more details.<br/>
<br/>
<br/>
<br/>
-------------------------------------------------<br/>
------------  V5.1 Beta to V5.2 Beta <br/>
-------------------------------------------------<br/>
<br/>
- Custom textures added to the A-10 thunderbolt. It now looks like it belongs in chernarus.<br/>
- The airlifting ability of the MH-60S and MV-22 have been fixed.<br/>
- F-35Bs have been equipped with AGM-65 Mavericks for extra Anti-Tank capability.<br/>
<br/>
<br/>
<br/>
-------------------------------------------------<br/>
-----------     V4R2 to V5.1 Beta <br/>
-------------------------------------------------<br/>
<br/>
- Main Base and FARPs were remodelled into more organized layouts.<br/>
- Tweaked ammo boxes to carry varying selections of weapons and ammo.<br/>
- HALO jump capability added to the C-130J and MV-22.<br/>
- Lots of bicycles have been added to the main base, along with another M1A1 and M1A2 TUSK. An extra C-130J and MV-22 have been added as well.<br/>
- Fixed many bugs."]];

//notes
_log = player createDiaryRecord ["Diary", ["Role-related skills", "
Every player type has a special ability.<br/>
The following is a list of the capabilities:<br/>
- Engineer : Erect FARPs when near a repair truck.<br/>
- Medic : Erect MASHs when near a medical vehicle.<br/>
- AA-Soldier : Erect AA static defences when equipped with a Stinger launcher.<br/>
- Grenadier : Erect a grenade launcher minitripod when equipped with a weapon that has a grenade launcher.<br/>
- AT-Specialist : Erect a TOW Missile launcher when equipped with a Javelin.<br/>
- Spotter : Erect M119 artillery units when near an ammunition truck.<br/>
- Machinegunner : Erect a M2 tripod when equipped with a LMG.<br/>"]];


_log = player createDiaryRecord ["Diary", ["Vehicle rank unlocks", "
Here is a brief overview of what vehicles unlock when you rank up.<br/>
<br/>
Corporal   - 25 points<br/>
	- All Humvee and UAZ variants, excluding the Avenger. <br/>
	- All Armoured Personel Carriers.<br/>
	- M119 Artillery Units.<br/><br/>
Sergeant   - 45 points<br/>
	- All light tanks - M1A1 and T72.<br/>
	- All anti-air vehicles - HMMWV Avenger and ZSU Shilka.<br/>
	- The MH60S heavy transport helicopter.<br/>
	- The UH-1Y light transport helicopter.<br/><br/>
Lieutenant   - 85 points<br/>
	- The M1A2 TUSK urban battle tank.<br/>
	- The MLRS mobile artillery system.<br/>
	- The MV-22 Osprey VTOL transport.<br/>
	- The C130J heavy transport plane.<br/>
	- The Mi24-D gunship helicopter.<br/><br/>
Captain   - 145 points<br/>
	- The anti-air variant of the AH64D attack helicopter.<br/>
	- The anti-tank variant of the AH64D attack helicopter.<br/>
	- The Su-25 Close Air Support aircraft.<br/><br/>
Major   - 220 points<br/>
	- The A10 Close Air Support aircraft.<br/>
	- The F35B fighter bomber.<br/>
	- The AV-8B (LGB) Close Air Support aircraft.<br/><br/>
Colonel   - 360 points<br/>
	- The AV-8B fighter bomber.<br/>
	- The AH-1Z attack helicopter.<br/>
"]];

_log = player createDiaryRecord ["Diary", ["The Officer", "
Officers command forces on the ground and are often protected by multiple squads of infantry and armour. <br> Capture the officer for additional score."]];

_log = player createDiaryRecord ["Diary", ["The Radiotower", "
The radio tower is vital for the survival of the resistance forces.  In light of that they will protect it at all costs!<br>
Destroy the tower to prevent local resistance from calling in reinforcements."]];

_log = player createDiaryRecord ["Diary", ["Free the town", "
<img image='pictures\evo_blue.paa'/><br/><br/>
Destroy the resistance and liberate the town."]];



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
	case (E_Towns ==8) : {"15 random towns"};
#else
	case (E_Towns ==1) : {"Evo Standard Route (9)"};
	case (E_Towns ==2) : {"Coast Route"};
	case (E_Towns ==3) : {"random all (24)"};
	case (E_Towns ==4) : {"1 random town"};
	case (E_Towns ==5) : {"3 random towns"};
	case (E_Towns ==6) : {"5 random towns"};
	case (E_Towns ==7) : {"8 random towns"};
	case (E_Towns ==8) : {"15 random towns"};
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
/*
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
*/

//////credits
_subject = player createDiarySubject ["made", "Credits"];

_log = player createDiaryRecord ["made", ["Contact", "
Please report bugs to any Anzu's War Games administrator or clan member. <br>
Feel free to visit us on our forums or TS3.<br>
Web: AnzusWarGames.Info<br>
TS3: TS3.AnzusWarGames.Info"]];

_log = player createDiaryRecord ["made", ["Thank You...", "<br/>
...to:<br/>
- for first mission design: Kiljoy<br/>
- for the good teamwork in 2010: Razor<br/>
- for the excelent update in 2013: {AWG} Wyatt<br>
- for external scripts and functions:<br/>
--> BI-functions - BIS<br/>
--> snow script - Ruebe<br/>
--> BTK Cargo Drop - sxp2high<br/>
- for the game OFP, ArmA and ArmA2 - Bohemia Interactive Simulation<br/>
- to devheaven for the webspace<br/>
- to the hole Combat Group community and especially to Iridium for Beta testing and intensive bug reporting<br/><br/>
...and all the others I have forgotten here!<br/>
"]];

_log = player createDiaryRecord ["made", ["Created by", "<br/>
- Original Evolution for ArmA1 by Kiljoy (in 2007?)<br/>
- first fine working ArmA2 port by Razor in 2009<br/>
- complete reworked for ArmA2 and OA by Psychobastard in 2011<br/>
- Updated for AWG by {AWG} Wyatt in 2013<br>
- Version number: 5.2 Beta"]];

// Only put stuff relevant to the players in the changelog

_log = player createDiaryRecord ["made", ["Changelog", "<br/>
-------------------------------------------------<br/>
------------  V5.2 Beta to V5.3 Beta <br/>
-------------------------------------------------<br/>
<br/>
- Some of the vehicle rank requirements have been updated. Check the rank requirements note for more details.<br/>
<br/>
<br/>
<br/>
-------------------------------------------------<br/>
------------  V5.1 Beta to V5.2 Beta <br/>
-------------------------------------------------<br/>
<br/>
- Custom textures added to the A-10 thunderbolt. It now looks like it belongs in chernarus.<br/>
- The airlifting ability of the MH-60S and MV-22 have been fixed.<br/>
- F-35Bs have been equipped with AGM-65 Mavericks for extra Anti-Tank capability.<br/>
<br/>
<br/>
<br/>
-------------------------------------------------<br/>
-----------     V4R2 to V5.1 Beta <br/>
-------------------------------------------------<br/>
<br/>
- Main Base and FARPs were remodelled into more organized layouts.<br/>
- Tweaked ammo boxes to carry varying selections of weapons and ammo.<br/>
- HALO jump capability added to the C-130J and MV-22.<br/>
- Lots of bicycles have been added to the main base, along with another M1A1 and M1A2 TUSK. An extra C-130J and MV-22 have been added as well.<br/>
- Fixed many bugs."]];

//for jips
notes_done = true;