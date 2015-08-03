//--By Nashable------------------------------------------------------//
// Following Code has been licensed for use in ALiVE TAKISTAN NATOFOR// 
//		by Nashable www.playdefiance.com 				   //
// and is licensed separately from the rest of ALiVE TAKISTAN NATOFOR//
//-------------------------------------------------------------------//

while {true} do
{
	//create the MHQ
	_spawnLoc = getMarkerPos "mhq";
	b_mhq = createVehicle ["B_APC_Tracked_01_CRV_F", _spawnLoc, [], 0, "NONE"];
	b_mhq setDir (markerDir "mhq");
	b_mhq allowDammage false;
	VAS = b_mhq;
	publicVariable "VAS";
	BIS_Curator addCuratorEditableObjects [[b_mhq],false];
	//TODO: Create and Delete respawn_west
	_oldPos = _spawnLoc;
	while { alive b_mhq } do
	{
		_mhqCPos = getPos b_mhq;
		if (_mhqCPos distance _oldPos > 0) then {
			_mhqNWPos = [(_mhqCPos select 0)-45,(_mhqCPos select 1)+45,(_mhqCPos select 2)];
			_mhqNPos = [(_mhqCPos select 0),(_mhqCPos select 1)+45,(_mhqCPos select 2)];
			_mhqNEPos = [(_mhqCPos select 0)+45,(_mhqCPos select 1)+45,(_mhqCPos select 2)];
			_mhqEPos = [(_mhqCPos select 0)+45,(_mhqCPos select 1),(_mhqCPos select 2)];
			_mhqSEPos = [(_mhqCPos select 0)+45,(_mhqCPos select 1)-45,(_mhqCPos select 2)];
			_mhqSPos = [(_mhqCPos select 0),(_mhqCPos select 1)-45,(_mhqCPos select 2)];
			_mhqSWPos = [(_mhqCPos select 0)-45,(_mhqCPos select 1)-45,(_mhqCPos select 2)];
			_mhqWPos = [(_mhqCPos select 0)-45,(_mhqCPos select 1),(_mhqCPos select 2)];

			BIS_Curator addCuratorEditingArea [2,_mhqNWPos,50];
			BIS_Curator addCuratorEditingArea [3,_mhqNPos,50];
			BIS_Curator addCuratorEditingArea [4,_mhqNEPos,50];
			BIS_Curator addCuratorEditingArea [5,_mhqEPos,50];
			BIS_Curator addCuratorEditingArea [6,_mhqSEPos,50];
			BIS_Curator addCuratorEditingArea [7,_mhqSPos,50];
			BIS_Curator addCuratorEditingArea [8,_mhqSWPos,50];
			BIS_Curator addCuratorEditingArea [9,_mhqWPos,50];
			_oldPos = _mhqCPos;
		};
	};
};
//////////////////////////////
//--End of Licensed Code----//
//////////////////////////////