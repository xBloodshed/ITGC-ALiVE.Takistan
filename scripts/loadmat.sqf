//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: Author Name
//////////////////////////////////////////////////////////////////

_patient = _this select 0;

_nearestVeh = getPos _patient nearestObject "RHS_UH60M_MEV2_d";

_patient attachTo [_nearestVeh,[0,1.9,-1.8]];

if(true) exitWith{};



