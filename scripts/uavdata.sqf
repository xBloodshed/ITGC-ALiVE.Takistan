//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: M4RT14L
//////////////////////////////////////////////////////////////////

_intel = _this select 0;
_ingeniero = _this select 1;
_callid = _this select 2;

hint "LINKING DEVICE";
_ingeniero playMove "AinvPknlMstpSlayWrflDnon_medic";
_intel removeAction _callid;
sleep 5;
hint "RETRIEVING DATA";
sleep 30;
hint "DATA TRANSMISSION COMPLETED";
{ deleteVehicle _x; } forEach nearestObjects [getpos _intel,["Land_SurvivalRadio_F"],100];

if(true) exitWith{};