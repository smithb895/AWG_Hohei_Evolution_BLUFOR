_punit = _this select 0;
_pmis = _this select 1;
_prew = _this select 2;
 
switch (_pmis) do {
    case 1:{_run = [_punit,_prew] execVM "data\scripts\Mass.sqf"};
    case 2:{_run = [_punit,_prew] execVM "data\scripts\Mlpat.sqf"}; 
    case 3:{_run = [_punit,_prew] execVM "data\scripts\Mwpat.sqf"};
    case 4:{_run = [_punit,_prew] execVM "data\scripts\Mdst.sqf"};
    case 5:{_run = [_punit,_prew] execVM "data\scripts\Mcsar.sqf"};
	case 6:{_run = [_punit,_prew] execVM "data\scripts\Mcsarb.sqf"};  
    case 7:{_run = [_punit,_prew] execVM "data\scripts\Mdefn.sqf"};
    case 8:{_run = [_punit,_prew] execVM "data\scripts\Msaad.sqf"};  
    case 9:{_run = [_punit,_prew] execVM "data\scripts\Mapat.sqf"};  
	default {};
};
