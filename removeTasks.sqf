//////////////////////////////////////////////////////////////////
// Function file for ArmA III
// Created by: LARROW
//////////////////////////////////////////////////////////////////
//Uso [west, "mob_arty"] call LARs_fnc_removeTask;
//init.sqf 
//call compile preprocessFileLineNumbers "removeTasks.sqf" 

if (isServer) then { 
    //[targets, taskid] call LARs_fnc_removeTask; 
    LARs_fnc_removeTask = { 
        _targets = [_this,0,true,[true,sideunknown,grpnull,objnull,[]]] call BIS_fnc_param; 
        _taskID = [_this,1,"",[""]] call BIS_fnc_param; 

        { 
            _target = _x; 
            switch (typeName _target) do { 
                //case (typeName objNull || typeName sideUnknown || typeName [] || typeName true): { 
                //    [[_taskID],"LARs_fnc_removeTaskLocal",_target,true] call BIS_fnc_MP; 
                //}; 
                case (typeName grpNull): { 
                    [[_taskID],"LARs_fnc_removeTaskLocal",units _target,true] call BIS_fnc_MP; 
                }; 
                default { 
                    [[_taskID],"LARs_fnc_removeTaskLocal",_target,true] call BIS_fnc_MP; 
                }; 
            }; 
        } foreach [_targets]; 
    }; 
}; 


if (!(isDedicated)) then { 
    //preprocess on clients 
    LARs_fnc_removeTaskLocal = { 
        _taskID = [_this,0,"",[""]] call BIS_fnc_param; 
        _taskVar = [_taskID] call BIS_fnc_taskVar; 
        missionNamespace setVariable [_taskVar,nil]; 
        player removeSimpleTask ([_taskID,player] call BIS_fnc_taskReal); 
        _playerTasks = player getVariable ["BIS_fnc_setTaskLocal_tasks",[]]; 
        _playerTasks = _playerTasks - [_taskID]; 
        player setVariable ["BIS_fnc_setTaskLocal_tasks", _playerTasks]; 
        _playerTaskVar = "BIS_fnc_taskvar_" + _taskID; 
        player setVariable [_playerTaskVar,nil]; 
    }; 
};  