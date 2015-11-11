class fms_pager {
	idd = 2800;
	name= "fms_pager";
	movingEnable = true;
	enableSimulation = true;
	duration=99999999999;
	fadein=0;
	fadeout=0;
	onLoad="";

	class controlsBackground {
		class FMS_Background:Life_RscText
		{
			idc = 2801;
			x = 1.3;
			y = 0.9;
			w = 0.4;
			h = 0.15;
			colorBackground[] = {0.2, 0.2, 0.2, 0.7};
		};
		class FMS_Display:Life_RscStructuredText
		{
			idc = 2802;
			x = 1.305;
			y = 0.905;
			w = 0.39;
			h = 0.14;
			colorBackground[] = {0.2,0.6,0.2,0.7};
			text = "FMS System Offline";
			//text = "FMS: Police<t align='right'>[Sergeant] mario-to-flop</t><br/>Group: Juilett<t align='right'>2 In Anfahrt</t><br/>Einsatz: Überfall 158.154<br/>Informationen: Hilfe am Peachfeld überfall!! Kommen sie schnell...."; //--- ToDo: Localize;
			class Attributes {
				color = "#DBDBDB";
				size = "0.70";
			};
		};
	};
};

class phone_display {
	idd = 3600;
	name= "phone_display";
	movingEnable = true;
	enableSimulation = true;
	duration=9999999;
	fadein=0;
	fadeout=0;

	class controlsBackground {
		class PHONE_Background:Life_RscText
		{
			idc = 3601;
			moving = 1;
			x = 1.5;
			y = 0.6;
			w = 0.2;
			h = 0.15;
			colorBackground[] = {0.2, 0.2, 0.2, 0.7};
		};
		class PHONE_Display:Life_RscStructuredText
		{
			idc = 3602;
			x = 1.505;
			y = 0.605;
			w = 0.19;
			h = 0.14;
			colorBackground[] = {0.95,0.7,0,0.7};
			text = "Cellulare Offline";
			class Attributes {
				color = "#E6E6E6";
				size = "0.80";
			};
		};
	};
};