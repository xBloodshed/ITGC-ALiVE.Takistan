//--By Master-Antonio---------------------//
//----------------------------------//


//Mission Select
if(!isServer) exitWith {};
_missions = ["ied","roadrepair","hqbuild","towrepair","vehrepair","rescue","uavrec","pilotrescue"] call BIS_fnc_selectRandom; //mission array + Random
[_missions] execVM "Rtask\makeSupportOps.sqf";  //call mission