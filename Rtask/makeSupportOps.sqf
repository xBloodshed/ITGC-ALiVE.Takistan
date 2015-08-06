//////////////////////////////////////
//----ALiVE NATOFOR Random Tasks----//
//---By Valixx, Kylania & M4RT14L---//
//---------------v2.4---------------//
//////////////////////////////////////

_missionType = [_this, 0, ""] call BIS_fnc_param;

_myHint ="Requesting Support Operations";
GlobalHint = _myHint;
publicVariable "GlobalHint";
hintsilent parseText _myHint;

sleep 10;

_markerArray = ["road","road_1","road_2","road_3","road_4","road_5","road_6","road_7","road_8","road_9","road_10","road_11","road_12","road_13","road_14"];
_rnd 	= floor (random (count(_markerArray)));
_mrkSpawnPos = getMarkerPos (_markerArray select _rnd);

sleep 10;
															   
fn_spawnIedMission = {

	hint "UPDATED SUPPORT OPS";
	//creating the marker 

	_markerSO = createMarker ["mob_ied", _mrkSpawnPos];
	_markerSO setMarkerType "Minefield";
	_markerSO setMarkerColor "ColorOrange";
	_markerSO setMarkerText "Clear IED";
	_markerSO setMarkerSize [1,1];
	
	sleep 0.3;

	//creating the vehicle

	_ied = ["ModuleExplosive_IEDLandSmall_F","ModuleExplosive_IEDLandBig_F"] call BIS_fnc_selectRandom;
	
	_explo = createVehicle [_ied,[(getMarkerpos _markerSO select 0) + 3, getMarkerpos _markerSO select 1,0],[], 0, "NONE"];
	
	_pole = createVehicle ["Pole_F", getPos _explo, [], 0, "NONE"];
	iedblow = _pole;
	publicVariable "iedblow";  
	
	_grp1S = [getMarkerPos _markerSO, WEST, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam")] call BIS_fnc_spawnGroup;
	{_x allowdamage false} foreach units _grp1S;
	nul = [_grp1S,getPos _pole, 150] call BIS_fnc_taskPatrol;
	
	_null = [west, "mob_ied", ["Must neutralize the IED.", "Clear IED", "Clear IED"], getMarkerPos "mob_ied", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_ied", "CREATED"] spawn BIS_fnc_taskSetState;

	waitUntil { !alive _explo };
	
	_null = ["mob_ied", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerSO;
	{deleteVehicle _x} forEach units _grp1S;
	deleteGroup _grp1S;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_ied"] call LARs_fnc_removeTask;
};

fn_spawnRrepairMission = {

	hint "UPDATED SUPPORT OPS";
	//creating the marker 

	_markerSO = createMarker ["mob_rrep", _mrkSpawnPos];
	_markerSO setMarkerType "waypoint";
	_markerSO setMarkerColor "ColorRed";
	_markerSO setMarkerText "Repair MSR";
	_markerSO setMarkerSize [1,1];
	
	sleep 0.3;

	//creating the vehicle

	_crater = ["CraterLong","CraterLong_small","Dirthump_3_F","Dirthump_2_F","Dirthump_1_F"] call BIS_fnc_selectRandom;
	
	_eng = createVehicle ["B_APC_Tracked_01_CRV_F",[(getMarkerpos "respawn_west" select 0) + 10, getMarkerpos "respawn_west" select 1,0],[], 0, "NONE"];
	_eng setFuel 1;
	_eng allowDammage false;
	_sign = createVehicle ["Sign_Sphere25cm_F",getPos _eng, [], 0, "NONE"];
	_sign attachTo [_eng,[0,0,+5]];
	
	_cra = createVehicle [_crater,[(getMarkerpos _markerSO select 0), getMarkerpos _markerSO select 1,0],[], 0, "NONE"];
	
	_grp1S = [getMarkerPos _markerSO, WEST, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam")] call BIS_fnc_spawnGroup;
	{_x allowdamage false} foreach units _grp1S;
	nul = [_grp1S,getPos _cra, 150] call BIS_fnc_taskPatrol;
	
	_null = [west, "mob_rrep", ["Take the CRV and repair the MSR.", "Road Repair", "Road Repair"], getMarkerPos "mob_rrep", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_rrep", "CREATED"] spawn BIS_fnc_taskSetState;
	
	waitUntil { _eng distance getMarkerpos _markerSO < 20 OR !alive _eng };
	
	if (!alive _eng) exitWith {_null = ["mob_rrep", "FAILED"] spawn BIS_fnc_taskSetState; deleteMarker _markerSO; {deleteVehicle _x} forEach units _grp1S; deleteGroup _grp1S; deleteVehicle _eng; deleteVehicle _sign; deleteVehicle _cra; [west, "mob_rrep"] call LARs_fnc_removeTask;};
	
	hint "REPAIRING ROAD";
	sleep 60;
	deleteVehicle _cra;
	
	_null = ["mob_rrep", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerSO;
	deletevehicle _eng;
	deleteVehicle _sign;
	{deleteVehicle _x} forEach units _grp1S;
	deleteGroup _grp1S;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_rrep"] call LARs_fnc_removeTask;
};

fn_spawnBuildMission = {

	hint "UPDATED SUPPORT OPS";
	//creating the marker 

	_markerSO = createMarker ["mob_build", _mrkSpawnPos];
	_markerSO setMarkerType "mil_box";
	_markerSO setMarkerColor "ColorBlue";
	_markerSO setMarkerText "Checkpoint";
	_markerSO setMarkerSize [1,1];
	
	sleep 0.3;

	//creating the vehicle
	
	_newPos = [getMarkerPos _markerSO, 15, 30, 10, 0, 20, 0] call BIS_fnc_findSafePos;
	
	_eng = createVehicle ["B_Truck_01_box_F",[(getMarkerpos "respawn_west" select 0) + 10, getMarkerpos "respawn_west" select 1,0],[], 0, "NONE"];
	_eng setFuel 1;
	_eng allowDammage false;
	_sign = createVehicle ["Sign_Sphere25cm_F",getPos _eng, [], 0, "NONE"];
	_sign attachTo [_eng,[0,0,+5]];
	
	_null = [(configfile >> "CfgGroups" >> "Empty" >> "ALIVE" >> "other" >> "mediumCheckpoint1"), getMarkerPos _markerSO, 0] call ALIVE_fnc_spawnComposition;
	
	_grp1S = [getMarkerPos _markerSO, WEST, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam")] call BIS_fnc_spawnGroup;
	{_x allowdamage false} foreach units _grp1S;
	nul = [_grp1S,getMarkerpos _markerSO, 150] call BIS_fnc_taskPatrol;
	
	_null = [west, "mob_build", ["Take the supply truck and escort him to the checkpoint to deploy the HQ.", "Deploy HQ", "Deploy HQ"], getMarkerPos "mob_build", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_build", "CREATED"] spawn BIS_fnc_taskSetState;

	waitUntil { _eng distance getMarkerpos _markerSO < 50 OR !alive _eng };
	
	if (!alive _eng) exitWith {_null = ["mob_build", "FAILED"] spawn BIS_fnc_taskSetState; deleteMarker _markerSO; {deleteVehicle _x} forEach units _grp1S; deleteGroup _grp1S; deleteVehicle _eng; deleteVehicle _sign; [west, "mob_rrep"] call LARs_fnc_removeTask;};
	
	hint "BUILDING POST";
	sleep 120;
	_post = createVehicle ["US_WarfareBBarracks_Base_EP1", _newPos,[], 0, "NONE"];
	
	_null = ["mob_build", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerSO;
	deletevehicle _eng;
	deleteVehicle _sign;
	deleteVehicle _post;
	{deleteVehicle _x} forEach units _grp1S;
	deleteGroup _grp1S;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_build"] call LARs_fnc_removeTask;
};

fn_spawnTwrepairMission = {

	hint "UPDATED SUPPORT OPS";
	//creating the marker 

	_markerSO = createMarker ["mob_trepair", _mrkSpawnPos];
	_markerSO setMarkerType "b_installation";
	_markerSO setMarkerColor "ColorBlue";
	_markerSO setMarkerText "C.O.P.";
	_markerSO setMarkerSize [1,1];
	
	sleep 0.3;

	//creating the vehicle
	
	_eng = createVehicle ["B_Truck_01_box_F",[(getMarkerpos "respawn_west" select 0) + 10, getMarkerpos "respawn_west" select 1,0],[], 0, "NONE"];
	_eng setFuel 1;
	_eng allowDammage false;
	_sign = createVehicle ["Sign_Sphere25cm_F",getPos _eng, [], 0, "NONE"];
	_sign attachTo [_eng,[0,0,+5]];
	
	_grp1S = [getMarkerPos _markerSO, WEST, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam")] call BIS_fnc_spawnGroup;
	{_x allowdamage false} foreach units _grp1S;
	nul = [_grp1S,getMarkerpos _markerSO, 150] call BIS_fnc_taskPatrol;
	
	_grp2S = [getMarkerPos _markerSO, WEST, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam")] call BIS_fnc_spawnGroup;
	{_x allowdamage false} foreach units _grp2S;
	nul = [_grp2S,getMarkerpos _markerSO, 300] call BIS_fnc_taskPatrol;
	
	sleep 0.3;
	
	_newPos = [getMarkerPos _markerSO, 50, 70, 10, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_null = [(configfile >> "CfgGroups" >> "Empty" >> "ALIVE" >> "objectives" >> "largeMilitaryOutpost1"), _newPos, 0] call ALIVE_fnc_spawnComposition;
	
	_null = [west, "mob_trepair", ["Take the supply truck and escort to the C.O.P.", "Deliver Supplies", "Deliver Supplies"], getMarkerPos "mob_trepair", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_trepair", "CREATED"] spawn BIS_fnc_taskSetState;

	waitUntil { _eng distance getMarkerpos _markerSO < 100 OR !alive _eng };
	
	if (!alive _eng) exitWith {_null = ["mob_trepair", "FAILED"] spawn BIS_fnc_taskSetState; deleteMarker _markerSO; {deleteVehicle _x} forEach units _grp1S; {deleteVehicle _x} forEach units _grp2S; deleteGroup _grp1S; deleteGroup _grp2S; deleteVehicle _eng; deleteVehicle _sign; [west, "mob_trepair"] call LARs_fnc_removeTask;};
	
	sleep 10;
	
	_null = ["mob_trepair", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerSO;
	deletevehicle _eng;
	deleteVehicle _sign;
	{deleteVehicle _x} forEach units _grp1S;
	{deleteVehicle _x} forEach units _grp2S;
	deleteGroup _grp1S;
	deleteGroup _grp2S;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_trepair"] call LARs_fnc_removeTask;
};

fn_spawnVerepairMission = {

	hint "UPDATED SUPPORT OPS";
	//creating the marker 

	_markerSO = createMarker ["mob_vrepair", _mrkSpawnPos];
	_markerSO setMarkerType "b_armor";
	_markerSO setMarkerColor "ColorBlue";
	_markerSO setMarkerText "Damaged Vehicle";
	_markerSO setMarkerSize [1,1];
	
	sleep 0.3;

	//creating the vehicle

	_dveh = ["B_APC_Tracked_01_rcws_F","B_APC_Tracked_01_AA_F","B_MBT_01_cannon_F"] call BIS_fnc_selectRandom;
	
	_eng = createVehicle ["B_APC_Tracked_01_CRV_F",[(getMarkerpos "respawn_west" select 0) + 10, getMarkerpos "respawn_west" select 1,0],[], 0, "NONE"];
	_eng setFuel 1;
	_eng allowDammage false;
	_sign = createVehicle ["Sign_Sphere25cm_F",getPos _eng, [], 0, "NONE"];
	_sign attachTo [_eng,[0,0,+5]];
	
	_damve = createVehicle [_dveh,[(getMarkerpos _markerSO select 0) + 10, getMarkerpos _markerSO select 1,0],[], 0, "NONE"];
	_damve setDammage 0.8;
	_damve setFuel 0;
	_damve allowDammage false;
	towvehicle = _damve;
	publicVariable "towvehicle";
	untowvehicle = _damve;
	publicVariable "untowvehicle";
	
	_grp1S = [getMarkerPos _markerSO, WEST, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam")] call BIS_fnc_spawnGroup;
	{_x allowdamage false} foreach units _grp1S;
	nul = [_grp1S,getPos _damve, 150] call BIS_fnc_taskPatrol;
	
	_null = [west, "mob_vrepair", ["They come with the CRV and tow dammaged vehicle to the service the area in Loy Manara AB", "Repair vehicle", "Repair Vehicle"], getMarkerPos "mob_vrepair", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_vrepair", "CREATED"] spawn BIS_fnc_taskSetState; 

	waitUntil {_damve distance getMarkerPos "reparea" < 20 OR !alive _damve};
	
	if (!alive _damve) exitWith {_null = ["mob_vrepair", "FAILED"] spawn BIS_fnc_taskSetState; deleteMarker _markerSO; {deleteVehicle _x} forEach units _grp1S; deleteGroup _grp1S; deleteVehicle _eng; deleteVehicle _sign; deleteVehicle _damve; [west, "mob_vrepair"] call LARs_fnc_removeTask;};
	
	_null = ["mob_vrepair", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerSO;
	{deleteVehicle _x} forEach units _grp1S;
	deleteGroup _grp1S;
	deletevehicle _eng;
	deleteVehicle _sign;
	deleteVehicle _damve;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_vrepair"] call LARs_fnc_removeTask;
};

fn_spawnRescueMission = {

	hint "UPDATED SUPPORT OPS";
	//creating the marker 

	_markerSO = createMarker ["mob_rescue", _mrkSpawnPos];
	_markerSO setMarkerType "b_med";
	_markerSO setMarkerColor "ColorRed";
	_markerSO setMarkerText "MEDEVAC";
	_markerSO setMarkerSize [1,1];
	
	sleep 0.3;

	//creating the vehicle

	_veh = ["B_MRAP_01_gmg_F","B_MRAP_01_F","B_Truck_01_transport_F"] call BIS_fnc_selectRandom;
	
	_truck = createVehicle [_veh,[(getMarkerpos _markerSO select 0) + 3, getMarkerpos _markerSO select 1,0],[], 0, "NONE"];
	_truck setDammage 0.8;
	_truck allowDamage false;
	_truck setFuel 0;
	
	_grp = createGroup WEST;
	_men1 = _grp createUnit ["B_Soldier_F", [(getMarkerpos _markerSO select 0) + 10, getMarkerpos _markerSO select 1,0], [], 0, "CAN_COLLIDE"];
	_men1 allowDamage false;
	_men1 setCaptive true;
	_men1 playMoveNow "AinjPpneMstpSnonWrflDnon";
	_men1 disableAI "MOVE";
	_men1 disableAI "ANIM";
	dragmat = _men1;
	publicVariable "dragmat";
	dropmat = _men1;
	publicVariable "dropmat";
	loadmat = _men1;
	publicVariable "loadmat";
	
	_camilla = createVehicle ["Land_Ground_sheet_khaki_F", getPos _men1, [], 0, "NONE"];
	_camilla attachTo [_men1,[0,0,0]];
	
	_grp1S = [getMarkerPos _markerSO, WEST, (configfile >> "CfgGroups" >> "West" >> "BLU_F" >> "Infantry" >> "BUS_InfTeam")] call BIS_fnc_spawnGroup;
	{_x allowdamage false} foreach units _grp1S;
	nul = [_grp1S,getPos _truck, 150] call BIS_fnc_taskPatrol;
	
	_null = [west, "mob_rescue", ["Evac wounded personnel from the AO and bring it to MASH in Loy Manara AB, you can only do with MEDEVAC Chopper.", "MEDEVAC", "MEDEVAC"], getMarkerPos "mob_rescue", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_rescue", "CREATED"] spawn BIS_fnc_taskSetState;
	
	waitUntil { _men1 distance getMarkerPos "mash" < 50 OR !alive _men1 };
	
	if (!alive _men1) exitWith {_null = ["mob_rescue", "FAILED"] spawn BIS_fnc_taskSetState; deleteMarker _markerSO; {deleteVehicle _x} forEach units _grp1S; deleteGroup _grp1S; deleteVehicle _truck; deleteVehicle _camilla; deleteVehicle _men1; deleteGroup _grp; [west, "mob_rescue"] call LARs_fnc_removeTask;};
	
	_null = ["mob_rescue", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;
	
	deleteMarker _markerSO;
	{deleteVehicle _x} forEach units _grp1S;
	deleteGroup _grp1S;
	deleteVehicle _truck;
	deleteVehicle _camilla;
	deleteVehicle _men1;
	deleteGroup _grp;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_rescue"] call LARs_fnc_removeTask;
};

fn_spawnUavMission = {

	hint "UPDATED SUPPORT OPS";
	//creating the marker 

	_markerSO = createMarker ["mob_uav", _mrkSpawnPos];
	_markerSO setMarkerShape "Empty";
	
	sleep 0.3;

	//creating the vehicle

	_newPos = [getMarkerPos _markerSO, 200, 400, 10, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_uav = createVehicle ["O_UAV_02_F", _newPos, [], 0, "CAN_COLLIDE"];
	_uav setDammage 0.8;
	uavdata = _uav;
	publicVariable "uavdata";
	
	_device = createVehicle ["Land_SurvivalRadio_F", getPos _uav, [], 0, "CAN_COLLIDE"];
	_device attachTo [_uav,[0,0,-0.3]];
	
	_markeruav = createMarker ["uavmarker", getPos _uav];
	_markeruav setMarkerType "o_uav";
	_markeruav setMarkerColor "ColorRed";
	_markeruav setMarkerSize [0.7,0.7];
	_markeruav setMarkerText "Downed UAV";  
	
	_grp1S = [getMarkerPos _markerSO, INDEPENDENT, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_ISTS" >> "Infantry" >> "LOP_ISTS_Support_section")] call BIS_fnc_spawnGroup;
	nul = [_grp1S,getPos _uav, 150] call BIS_fnc_taskPatrol;
	
	_grp2S = [getMarkerPos _markerSO, INDEPENDENT, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_ISTS" >> "Infantry" >> "LOP_ISTS_Support_section")] call BIS_fnc_spawnGroup;
	nul = [_grp2S,getPos _uav, 200] call BIS_fnc_taskPatrol;
	
	_cars2 = createGroup INDEPENDENT;
	[getMarkerPos _markerSO, 10, "LOP_ISTS_Landrover_M2", _cars2] call BIS_fnc_spawnvehicle;
	nul = [_cars2,getPos _uav, 700] call BIS_fnc_taskPatrol;
	sleep 10;
	[getMarkerPos _markerSO, 10, "LOP_ISTS_Landrover_M2", _cars2] call BIS_fnc_spawnvehicle;
	
	_null = [west, "mob_uav", ["One of our drones has been shot down, come to the area retrieve intel and destroy the wreckage.", "Recover UAV", "Recover UAV"], getMarkerPos "uavmarker", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_uav", "CREATED"] spawn BIS_fnc_taskSetState;

	waitUntil { !alive _device };
	
	_null = ["mob_uav", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;

	deleteMarker _markerSO;
	deleteMarker _markeruav;
	{deleteVehicle _x} forEach units _grp1S;
	{deleteVehicle _x} forEach units _grp2S;
	{deleteVehicle _x} forEach units _cars2;
	deleteGroup _grp1S;
	deleteGroup _grp2S;
	deleteGroup _cars2;

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_uav"] call LARs_fnc_removeTask;
};

fn_spawnPilotRescueMission = {

	hint "UPDATED SUPPORT OPS";
	//creating the marker 

	_markerSO = createMarker ["mob_pilotrescue", _mrkSpawnPos];
	_markerSO setMarkerShape "Empty";
	
	sleep 0.3;

	//creating the vehicle

	_helo = ["B_Heli_Light_01_armed_F","B_Heli_Attack_01_F","B_Heli_Transport_01_camo_F"] call BIS_fnc_selectRandom;
	
	_newPos = [getMarkerPos _markerSO, 0, 150, 10, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_wreck = createVehicle [_helo, _newPos, [], 0, "CAN_COLLIDE"];
	_wreck setDammage 1;
	
	sleep 0.3;
	
	_newPos2 = [getMarkerPos _markerSO, 300, 500, 10, 0, 0, 0] call BIS_fnc_findSafePos;
	
	_pilotgrp = createGroup WEST;
	_pilot1 = _pilotgrp createUnit ["B_helicrew_F", _newPos2, [], 0, "NONE"];
	_pilot1 setCaptive true;
	_pilot1 allowDamage false;
	_pilot1 disableAI "MOVE";
	_pilot1 disableAI "ANIM";
	escolta = _pilot1;
	publicVariable "escolta";
	grab = _pilot1;
	publicVariable "grab";
	
	_IRgren = createVehicle ["B_IRStrobe", _newPos2, [], 0, "NONE"];
	
	_signpl = createVehicle ["Sign_Sphere25cm_F",getPos _pilot1, [], 0, "NONE"];
	_signpl attachTo [_pilot1,[0,0,+5]];
	
	_markerpilot = createMarker ["pilotmarker", getPos _pilot1];
	_markerpilot setMarkerType "hd_join";
	_markerpilot setMarkerColor "ColorBlue";
	_markerpilot setMarkerSize [0.7,0.7];
	_markerpilot setMarkerText "Pilot CSAR";
	
	sleep 0.3;
	
	_grp1S = [getPos _wreck, INDEPENDENT, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_ISTS" >> "Infantry" >> "LOP_ISTS_Support_section")] call BIS_fnc_spawnGroup;
	nul = [_grp1S,getPos _wreck, 150] call BIS_fnc_taskPatrol;
	
	_grp2S = [getPos _wreck, INDEPENDENT, (configfile >> "CfgGroups" >> "INDEP" >> "LOP_ISTS" >> "Infantry" >> "LOP_ISTS_Support_section")] call BIS_fnc_spawnGroup;
	nul = [_grp2S,getPos _wreck, 250] call BIS_fnc_taskPatrol;
	
	_cars3 = createGroup INDEPENDENT;
	[getMarkerPos _markerSO, 10, "LOP_ISTS_Landrover_M2", _cars3] call BIS_fnc_spawnvehicle;
	nul = [_cars3,getPos _wreck, 500] call BIS_fnc_taskPatrol;
	sleep 10;
	[getMarkerPos _markerSO, 10, "LOP_ISTS_Landrover_M2", _cars3] call BIS_fnc_spawnvehicle;
	
	_null = [west, "mob_pilotrescue", ["One of our choppers has been shot down, find the pilot and bring it to MASH in Loy Manara AB.", "Pilot CSAR", "Pilot CSAR"], getMarkerPos "pilotmarker", false] spawn BIS_fnc_taskCreate;
	_null = ["mob_pilotrescue", "CREATED"] spawn BIS_fnc_taskSetState;
	
	waitUntil { _pilot1 distance getMarkerPos "mash" < 50 OR !alive _pilot1 };
	
	if (!alive _men1) exitWith {_null = ["mob_pilotrescue", "FAILED"] spawn BIS_fnc_taskSetState; deleteMarker _markerSO; deleteMarker _markerpilot; {deleteVehicle _x} forEach units _grp1S; {deleteVehicle _x} forEach units _grp2S; {deleteVehicle _x} forEach units _cars3; deleteGroup _grp1S; deleteGroup _grp2S; deleteGroup _cars3; deleteVehicle _wreck; deleteVehicle _camilla; deleteVehicle _pilot1; deleteGroup _pilotgrp; deleteVehicle _signpl; deleteVehicle  (nearestobject [_newPos2,"nvg_targetC"]); [west, "mob_pilotrescue"] call LARs_fnc_removeTask;};
	
	[_pilot1] join grpNull;
	
	_null = ["mob_pilotrescue", "SUCCEEDED"] spawn BIS_fnc_taskSetState;
	
	sleep 10;
	
	deleteMarker _markerSO;
	deleteMarker _markerpilot;
	{deleteVehicle _x} forEach units _grp1S;
	{deleteVehicle _x} forEach units _grp2S;
	{deleteVehicle _x} forEach units _cars3;
	deleteGroup _grp1S;
	deleteGroup _grp2S;
	deleteGroup _cars3;
	deleteVehicle _wreck;
	deleteVehicle _pilot1;
	deleteVehicle _signpl;
	deleteGroup _pilotgrp;
	deleteVehicle  (nearestobject [_newPos2,"nvg_targetC"]);

	_myHint ="Good Job!";
	GlobalHint = _myHint;
	publicVariable "GlobalHint";
	hintsilent parseText _myHint;

	_mySChat ="OBJECTIVE COMPLETED";
	GlobalSCHat = _mySChat;
	publicVariable "GlobalSCHat";
	player sideChat _mySChat;
	
	[west, "mob_pilotrescue"] call LARs_fnc_removeTask;
};

// MAIN LOGIC

_missionDetails = switch (_missionType) do {
	case "ied": {call fn_spawnIedMission;};
	case "roadrepair": {call fn_spawnRrepairMission;};
	case "hqbuild": {call fn_spawnBuildMission;};
	case "towrepair": {call fn_spawnTwrepairMission;};
	case "vehrepair": {call fn_spawnVerepairMission;};
	case "rescue": {call fn_spawnRescueMission;};
	case "uavrec": {call fn_spawnUavMission;};
	case "pilotrescue": {call fn_spawnPilotRescueMission;};
};