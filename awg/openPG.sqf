_UID = getPlayerUID player;

if (_UID in EVO_SAdmins) then {
closedialog 0;
createDialog "balca_debug_main";
diag_log format ["Super Admin %1 accessed Proving Grounds - ArmA 2 Key: %2", name player, _uid];
};