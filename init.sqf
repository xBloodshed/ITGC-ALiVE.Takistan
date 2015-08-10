//////////////////////////////
//--ALiVE TAKISTAN NATOFOR--//
//-------By M4RT14L---------//
//////////////////////////////

#include "funcs\compile_funcs.sqf"
#include "initBriefing.sqf";
execVM "headlessClient\passToHCs.sqf";
enableSaving [false,false];

//Funciones---------------------//
call compile preprocessfile "globaltools.sqf";
call compile preprocessfile "addactions.sqf";
call compile preprocessFileLineNumbers "removeTasks.sqf";
//------------------------------//

//Scripts-----------------------//
[] execVM "bon_recruit_units\init.sqf";
[] execVM "scripts\prayer.sqf";
//------------------------------//

//Others-----------------------//
[] execVM "zlt_fastrope.sqf";
//-----------------------------------//

tf_no_auto_long_range_radio = true;
  
if (!hasInterface) then {
	headlessClients = [];
	headlessClients set [(count headlessClients), player];
	publicVariable "headlessClients";
	isHC = true;
};


if (hasInterface) then {
	titleText ["For ITGC by X B L O O D S H E D...", "BLACK IN",9999];
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
	
	titleText ["T A K I S T A N   C O N T R O L  for  I T G C  by  X B L O O D S H E D", "BLACK IN",10];
	10 fadesound 0.9;
	_cam CamCommit 20;
	sleep 5;
	sleep 15;
			
	_cam CameraEffect ["Terminate","Back"];
	CamDestroy _cam;

};