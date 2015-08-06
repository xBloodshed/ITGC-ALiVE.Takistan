//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: M4RT14L
//////////////////////////////////////////////////////////////////
//ZEUS SOLO PARA CONSTRUCCION ZONAS
//////////////////////////////////////////////////////////////////

//---MHQ-------------------------------------//

execVM "scripts\nash_zeus_mhq.sqf";
["Initialize"] call BIS_fnc_dynamicGroups;

//--- Curator settings-----------------------//
_curator = allcurators select 0;
_curators = allcurators;

_curator addcuratoraddons [
		"A3_Characters_F_BLUFOR",
		//"A3_Characters_F_Gamma",
		//"A3_UAV_F_Characters_F_Gamma",
		"A3_Static_F_Mortar_01",
		"A3_Static_F_Beta_Mortar_01",
		"A3_Static_F_Gamma",
		"A3_Weapons_F_Ammoboxes",
		"A3_Weapons_F_NATO",
		//"A3_Soft_F_Crusher_UGV",
		//"A3_Air_F_Gamma_UAV_01",
		//"A3_Air_F_Gamma_UAV_02",
		"A3_Structures_F_Mil_BagBunker",
		"A3_Structures_F_Mil_Barracks",
		"A3_Structures_F_Mil_Bunker",
		"A3_Structures_F_Mil_Cargo",
		"A3_Structures_F_Mil_Fortification",
		"A3_Structures_F_Mil_Offices",
		//"A3_Structures_F_Mil_Radar",
		"A3_Structures_F_Mil_Shelters",
		"A3_Structures_F_Mil_TentHangar",
		"A3_Structures_F_Research",
		"A3_Structures_F_Training",
		"A3_Structures_F_EPA_Mil_Scrapyard",
		"A3_Structures_F_Mil_BagFence",
		//"A3_Modules_F_Effects",
		"A3_Modules_F_Events",
		//"A3_Modules_F_Intel",
		//"A3_Modules_F_Curator_Animals",
		//"A3_Modules_F_Curator_Effects",
		"A3_Modules_F_Curator_Environment",
		//"A3_Modules_F_Curator_Flares",
		"A3_Modules_F_Curator_Chemlights",
		"A3_Modules_F_Curator_Intel",
		//"A3_Modules_F_Curator_Lightning",
		//"A3_Modules_F_Curator_Mines",
		//"A3_Modules_F_Curator_Misc",
		//"A3_Modules_F_Curator_Multiplayer",
		//"A3_Modules_F_Curator_Objectives",
		"A3_Modules_F_Curator_Respawn",
		"A3_Modules_F_Curator_Smokeshells",
		"A3_Weapons_F_NATO",
		"A3_Weapons_F_ItemHolders",
		"A3_Weapons_F_Headgear",
		"A3_Weapons_F_Vests",
		"A3_Weapons_F_EPA_Ammoboxes",
		"A3_Weapons_F_EPB_Ammoboxes",
		"A3_Data_F_Curator_Intel",
		"A3_Weapons_F_EBR",
		"A3_Weapons_F_EPA_EBR",
		"A3_Weapons_F_EPA_LongRangeRifles_DMR_01",
		"A3_Weapons_F_EPA_LongRangeRifles_GM6",
		"A3_Weapons_F_EPB_LongRangeRifles_GM3",
		"A3_Weapons_F_EPB_LongRangeRifles_M320",
		"A3_Weapons_F_Explosives",
		"A3_Weapons_F_Items",
		"A3_Weapons_F_Launchers_LAW",
		"A3_Weapons_F_Launchers_NLAW",
		"A3_Weapons_F_Launchers_Titan",
		"A3_Weapons_F_LongRangeRifles_GM6",
		"A3_Weapons_F_LongRangeRifles_M320",
		"A3_Weapons_F_Machineguns_M200",
		"A3_Weapons_F_Machineguns_Zafir",
		"A3_Weapons_F_Pistols_ACPC2",
		"A3_Weapons_F_Pistols_P07",
		"A3_Weapons_F_Pistols_PDW2000",
		"A3_Weapons_F_Pistols_Pistol_heavy_01",
		"A3_Weapons_F_Pistols_Pistol_heavy_02",
		"A3_Weapons_F_Pistols_Rook40",
		"A3_Weapons_F_Rifles_Mk20",
		"A3_Weapons_F_Rifles_MX",
		"A3_Weapons_F_Rifles_SDAR",
		"A3_weapons_f_rifles_SMG_02",
		"A3_Weapons_F_Rifles_TRG20",
		"A3_Weapons_F_Rifles_Vector",
		"A3_Weapons_F",
		"A3_Weapons_F_Acc"
];

//--- Curator Points----------------------//

_curator addCuratorPoints 20;

//--- Curator Costs-----------------------//