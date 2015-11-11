class Life_Vehicle_Shop_v2
{
	idd = 2300;
	name="life_vehicle_shop";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "ctrlShow [2330,false];";
	
	class controlsBackground
	{
		class Life_RscTitleBackground : Life_RscText
		{
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.334943 * safezoneH + safezoneY;
			w = 0.474375 * safezoneW;
			h = 0.0220077 * safezoneH;
		};
		
		class MainBackground : Life_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = -1;
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.35695 * safezoneH + safezoneY;
			w = 0.474375 * safezoneW;
			h = 0.336717 * safezoneH;
		};
		
		class Title : Life_RscTitle
		{
			idc = 2301;
			text = "";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.334943 * safezoneH + safezoneY;
			w = 0.474375 * safezoneW;
			h = 0.0220077 * safezoneH;
		};
		
		class VehicleTitleBox : Life_RscText
		{
			idc = -1;
			text = "$STR_GUI_ShopStock";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.367954 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.0220077 * safezoneH;
		};
		
		class VehicleInfoHeader : Life_RscText
		{
			idc = 2330;
			text = "$STR_GUI_VehInfo";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.367954 * safezoneH + safezoneY;
			w = 0.18975 * safezoneW;
			h = 0.0220077 * safezoneH;
		};
		
		class CloseBtn : Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.698069 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.0220077 * safezoneH;
		};
		
		class RentCar : Life_RscButtonMenu
		{
			idc = -1;
			text = "$STR_Global_RentVeh";
			onButtonClick = "[false] spawn life_fnc_vehicleShopBuy;";
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.698069 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.0220077 * safezoneH;
		};
		
		class BuyCar : life_RscButtonMenu 
		{
			idc = 2309;
			text = "$STR_Global_Buy";
			onButtonClick = "[true] spawn life_fnc_vehicleShopBuy;";
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.698069 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.0220077 * safezoneH;
		};
	};
	
	class controls
	{
		class VehicleList : Life_RscListBox
		{
			idc = 2302;
			text = "";
			sizeEx = 0.04;
			colorBackground[] = {0.1,0.1,0.1,0.9};
			onLBSelChanged = "_this call life_fnc_vehicleShopLBChange";
			
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.389962 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.269594 * safezoneH;
		};
		
		class ColorList : Life_RscCombo
		{
			idc = 2304;
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.665057 * safezoneH + safezoneY;
			w = 0.124987 * safezoneW;
			h = 0.0165057 * safezoneH;
		};
		
		class vehicleInfomationList : Life_RscStructuredText
		{
			idc = 2303;
			text = "";
			sizeEx = 0.035;
			
			x = 0.536094 * safezoneW + safezoneX;
			y = 0.389962 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.275096 * safezoneH;
		};
	};
};