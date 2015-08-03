// by Bon_Inf*
// executed by player action

_grabbee = _this select 0;
_grabber = _this select 1;
_callid = _this select 2;

_grabbee removeAction _callid;
detach _grabbee;


_grabbee disableAI "MOVE";
_grabbee disableAI "ANIM";

_grabbee attachTo [_grabber,[0,1,0]];


[_grabbee,_grabber] spawn {

	_grabbee = _this select 0;
	_grabber = _this select 1;

	_time = time;

	While{time < _time + 5} do {
		if(speed _grabber > 10) then{detach _grabbee};
		sleep 0.5;
	};

};

sleep 15;


detach _grabbee;

_grabbee enableAI "MOVE";
_grabbee enableAI "ANIM";


_grabbee addAction ["<t color='#FF6600'>Grab</t>","scripts\grab.sqf"];

