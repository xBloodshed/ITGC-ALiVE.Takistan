// by Bon_Inf*
// executed by player action

_capturee = _this select 0;
_capturer = _this select 1;
_callid = _this select 2;

_capturee enableAI "MOVE";
_capturee enableAI "ANIM";

[_capturee] joinSilent _capturer;

{ deleteVehicle _x; } forEach nearestObjects [getpos _capturee,["Sign_Sphere25cm_F"],50];

if(true) exitWith{};