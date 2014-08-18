/*
	FileName: functions.sqf
	Author: =FTS= Dez
	Description: Contains and custom fucntions that I want to delcare at the start of the mission.
*/

// Calculate KillDeath ratio
fn_calckdRatio = { 

dez_killCount = _this select 0;
dez_deathCount = _this select 1;

				if (dez_deathCount > 0)
					then
					{
					dez_kdRatio = (dez_killCount / dez_deathCount);
					}
				else
				{
		dez_kdRatio = dez_kdRatio + 1;
	};
};

fn_MPhint = { 
	[hint format _this]; 
};

fn_randomiseAmmoBox = {

Private ["_box","_randWeapons","randItems"];

	_box = _this select 0;

	removeAllWeapons _box;
	{_box removeMagazine _x} forEach magazines _box;
	removeAllItems _box;
	
	_randItems = round (random 4)
	switch {__randItems} do
	{
		case 1: {
					_box addItemCargo["optic_MRCO",1];
					_box addItemCargo["optic_Hamr",1];
					_box addItemCargo["optic_Arco",1];
					_box addItemCargo["muzzle_snds_H",1];
					_box addItemCargo["optic_DMS",1];
					_box addItemCargo["optic_LRPS",1];
				};
		case 2: {
					_box addItemCargo["optic_MRCO",1];
					_box addItemCargo["muzzle_snds_H",1];
					_box addItemCargo["muzzle_snds_L",1];
					_box addItemCargo["muzzle_snds_H_MG",1];
					_box addItemCargo["FirstAidKit",5];
					_box addItemCargo["ToolKit",1];
					_box addItemCargo["optic_DMS",1];
					_box addItemCargo["optic_LRPS",1];
				};
		case 3: {

					_box addItemCargo["acc_pointer_IR",1];
					_box addItemCargo["optic_Aco",1];
					_box addItemCargo["optic_ACO_grn",1];
					_box addItemCargo["optic_Arco",1];
					_box addItemCargo["muzzle_snds_B",1];
					_box addItemCargo["muzzle_snds_H_MG",1];
					_box addItemCargo["FirstAidKit",5];
					_box addItemCargo["optic_tws",1];
				};
		case 4: {
					_box addItemCargo["optic_Holosight",1];
					_box addItemCargo["optic_Hamr",1];
					_box addItemCargo["optic_Arco",1];
					_box addItemCargo["optic_DMS",1];
					_box addItemCargo["optic_tws_mg",1];
				};
		case 5: {
					_box addItemCargo["optic_MRCO",1];
					_box addItemCargo["optic_Holosight",1];
					_box addItemCargo["optic_Arco",1];
					_box addItemCargo["muzzle_snds_B",1];
					_box addItemCargo["muzzle_snds_H_MG",1];
					_box addItemCargo["FirstAidKit",5];
					_box addItemCargo["optic_DMS",1];
					_box addItemCargo["optic_LRPS",1];
				};
		case 6: {
					_box addItemCargo["optic_MRCO",1];
					_box addItemCargo["acc_pointer_IR",1];
					_box addItemCargo["optic_Aco",1];
					_box addItemCargo["optic_ACO_grn",1];
					_box addItemCargo["optic_Holosight",1];
					_box addItemCargo["optic_Hamr",1];
					_box addItemCargo["optic_Arco",1];
					_box addItemCargo["muzzle_snds_H",1];
					_box addItemCargo["muzzle_snds_L",1];
					_box addItemCargo["muzzle_snds_M",1];
					_box addItemCargo["muzzle_snds_B",1];
					_box addItemCargo["muzzle_snds_H_MG",1];
					_box addItemCargo["FirstAidKit",5];
					_box addItemCargo["ToolKit",1];
					_box addItemCargo["optic_DMS",1];
					_box addItemCargo["optic_LRPS",1];
				};
		default {
					_box addItemCargo["optic_Holosight",1];
					_box addItemCargo["optic_Hamr",1];
					_box addItemCargo["optic_Arco",1];
					_box addItemCargo["optic_DMS",1];
					_box addItemCargo["optic_tws_mg",1];
				};
	};

	_randWeapons = round (random 28);
	switch {_randWeapons} do
	{
		case 1: {
					_box addWeaponCargoGlobal["srifle_EBR_ACO_F",1];
					_box addMagazineCargoGlobal["20Rnd_762x51_Mag",5];
				};
		case 2: {
					_box addWeaponCargoGlobal["srifle_EBR_MRCO_pointer_F",1];
					_box addMagazineCargoGlobal["20Rnd_762x51_Mag",5];
				};
		case 3: {
					_box addWeaponCargoGlobal["srifle_EBR_SOS_F",1];
					_box addMagazineCargoGlobal["20Rnd_762x51_Mag",5];
				};
		case 4: {
					_box addWeaponCargoGlobal["srifle_LRR_SOS_F",1];
					_box addMagazineCargoGlobal["7Rnd_408_Mag",5];
				};
		case 5: {
					_box addWeaponCargoGlobal["LMG_Mk200_F",1];
					_box addMagazineCargoGlobal["200Rnd_65x39_cased_Box",5];
				};
		case 6: {
					_box addWeaponCargoGlobal["LMG_Mk200_MRCO_F",1];
					_box addMagazineCargoGlobal["200Rnd_65x39_cased_Box",5];
				};
		case 7: {
					_box addWeaponCargoGlobal["arifle_Katiba_F",1];
					_box addMagazineCargoGlobal["30Rnd_65x39_caseless_green",5];
				};
		case 8: {
					_box addWeaponCargoGlobal["arifle_Katiba_GL_F",1];
					_box addMagazineCargoGlobal["30Rnd_65x39_caseless_green",5];
					_box addMagazineCargoGlobal["1Rnd_HE_Grenade_shell",5];
				};
		case 9: {
					_box addWeaponCargoGlobal["arifle_Katiba_ACO_F",1];
					_box addMagazineCargoGlobal["30Rnd_65x39_caseless_green",5];
				};
		case 10: {
					_box addWeaponCargoGlobal["arifle_Katiba_ARCO_F",1];
					_box addMagazineCargoGlobal["30Rnd_65x39_caseless_green",5];
				};
		case 11: {
					_box addWeaponCargoGlobal["arifle_Katiba_GL_ARCO_pointer_",1];
					_box addMagazineCargoGlobal["30Rnd_65x39_caseless_green",5];
					_box addMagazineCargoGlobal["1Rnd_HE_Grenade_shell",5];
				};
		case 12: {
					_box addWeaponCargoGlobal["arifle_MXC_F",1];
					_box addMagazineCargoGlobal["30Rnd_65x39_caseless_mag",5];
				};
		case 13: {
					_box addWeaponCargoGlobal["arifle_MX_F",1];
					_box addMagazineCargoGlobal["30Rnd_65x39_caseless_mag",5];
				};
		case 14: {
					_box addWeaponCargoGlobal["arifle_MX_GL_F",1];
					_box addMagazineCargoGlobal["30Rnd_65x39_caseless_mag",5];
					_box addMagazineCargoGlobal["1Rnd_HE_Grenade_shell",5];
				};
		case 15: {
					_box addWeaponCargoGlobal["arifle_MX_SW_F",1];
					_box addMagazineCargoGlobal["100Rnd_65x39_caseless_mag",5];
				};
		case 16: {
					_box addWeaponCargoGlobal["arifle_MXM_F",1];
					_box addMagazineCargoGlobal["30Rnd_65x39_caseless_mag",5];
				};
		case 17: {
					_box addWeaponCargoGlobal["arifle_MX_Holo_pointer_F",1];
					_box addMagazineCargoGlobal["30Rnd_65x39_caseless_mag",5];
				};
		case 18: {
					_box addWeaponCargoGlobal["arifle_MX_ACO_F",1];
					_box addMagazineCargoGlobal["30Rnd_65x39_caseless_mag",5];
				};
		case 19: {
					_box addWeaponCargoGlobal["arifle_MXC_Holo_F",1];
					_box addMagazineCargoGlobal["30Rnd_65x39_caseless_mag",5];
				};
		case 20: {
					_box addWeaponCargoGlobal["arifle_MX_SW_Hamr_pointer_F",1];
					_box addMagazineCargoGlobal["100Rnd_65x39_caseless_mag",5];
				};
		case 21: {
					_box addWeaponCargoGlobal["arifle_TRG20_F",1];
					_box addMagazineCargoGlobal["30Rnd_556x45_Stanag",5];
				};
		case 22: {
					_box addWeaponCargoGlobal["arifle_TRG20_Holo_F",1];
					_box addMagazineCargoGlobal["30Rnd_556x45_Stanag",5];
				};
		case 23: {
					_box addWeaponCargoGlobal["arifle_TRG21_ARCO_pointer_F",1];
					_box addMagazineCargoGlobal["30Rnd_556x45_Stanag",5];
				};
		case 24: {
					_box addWeaponCargoGlobal["LMG_Zafir_F",1];
					_box addMagazineCargoGlobal["150Rnd_762x51_Box",5];
				};
		case 25: {
					_box addWeaponCargoGlobal["arifle_Mk20_F",1];
					_box addMagazineCargoGlobal["30Rnd_556x45_Stanag",5];
				};
		case 26: {
					_box addWeaponCargoGlobal["arifle_Mk20_MRCO_plain_F",1];
					_box addMagazineCargoGlobal["30Rnd_556x45_Stanag",5];
				};
		case 27: {
					_box addWeaponCargoGlobal["SMG_01_F",1];
					_box addMagazineCargoGlobal["30Rnd_45ACP_Mag_SMG_01",5];
				};
		case 28: {
					_box addWeaponCargoGlobal["SMG_01_Holo_F",1];
					_box addMagazineCargoGlobal["30Rnd_45ACP_Mag_SMG_01",5];
				};
		default {
					_box addWeaponCargoGlobal["SMG_01_F",1];
					_box addMagazineCargoGlobal["30Rnd_45ACP_Mag_SMG_01",5];
				};
	};
};
