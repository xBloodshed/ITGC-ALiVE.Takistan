_nato_squadleader = "B_Soldier_TL_F";
_nato_eodteam = "B_Soldier_SL_F";
_nato_crewman = "B_crew_F";
_nato_pilot = "B_Helipilot_F";
_nato_commander = "B_officer_F";


switch (typeOf player) do{
	case _nato_squadleader : {
		bon_recruit_recruitableunits = [
			"B_Soldier_F",
			"B_Soldier_GL_F",
			"B_soldier_M_F",
			"B_soldier_LAT_F",
			"B_medic_F",
			"B_Soldier_A_F",
			"B_soldier_AR_F"
		];
	};

	case _nato_eodteam : {
		bon_recruit_recruitableunits = [
			"B_soldier_repair_F",
			"B_soldier_exp_F",
			"B_Soldier_GL_F",
			"B_medic_F",
			"B_soldier_AR_F",
			"B_soldier_LAT_F"
		];
	};

	case _nato_pilot : {
		bon_recruit_recruitableunits = [
			"B_Helipilot_F"
		];
	};

	case _nato_crewman : {
		bon_recruit_recruitableunits = [
			"B_crew_F"
		];
	};

	case _nato_commander : {
		bon_recruit_recruitableunits = [
			"B_engineer_F",
			"B_soldier_AT_F",
			"B_soldier_AA_F",
			"B_medic_F",
			"B_soldier_M_F"
		];
	};

	default {bon_recruit_recruitableunits = []};
};