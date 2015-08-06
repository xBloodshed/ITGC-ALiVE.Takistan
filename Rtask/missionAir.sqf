//--By Kylania----------------------//
//----------------------------------//


//Mission Select
if(!isServer) exitWith {}; 

//waituntil {!isnil "bis_fnc_init"}; //waiting

_missions = ["arty","cas","convoy","warehouse"]; //mission array

_choose = _missions call BIS_fnc_selectRandom; // random mission 
//_choose = "warehouse";
[_choose] execVM "Rtask\makeAirOps.sqf";  //call mission