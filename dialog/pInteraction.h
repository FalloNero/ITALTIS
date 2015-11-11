#define BGX 0.35
#define BGY 0.2
#define BGW 0.3

class pInteraction_Menu
{
	idd = 37400;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class RscTitleBackground:life_RscText 
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.709073 * safezoneH + safezoneY;
			w = 0.3 * safezoneW;
			h = 0.045 * safezoneH;
		};
				
		class Title : life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = 37401;
			text = "$STR_pInAct_Title";
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.709073 * safezoneH + safezoneY;
			w = 0.3 * safezoneW;
			h = 0.045 * safezoneH;
		};
	};
	
	class controls
	{
		class ButtonClose : life_RscButtonMenu 
		{
			idc = 37449;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.632046 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.06 * safezoneH;
		};
		
		class ButtonOne : life_RscButtonMenu
		{
			idc = 37450;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.665 * safezoneW + safezoneX;
			y = 0.334943 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.045 * safezoneH;
		};
		
		class ButtonTwo : life_RscButtonMenu
		{
			idc = 37451;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.685625 * safezoneW + safezoneX;
			y = 0.400966 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.045 * safezoneH;
		};
		
		class ButtonThree : life_RscButtonMenu
		{
			idc = 37452;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.466989 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.045 * safezoneH;
		};
		
		class ButtonFour : life_RscButtonMenu
		{
			idc = 37453;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.685625 * safezoneW + safezoneX;
			y = 0.533011 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.045 * safezoneH;
		};
		
		class ButtonFive : life_RscButtonMenu
		{
			idc = 37454;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.665 * safezoneW + safezoneX;
			y = 0.599034 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.045 * safezoneH;
		};
		
		class ButtonSix : life_RscButtonMenu
		{
			idc = 37455;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.175156 * safezoneW + safezoneX;
			y = 0.334943 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.045 * safezoneH;
		};
		
		class ButtonSeven : life_RscButtonMenu
		{
			idc = 37456;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.400966 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.045 * safezoneH;
		};
		
		class ButtonEight : life_RscButtonMenu
		{
			idc = 37457;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.133906 * safezoneW + safezoneX;
			y = 0.466989 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.045 * safezoneH;
		};
		
		class ButtonNine : life_RscButtonMenu
		{
			idc = 37458;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.533011 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.045 * safezoneH;
		};
		
		class ButtonTen : life_RscButtonMenu
		{
			idc = 37459;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.175156 * safezoneW + safezoneX;
			y = 0.599034 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.045 * safezoneH;
		};
	};
};

class vInteraction_Menu
{
	idd = 37400;
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class RscTitleBackground:life_RscText 
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.709073 * safezoneH + safezoneY;
			w = 0.3 * safezoneW;
			h = 0.045 * safezoneH;
		};
		
		class Title : life_RscTitle
		{
			colorBackground[] = {0,0,0,0};
			idc = 37401;
			text = "$STR_vInAct_Title";
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.709073 * safezoneH + safezoneY;
			w = 0.3 * safezoneW;
			h = 0.045 * safezoneH;
		};
	};
	
	class controls
	{
		class ButtonClose : life_RscButtonMenu 
		{
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.632046 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.06 * safezoneH;
		};
		
		class ButtonOne : life_RscButtonMenu
		{
			idc = 37450;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.665 * safezoneW + safezoneX;
			y = 0.334943 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.045 * safezoneH;
		};
		
		class ButtonTwo : life_RscButtonMenu
		{
			idc = 37451;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.685625 * safezoneW + safezoneX;
			y = 0.400966 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.045 * safezoneH;
		};
		
		class ButtonThree : life_RscButtonMenu
		{
			idc = 37452;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.466989 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.045 * safezoneH;
		};
		
		class ButtonFour : life_RscButtonMenu
		{
			idc = 37453;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.685625 * safezoneW + safezoneX;
			y = 0.533011 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.045 * safezoneH;
		};
		
		class ButtonFive : life_RscButtonMenu
		{
			idc = 37454;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.665 * safezoneW + safezoneX;
			y = 0.599034 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.045 * safezoneH;
		};
		
		class ButtonSix : life_RscButtonMenu
		{
			idc = 37455;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.175156 * safezoneW + safezoneX;
			y = 0.334943 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.045 * safezoneH;
		};
		
		class ButtonSeven : life_RscButtonMenu
		{
			idc = 37456;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.400966 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.045 * safezoneH;
		};
		
		class ButtonEight : life_RscButtonMenu
		{
			idc = 37457;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.133906 * safezoneW + safezoneX;
			y = 0.466989 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.045 * safezoneH;
		};
		
		class ButtonNine : life_RscButtonMenu
		{
			idc = 37458;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.154531 * safezoneW + safezoneX;
			y = 0.533011 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.045 * safezoneH;
		};
		
		class ButtonTen : life_RscButtonMenu
		{
			idc = 37459;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.175156 * safezoneW + safezoneX;
			y = 0.599034 * safezoneH + safezoneY;
			w = 0.16 * safezoneW;
			h = 0.045 * safezoneH;
		};
	};
};