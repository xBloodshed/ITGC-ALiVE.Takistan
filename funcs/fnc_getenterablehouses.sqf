// by Bon_Inf*
//
// INPUT: position, radius
// OUTPUT: array with elements [house,int],
//	   for all houses in given radius around
//	   given position which can be entered, and
//	   int the max. buildingpos of the house

private ['_position','_radius'];

_position = _this select 0;
_radius = _this select 1;


_houses = nearestObjects[_position,["House"],_radius];

_houses_enterable=[];

{
	_house = _x;
	_i = 0;
	While{count ((_house buildingPos _i)-[0]) > 0} do {_i = _i+1};
	_maxbuildingpos = _i - 1;

	if(_maxbuildingpos>0) then{_houses_enterable = _houses_enterable + [[_house,_maxbuildingpos]]};
} foreach _houses;



_houses_enterable