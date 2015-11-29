class call_menu {
	idd = 3700;
	name= "call_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = 3701;
			text = "Kontaktmenü";
			x = 0.0;
			y = 0.3;
			w = 1;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.0;
			y = 0.344;
			w = 1.0;
			h = 0.125;
		};
		
			class fondtablet: Life_RscPicture
			{
			idc = 9090909;
			text = "texture\menu.paa";
			x = 0;
			y = -0.12;
			w = 1;
			h = 1.28;
			};
		

	};
	
	class controls {

		class messageTXT : Life_RscEdit 
		{
			colorBackground[] = {0, 0, 0, 0.9};
			idc = 3702;
			text = "";
			sizeEx = 0.035;
			x = 0.01; y = 0.31 + (11 / 250);
			w = 0.98; h = 0.045;
		};
		
		class ButtonOne : Life_RscButtonMenu
		{
			idc = 3703;
			text = "Nachricht";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[0] spawn life_fnc_callSendMsg;";
			
			x = 0.01;
			y = 0.419;
			w = 0.2375;
			h = (1 / 25);
		};
		
		class ButtonOneOne : Life_RscButtonMenu
		{
			idc = 3707;
			text = "Polizei Schreiben";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[3] spawn life_fnc_callSendMsg;";
			
			x = 0.01;
			y = 0.419;
			w = 0.2375;
			h = (1 / 25);
		};
		
		class ButtonTwo : Life_RscButtonMenu
		{
			idc = 3704;
			text = "Anrufen";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "";
			
			x = 0.2575;
			y = 0.419;
			w = 0.2375;
			h = (1 / 25);
		};
		
		class ButtonTwoTwo : Life_RscButtonMenu
		{
			idc = 3708;
			text = "Polizei Anrufen";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "";
			
			x = 0.2575;
			y = 0.419;
			w = 0.2375;
			h = (1 / 25);
		};
		
		class ButtonThree : Life_RscButtonMenu
		{
			idc = 3705;
			text = "Medic Schreiben";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[4] spawn life_fnc_callSendMsg;";
			
			x = 0.505;
			y = 0.419;
			w = 0.2375;
			h = (1 / 25);
		};
		
		class ButtonFour : Life_RscButtonMenu
		{
			idc = 3706;
			text = "Medic Anrufen";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "";
			
			x = 0.7525;
			y = 0.419;
			w = 0.2375;
			h = (1 / 25);
		};
		
		class ButtonFourFour : Life_RscButtonMenu
		{
			idc = 3709;
			text = "Allen Schreiben";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[6] spawn life_fnc_callSendMsg;";
			
			x = 0.7525;
			y = 0.419;
			w = 0.2375;
			h = (1 / 25);
		};
		
		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.0;
			y = 0.472;
			w = 0.17;
			h = (1 / 25);
		};
		
		class ButtonAdmin : Life_RscButtonMenu {
			idc = 3715;
			//shortcuts[] = {0x00050000 + 2};
			text = "Admin Schreiben";
			onButtonClick = "[5] spawn life_fnc_callSendMsg;";
			x = 0.18;
			y = 0.472;
			w = 0.2;
			h = (1 / 25);
		};
	};
};