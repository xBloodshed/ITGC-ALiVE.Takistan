//--Funcion UAV por M4RT14L--//
///////////////////////////////

_terminal = _this select 0;
_operador = _this select 1;
_accion = _this select 2;

hint "DEPLOY UGV";
sleep 5;

_ugv = [getPos UAV2, 150, "B_UGV_01_rcws_F", WEST] call BIS_fnc_spawnVehicle;
createVehicleCrew (_ugv select 0);

hint "SYNCH THE UAV TERMINAL NOW";

if (true)exitWith {};