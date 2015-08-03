//by Bon_Inf*


BON_RECRUIT_PATH = "bon_recruit_units\";

bon_max_units_allowed = 10;

bon_recruit_limitation = -1; // limit times recruitment action is available. negative number means unlimited.


bon_recruit_queue = [];

if(isServer) then{
	"bon_recruit_newunit" addPublicVariableEventHandler {
		_newunit = _this select 1;
		[_newunit] execFSM (BON_RECRUIT_PATH+"unit_lifecycle.fsm");
	};
};
if(isDedicated) exitWith{};


// Client stuff...