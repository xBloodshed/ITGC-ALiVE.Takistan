// by Bon_Inf*
#include "dialog\definitions.sqf"
disableSerialization;

#include "recruitable_units.sqf";

_display = findDisplay BON_RECRUITING_DIALOG;
_unitlist = _display displayCtrl BON_RECRUITING_UNITLIST;
_queuelist = _display displayCtrl BON_RECRUITING_QUEUE;

_queuelist ctrlSetText format["Units queued: %1",count bon_recruit_queue];


_weaponstring = "";
{
	_displname = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
	_picture = getText (configFile >> "CfgVehicles" >> _x >> "portrait");
	_weaponstring = format["%1",_displname,_picture];
	_unitlist lbAdd _weaponstring;
} foreach bon_recruit_recruitableunits;