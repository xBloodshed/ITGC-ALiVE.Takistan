/* 
TPW ANIMALS - Spawn ambient animals around player.
Author: tpw 
Date: 20140630
Version: 1.33
Requires: CBA A3, tpw_core.sqf
Compatibility: SP, MP client

Disclaimer: Feel free to use and modify this code, on the proviso that you post back changes and improvements so that everyone can benefit from them, and acknowledge the original author (tpw) in any derivative works.     

To use: 
1 - Save this script into your mission directory as eg tpw_animals.sqf
2 - Call it with 0 = [10,15,200,75,60] execvm "tpw_animals.sqf"; where 10 = start delay, 15 = maximum animals near player, 200 = animals will be removed beyond this distance (m), 75 = minimum distance from player to spawn an animal (m), 60 = maximum time between dog/cat noises (sec)

THIS SCRIPT WON'T RUN ON DEDICATED SERVERS.
*/

if (isDedicated) exitWith {};
if (count _this < 5) exitwith {hint "TPW ANIMALS incorrect/no config, exiting."};
if (_this select 1 == 0) exitwith {};
WaitUntil {!isNull FindDisplay 46};

// READ IN CONFIGURATION VALUES
tpw_animal_version = "1.33"; // Version string
tpw_animal_sleep = _this select 0; // delay until animals start spawning
tpw_animal_max = _this select 1; // maximum animals near player
tpw_animal_maxradius = _this select 2; // distance beyond which animals will be removed
tpw_animal_minradius = _this select 3; // minimum distance from player to spawn animals
tpw_animal_noisetime = _this select 4; // maximum time in between animal noises

// DEFAULT VALUES FOR MP
if (isMultiplayer) then 
	{
	tpw_animal_sleep = 10; 
	tpw_animal_max =5; 
	tpw_animal_maxradius = 200;
	tpw_animal_minradius = 75;
	};

// VARIABLES
tpw_animal_debug = false; // debugging
tpw_animal_array = []; // array of animals near player
tpw_animal_exclude = false; // player near exlusion object
tpw_animal_active = true; // global activate/deactivate

tpw_animals = // array of animals and their min / max flock sizes
[["Hen_random_F",2,4,"(1 - meadow) * (1 - houses) * (1 - forest) * (1 + trees) * (1 - sea) * (1 - hills)"], // chicken
["Hen_random_F",2,4,"(1 - meadow) * (1 - houses) * (1 - forest) * (1 + trees) * (1 - sea) * (1 - hills)"],
["Sheep_random_F",3,6,"(1 + meadow) * (1 - houses) * (1 - forest) * (1 + trees) * (1 - sea) * (1 - hills)"], // sheep
["Sheep_random_F",3,6,"(1 + meadow) * (1 - houses) * (1 - forest) * (1 + trees) * (1 - sea) * (1 - hills)"],
["Goat_random_F",3,6,"(1 + meadow) * (1 - houses) * (1 + forest) * (1 + trees) * (1 - sea) * (1 + hills)"], // goat
["Goat_random_F",3,6,"(1 + meadow) * (1 - houses) * (1 + forest) * (1 + trees) * (1 - sea) * (1 + hills)"],
["Alsatian_random_F",1,1,"(1 - meadow) * (1 + houses) * (1 - forest) * (1 - trees) * (1 - sea) * (1 - hills)"], // alsation
["Fin_random_F",1,1,"(1 - meadow) * (1 + houses) * (1 - forest) * (1 - trees) * (1 - sea) * (1 - hills)"]]; // mutt

// DELAY
sleep tpw_animal_sleep;

