bon_recruit_barracks = _this select 0;
createDialog "RecruitUnitsDialog";

bon_recruit_limitation = bon_recruit_limitation - 1;
if(bon_recruit_limitation == 0) then{
	(_this select 0) removeAction (_this select 2);
};