//--By Master-Antonio----------------------//
//----------------------------------//


//Mission Select
if(!isServer) exitWith {};
_missions = ["clear","kill","ammo","ammo2","comms","clear2","antiair","capture"] call BIS_fnc_selectRandom; //mission array + Random
[_missions] execVM "Rtask\makeClearOps.sqf";  //call mission