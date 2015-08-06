//////////////////////////////////////
//----ALiVE NATOFOR Random Tasks----//
//---By Valixx, Kylania & M4RT14L---//
//---------------v2.4---------------//
//////////////////////////////////////

_missionType = [_this, 0, ""] call BIS_fnc_param;

_myHint ="Requesting Clear Operations";
GlobalHint = _myHint;
publicVariable "GlobalHint";
hintsilent parseText _myHint;

sleep 10;

_markerArray = ["town","town_1","town_2","town_3","town_4","town_5","town_6","town_7","town_8","town_9","town_10","town_11","town_12","town_13","town_14"];
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
	
	sleep 0.3;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerCO, 300, 500, 10, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_mhq = createVehicle ["BRDM2_HQ_TK_GUE_unfolded_Base_EP1",[(getMarkerpos _markerCO select 0) + 1, getMarkerpos _markerCO select 1,0],[], 0, "CAN_COLLIDE"];
	
	_ifv1 = createGroup INDEPENDENT;
	[_newPos, 10, "LOP_ISTS_Landrover_M2", _ifv1] call BIS_fnc_spawnvehicle;
	nul = [_ifv1,getPos _mhq, 250] call BIS_fnc_taskPatrol;
	sleep 10;
	[_newPos, 10, "LOP_ISTS_Landrover_M2", _ifv1] call BIS_fnc_spawnvehicle;
	sleep 10;
	[_newPos, 10, "LOP_ISTS_Landrover_M2", _ifv1] call BIS_fnc_spawnvehicle;
	
	_grp1C = [getMarkerPos _markerCO, INDEPENDENT, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_ISTS" >> "Infantry" >> "LOP_ISTS_Rifle_squad")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getPos _mhq, 150] call BIS_fnc_taskPatrol;
	
	_grp2C = [getMarkerPos _markerCO, INDEPENDENT, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_ISTS" >> "Infantry" >> "LOP_ISTS_Rifle_squad")] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getPos _mhq, 200] call BIS_fnc_taskPatrol;
	
	_grp3C = [getMarkerPos _markerCO, INDEPENDENT, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_ISTS" >> "Infantry" >> "LOP_ISTS_Support_section")] call BIS_fnc_spawnGroup;
	nul = [_grp3C,getPos _mhq, 250] call BIS_fnc_taskPatrol;

	_trg = createTrigger ["EmptyDetector", getMarkerPos _markerCO]; 
	_trg setTriggerArea [300, 300, 0, false]; 
	_trg setTriggerActivation ["GUER", "NOT PRESENT", false]; 
	_trg setTriggerStatements ["this", "", ""];
	
	_null = [west, "mob_clear", ["Take control of the town and drive out terrorist forces.", "Area Clear", "Area Clear"], getMarkerPos "mob_clear", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_clear", "CREATED"] spawn BIS_fnc_taskSetState; 

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
	
	sleep 0.3;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerCO, 400, 500, 10, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_mrap = createVehicle ["LOP_AM_Landrover",[(getMarkerpos _markerCO select 0) + 1, getMarkerpos _markerCO select 1,0],[], 0, "NONE"];
	
	_off = createGroup RESISTANCE;
	_officer1 = _off createUnit ["LOP_AM_Infantry_TL",[(getMarkerpos _markerCO select 0) + 3, getMarkerpos _markerCO select 1,0], [], 0, "NONE"];
	_officer1 disableAI "MOVE";
	_officer1 disableAI "ANIM";
	
	_grp1C = [getMarkerPos _markerCO, INDEPENDENT, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_AM" >> "Infantry" >> "LOP_AM_Rifle_squad")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getpos _mrap, 250] call BIS_fnc_taskPatrol;
	
	_mrap1 = createGroup INDEPENDENT;
	[_newPos, 10, "LOP_AM_Landrover_M2", _mrap1] call BIS_fnc_spawnvehicle;
	nul = [_mrap1,getPos _officer1, 300] call BIS_fnc_taskPatrol;
	sleep 10;
	[_newPos, 10, "LOP_AM_Landrover_M2", _mrap1] call BIS_fnc_spawnvehicle;
	
	_null = [west, "mob_kill", ["Kill the insurgent officer", "Kill Officer", "Kill Officer"], getMarkerPos "mob_kill", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_kill", "CREATED"] spawn BIS_fnc_taskSetState;

	waitUntil {!alive _officer1};
	
	_null = ["mob_kill", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
	{deleteVehicle _x} forEach units _grp1C;
	{deleteVehicle _x} forEach units _mrap1;
	deleteGroup _grp1C;
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
	_markerCO setMarkerSize [150,150];
	
	sleep 0.3;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerCO, 100, 150, 10, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_inteltype = ["Land_SatellitePhone_F","Land_SurvivalRadio_F","Land_Suitcase_F"] call BIS_fnc_selectRandom;
	
	_intel = createVehicle [_inteltype, getMarkerPos _markerCO, [], 0, "CAN_COLLIDE"];
	getintel = _intel;
	publicVariable "getintel";
	
	_houses2 = [getMarkerPos _markerCO,150] call getEnterableHouses;

	if((count _houses2) > 0) then {

		_house2 = _houses2 call getRandomElement;

		_buildingpos = 1 max (round random (_house2 select 1));
		_house2 = _house2 select 0;

		_intel setPos (_house2 buildingPos _buildingpos);
	} else {
		_intel setPos [(_pos select 0) + _size - round random (2*_size),(_pos select 1) + _size - round random (2*_size),0];
	};
	
	sleep 0.3;
	
	//creating the suspect
	
	_civiliantype = ["LOP_Tak_Civ_Man_01","LOP_Tak_Civ_Man_02","LOP_Tak_Civ_Man_04"] call BIS_fnc_selectRandom;
	
	_civgrp = createGroup CIVILIAN;
	_suspect = _civgrp createUnit [_civiliantype, [(getpos _intel select 0) + 0.2, getpos _intel select 1,0], [], 0, "CAN_COLLIDE"];
	_suspect disableAI "MOVE";
	_suspect disableAI "ANIM";
	_suspect allowDamage false;
	_suspect addMagazine "MiniGrenade";
	arrest = _suspect;
	publicVariable "arrest";
	grab = _suspect;
	publicVariable "grab";
	
	_null = [west, "mob_ammo", ["We have humint about one civilian cooperating with terrorist forces, search in the marked area and find evidences.", "Find Evidences", "Find Evidences"], getMarkerPos "mob_ammo", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_ammo", "CREATED"] spawn BIS_fnc_taskSetState;

	waitUntil {!alive _intel};
	
	sleep 3;
	
	_grp1C = [_newPos, INDEPENDENT, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_AM" >> "Infantry" >> "LOP_AM_Rifle_squad")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getpos _suspect, 50] call BIS_fnc_taskPatrol;
	
	_mySChat ="Now arrest suspect and escort to Loy Manara AB";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	waitUntil {_suspect distance getMarkerPos "respawn_west" < 100 OR !alive _suspect};
	
	if (!alive _suspect) exitWith {_null = ["mob_ammo", "FAILED"] spawn BIS_fnc_taskSetState; deleteMarker _markerCO; {deleteVehicle _x} forEach units _grp1C; deleteGroup _grp1C; deleteVehicle _suspect; deleteGroup _civgrp; [west, "mob_ammo"] call LARs_fnc_removeTask;};
	
	_null = ["mob_ammo", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	[_suspect] join grpNull;
	
	sleep 10;

	deleteMarker _markerCO;
	{deleteVehicle _x} forEach units _grp1C;
	deleteGroup _grp1C;
	deleteVehicle _suspect;
	deleteGroup _civgrp;

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
	_markerCO setMarkerSize [100,100];
	
	sleep 0.3;

	//creating the vehicle
	
	_stashtype = ["Box_NATO_Ammo_F","Box_NATO_WpsLaunch_F","Box_East_WpsSpecial_F"] call BIS_fnc_selectRandom;
	
	_cache1 = createVehicle [_stashtype, getMarkerPos _markerCO, [], 0, "CAN_COLLIDE"];
	
	_houses1 = [getMarkerPos _markerCO,100] call getEnterableHouses;

	if((count _houses1) > 0) then {

		_house1 = _houses1 call getRandomElement;

		_buildingpos = 1 max (round random (_house1 select 1));
		_house1 = _house1 select 0;

		_cache1 setPos (_house1 buildingPos _buildingpos);
	} else {
		_cache1 setPos [(_pos select 0) + _size - round random (2*_size),(_pos select 1) + _size - round random (2*_size),0];
	};
	
	_cache2 = createVehicle [_stashtype, getMarkerPos _markerCO, [], 0, "CAN_COLLIDE"];
	
	_houses2 = [getMarkerPos _markerCO,100] call getEnterableHouses;

	if((count _houses2) > 0) then {

		_house2 = _houses2 call getRandomElement;

		_buildingpos = 1 max (round random (_house2 select 1));
		_house2 = _house2 select 0;

		_cache2 setPos (_house2 buildingPos _buildingpos);
	} else {
		_cache2 setPos [(_pos select 0) + _size - round random (2*_size),(_pos select 1) + _size - round random (2*_size),0];
	};
	
	_cache3 = createVehicle [_stashtype, getMarkerPos _markerCO, [], 0, "CAN_COLLIDE"];
	
	_houses3 = [getMarkerPos _markerCO,100] call getEnterableHouses;

	if((count _houses3) > 0) then {

		_house3 = _houses3 call getRandomElement;

		_buildingpos = 1 max (round random (_house3 select 1));
		_house3 = _house3 select 0;

		_cache3 setPos (_house3 buildingPos _buildingpos);
	} else {
		_cache3 setPos [(_pos select 0) + _size - round random (2*_size),(_pos select 1) + _size - round random (2*_size),0];
	};
	
	sleep 0.3;
	
	_grp1C = [getMarkerPos _markerCO, INDEPENDENT, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_AM" >> "Infantry" >> "LOP_AM_Rifle_squad")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getPos _cache1, 150] call BIS_fnc_taskPatrol;
	
	_null = [west, "mob_ammo2", ["We have information that terrorist forces they have several ammo stashes in this marked area, you must find and blow them.", "Destroy Stash", "Destroy Stash"], getMarkerPos "mob_ammo2", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_ammo2", "CREATED"] spawn BIS_fnc_taskSetState;

	waitUntil {!alive _cache1 && !alive _cache2 && !alive _cache3};
	
	_null = ["mob_ammo2", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 30;

	deleteMarker _markerCO;
	{deleteVehicle _x} forEach units _grp1C;
	deleteGroup _grp1C;
	deleteVehicle _cache1;
	deleteVehicle _cache2;
	deleteVehicle _cache3;

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
	_markerCO setMarkerShape "Empty";
	
	sleep 0.3;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerCO, 200, 400, 15, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_movilhq = createVehicle ["rhs_gaz66_r142_msv", _newPos, [], 0, "NONE"];
	
	_isFlat_comms = [getMarkerPos _markerCO,600] call getFlatArea;
	_movilhq setPos _isFlat_comms;
	
	_camonet = createVehicle ["CamoNet_OPFOR_big_F", getPos _movilhq, [], 0, "CAN_COLLIDE"];
	
	_markercomms = createMarker ["commsmarker", getPos _movilhq];
	_markercomms setMarkerType "o_support";
	_markercomms setMarkerColor "ColorRed";
	_markercomms setMarkerSize [0.7,0.7];
	_markercomms setMarkerText "Comms Module";
	
	_grp1C = [getMarkerPos _markerCO, INDEPENDENT, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_ISTS" >> "Infantry" >> "LOP_ISTS_Patrol_section")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getpos _movilhq, 100] call BIS_fnc_taskPatrol;
	
	_grp2C = [getMarkerPos _markerCO, INDEPENDENT, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_ISTS" >> "Infantry" >> "LOP_ISTS_Patrol_section")] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getpos _movilhq, 200] call BIS_fnc_taskPatrol;
	
	_null = [west, "mob_comms", ["Find and destroy OPFOR mobile comms", "Destroy Comms", "Destroy Comms"], getMarkerPos "commsmarker", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_comms", "CREATED"] spawn BIS_fnc_taskSetState;

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

	_mySChat ="OBJECTIVE COMPLETED";
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
	
	sleep 0.3;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerCO, 300, 500, 10, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_mhq = createVehicle ["BRDM2_HQ_Gue_unfolded",[(getMarkerpos _markerCO select 0) + 1, getMarkerpos _markerCO select 1,0],[], 0, "CAN_COLLIDE"];
	
	_grp1C = [getMarkerPos _markerCO, INDEPENDENT, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_AM" >> "Infantry" >> "LOP_AM_Rifle_squad")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getpos _mhq, 100] call BIS_fnc_taskPatrol;
	
	_grp2C = [getMarkerPos _markerCO, INDEPENDENT, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_AM" >> "Infantry" >> "LOP_AM_Rifle_squad")] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getpos _mhq, 150] call BIS_fnc_taskPatrol;
	
	_car1 = createGroup INDEPENDENT;
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
	
	_null = [west, "mob_clear2", ["Take control of the town and drive out Militia forces.", "Area Clear", "Area Clear"], getMarkerPos "mob_clear2", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_clear2", "CREATED"] spawn BIS_fnc_taskSetState; 

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
	_markerCO setMarkerShape "Empty";
	
	sleep 0.3;

	//creating the vehicle
	
	_artyaa = createVehicle ["rhs_zsu234_aa", getMarkerPos _markerCO, [], 0, "CAN_COLLIDE"];
	_artyaa setFuel 0;
	
	_isFlat_AA = [getMarkerPos _markerCO,600] call getFlatArea;
	_artyaa setPos _isFlat_AA;
	
	_atrezzo = createVehicle ["TK_WarfareBVehicleServicePoint_Base_EP1",[(getpos _artyaa select 0) + 15, getpos _artyaa select 1,0], [], 0, "NONE"];
	_camonet = createVehicle ["CamoNet_OPFOR_big_F", getPos _atrezzo, [], 0, "CAN_COLLIDE"];
	
	_aacrew = createGroup INDEPENDENT;
	_crew1 = _aacrew createUnit ["LOP_ISTS_Infantry_Engineer", [0,0,1], [], 0, "CAN_COLLIDE"];
	_crew1 moveInCommander _artyaa;
	_crew2 = _aacrew createUnit ["LOP_ISTS_Infantry_Engineer", [0,0,1], [], 0, "CAN_COLLIDE"];
	_crew2 moveInGunner _artyaa;
	
	_markerAA = createMarker ["AAmarker", getPos _artyaa];
	_markerAA setMarkerType "o_art";
	_markerAA setMarkerColor "ColorRed";
	_markerAA setMarkerSize [0.7,0.7];
	_markerAA setMarkerText "Terrorist SPAA";
	
	_grp1C = [getPos _atrezzo, INDEPENDENT, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_AM" >> "Infantry" >> "LOP_AM_AT_section")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getpos _atrezzo] call BIS_fnc_taskDefend;
	
	_grp2C = [getMarkerPos _markerCO, INDEPENDENT, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_AM" >> "Infantry" >> "LOP_AM_Rifle_squad")] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getpos _artyaa, 250] call BIS_fnc_taskPatrol;
	
	_null = [west, "mob_aaa", ["Find and destroy the AA.", "Destroy AA", "Destroy AA"], getMarkerPos "AAmarker", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_aaa", "CREATED"] spawn BIS_fnc_taskSetState;

	waitUntil {!alive _artyaa};
	
	_null = ["mob_aaa", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerCO;
	deleteMarker _markerAA;
	deleteVehicle _artyaa;
	deleteVehicle _camonet;
	deleteVehicle _atrezzo;
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
	_markerCO setMarkerShape "Empty";
	
	sleep 0.3;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerCO, 100, 150, 15, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_wlordgrp = createGroup INDEPENDENT;
	_warlord = _wlordgrp createUnit ["LOP_ISTS_Infantry_SL", getMarkerPos _markerCO, [], 0, "NONE"];
	removeAllWeapons _warlord;
	_warlord disableAI "MOVE";
	_warlord disableAI "ANIM";
	_warlord allowDamage false;
	_warlord setCaptive true;
	arrest = _warlord;
	publicVariable "arrest";
	grab = _warlord;
	publicVariable "grab";
	
	_houses = [getMarkerPos _markerCO,300] call getEnterableHouses;

	if((count _houses) > 0) then {

		_house = _houses call getRandomElement;

		_buildingpos = 1 max (round random (_house select 1));
		_house = _house select 0;

		_warlord setPos (_house buildingPos _buildingpos);
	} else {
		_warlord setPos [(_pos select 0) + _size - round random (2*_size),(_pos select 1) + _size - round random (2*_size),0];
	};
	
	_markerwlord = createMarker ["wlordmarker", getPos _warlord];
	_markerwlord setMarkerType "o_hq";
	_markerwlord setMarkerColor "ColorRed";
	_markerwlord setMarkerSize [0.7,0.7];
	_markerwlord setMarkerText "Terrorist Leader";
	
	sleep 0.3;
	
	_grp1C = [_newPos, INDEPENDENT, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_AM" >> "Infantry" >> "LOP_AM_Patrol_section")] call BIS_fnc_spawnGroup;
	nul = [_grp1C,getpos _warlord] call BIS_fnc_taskDefend;
	
	_grp2C = [_newPos, INDEPENDENT, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_AM" >> "Infantry" >> "LOP_AM_Patrol_section")] call BIS_fnc_spawnGroup;
	nul = [_grp2C,getpos _warlord] call BIS_fnc_taskDefend;
	
	_grp3C = [_newPos, INDEPENDENT, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_AM" >> "Infantry" >> "LOP_AM_Rifle_squad")] call BIS_fnc_spawnGroup;
	nul = [_grp3C,getpos _warlord, 300] call BIS_fnc_taskPatrol;
	
	_null = [west, "mob_capture", ["Find and arrest the insurgent leader and escort him to Loy Manara Air Base.", "Capture Warlord", "Capture Warlord"], getMarkerPos "wlordmarker", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_capture", "CREATED"] spawn BIS_fnc_taskSetState;
	
	waitUntil { _warlord distance getMarkerPos "respawn_west" < 100 OR !alive _warlord };
	
	if (!alive _warlord) exitWith {_null = ["mob_capture", "FAILED"] spawn BIS_fnc_taskSetState; deleteMarker _markerCO; deleteMarker _markerwlord; {deleteVehicle _x} forEach units _grp1C; {deleteVehicle _x} forEach units _grp2C; {deleteVehicle _x} forEach units _grp3C; deleteGroup _grp1C; deleteGroup _grp2C; deleteGroup _grp3C; deleteVehicle _warlord; deleteVehicle _signwl; deleteGroup _wlordgrp; [west, "mob_capture"] call LARs_fnc_removeTask;};
	
	_null = ["mob_capture", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	[_warlord] join grpNull;
	
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