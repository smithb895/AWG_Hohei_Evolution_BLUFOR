private ["_p","_prank","_vp","_vtype"];
_p = _this select 0;
_vp = vehicle _p;
_vtype = typeOf _vp;
_prank = rankID _p;
switch (_prank) do {
	case 0 : {
		if (((_vtype in EVO_rank1_vecs) || (_vtype in EVO_rank2_vecs) || (_vtype in EVO_rank3_vecs) || (_vtype in EVO_rank4_vecs) || (_vtype in EVO_rank5_vecs) || (_vtype in EVO_rank6_vecs)) && !((getPlayerUID player) in Evo_Admins)) then {
			[_p] spawn EVO_Eject;
			_req_r = call EVO_wich_rank_req;
			[_p,_req_r] call EVO_RankReq;
		};
	};
	case 1 : {
		if (((_vtype in EVO_rank2_vecs) || (_vtype in EVO_rank3_vecs) || (_vtype in EVO_rank4_vecs) || (_vtype in EVO_rank5_vecs) || (_vtype in EVO_rank6_vecs)) && !((getPlayerUID player) in Evo_Admins)) then {
			[_p] spawn EVO_Eject;
			_req_r = call EVO_wich_rank_req;
			[_p,_req_r] call EVO_RankReq;
		};
	};
	case 2 : {
		if (((_vtype in EVO_rank3_vecs) || (_vtype in EVO_rank4_vecs) || (_vtype in EVO_rank5_vecs) || (_vtype in EVO_rank6_vecs)) && !((getPlayerUID player) in Evo_Admins)) then {
			[_p] spawn EVO_Eject;
			_req_r = call EVO_wich_rank_req;
			[_p,_req_r] call EVO_RankReq;
		};
	};
	case 3 : {
		if (((_vtype in EVO_rank4_vecs) || (_vtype in EVO_rank5_vecs) || (_vtype in EVO_rank6_vecs)) && !((getPlayerUID player) in Evo_Admins)) then {
			[_p] spawn EVO_Eject;
			_req_r = call EVO_wich_rank_req;
			[_p,_req_r] call EVO_RankReq;
		};
	};
	case 4 : {
		if (((_vtype in EVO_rank5_vecs) || (_vtype in EVO_rank6_vecs)) && !((getPlayerUID player) in Evo_Admins)) then {
			[_p] spawn EVO_Eject;
			_req_r = call EVO_wich_rank_req;
			[_p,_req_r] call EVO_RankReq;
		};
	};
	case 5 : {
		if ((_vtype in EVO_rank6_vecs) && !((getPlayerUID player) in Evo_Admins)) then {
			[_p] spawn EVO_Eject;
			[_p,EVO_rank6] call EVO_RankReq;
		};
	};
	case 6 : {disableUserInput false};
	default {
		disableUserInput false;
		diag_log "----------EVO Error: error occurs during vehicle-check rank switching!"
	};
};