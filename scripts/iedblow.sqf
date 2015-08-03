//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: M4RT14L
//////////////////////////////////////////////////////////////////

_explosivo = _this select 0;
_ingeniero = _this select 1;
_callid = _this select 2;

hint "ARMING DEMO CHARGE";
_explosivo removeAction _callid;
_ingeniero playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 10;
hint "EXPLOSIVES ARMED BLOW IN 60 SECONDS";
sleep 60;
bomb = "M_Mo_82mm_AT_LG" createVehicle (getPos _explosivo);
deleteVehicle _explosivo;
{ deleteVehicle _x; } forEach nearestObjects [getpos _explosivo,["ModuleExplosive_IEDLandSmall_F","ModuleExplosive_IEDLandBig_F"],5];

if(true) exitWith{};