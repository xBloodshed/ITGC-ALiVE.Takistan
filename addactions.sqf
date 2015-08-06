//////////////////////////////////////////////////////////////////
// Function file for ArmA III
// Created by: M4RT14L
//////////////////////////////////////////////////////////////////

if (!isDedicated) then {
    fnc_iedblow = {
        _this addAction ["<t color='#FF6600'>Blow IED</t>", "scripts\iedblow.sqf", [], 1, false, true, "", ""];
    };
    iedblow = [];
    "iedblow" addPublicVariableEventHandler {(_this select 1) call fnc_iedblow};
};

if (!isDedicated) then {
    fnc_escolta = {
        _this addAction ["<t color='#FF6600'>Follow Me</t>", "scripts\capture.sqf", nil, 6, true, true, "", ""];
    };
    escolta = [];
    "escolta" addPublicVariableEventHandler {(_this select 1) call fnc_escolta};
};

if (!isDedicated) then {
    fnc_uavdata = {
        _this addAction ["<t color='#FF6600'>Recover Intel</t>", "scripts\uavdata.sqf", nil, 6, true, true, "", ""];
    };
    uavdata = [];
    "uavdata" addPublicVariableEventHandler {(_this select 1) call fnc_uavdata};
};

if (!isDedicated) then {
    fnc_arrest = {
        _this addAction ["<t color='#FF6600'>Arrest</t>", "scripts\arrest.sqf", nil, 6, true, true, "", ""];
    };
    arrest = [];
    "arrest" addPublicVariableEventHandler {(_this select 1) call fnc_arrest};
};

if (!isDedicated) then {
    fnc_dragmat = {
        _this addAction ["<t color='#FF6600'>Drag stretcher</t>", "scripts\dragmat.sqf", nil, 6, true, true, "", ""];
    };
    dragmat = [];
    "dragmat" addPublicVariableEventHandler {(_this select 1) call fnc_dragmat};
};

if (!isDedicated) then {
    fnc_dropmat = {
        _this addAction ["<t color='#FF6600'>Drop stretcher</t>", "scripts\dropmat.sqf", nil, 6, true, true, "", ""];
    };
    dropmat = [];
    "dropmat" addPublicVariableEventHandler {(_this select 1) call fnc_dropmat};
};

if (!isDedicated) then {
    fnc_loadmat = {
        _this addAction ["<t color='#FF6600'>Load stretcher</t>", "scripts\loadmat.sqf", nil, 6, true, true, "", ""];
    };
    loadmat = [];
    "loadmat" addPublicVariableEventHandler {(_this select 1) call fnc_loadmat};
};

if (!isDedicated) then {
    fnc_grab = {
        _this addAction ["<t color='#FF6600'>Grab</t>", "scripts\grab.sqf", nil, 6, true, true, "", ""];
    };
    grab = [];
    "grab" addPublicVariableEventHandler {(_this select 1) call fnc_grab};
};

if (!isDedicated) then {
    fnc_getintel = {
        _this addAction ["<t color='#FF6600'>Take intel</t>", "scripts\getintel.sqf", nil, 6, true, true, "", ""];
    };
    getintel = [];
    "getintel" addPublicVariableEventHandler {(_this select 1) call fnc_getintel};
};

if (!isDedicated) then {
    fnc_towvehicle = {
        _this addAction ["<t color='#FF6600'>Tow vehicle</t>", "scripts\vehtower.sqf", nil, 6, true, true, "", ""];
    };
    towvehicle = [];
    "towvehicle" addPublicVariableEventHandler {(_this select 1) call fnc_towvehicle};
};

if (!isDedicated) then {
    fnc_untowvehicle = {
        _this addAction ["<t color='#FF6600'>Release vehicle</t>", "scripts\unvehtower.sqf", nil, 6, true, true, "", ""];
    };
    untowvehicle = [];
    "untowvehicle" addPublicVariableEventHandler {(_this select 1) call fnc_untowvehicle};
};