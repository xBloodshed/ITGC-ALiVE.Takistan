//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: Author Name
//////////////////////////////////////////////////////////////////

_towedVeh = _this select 0;

_towingVeh = getPos _towedVeh nearestObject "B_APC_Tracked_01_CRV_F";

_towedVeh attachTo [_towingVeh,[0,-10,0]];

if(true) exitWith{};