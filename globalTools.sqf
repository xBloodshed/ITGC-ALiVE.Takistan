//--By Kylania-----------------//
//-----------------------------//

//ENABLE GLOBAL HINT
"GlobalHint" addPublicVariableEventHandler
{private ["_GHint"];_GHint = _this select 1;hint parseText format["%1", _GHint];
};

"GlobalSideChat" addPublicVariableEventHandler
{private ["_GSChat"];_GSChat = _this select 1;player sideChat _GSChat;
};
