#define __ccppfln(xfile1) call compile preprocessFileLineNumbers #xfile1
#define __cppfln(xdfunc,xfile2) xdfunc = compile preprocessFileLineNumbers #xfile2
#define __XJIPGetVar(jvarname) (X_JIPH getVariable #jvarname)
#define __XJIPSetVar X_JIPH setVariable

#define PARAMS_1(param1) param1 = _this select 0
#define __pGetVar(pvarname) (player getVariable #pvarname)
#define __pSetVar player setVariable
#define __aiSetVar(theai) theai setVariable
#define __uiGetVar(uvarname) (uiNamespace getVariable #uvarname)
#define __prma _p removeAction _id
#define __waitpl [] spawn {waitUntil {!isNull player};X_INIT = true}
#define __addmx _p addMagazine _x
#define __addwx _p addWeapon _x
#define __kindp _p isKindOf
#define __kind(eobj) eobj isKindOf
#define __sleep sleep 0.152
#define __type typeOf (vehicle player)
#define __Tcondition ((score _p >= EVO_rank4) || (E_lock == 1))
#define __PsyCondition (name Player == "Psychobastard")

#define __isBlue (EVO_own_side == "WEST")
#define __isRed (EVO_own_side == "EAST")
#define __ACEver ("ACE" in e_version)
#define __OAonly ("OA" in e_version)
#define __COver ("CO" in e_version)
#define __A2only ("A2" in e_version)
#define __Takistan ("Takistan" in e_version)
#define __Chernarus ("Chernarus" in e_version)

#define __setEvoSkill(theunit) theunit setUnitAbility ((EVO_ai_skill select 0) + (random (EVO_ai_skill select 1)))
#define __MPCheck if (X_MP) then {waitUntil {sleep (1.012 + random 1);(call XPlayersNumber) > 0}}
#define __addDead(evec) d_allunits_add set [count d_allunits_add, evec];
#define __betalist ["417730","2297666","64770","220162","2222210","472450"]