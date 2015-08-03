////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by M4RT14L, v1.063, #Bomavo)
////////////////////////////////////////////////////////
class M4RT14L_DIALOG
{
	idd = -1;
	movingenable = false;
	
	class controls
	{
		
		class M4RT14L_BOX: BOX
		{
			idc = 1800;
			text = ""; //--- ToDo: Localize;
			x = 0.252969 * safezoneW + safezoneX;
			y = 0.211 * safezoneH + safezoneY;
			w = 0.502031 * safezoneW;
			h = 0.544 * safezoneH;
		};
		class M4RT14L_FRAME: RscFrame
		{
			idc = 1800;
			text = "CENTCOM"; //--- ToDo: Localize;
			x = 0.252969 * safezoneW + safezoneX;
			y = 0.211 * safezoneH + safezoneY;
			w = 0.502031 * safezoneW;
			h = 0.544 * safezoneH;
		};
		class boton1: RscButton
		{
			idc = 1600;
			text = "Request Air Ops"; //--- ToDo: Localize;
			x = 0.547813 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.068 * safezoneH;
			action = "closeDialog 0;[[[],'Rtask\missionAir.sqf'],'BIS_fnc_execVM',false] call BIS_fnc_MP;";
		};
		class boton2: RscButton
		{
			idc = 1601;
			text = "Request Clear Ops"; //--- ToDo: Localize;
			x = 0.547813 * safezoneW + safezoneX;
			y = 0.449 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.068 * safezoneH;
			action = "closeDialog 0;[[[],'Rtask\missionClear.sqf'],'BIS_fnc_execVM',false] call BIS_fnc_MP;";
		};
		class boton3: RscButton
		{
			idc = 1602;
			text = "Request Support Ops"; //--- ToDo: Localize;
			x = 0.547813 * safezoneW + safezoneX;
			y = 0.619 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.068 * safezoneH;
			action = "closeDialog 0;[[[],'Rtask\missionSupport.sqf'],'BIS_fnc_execVM',false] call BIS_fnc_MP;";
		};
		class botoncierre: RscButton
		{
			idc = 1603;
			text = "CLOSE MENU"; //--- ToDo: Localize;
			x = 0.276875 * safezoneW + safezoneX;
			y = 0.619 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.068 * safezoneH;
			onButtonClick = "closeDialog 0";
		};
		class ZONA_PIC: RscPicture
		{
			idc = 1200;
			text = "pics\mapa.paa";
			x = 0.276874 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.239063 * safezoneW;
			h = 0.306 * safezoneH;
		};
		
	};
	
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

