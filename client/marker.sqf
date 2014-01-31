private ["_id","_ex"];
_id = _this select 0;
_ex = false;


if (isNil "markPos") then {markPos = true;} else {markPos = !markPos};

if(isNil "markers") then { markers = []};

if (!_ex) then
{
     //If the _id is not in the array, then add it!
     PlayerScores = PlayerScores + [ [_id, score player] ];
     publicVariable "PlayerScores";
};

//GLOBAL VARS START

//SLEEP
GlobalSleep=4;//Sleep between update markers
//SLEEP

//----------------------#Players#--------------------------
AddPlayersToMap=true;
AddPlayersToScreen=true;
//PlayersMarkerType=["b_inf"];
PlayerMarkerColor=[0,0,1,1];//two in the fourth degree is equal to sixteen, so there are 16 colors
InjuredPlayerColor = [0.2,0.2,0.2,1];
PlayerShowBloodInt=false;
PlayerShowDistance=false;
TheThicknessOfThePointPlayer=1.0;
//----------------------#Players#--------------------------

//----------------------#Zombies#--------------------------
AddZombieToMap=false;
ZombieVisibleDistance=100;
ZombieMarkerType="vehicle";
ZombieMarkerColor="ColorGreen";
ZombieName="Zombie";
//----------------------#Zombies#--------------------------
//----------------------#Vehicles#-------------------------
AddVehicleToMap=false;
VehicleMarkerType="vehicle";
VehicleMarkerColor="ColorBlue";
//----------------------#Vehicles#-------------------------

//----------------------#Tents#----------------------------
AddTentsToMap=false;
TentsMarkerType="vehicle";
TentsMarkerColor="ColorYellow";
//----------------------#Tents#----------------------------

//----------------------#Crashes#--------------------------
AddCrashesToMap=false;
CrashesMarkerType="vehicle";
CrashesMarkerColor="ColorBlack";
//----------------------#Crashes#--------------------------
//----------------------#Medical Box#--------------------------
AddMedicalToMap=false;
MedicalMarkerType="vehicle";
MedicalMarkerColor="ColorRed";
//----------------------#Medical Box#--------------------------

//GLOBAL VARS END

While {markPos} do {
 	If (AddPlayersToMap) then {
	{	
		if ((vehicle (leader (group _x))) iskindof "Car") then {
			PlayersMarkerType=["b_motor_inf"]; };
		if ((vehicle (leader (group _x))) iskindof "Tank") then {
			PlayersMarkerType=["b_armor"]; };
		if ((vehicle (leader (group _x))) iskindof "Helicopter") then {
			PlayersMarkerType=["b_air"]; };
		if ((vehicle (leader (group _x))) iskindof "Plane") then {
			PlayersMarkerType=["b_plane"]; };
		if (!(vehicle (leader (group _x)) iskindof "Plane") and !(vehicle (leader (group _x)) iskindof "Helicopter") and !(vehicle (leader (group _x)) iskindof "Tank") and !(vehicle (leader (group _x)) iskindof "Car")) then {
			PlayersMarkerType=["b_inf"]; }; 
		(group _x) addGroupIcon PlayersMarkerType;
		if (PlayerShowBloodInt && PlayerShowDistance) then {
		BloodVal=round(_x getVariable["PlayerScores",0]);
		(group _x) setGroupIconParams [PlayerMarkerColor, format["%1(%2)-%3",name _x,BloodVal,round(player distance _x)],TheThicknessOfThePointPlayer,true];
		};
		If (PlayerShowBloodInt && !PlayerShowDistance) then {
		BloodVal=round(_x getVariable["PlayerScores",0]);
		(group _x) setGroupIconParams [PlayerMarkerColor, format ["%1(%2)",name _x, BloodVal],TheThicknessOfThePointPlayer,true];
		};
		If (PlayerShowDistance && !PlayerShowBloodInt) then {
		(group _x) setGroupIconParams [PlayerMarkerColor, format["%1-%2", name _x,round(player distance _x)],TheThicknessOfThePointPlayer,true];
		};
		if (!PlayerShowBloodInt && !PlayerShowDistance) then {
		(group _x) setGroupIconParams [PlayerMarkerColor, format ["%1",name _x],TheThicknessOfThePointPlayer,true];
		};
		if (!PlayerShowBloodInt && !PlayerShowDistance) then {
			if ((lifestate (leader (group _x))) == "ALIVE") then {
				(group _x) setGroupIconParams [PlayerMarkerColor, format ["%1",name _x],TheThicknessOfThePointPlayer,true];
			} else {
				(group _x) setGroupIconParams [InjuredPlayerColor, format ["%1 is down",name _x],TheThicknessOfThePointPlayer,true];
			};
		};
		ParamsPlayersMarkers=[true,true];
		setGroupIconsVisible [true,true];
	} forEach playableUnits;
};

sleep GlobalSleep;
{
clearGroupIcons (group _x);
} forEach playableUnits;
};


if(!markPos) then { 

If (AddPlayersToMap) then {
{
clearGroupIcons (group _x);
} forEach allUnits;
};
sleep 0.5;
 };
 
titleText ["AWG map esp disabled","PLAIN DOWN"]; titleFadeOut 4;
