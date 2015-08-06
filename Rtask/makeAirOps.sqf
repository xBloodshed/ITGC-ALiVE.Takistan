//////////////////////////////////////
//----ALiVE NATOFOR Random Tasks----//
//---By Valixx, Kylania & M4RT14L---//
//---------------v2.4---------------//
//////////////////////////////////////

_missionType = [_this, 0, ""] call BIS_fnc_param;
	
_myHint ="Requesting Air Operations";
GlobalHint = _myHint;
publicVariable "GlobalHint";
hintsilent parseText _myHint;

sleep 10;

_markerArray = ["aosite","aosite_1","aosite_2","aosite_3","aosite_4","aosite_5","aosite_6","aosite_7","aosite_8","aosite_9","aosite_10"];
_rnd 	= floor (random (count(_markerArray)));
_mrkSpawnSite = getMarkerPos (_markerArray select _rnd);

sleep 10;
															   
fn_spawnArtyMission = {

	hint "UPDATED AIR OPS";
	//creating the marker 

	_markerAO = createMarker ["mob_arty", _mrkSpawnSite];
	_markerAO setMarkerType "Empty";
	
	sleep 0.3;

	//creating the vehicle
	
	_isFlat_arty = [getMarkerPos _markerAO,300] call getFlatArea;
	
	_newPos3 = [getMarkerPos _markerAO, 400, 500, 10, 0, 10, 0] call BIS_fnc_findSafePos;
	
	_radiohq = createVehicle ["BRDM2_HQ_TK_GUE_unfolded_Base_EP1",[(getMarkerpos _markerAO select 0) + 1, getMarkerpos _markerAO select 1,0],[], 0, "NONE"];
	_radiohq setPos _isFlat_arty;
	
	_markerarty = createMarker ["artymarker", getPos _radiohq];
	_markerarty setMarkerType "o_art";
	_markerarty setMarkerColor "ColorRed";
	_markerarty setMarkerSize [1,1];
	_markerarty setMarkerText "Mobile Artillery";
	
	_arty1 = createVehicle ["RHS_BM21_MSV_01",[(getPos _radiohq select 0) + 15, getPos _radiohq select 1,0],[], 0, "NONE"];
	_arty1 setFuel 0;
	_arty1 setDamage 0;
	
	_arty2 = createVehicle ["RHS_BM21_MSV_01",[(getPos _radiohq select 0) - 15, getPos _radiohq select 1,0],[], 0, "NONE"];
	_arty2 setFuel 0;
	_arty2 setDamage 0;
	
	_camonet1 = createVehicle ["CamoNet_OPFOR_big_F", getPos _arty1, [], 0, "CAN_COLLIDE"];
	_camonet2 = createVehicle ["CamoNet_OPFOR_big_F", getPos _arty2, [], 0, "CAN_COLLIDE"];
	
	_armor = createGroup INDEPENDENT;
	_crew1 = _armor createUnit ["LOP_ISTS_Infantry_Engineer", [0,0,1], [], 0, "CAN_COLLIDE"];
	_crew1 moveInDriver _arty1;
	_crew2 = _armor createUnit ["LOP_ISTS_Infantry_Engineer", [0,0,1], [], 0, "CAN_COLLIDE"];
	_crew2 moveInDriver _arty2;
	
	_grp1A = [getMarkerPos _markerAO, INDEPENDENT, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_ISTS" >> "Infantry" >> "LOP_ISTS_Patrol_section")] call BIS_fnc_spawnGroup;
	nul = [_grp1A,getPos _radiohq] call BIS_fnc_taskDefend;
	
	_cars1 = createGroup INDEPENDENT;
	[_newPos3, 10, "LOP_ISTS_Offroad_M2", _cars1] call BIS_fnc_spawnvehicle;
	nul = [_cars1,getPos _arty1, 300] call BIS_fnc_taskPatrol;
	sleep 10;
	[_newPos3, 10, "LOP_ISTS_Offroad_M2", _cars1] call BIS_fnc_spawnvehicle;
	
	_null = [west, "mob_arty", ["Must destroy two opfor MAT", "Destroy Artillery", "Destroy Artillery"], getMarkerPos "artymarker", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_arty", "CREATED"] spawn BIS_fnc_taskSetState;

	waitUntil { !alive _arty1 && !alive _arty2 };
	
	_null = ["mob_arty", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerAO;
	deleteMarker _markerarty;
	{deleteVehicle _x} forEach units _grp1A;
	{deleteVehicle _x} forEach units _cars1;
	deleteGroup _grp1A;
	deleteGroup _cars1;
	deleteGroup _armor;
	deleteVehicle _radiohq;
	deleteVehicle _camonet1;
	deleteVehicle _camonet2;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_arty"] call LARs_fnc_removeTask;
};

fn_spawnCasMission = {

	hint "AIR OPS UPDATED";
	//creating the marker 

	_markerAO = createMarker ["mob_cas", _mrkSpawnSite];
	_markerAO setMarkerType "o_armor";
	_markerAO setMarkerColor "ColorRed";
	_markerAO setMarkerText "OPFOR Armor Ptn";
	_markerAO setMarkerSize [1,1];
	
	sleep 0.3;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerAO, 300, 700, 10, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_mhq = createVehicle ["BRDM2_HQ_TK_GUE_unfolded_Base_EP1",[(getMarkerpos _markerAO select 0) + 1, getMarkerpos _markerAO select 1,0],[], 0, "NONE"];
	
	_tanques1 = createGroup INDEPENDENT;
	[_newPos, 10, "LOP_ISTS_T72BA", _tanques1] call BIS_fnc_spawnvehicle;
	nul = [_tanques1,getPos _mhq, 150] call BIS_fnc_taskPatrol;
	sleep 10;
	[_newPos, 10, "LOP_ISTS_T72BA", _tanques1] call BIS_fnc_spawnvehicle;
	sleep 10;
	[_newPos, 10, "LOP_ISTS_BTR60", _tanques1] call BIS_fnc_spawnvehicle;
	sleep 10;
	[_newPos, 10, "LOP_ISTS_BTR60", _tanques1] call BIS_fnc_spawnvehicle;
	sleep 10;
	[_newPos, 10, "LOP_ISTS_BTR60", _tanques1] call BIS_fnc_spawnvehicle;
	
	_null = [west, "mob_cas", ["Destroy the OPFOR armor platoon", "Destroy Armor", "Destroy Armor"], getMarkerPos "mob_cas", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_cas", "CREATED"] spawn BIS_fnc_taskSetState;
	
	waitUntil {{ alive _x } count units _tanques1 <= 5}; 

	_null = ["mob_cas", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerAO;
	deleteVehicle _mhq;
	{deleteVehicle _x} forEach units _tanques1;
	deleteGroup _tanques1;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_cas"] call LARs_fnc_removeTask;
};

fn_spawnConvoyMission = {

	hint "UPDATED AIR OPS";
	//creating the marker 

	_markerAO = createMarker ["mob_convoy", _mrkSpawnSite];
	_markerAO setMarkerType "o_support";
	_markerAO setMarkerColor "ColorRed";
	_markerAO setMarkerText "Supply Convoy";
	_markerAO setMarkerSize [1,1];
	
	sleep 0.3;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerAO, 500, 700, 10, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_shed2 = createVehicle ["BRDM2_HQ_TK_GUE_unfolded_Base_EP1",[(getMarkerpos _markerAO select 0) + 10, getMarkerpos _markerAO select 1,0],[], 0, "NONE"];
	
	_convoy1 = createGroup INDEPENDENT;
	[_newPos, 10, "LOP_ISTS_BTR60", _convoy1] call BIS_fnc_spawnvehicle;
	nul = [_convoy1,getPos _shed2, 300] call BIS_fnc_taskPatrol;
	sleep 15;
	[_newPos, 10, "LOP_AM_Landrover", _convoy1] call BIS_fnc_spawnvehicle;
	sleep 15;
	[_newPos, 10, "LOP_AM_Landrover", _convoy1] call BIS_fnc_spawnvehicle;
	sleep 15;
	[_newPos, 10, "LOP_AM_Landrover", _convoy1] call BIS_fnc_spawnvehicle;
	sleep 15;
	[_newPos, 10, "LOP_AM_Landrover", _convoy1] call BIS_fnc_spawnvehicle;
	sleep 15;
	[_newPos, 10, "LOP_AM_Landrover_M2", _convoy1] call BIS_fnc_spawnvehicle;
	
	_null = [west, "mob_convoy", ["Attack and destroy the supply convoy", "Eliminate Convoy", "Eliminate Convoy"], getMarkerPos "mob_convoy", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_convoy", "CREATED"] spawn BIS_fnc_taskSetState;

	waitUntil {{ alive _x } count units _convoy1 <= 3}; 

	_null = ["mob_convoy", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerAO;
	deleteGroup _convoy1;
	deleteVehicle _shed2;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_convoy"] call LARs_fnc_removeTask;
};

fn_spawnPlacementMission = {

	hint "UPDATED AIR OPS";
	//creating the marker 

	_markerAO = createMarker ["mob_placement", _mrkSpawnSite];
	_markerAO setMarkerType "Empty";
	
	sleep 0.3;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerAO, 200, 300, 10, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_isFlat_warehouse = [getMarkerPos _markerAO,200] call getFlatArea;
	
	_warehouse = createVehicle ["WarfareBDepot",[(getMarkerpos _markerAO select 0) + 1, getMarkerpos _markerAO select 1,0],[], 0, "NONE"];
	_warehouse setDamage 0.9;
	_warehouse setPos _isFlat_warehouse;
	
	_markerwarehouse = createMarker ["warehousemarker", getPos _warehouse];
	_markerwarehouse setMarkerType "o_support";
	_markerwarehouse setMarkerColor "ColorRed";
	_markerwarehouse setMarkerSize [1,1];
	_markerwarehouse setMarkerText "Insurgent Depot";
	
	_truck1 = createVehicle ["LOP_AM_Landrover",[(getPos _warehouse select 0) + 15, getPos _warehouse select 1,0],[], 0, "NONE"];
	
	_grp1A = [getPos _warehouse, INDEPENDENT, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_IT" >> "Infantry" >> "LOP_ISTS_Rifle_squad")] call BIS_fnc_spawnGroup;
	nul = [_grp1A,getpos _warehouse] call BIS_fnc_taskDefend;
	
	_AA2 = createGroup INDEPENDENT;
	[_newPos, 10, "LOP_ISTS_Offroad_M2", _AA2] call BIS_fnc_spawnvehicle;
	nul = [_AA2,getPos _warehouse, 150] call BIS_fnc_taskPatrol;
	sleep 15;
	[_newPos, 10, "LOP_ISTS_Offroad_M2", _AA2] call BIS_fnc_spawnvehicle;
	
	_null = [west, "mob_placement", ["Eliminate the OPFOR Depot.", "Eliminate Depot", "Eliminate Depot"], getMarkerPos "warehousemarker", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_placement", "CREATED"] spawn BIS_fnc_taskSetState;

	waitUntil { !alive _warehouse };
	
	_null = ["mob_placement", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 3;
	
	_sbomb1 = "R_60mm_HE" createVehicle (getPos _truck1);
	_truck1 setDammage 1;
	
	sleep 10;

	deleteMarker _markerAO;
	deleteMarker _markerwarehouse;
	{deleteVehicle _x} forEach units _grp1A;
	{deleteVehicle _x} forEach units _AA2;
	deleteGroup _grp1A;
	deleteGroup _AA2;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_placement"] call LARs_fnc_removeTask;
};

// MAIN LOGIC

_missionDetails = switch (_missionType) do {
	case "arty": {call fn_spawnArtyMission;};
	case "cas": {call fn_spawnCasMission;};
	case "convoy": {call fn_spawnConvoyMission;};
	case "warehouse": {call fn_spawnPlacementMission;};
};