class cellphone_menu {
	idd = 3200;
	name= "cellphone_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = 3214;
			text = "Telefono ";
			x = 0.0;
			y = 0.0;
			w = 1;
			h = (1 / 25);
		};
		
		class Life_RscFooterBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.6])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.4019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = 3215;
			text = "L'Abuso della chiamata di emergenza sarà punito!";
			x = 0.0;
			y = 0.77 - (1 / 25);
			w = 1;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.0;
			y = 0.0 + (11 / 250);
			w = 1.0;
			h = 0.77 - (22 / 250);
		};
		
		class playerlistText : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "GIOCATORI";
			sizeEx = 0.04;
			x = 0.01; y = 0.07;
			w = 0.22; h = 0.04;
		};
		
		class choosenPlayerText : Life_RscText
		{
			idc = 3217;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Nessun giocatore selezionato!";
			sizeEx = 0.04;
			x = 0.265; y = 0.675;
			w = 0.290; h = 0.04;
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

		class playerSearch : Life_RscEdit 
		{
			idc = 3201;
			text = "";
			sizeEx = 0.030;
			x = 0.01; y = 0.11;
			w = 0.22; h = 0.03;
			
			onKeyUp = "[1] call life_fnc_cellphonePlayer;";
		};
	
		class playerList : Life_RscListBox 
		{			
			idc = 3202;
			text = "";
			sizeEx = 0.030;
			
			x = 0.01; y = 0.14;
			w = 0.22; h = 0.52;
			
			onLBSelChanged = "[2,_this select 1] call life_fnc_cellphonePlayer;";
		};

		
		class ButtonSendMessage : Life_RscButtonMenu
		{
			idc = 3207;
			text = "Scrivi";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			
			onButtonClick = "[0] call life_fnc_setupCallmenu;";
			
			x = 0.01;
			y = 0.675;
			w = 0.245;
			h = (1 / 25);
		};
		
		class ButtonAdminALL : Life_RscButtonMenu
		{
			idc = 3220;
			text = "Scrittura";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[3] call life_fnc_setupCallmenu;";
			
			x = 0.667;
			y = 0.675;
			w = 0.31;
			h = (1 / 25);
		};
		
		class ButtonEmergency : Life_RscButtonMenu
		{
			idc = 3209;
			text = "EMERGENZA";
			colorBackground[] = {0.9, 0.11, 0.14, 0.5};
			onButtonClick = "[2] spawn life_fnc_setupCallmenu;";
			
			x = 0.827;
			y = 0.675;
			w = 0.15;
			h = (1 / 25);
		};
		
		class ButtonClose : Life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "CHIUDI";
			onButtonClick = "closeDialog 0;";
			x = 0.0;
			y = 0.82 - (1 / 25);
			w = 0.17;
			h = (1 / 25);
		};
		
		class ButtonSwitchPolice : Life_RscButtonMenu {
			idc = 3211;
			text = "POLIZIA";
			onButtonClick = "[2] spawn life_fnc_setupCellphonemenu;";
			x = 0.36;
			y = 0.82 - (1 / 25);
			w = 0.17;
			h = (1 / 25);
		};
		
		class ButtonSwitchNormalFromPolice : Life_RscButtonMenu {
			idc = 3218;
			text = "NORMALE";
			onButtonClick = "[0] spawn life_fnc_setupCellphonemenu;";
			x = 0.36;
			y = 0.82 - (1 / 25);
			w = 0.17;
			h = (1 / 25);
		};
		
		class ButtonSwitchAdmin : Life_RscButtonMenu {
			idc = 3212;
			text = "ADMIN";
			onButtonClick = "[3] spawn life_fnc_setupCellphonemenu;";
			x = 0.54;
			y = 0.82 - (1 / 25);
			w = 0.17;
			h = (1 / 25);
		};
		
		class ButtonSwitchNormalFromAdmin : Life_RscButtonMenu {
			idc = 3219;
			text = "NORMALE";
			onButtonClick = "[0] spawn life_fnc_setupCellphonemenu;";
			x = 0.54;
			y = 0.82 - (1 / 25);
			w = 0.17;
			h = (1 / 25);
		};
	};
};