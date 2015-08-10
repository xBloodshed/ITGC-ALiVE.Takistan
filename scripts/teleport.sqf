//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: TODO: Author Name
//////////////////////////////////////////////////////////////////

// Teleports a person to the marker. You can place this marker anywhere on the map.
//
// To use: Add this script as an action on an item via it's init field. EG:
//
//this addAction["Dest Description","teleport.sqf",["markerName"]];
//
//this addAction ["Teleport - Airfield","teleport.sqf",["Airfield"]];
//this addAction ["Teleport - HQ","teleport.sqf",["HQ"]];
//this addAction ["Teleport - BACC","teleport.sqf",["BACC"]];

// Get the destination.
_dest = (_this select 3) select 0;

// Get a random direction
_dir = random 359;

// Move the person 15 meters away from the destination (in the direction of _dir)
player SetPos [(getMarkerPos _dest select 0)-10*sin(_dir),(getMarkerPos _dest select 1)-10*cos(_dir)];