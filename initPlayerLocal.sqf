//[] execVM "ANTONY_musicScript.sqf";
[] execVM "scripts\QS_icons.sqf";
[] execVM 'scripts\QS_Fatigue.sqf';
0 = [10,10,500,50,60] execvm "scripts\tpw_animals.sqf";
[.1] execVM "goon_dust.sqf";
["InitializePlayer",[player]] call BIS_fnc_dynamicGroups;
[] spawn {
	sleep 10;
	hintSilent 'Press U to open Group Manager';
};