// CONDITIONS FOR SPAWNING A NEW ANIMAL
tpw_animal_fnc_nearanimal =
	{
	private ["_owner","_spawnflag","_deadplayer","_animalarray","_animal","_exc","_i"];
	
	_spawnflag = true; // only spawn animal if this is true

	// Check if any players have been killed and disown their animals - MP
	if (isMultiplayer) then 
		{
			{
			if ((isplayer _x) && !(alive _x)) then
				{
				_deadplayer = _x;
				_animalarray = _x getvariable ["tpw_animalarray"];
				for "_i" from 0 to (count _animalarray - 1) do 
					{
					
					_animal setvariable ["tpw_animal_owner",(_animal getvariable "tpw_animal_owner") - [_deadplayer],true];
					};
				};
			} foreach allunits;    

		// Any nearby animals owned by other players - MP
		_nearanimals = (position player) nearentities [["Fowl_Base_F", "Dog_Base_F", "Goat_Base_F", "Sheep_Random_F"],tpw_animal_maxradius]; 
		for "_i" from 0 to (count _nearanimals - 1) do 
			{
			_animal = _nearanimals select _i;
			_owner = _animal getvariable ["tpw_animal_owner",[]];
	
			//Animals with owners who are not this player
			if ((count _owner > 0) && !(player in _owner)) exitwith
				{
				_spawnflag = false;
				_owner set [count _owner,player]; // add player as another owner of this animal
				_animal setvariable ["tpw_animal_owner",_owner,true]; // update ownership
				tpw_animal_array set [count tpw_animal_array,_animal]; // add this animal to the array of animals for this player
				};
			};
		};  
		
	// Refresh array of exclusion objects
	tpw_animal_excarray = [];
	tpw_animal_exclude = false;	
	if !(isnil "tpwanimexc") then {tpw_animal_excarray set [count tpw_animal_excarray,tpwanimexc]};
	if !(isnil "tpwanimexc_1") then {tpw_animal_excarray set [count tpw_animal_excarray,tpwanimexc_1]};	
	if !(isnil "tpwanimexc_2") then {tpw_animal_excarray set [count tpw_animal_excarray,tpwanimexc_2]};
	if !(isnil "tpwanimexc_3") then {tpw_animal_excarray set [count tpw_animal_excarray,tpwanimexc_3]};
	if !(isnil "tpwanimexc_4") then {tpw_animal_excarray set [count tpw_animal_excarray,tpwanimexc_4]};
	if !(isnil "tpwanimexc_5") then {tpw_animal_excarray set [count tpw_animal_excarray,tpwanimexc_5]};
	if !(isnil "tpwanimexc_6") then {tpw_animal_excarray set [count tpw_animal_excarray,tpwanimexc_6]};
	if !(isnil "tpwanimexc_7") then {tpw_animal_excarray set [count tpw_animal_excarray,tpwanimexc_7]};
	if !(isnil "tpwanimexc_8") then {tpw_animal_excarray set [count tpw_animal_excarray,tpwanimexc_8]};
	if !(isnil "tpwanimexc_9") then {tpw_animal_excarray set [count tpw_animal_excarray,tpwanimexc_9]};	
	
	// If player near exclusion object then spawn no animals
	for "_i" from 0 to (count tpw_animal_excarray - 1) do 
		{
		_exc = tpw_animal_excarray select _i;
		if (_exc distance vehicle player < tpw_animal_maxradius) exitwith
			{
			_spawnflag = false;
			tpw_animal_exclude = true;	
			};		
		} foreach tpw_animal_excarray;	
    
	// Otherwise, spawn a new animal
	if (_spawnflag) then 
		{
		[] spawn tpw_animal_fnc_spawn;    
		};     
	};

// SPAWN ANIMALS INTO APPROPRIATE SPOTS
tpw_animal_fnc_spawn =
	{
	private ["_group","_pos","_dir","_posx","_posy","_randpos","_type","_animal","_typearray","_type","_flock","_minflock","_maxflock","_diff","_i","_exp","_placearray","_place"];

	_typearray = tpw_animals select (floor (random (count tpw_animals))); // select animal/flocksize
	_type = _typearray select 0; // type of animal
	_minflock = _typearray select 1; // minimum flock size
	_maxflock = _typearray select 2; // maximum flock size
	_exp = _typearray select 3; // expression for selecting best places
	_diff = round (random (_maxflock - _minflock)); // how many animals more than minimum flock size
	_flock = _minflock + _diff; // flock size
	_pos = getposasl player; 	
	_placearray = selectBestPlaces [_pos, tpw_animal_maxradius, _exp, 50, 5]; 
	_place = _placearray select (floor (random (count _placearray)));
	_randpos = _place select 0;
	if(!(isnil "_randpos") && _randpos distance player > tpw_animal_minradius) then 
		{
	
		// Spawn flock
		for "_i" from 1 to _flock do 
			{
			sleep random 3;
			_animal = createAgent [_type,_randpos, [], 0, "NONE"];
			_animal setdir random 360;
			_animal setbehaviour "CARELESS";
			_animal setvariable ["tpw_animal_owner",[player],true]; // mark it as owned by this player
			tpw_animal_array set [count tpw_animal_array,_animal]; // add to player's animal array
			player setvariable ["tpw_animalarray",tpw_animal_array,true]; // broadcast it
			};
		};	
	};

