//--By Kylania----------------------//
//----------------------------------//


//Mission Select
if(!isServer) exitWith {};

//waituntil {!isnil "bis_fnc_init"}; //waiting

_missions = ["clear","kill","ammo","ammo2","comms","clear2","antiair","capture"]; //mission array

_choose = _missions call BIS_fnc_selectRandom; // random mission 
//_choose = "comms";
[_choose] execVM "Rtask\makeClearOps.sqf";  //call mission