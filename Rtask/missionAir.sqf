//--By Master-Antonio----------------------//
//----------------------------------//


//Mission Select
if(!isServer) exitWith {}; 
_missions = ["arty","cas","convoy","warehouse"] call BIS_fnc_selectRandom; //mission array + Random
[_missions] execVM "Rtask\makeAirOps.sqf";  //call mission