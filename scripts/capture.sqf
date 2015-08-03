// by Bon_Inf*
// executed by player action

_capturee = _this select 0;
_capturer = _this select 1;
_callid = _this select 2;

_capturee enableAI "MOVE";
_capturee enableAI "ANIM";

[_capturee] joinSilent _capturer;

if(true) exitWith{};