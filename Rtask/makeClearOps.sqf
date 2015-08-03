//////////////////////////////////////
//----ALiVE NATOFOR Random Tasks----//
//---By Valixx, Kylania & M4RT14L---//
//---------------v1.8---------------//
//////////////////////////////////////

_missionType = [_this, 0, ""] call BIS_fnc_param;

_myHint ="Requesting Clear Operations";
GlobalHint = _myHint;
publicVariable "GlobalHint";
hintsilent parseText _myHint;

sleep 10;

_markerArray = ["town","town_1","town_2","town_3","town_4","town_5","town_6","town_7","town_8","town_9","town_10","town_11","town_12","town_13","town_14","town_15","town_16","town_17","town_18","town_19","town_20",
"town_21","town_22","town_23","town_24"];
_rnd 	= floor (random (count(_markerArray)));
_mrkSpawnTown = getMarkerPos (_markerArray select _rnd);

sleep 10;

fn_spawnClearMission = {

	hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_clear", _mrkSpawnTown];
	_markerCO setMarkerShape "ellipse";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerSize [400,400];
	
	_null = [west, "mob_clear", ["Take control of the town and drive out terrorist forces.", "Area Clear", "Area Clear"], getMarkerPos "mob_clear", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_clear", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerCO, 300, 500, 10, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_mhq = createVehicle ["BRDM2_HQ_TK_GUE_unfolded_Base_EP1",[(getMarkerpos _markerCO select 0) + 1, getMarkerpos _markerCO select 1,0],[], 0, "CAN_COLLIDE"];
	
	_ifv1 = createGroup RESISTANCE;
	[_newPos, 10, "LOP_ISTS_Landrover_M2", _ifv1] call BIS_fnc_spawnvehicle;
	nul = [_ifv1,getPos _mhq, 250] call BIS_fnc_taskPatrol;
	sleep 10;
	[_newPos, 10, "LOP_ISTS_Landrover_M2", _ifv1] call BIS_fnc_spawnvehicle;
	sleep 10;
	[_newPos, 10, "LOP_ISTS_Landrover_M2", _ifv1] call BIS_fnc_spawnvehicle;
	
	_grp1C = [getMarkerPos _markerCO, RESISTANCE, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_ISTS" >> "Infantry" >> "LOP_ISTS_Support_section")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getPos _mhq, 150] call BIS_fnc_taskPatrol;
	
	_grp2C = [getMarkerPos _markerCO, RESISTANCE, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_ISTS" >> "Infantry" >> "LOP_ISTS_Rifle_squad")] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getPos _mhq, 200] call BIS_fnc_taskPatrol;
	
	_grp3C = [getMarkerPos _markerCO, RESISTANCE, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_ISTS" >> "Infantry" >> "LOP_ISTS_Support_section")] call BIS_fnc_spawnGroup;
	nul = [_grp3C,getPos _mhq, 250] call BIS_fnc_taskPatrol;

	_trg = createTrigger ["EmptyDetector", getMarkerPos _markerCO]; 
	_trg setTriggerArea [300, 300, 0, false]; 
	_trg setTriggerActivation ["GUER", "NOT PRESENT", false]; 
	_trg setTriggerStatements ["this", "", ""]; 

	enemyDead = false; 
	waitUntil {triggerActivated _trg}; 

	_null = ["mob_clear", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
	deleteVehicle _mhq;
	{deleteVehicle _x} forEach units _grp1C;
	{deleteVehicle _x} forEach units _grp2C;
	{deleteVehicle _x} forEach units _grp3C;
	{deleteVehicle _x} forEach units _ifv1;
	deleteGroup _ifv1;
	deleteGroup _grp1C;
	deleteGroup _grp2C;
	deleteGroup _grp3C;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_clear"] call LARs_fnc_removeTask;
};

fn_spawnKillMission = {

	hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_kill", _mrkSpawnTown];
	_markerCO setMarkerShape "ellipse";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerSize [100,100];
	
	_null = [west, "mob_kill", ["Kill the insurgent officer", "Kill Officer", "Kill Officer"], getMarkerPos "mob_kill", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_kill", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerCO, 400, 500, 10, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_mrap = createVehicle ["LOP_AM_Landrover",[(getMarkerpos _markerCO select 0) + 1, getMarkerpos _markerCO select 1,0],[], 0, "NONE"];
	
	_off = createGroup RESISTANCE;
	_officer1 = _off createUnit ["LOP_ISTS_Infantry_SL",[(getMarkerpos _markerCO select 0) + 3, getMarkerpos _markerCO select 1,0], [], 0, "NONE"];
	_officer1 disableAI "MOVE";
	_officer1 disableAI "ANIM";
	
	_grp1C = [getMarkerPos _markerCO, RESISTANCE, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_AM" >> "Infantry" >> "LOP_AM_Rifle_squad")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getpos _mrap, 150] call BIS_fnc_taskPatrol;
	
	_grp2C = [getMarkerPos _markerCO, RESISTANCE, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_AM" >> "Infantry" >> "LOP_AM_Rifle_squad")] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getpos _mrap, 250] call BIS_fnc_taskPatrol;
	
	_mrap1 = createGroup RESISTANCE;
	[_newPos, 10, "LOP_AM_Landrover_M2", _mrap1] call BIS_fnc_spawnvehicle;
	nul = [_mrap1,getPos _officer1, 300] call BIS_fnc_taskPatrol;
	sleep 10;
	[_newPos, 10, "LOP_AM_Landrover_M2", _mrap1] call BIS_fnc_spawnvehicle;

	waitUntil {!alive _officer1};
	
	_null = ["mob_kill", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
	{deleteVehicle _x} forEach units _grp1C;
	{deleteVehicle _x} forEach units _grp2C;
	{deleteVehicle _x} forEach units _mrap1;
	deleteGroup _grp1C;
	deleteGroup _grp2C;
	deleteGroup _mrap1;
	deleteGroup _off;
	deleteVehicle _mrap;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_kill"] call LARs_fnc_removeTask;
};

fn_spawnAmmoMission = {

	hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_ammo", _mrkSpawnTown];
	_markerCO setMarkerShape "ellipse";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerSize [300,300];
	
	_null = [west, "mob_ammo", ["Find and destroy the supply truck.", "Destroy Supplies", "Destroy Supplies"], getMarkerPos "mob_ammo", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_ammo", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerCO, 150, 250, 15, 0, 0, 0] call BIS_fnc_findSafePos;

	_supply = ["rhs_gaz66o_msv","rhs_gaz66_r142_msv","rhs_gaz66_repair_msv"] call BIS_fnc_selectRandom;
	
	_supplies = createVehicle [_supply, _newPos, [], 0, "CAN_COLLIDE"];
	_camonet = createVehicle ["CamoNet_OPFOR_big_F", getPos _supplies, [], 0, "CAN_COLLIDE"];
	
	_markersupply = createMarker ["supplymarker", getPos _supplies];
	_markersupply setMarkerType "o_support";
	_markersupply setMarkerColor "ColorRed";
	_markersupply setMarkerSize [0.7,0.7];
	
	_grp1C = [_newPos, RESISTANCE, (configfile >> "CfgGroups" >> "Indep" >> "LOP_AM" >> "Infantry" >> "LOP_AM_Rifle_squad")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getpos _supplies] call BIS_fnc_taskDefend;
	
	_grp2C = [_newPos, RESISTANCE, (configfile >> "CfgGroups" >> "Indep" >> "LOP_AM" >> "Infantry" >> "LOP_AM_Patrol_section")] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getpos _supplies, 500] call BIS_fnc_taskPatrol;
		
	sleep 5;
	
	_newPos2 = [getPos _supplies, 20, 25, 15, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_null = [(configfile >> "CfgGroups" >> "Empty" >> "ALIVE" >> "communications" >> "communicationCamp1"), _newPos2, 0] call ALIVE_fnc_spawnComposition;

	waitUntil {!alive _supplies};
	
	_null = ["mob_ammo", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
	deleteMarker _markersupply;
	deleteVehicle _supplies;
	deleteVehicle _camonet;
	{deleteVehicle _x} forEach units _grp1C;
	{deleteVehicle _x} forEach units _grp2C;
	deleteGroup _grp1C;
	deleteGroup _grp2C;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_ammo"] call LARs_fnc_removeTask;
};

fn_spawnAmmo2Mission = {

	hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_ammo2", _mrkSpawnTown];
	_markerCO setMarkerShape "ellipse";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerSize [800,800];
	
	_null = [west, "mob_ammo2", ["Find and destroy the campsite.", "Destroy Camp", "Destroy Camp"], getMarkerPos "mob_ammo2", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_ammo2", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerCO, 500, 700, 15, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_cache = createVehicle ["Box_East_AmmoVeh_F", _newPos, [], 0, "CAN_COLLIDE"];
	
	_markercamp = createMarker ["campmarker", getPos _cache];
	_markercamp setMarkerType "o_support";
	_markercamp setMarkerColor "ColorRed";
	_markercamp setMarkerSize [0.7,0.7];
	
	_grp1C = [_newPos, RESISTANCE, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_ISTS" >> "Infantry" >> "LOP_ISTS_Rifle_squad")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getpos _cache] call BIS_fnc_taskDefend;
	
	_grp2C = [_newPos, RESISTANCE, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_ISTS" >> "Infantry" >> "LOP_ISTS_Patrol_section")] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getpos _cache, 300] call BIS_fnc_taskPatrol;
	
	sleep 5;
	
	_null = [(configfile >> "CfgGroups" >> "Empty" >> "ALIVE" >> "camps" >> "smallMilitaryCamp1"), getPos _cache, 0] call ALIVE_fnc_spawnComposition;

	waitUntil {!alive _cache};
	
	_null = ["mob_ammo2", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	deleteMarker _markerCO;
	deleteMarker _markercamp;
	{deleteVehicle _x} forEach units _grp1C;
	{deleteVehicle _x} forEach units _grp2C;
	deleteGroup _grp1C;
	deleteGroup _grp2C;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_ammo2"] call LARs_fnc_removeTask;
};

fn_spawnComsMission = {

	hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_comms", _mrkSpawnTown];
	_markerCO setMarkerShape "ellipse";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerSize [600,600];
	
	_null = [west, "mob_comms", ["Find and destroy OPFOR mobile comms", "Destroy Comms", "Destroy Comms"], getMarkerPos "mob_comms", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_comms", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerCO, 200, 400, 15, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_movilhq = createVehicle ["rhs_gaz66_r142_msv", _newPos, [], 0, "NONE"];
	_camonet = createVehicle ["CamoNet_OPFOR_big_F", getPos _movilhq, [], 0, "CAN_COLLIDE"];
	
	_markercomms = createMarker ["commsmarker", getPos _movilhq];
	_markercomms setMarkerType "o_support";
	_markercomms setMarkerColor "ColorRed";
	_markercomms setMarkerSize [0.7,0.7];
	
	_grp1C = [getMarkerPos _markerCO, RESISTANCE, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_ISTS" >> "Infantry" >> "LOP_ISTS_Patrol_section")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getpos _movilhq, 100] call BIS_fnc_taskPatrol;
	
	_grp2C = [getMarkerPos _markerCO, RESISTANCE, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_ISTS" >> "Infantry" >> "LOP_ISTS_Patrol_section")] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getpos _movilhq, 200] call BIS_fnc_taskPatrol;

	waitUntil {!alive _movilhq};
	
	_null = ["mob_comms", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
	deleteMarker _markercomms;
	deleteVehicle _movilhq;
	deleteVehicle _camonet;
	{deleteVehicle _x} forEach units _grp1C;
	{deleteVehicle _x} forEach units _grp2C;
	deleteGroup _grp1C;
	deleteGroup _grp2C;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLATED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_comms"] call LARs_fnc_removeTask;
};

fn_spawnClear2Mission = {

	hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_clear2", _mrkSpawnTown];
	_markerCO setMarkerShape "ellipse";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerSize [500,500];
	
	_null = [west, "mob_clear2", ["Take control of the town and drive out Militia forces.", "Area Clear", "Area Clear"], getMarkerPos "mob_clear2", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_clear2", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerCO, 300, 500, 10, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_mhq = createVehicle ["BRDM2_HQ_Gue_unfolded",[(getMarkerpos _markerCO select 0) + 1, getMarkerpos _markerCO select 1,0],[], 0, "CAN_COLLIDE"];
	
	_grp1C = [getMarkerPos _markerCO, RESISTANCE, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_AM" >> "Infantry" >> "LOP_AM_Rifle_squad")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getpos _mhq, 100] call BIS_fnc_taskPatrol;
	
	_grp2C = [getMarkerPos _markerCO, RESISTANCE, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_AM" >> "Infantry" >> "LOP_AM_Rifle_squad")] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getpos _mhq, 150] call BIS_fnc_taskPatrol;
	
	_car1 = createGroup RESISTANCE;
	[_newPos, 10, "LOP_AM_Landrover_M2", _car1] call BIS_fnc_spawnvehicle;
	nul = [_car1,getPos _mhq, 200] call BIS_fnc_taskPatrol;
	sleep 10;
	[_newPos, 10, "LOP_AM_Landrover_M2", _car1] call BIS_fnc_spawnvehicle;
	sleep 10;
	[_newPos, 10, "LOP_AM_Landrover_M2", _car1] call BIS_fnc_spawnvehicle;
	
	_trg = createTrigger ["EmptyDetector", getMarkerPos _markerCO]; 
	_trg setTriggerArea [300, 300, 0, false]; 
	_trg setTriggerActivation ["GUER", "NOT PRESENT", false]; 
	_trg setTriggerStatements ["this", "", ""]; 

	enemyDead = false; 
	waitUntil {triggerActivated _trg}; 

	_null = ["mob_clear2", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
	deleteVehicle _mhq;
	{deleteVehicle _x} forEach units _grp1C;
	deleteGroup _grp1C;
	{deleteVehicle _x} forEach units _grp2C;
	deleteGroup _grp2C;
	{deleteVehicle _x} forEach units _car1;
	deleteGroup _car1;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_clear2"] call LARs_fnc_removeTask;
};

fn_spawnAntiairMission = {

	hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_aaa", _mrkSpawnTown];
	_markerCO setMarkerShape "ellipse";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerSize [600,600];
	
	_null = [west, "mob_aaa", ["Find and destroy the AA.", "Destroy AA", "Destroy AA"], getMarkerPos "mob_aaa", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_aaa", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerCO, 400, 600, 15, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_artyaa = createVehicle ["rhs_zsu234_aa", _newPos, [], 0, "CAN_COLLIDE"];
	_artyaa setFuel 0;
	
	_aacrew = createGroup RESISTANCE;
	_crew1 = _aacrew createUnit ["LOP_ISTS_Infantry_Engineer", [0,0,1], [], 0, "CAN_COLLIDE"];
	_crew1 moveInCommander _artyaa;
	_crew2 = _aacrew createUnit ["LOP_ISTS_Infantry_Engineer", [0,0,1], [], 0, "CAN_COLLIDE"];
	_crew2 moveInGunner _artyaa;
	
	_markerAA = createMarker ["AAmarker", getPos _artyaa];
	_markerAA setMarkerType "o_art";
	_markerAA setMarkerColor "ColorRed";
	_markerAA setMarkerSize [0.7,0.7];
	
	sleep 5;
	
	_newPos2 = [getPos _artyaa, 15, 20, 15, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_null = [(configfile >> "CfgGroups" >> "Empty" >> "ALIVE" >> "camps" >> "mediumAACamp1"), _newPos2, 0] call ALIVE_fnc_spawnComposition;
	
	_grp1C = [_newPos, RESISTANCE, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_AM" >> "Infantry" >> "LOP_AM_AT_section")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getpos _artyaa] call BIS_fnc_taskDefend;
	
	_grp2C = [_newPos, RESISTANCE, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_AM" >> "Infantry" >> "LOP_AM_Rifle_squad")] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getpos _artyaa, 200] call BIS_fnc_taskPatrol;

	waitUntil {!alive _artyaa};
	
	_null = ["mob_aaa", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
	deleteMarker _markerAA;
	deleteVehicle _artyaa;
	{deleteVehicle _x} forEach units _aacrew;
	deleteGroup _aacrew;
	{deleteVehicle _x} forEach units _grp1C;
	deleteGroup _grp1C;
	
	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_aaa"] call LARs_fnc_removeTask;
};

fn_spawnCaptureMission = {

	hint "COMBAT OPS UPDATED";
	//creating the marker 

	_markerCO = createMarker ["mob_capture", _mrkSpawnTown];
	_markerCO setMarkerShape "ellipse";
	_markerCO setMarkerColor "ColorRed";
	_markerCO setMarkerSize [500,500];
	
	_null = [west, "mob_capture", ["Find and arrest the insurgent leader and escort him to Loy Manara Air Base.", "Capture Warlord", "Capture Warlord"], getMarkerPos "mob_capture", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_capture", "CREATED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerCO, 100, 500, 15, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_mhq = createVehicle ["TK_GUE_WarfareBBarracks_Base_EP1", _newPos, [], 0, "CAN_COLLIDE"];
	
	_wlordgrp = createGroup RESISTANCE;
	_warlord = _wlordgrp createUnit ["LOP_ISTS_Infantry_SL", getPos _mhq, [], 0, "NONE"];
	removeAllWeapons _warlord;
	_warlord disableAI "MOVE";
	_warlord disableAI "ANIM";
	_warlord allowDamage false;
	_warlord setCaptive true;
	arrest = _warlord;
	publicVariable "arrest";
	grab = _warlord;
	publicVariable "grab";
	
	_signwl = createVehicle ["Sign_Sphere25cm_F", getPos _warlord, [], 0, "NONE"];
	_signwl attachTo [_warlord,[0,0,+5]];
	
	_markerwlord = createMarker ["wlordmarker", getPos _warlord];
	_markerwlord setMarkerType "o_hq";
	_markerwlord setMarkerColor "ColorRed";
	_markerwlord setMarkerSize [0.7,0.7];
	
	sleep 5;
	
	_grp1C = [_newPos, RESISTANCE, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_AM" >> "Infantry" >> "LOP_AM_Patrol_Section")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getpos _mhq] call BIS_fnc_taskDefend;
	
	_grp2C = [_newPos, RESISTANCE, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_AM" >> "Infantry" >> "LOP_AM_Patrol_Section")] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getpos _mhq] call BIS_fnc_taskDefend;
	
	_grp3C = [_newPos, RESISTANCE, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_AM" >> "Infantry" >> "LOP_AM_Rifle_squad")] call BIS_fnc_spawnGroup;
	nul = [_grp3C,getpos _warlord, 300] call BIS_fnc_taskPatrol;
	
	waitUntil { _warlord distance getMarkerPos "respawn_west" < 100 OR !alive _warlord };
	
	if (!alive _warlord) exitWith {_null = ["mob_capture", "FAILED"] spawn BIS_fnc_taskSetState; deleteMarker _markerCO; deleteMarker _markerwlord; {deleteVehicle _x} forEach units _grp1C; {deleteVehicle _x} forEach units _grp2C; {deleteVehicle _x} forEach units _grp3C; deleteGroup _grp1C; deleteGroup _grp2C; deleteGroup _grp3C; deleteVehicle _warlord; deleteVehicle _signwl; deleteVehicle _mhq; deleteGroup _wlordgrp; [west, "mob_capture"] call LARs_fnc_removeTask;};
	
	_null = ["mob_capture", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
	deleteMarker _markerwlord;
	{deleteVehicle _x} forEach units _grp1C;
	deleteGroup _grp1C;
	{deleteVehicle _x} forEach units _grp2C;
	deleteGroup _grp2C;
	{deleteVehicle _x} forEach units _grp3C;
	deleteGroup _grp3C;
	deleteGroup _wlordgrp;
	deleteVehicle _warlord;
	deleteVehicle _signwl;
	deleteVehicle _mhq;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_capture"] call LARs_fnc_removeTask;
};

// MAIN LOGIC

_missionDetails = switch (_missionType) do {
	case "clear": {call fn_spawnClearMission;};
	case "kill": {call fn_spawnKillMission;};
	case "ammo": {call fn_spawnAmmoMission;};
	case "ammo2": {call fn_spawnAmmo2Mission;};
	case "comms": {call fn_spawnComsMission;};
	case "clear2": {call fn_spawnClear2Mission;};
	case "antiair": {call fn_spawnAntiairMission;};
	case "capture": {call fn_spawnCaptureMission;};
};