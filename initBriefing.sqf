// Normal briefing

if (!hasInterface) exitWith {};

waitUntil {!isNull player};

player createDiarySubject ["support", "OP Support"];
player createDiarySubject ["operations", "Operations"];
player createDiarySubject ["credits", "Credits"];


player createDiaryRecord [
	"credits", 
	[
		"AUTHOR AND ACKNOWLEDGMENTS", 
		"<br />Edited and customized for ITGC by <font face='PuristaBold' size='22'>xBloodshed</font><br />
		<br/>Created by Master-Antonio and M4RT14L , we appreciate your work->
		<br/>Shuko, Bon_Inf*, Creobellum, and kylania for their fantastic scripts and everything I learned,
		<br/>To the ALiVE Team by this amazing tool,
		<br/>Nashable for nash_zeus_mhq, be sure to visit www.playdefiance.com,
		<br/>Red Hammer Studios for RHS,
		<br/>Leight for his Opfor Pack
		<br/>kju for All In ArmA Terrain pack,
		<br/>Larrow for LAR-fnc_removetasks,
		<br/>Valixx and kylania for his work scripting Random Objectives,
		<br/>pokertour for =ATM= Airdrop,
		<br/>The fantastic community of BIS Forums that no cease to work to improve ArmA III."
	]
];

player createDiaryRecord [
	"support", 
	[
		"SUPPORT", 
		"<br/>There are some support elements deployed in Loy Manara AB, for use with Laser Designators.
		<br/><br/>- <font face='PuristaBold'>VECTOR ONE and VECTOR TWO</font> for maneuver support,
		<br/>- <font face='PuristaBold'>SCIMITAR ONE</font> for CAS,
		<br/>- <font face='PuristaBold'>STEEL RAIN ONE</font> for Artillery Fire Support,
		<br/>- The Commander asistant/UAV CCT can deploy UAVs or UGVs from <marker name='command'>here</marker>
		<br/><br />You can perform HALO Jump from <marker name='command_2'>here</marker>."
	]
];

player createDiaryRecord [
	"Diary", 
	[
		"ZEUS", 
		"<br/>The commander can use ZEUS for various tasks and is assigned as a game master,
		<br/>Editing Area around MHQ now is 50 meters,
		<br/>My thanks to Nashable for giving me permission to use nash_zeus_mhq script."
	]
];

player createDiaryRecord [
	"Diary", 
	[
		"NOTES", 
		"<br/>There are two respawn points <marker name='respawn_west'>Loy Manara AB</marker> and <marker name='respawn_west_1'>Garmsar FSB</marker>.
		<br/>BIS Revive.
		<br/>Virtual Arsenal <marker name='VAS'>here</marker> and <marker name='VAS_1'>here</marker>.  
		<br/>Team Leaders can recruit AI´s <marker name='command_2'>here</marker> and <marker name='command_3'>here</marker> thanks to Bon_Inf* for Bon_AI_Recruitment script."
	]
];

player createDiaryRecord [
	"operations", 
	[
		"OPERATIONS", 
		"<br />You can select the Random Task from <marker name='command'>here</marker> and <marker name='command_1'>here</marker> <br />"
	]
];

player createDiaryRecord [
	"operations", 
	[
		"AIR OPERATIONS", 
		"<br/><font face='PuristaBold'>DESTROY MOBILE ARTILLERY</font> - eliminate two enemy MAT pieces.
		<br/><font face='PuristaBold'>DESTROY WAREHOUSE</font> - bomb CSAT supply depot.
		<br/><font face='PuristaBold'>CONVOY ATTACK</font> - eliminate a supply convoy.
		<br/><font face='PuristaBold'>CAS</font> - destroy CSAT armored platoon. <br />"
	]
];

player createDiaryRecord [
	"operations", 
	[
		"SUPPORT OPERATIONS", 
		"<br />
		<br/><font face='PuristaBold'>IED CLEAR</font> - must neutralize an IED, only specialists can disable explosives.
		<br/><font face='PuristaBold'>ROAD REPAIR</font> - must use the CRV and bring to the area to repair the road.
		<br/><font face='PuristaBold'>DEPLOY HQ</font> - carry and escort a supply truck to the area to deploy the HQ.
		<br/><font face='PuristaBold'>DELIVER SUPPLIES</font> - must escort a supply truck and take it to the ally C.O.P.
		<br/><font face='PuristaBold'>VEHICLE REPAIR</font> - must carry the CRV and tow the damaged vehicle to Repair service in Loy Manara Air Base.
		<br/><font face='PuristaBold'>MEDEVAC</font> - must evacuate the wounded in the AO to MASH in Loy Manara AB.
		<br/><font face='PuristaBold'>RECOVER UAV</font> - find the drone and retrieve intel.
		<br/><font face='PuristaBold'>CSAR</font> - Find the Pilot and evacuate to MASH in Loy Manara AB. <br />"
	]
];

player createDiaryRecord [
	"operations", 
	[
		"CLEAR AND COMBAT OPS", 
		"<br />
		<br/><font face='PuristaBold'>TAKE CONTROL</font> - take control of the town and eliminate or drive out CSAT forces.
		<br/><font face='PuristaBold'>KILL OFFICER</font> - must eliminate the insurgent officer.
		<br/><font face='PuristaBold'>DESTROY SUPPLIES</font> - must destroy an enemy supply truck.
		<br/><font face='PuristaBold'>DESTROY CAMPSITE</font> - must find and destroy the enemy camp.
		<br/><font face='PuristaBold'>DESTROY COMMS</font> - must destroy a mobile communications module.
		<br/><font face='PuristaBold'>TAKE CONTROL</font> - take control of the town and eliminate or drive out Insurgent forces.
		<br/><font face='PuristaBold'>DESTROY SPAA</font> - Find and destroy enemy SPAA Placement.
		<br/><font face='PuristaBold'>CAPTURE WARLORD</font> - Find the insurgent Leader and bring it to Loy Manara AB."
	]
];

player createDiaryRecord [
	"Diary", 
	[
		"MISSION", 
		"Our goal is to resist and maintain our positions in the area of Takistan. <br /><br />
		We face two forces :
		<br /><font face='PuristaBold' color='#C72A3C'>Islamic State of Takistan and Sahrani</font>
		<br />ISTS troops are well equipped, organized and have been proven effective in combat.
		<br/><font face='PuristaBold' color='#C72A3C'>Takistan militia</font><br />Takistan Republican militias control most of the urban areas and press our positions continuously. Reportedly have good civilian support.
		<br/><br />Takistan roads are plagued by IED's. Do not forget to pay attention to this threat."
	]
];

player createDiaryRecord [
	"Diary", 
	[
		"SITREP", 
		"<br/><font face='PuristaBold' color='#C72A3C'>Takistan March 2014</font>
		<br/>Terrorist forces has set sights on the petroleum resources in Takistan. The discontent of the civilian population due to the NATO occupation increases each day and more fighters join the ranks of former Republican militias. The NATO command has decided that we stand here to prevent terrorist forces spread around the region.
		<br />
		<br /><font face='PuristaBold' color='#C72A3C'>Takistan February 2016</font>
		<br />ISTS units have joined forces with the local militias."
	]
];

