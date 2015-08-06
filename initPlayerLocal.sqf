[] execVM "scripts\QS_icons.sqf";
[] execVM 'scripts\QS_Fatigue.sqf';

["InitializePlayer",[player]] call BIS_fnc_dynamicGroups;
[] spawn {
	sleep 10;
	hintSilent 'Press U to open Group Manager';
};