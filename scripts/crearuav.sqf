//--Funcion UAV por M4RT14L--//
///////////////////////////////

_terminal = _this select 0;
_operador = _this select 1;
_accion = _this select 2;

hint "DEPLOY VANT";
sleep 5;

_vant = [getPos UAV1, 60, "B_UAV_02_F", WEST] call BIS_fnc_spawnVehicle;
createVehicleCrew (_vant select 0);

hint "SYNC THE UAV TERMINAL NOW";

if (true)exitWith {};
  
