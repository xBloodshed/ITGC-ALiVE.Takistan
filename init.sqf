//////////////////////////////
//--ALiVE TAKISTAN NATOFOR--//
//-------By M4RT14L---------//
//////////////////////////////

#include "initBriefing.sqf";
enableSaving [false,false];

//Funciones---------------------//
call compile preprocessfile "globaltools.sqf";
call compile preprocessfile "addactions.sqf";
call compile preprocessFileLineNumbers "removeTasks.sqf";
//------------------------------//

//Scripts-----------------------//
[] execVM "bon_recruit_units\init.sqf";
[] execVM "scripts\prayer.sqf";
0 = [] execvm "scripts\tpw_core.sqf";
player execVM "scripts\simpleEP.sqf";
execVM "headlessclient\passToHCs.sqf";
//------------------------------//


//Other Scripts  ------------------//
null = [] execVM "minedetector.sqf";
[] execVM "zlt_fastrope.sqf";
//------------------------------//

//---Read the Time
curTimeHour = (paramsArray select 0);
curTimeMinutes = (paramsArray select 1);
curTimeMonth = (paramsArray select 2);
curTimeDay = (paramsArray select 3);

if (isNil "curTimeHour") then {curTimeHour = 9};
if (isNil "curTimeMinutes") then {curTimeMinutes = 0};
if (isNil "curTimeMonth") then {curTimeMinutes = 1};
if (isNil "curTimeDay") then {curTimeMinutes = 1};
setDate [2035, curTimeMonth, curTimeDay, curTimeHour, curTimeMinutes];
//------------------------------//

if (hasInterface) then {
	
	titleText ["Customized for ITGC by  X B L O O D S H E D", "BLACK IN",10000];
	0 fadesound 0;
	
	private ["_cam","_camx","_camy","_camz","_object"];
	_start = time;

	waituntil {(player getvariable ["alive_sys_player_playerloaded",false]) || ((time - _start) > 20)};
	sleep 10;
	
	_object = player;
	_camx = getposATL player select 0;
	_camy = getposATL player select 1;
	_camz = getposATL player select 2;
	
	_cam = "camera" CamCreate [_camx -500 ,_camy + 500,_camz+450];
	
	_cam CamSetTarget player;
	_cam CameraEffect ["Internal","Back"];
	_cam CamCommit 0;
	
	_cam camsetpos [_camx -15 ,_camy + 15,_camz+3];
	playMusic "Intro";
	titleText ["A L i V E - N A T O F O R   Persistent for I T G C", "BLACK IN",10];
	10 fadesound 0.9;
	_cam CamCommit 20;
	sleep 5;
	sleep 15;
			
	_cam CameraEffect ["Terminate","Back"];
	CamDestroy _cam;

};
if (!hasInterface && !isDedicated) then {
	headlessClients = [];
	headlessClients set [(count headlessClients), player];
	publicVariable "headlessClients";
	isHC = true;
};