//DISPERSE	
tpw_animal_disperse = 
	{
	private ["_obj","_animal","_adir","_pdir","_dir","_pos","_posx","_posy"];
	_obj = _this select 0;
	_animal = _this select 1;
	
	if (_animal getvariable ["tpw_animal_disperse",0] == 0) then	
		{
		sleep random 2;
		_animal setvariable	["tpw_animal_disperse",1];
		_adir = [_obj,_animal] call bis_fnc_dirto;
		_pdir = direction _obj;
		_dir = 0;
		if (_adir < _pdir) then
			{
			_dir = _pdir - 45 - random 20;
			}
		else
			{
			_dir = _pdir + 45 + random 20;
			};
		_animal setdir _dir;	
		for "_i" from 1 to (50 + random 100) do
			{
			_pos = position _animal;
			_posx = (_pos select 0) + (0.05 * sin _dir);
			_posy = (_pos select 1) +  (0.05 * cos _dir);
			_animal setposatl [_posx,_posy,0];
			sleep random 0.1;
			};
		_animal setvariable	["tpw_animal_disperse",0];	
		};	
	};	
	
// BARKING DOGS	
tpw_animal_fnc_dogbark =
	{
	private ["_ball","_pos","_dist","_posx","_posy","_barkpos","_bark","_nearhouses","_vol"];		
	
	//Invisible object to attach bark to 
	_ball = "Land_HelipadEmpty_F" createvehicle [0,0,0];
		
	while {true} do
		{
		if (tpw_animal_active && {player == vehicle player} && !(tpw_animal_exclude)) then
			{
			// random position around player
			_pos = getposasl player;
			_dir = random 360;
			_dist = 10 + (random 10);
			_posx = (_pos select 0) + (_dist * sin _dir);
			_posy = (_pos select 1) +  (_dist * cos _dir);
			_barkpos = [_posx,_posy,0]; 
			_ball setposatl _barkpos;
					
			// Scan for habitable houses 
			[100] call tpw_core_fnc_houses;
			_nearhouses = tpw_core_houses;
			
			// Reduce bark volume away from habitation
			if (count _nearhouses == 0) then 
				{
				_vol = 0.25;
				}
			else
				{
				_vol = 1;
				};
			
			// play bark
			_bark = format ["TPW_SOUNDS\sounds\dog%1.ogg",ceil (random 20)];
			playsound3d [_bark,_ball,false,getposasl _ball,_vol,1,50];
			};
		sleep random tpw_animal_noisetime;
		};
	};	
	
// YOWLING CATS AT NIGHT 	
tpw_animal_fnc_catmeow =
	{
	private ["_nearhouses","_ball","_pos","_dist","_posx","_posy","_meowpos","_meow"];		
	//Invisible object to attach meow to 
	_ball = "Land_HelipadEmpty_F" createvehicle [0,0,0];
		
	while {true} do
		{
		// Scan for habitable houses 
		[100] call tpw_core_fnc_houses;
		_nearhouses = tpw_core_houses;
		if (tpw_animal_active && {count _nearhouses > 0} && {(daytime < 5 || daytime > 20)} && {player == vehicle player} && {!(tpw_animal_exclude)}) then
			{
			// random position around player
			_pos = getposasl player;
			_dir = random 360;
			_dist = 15 + (random 10);
			_posx = (_pos select 0) + (_dist * sin _dir);
			_posy = (_pos select 1) +  (_dist * cos _dir);
			_meowpos = [_posx,_posy,0]; 
			_ball setposatl _meowpos;
			
			// play meow
			_meow = format ["TPW_SOUNDS\sounds\cat%1.ogg",ceil (random 5)];
			playsound3d [_meow,_ball,false,getposasl _ball,1,0.5 + (random 0.6),50];
			};
		sleep random tpw_animal_noisetime;
		};
	};	

