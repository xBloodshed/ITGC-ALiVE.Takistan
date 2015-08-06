//--By Kylania----------------------//
//----------------------------------//


//Mission Select
if(!isServer) exitWith {};

//waituntil {!isnil "bis_fnc_init"}; //waiting

_missions = ["ied","roadrepair","hqbuild","towrepair","vehrepair","rescue","uavrec","pilotrescue"]; //mission array

_choose = _missions call BIS_fnc_selectRandom; // random mission 
//_choose = "towrepair";
[_choose] execVM "Rtask\makeSupportOps.sqf";  //call mission