// BLEATING GOATS 	
tpw_animal_fnc_goatbleat =
	{
	private ["_bleatpos","_bleat","_neargoats","_goat"];		
	while {true} do
		{
		_neargoats = (position player) nearEntities ["goat_base_f", 50];
		if (tpw_animal_active && {count _neargoats > 0} && {(daytime < 5 || daytime < 20)} && {player == vehicle player} && {!(tpw_animal_exclude)}) then
			{
			// Random goat
			_goat = _neargoats select (floor (random (count _neargoats)));
			_bleatpos = getposasl _goat; 
			
			// Play bleat
			_bleat = format ["TPW_SOUNDS\sounds\goat%1.ogg",ceil (random 5)];
			playsound3d [_bleat,_goat,false,getposasl _goat,2,0.9 + (random 0.2),100];
			};
		sleep random 10;
		};
	};		
	

// MAIN LOOP
tpw_animal_fnc_mainloop = 
	{
	while {true} do
		{
		if (tpw_animal_active) then
			{
			private ["_deleteradius","_animal","_i"];

			if (tpw_animal_debug) then
				{
				hintsilent format ["Animals: %1",count tpw_animal_array];
				};
		
			// Shrink deletion radius if near an exclusion zone, to get rid of animals quicker
			if (tpw_animal_exclude) then
				{
				_deleteradius = tpw_animal_minradius;
				} else
				{
				_deleteradius = tpw_animal_maxradius;
				};		
		
			// Spawn animals if there are less than the specified maximum
			if (count tpw_animal_array < tpw_animal_max) then
				{
				[] call tpw_animal_fnc_nearanimal;
				};

			// Remove ownership of distant or dead animals
			tpw_animal_removearray = []; // array of animals to remove
			for "_i" from 0 to (count tpw_animal_array - 1) do 
				{
				_animal = tpw_animal_array select _i;
				_animal forceSpeed 0.0001; // stop the bloody animal from running around constantly via BIS default FSM
				if (_animal distance player > _deleteradius || !(alive _animal)) then 
					{
					_animal setvariable ["tpw_animal_owner",(_animal getvariable "tpw_animal_owner") - [player],true];
					tpw_animal_removearray set [count tpw_animal_removearray,_animal];
					};
				
				// Delete live animals with no owners
				if ((count (_animal getvariable ["tpw_animal_owner",[]]) == 0) && (alive _animal))then	
					{
					deletevehicle _animal;
					};
					
				// Animals move away from vehicles
				_near = (position _animal) nearEntities [["LandVehicle"], 20];
				if (count _near > 0) then
					{
					[(_near select 0),_animal] spawn tpw_animal_disperse;
					};
				}; 

			// Update player's animal array	
			tpw_animal_array = tpw_animal_array - tpw_animal_removearray;
			player setvariable ["tpw_animalarray",tpw_animal_array,true];
			};

			// Dogs bark if gunfire (as determined by TPW EBS)
			if (!(isnil "tpw_ebs_active") && {tpw_ebs_active}) then 
			{
				{
				private ["_ball","_pos","_dist","_posx","_posy","_barkpos","_bark","_nearhouses","_vol"];
				if (_x getvariable "tpw_ebs_supstate" > 0) exitwith 
					{
					// random position around player
					_ball = "Land_HelipadEmpty_F" createvehicle [0,0,0];
					_pos = getposasl player;
					_dir = random 360;
					_dist = 10 + (random 10);
					_posx = (_pos select 0) + (_dist * sin _dir);
					_posy = (_pos select 1) +  (_dist * cos _dir);
					_barkpos = [_posx,_posy,0]; 
					_ball setposatl _barkpos;
					
					// Scan for habitable houses 
					[100] call tpw_core_fnc_houses;
					_nearhouses = tpw_core_houses;
					// Reduce bark volume away from habitatiom
					if (count _nearhouses == 0) then 
						{
						_vol = 0.25;
						}
					else
						{
						_vol = 1.5;
						};
					
					// play bark
					_bark = format ["TPW_SOUNDS\sounds\dog%1.ogg",ceil (random 20)];
					playsound3d [_bark,_ball,false,getposasl _ball,_vol,1,50];
					deletevehicle _ball;
					};
				} foreach tpw_ebs_unitarray;
			};
			
		sleep random 10;
		};
	};	
	
// RUN IT
[] spawn tpw_animal_fnc_goatbleat;
[] spawn tpw_animal_fnc_dogbark;
[] spawn tpw_animal_fnc_catmeow;
[] spawn tpw_animal_fnc_mainloop;

while {true} do
	{
	// dummy loop so script doesn't terminate
	sleep 10;
	};