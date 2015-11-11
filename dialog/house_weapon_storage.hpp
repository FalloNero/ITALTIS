/*
	Author: Bryan "Tonic" Boardwine
	Website: www.iamtonic.co
	Use of the VAS system is permitted although modification and distribution must be approved by Tonic.
*/

//#include "common.hpp"

class HouseWeaponStorage {
	idd = 8700;
	name= "HouseWeaponStorage";
	movingEnable = 1;
	enableSimulation = true;
	onLoad = "";
	onUnload = "WS_filter = nil";
	
	class controlsBackground {
		class VAS_RscTitleBackground:VAS_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class MainBackground:VAS_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (22 / 250);
		};
		
		class vasText : VAS_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Storage";
			sizeEx = 0.04;
			x = 0.12; y = 0.27;
			w = 0.275; h = 0.04;
		};
		
		class vasgText : VAS_RscText
		{
			idc = 8721;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Your Backpack";
			sizeEx = 0.04;
			
			x = 0.60; y = 0.27;
			w = 0.275; h = 0.04;
		};
		
		class VAS_ContainerBG : VAS_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = 8701;
			x = 0.905;
			y = 0.2 + (11 / 250);
			w = 0.09;
			h = 0.235 - (22 / 250);
		};
		
		class VAS_VestBG : VAS_ContainerBG
		{
			idc = 8702;
			y = 0.35 + (11 / 250);
		};
		
		class VAS_BackpackBG : VAS_ContainerBG
		{
			idc = 8703;
			y = 0.5 + (11 / 250);
		};
		
		class VAS_UniformPicSlot : VAS_ActiveTextPicture
		{
			idc = 8704;
			text = "";
			onLBDrop = "";
			x = 0.905;
			y = 0.25;
			w = "3 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "3 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VAS_VestPicSlot : VAS_UniformPicSlot
		{
			idc = 8705;
			text = "";
			onLBDrop = "";
			y = 0.395;
		};
		
		class VAS_BackpackPicSlot : VAS_UniformPicSlot
		{
			idc = 8706;
			text = "";
			onLBDrop = "";
			y = 0.55;
		};
		
		class VAS_loadBarP : VAS_RscProgress
		{
			idc = 8707;
			texture = "";
			textureExt = "";
			colorBar[] = {0.9,0.9,0.9,0.9};
			colorExtBar[] = {1,1,1,1};
			colorFrame[] = {1,1,1,1};
			x = 0.9075;
			y = 0.371;
			w = 0.086;
			h = 0.015;
		};
		
		class VAS_VestLoad : VAS_loadBarP
		{
			idc = 8708;
			y = 0.52;
		};
		
		class VAS_BackpackLoad : VAS_loadBarP
		{
			idc = 8709;
			y = 0.67;
		};
	};
	
	class controls {
	/*
		class gundetailsbg : VAS_RscText
		{
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 8710;
			text = "";
			
			x = -0.205;
			y = 0.2 + (11 / 250);
			w = 0.3;
			h = 0.35 - (22 / 250);
		};
		
		class AttachmentsBG : VAS_RscText
		{
			colorBackground[] = {0,0,0,0.7};
			idc = 8711;
			text = "";
			x = -0.205;
			y = 0.47 + (11 / 250);
			w = 0.3;
			h = 0.32 - (22 / 250);
		};
		
		class AttachmentsList : VAS_RscListBox
		{
			colorBackground[] = {0,0,0,0};
			idc = 8712;
			text = "";
			onLBDblClick = "";
			canDrag = 1;
			sizeEx = 0.035;
			x = -0.2; y = 0.47 + (11 / 250);
			w = 0.29; h = 0.32 - (22 / 250);
		};
		
		class gundetails : VAS_RscStructuredText
		{
			idc = 8713;
			text = "";
			//text = "<t align='center'>EBR 21 7.62 mm Uses:</t>";
			x = -0.265;
			y = 0.21 + (11 / 250);
			w = 0.4; h = 0.15;
		};
		
		class gundetailslist : VAS_RscListBox
		{
			colorBackground[] = {0,0,0,0};
			idc = 8714;
			text = "";
			canDrag = 1;
			onLBDblClick = "";
			sizeEx = 0.030;
			
			x = -0.2; y = 0.3;
			w = 0.29; h = 0.16;
		};
		*/
		class vasGear : VAS_RscListBox 
		{
			idc = 8715;
			text = "";
			sizeEx = 0.032;
			canDrag = 1;
			onLBSelChanged = "";
			onLBDblClick = "";
			
			x = 0.12; y = 0.31;
			w = 0.275; h = 0.340;
		};
		
		class vasPGear : VAS_RscListBox 
		{
			idc = 8716;
			text = "";
			sizeEx = 0.032;
			onLBDblClick = "";
			//onLBSelChanged = "[2502] execVM 'gear\selection.sqf'";
			
			x = 0.60; y = 0.31;
			w = 0.275; h = 0.340;
		};
		
		class WeaponsBtn : VAS_RscButtonMenu
		{
			idc = -1;
			text = "Weapons";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "WS_filter = ['weapons', 'weapons'];[(WS_filter select 0)] call life_fnc_updateWeaponStorage;[(WS_filter select 1)] call life_fnc_updatePlayerGear;";
			x = 0.42; y = 0.30;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class MagazinesBtn : VAS_RscButtonMenu
		{
			idc = -1;
			text = "Magazines";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "WS_filter = ['magazines', 'magazines'];[(WS_filter select 0)] call life_fnc_updateWeaponStorage;[(WS_filter select 1)] call life_fnc_updatePlayerGear;";
			x = 0.42; y = 0.35;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class ItemsBtn : VAS_RscButtonMenu
		{
			idc = -1;
			text = "Items";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "WS_filter = ['items', 'items'];[(WS_filter select 0)] call life_fnc_updateWeaponStorage;[(WS_filter select 1)] call life_fnc_updatePlayerGear;";
			x = 0.42; y = 0.40;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class BackpacksBtn : VAS_RscButtonMenu
		{
			idc = -1;
			text = "Clothes";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "WS_filter = ['backpacks', 'backpacks'];[(WS_filter select 0)] call life_fnc_updateWeaponStorage;[(WS_filter select 1)] call life_fnc_updatePlayerGear;";
			x = 0.42; y = 0.45;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class PrimaryBtn : VAS_RscButtonMenu
		{
			idc = -1;
			text = "Primary Items";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "WS_filter = ['primary', 'primary'];[(WS_filter select 0)] call life_fnc_updateWeaponStorage;[(WS_filter select 1)] call life_fnc_updatePlayerGear;";
			x = 0.42; y = 0.50;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class HandgunBtn : VAS_RscButtonMenu
		{
			idc = -1;
			text = "Handgun Items";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "WS_filter = ['handgun', 'handgun'];[(WS_filter select 0)] call life_fnc_updateWeaponStorage;[(WS_filter select 1)] call life_fnc_updatePlayerGear;";
			x = 0.42; y = 0.55;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		/*
		class GogglesBtn : VAS_RscButtonMenu
		{
			idc = -1;
			text = "Goggles";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "['goggles'] call life_fnc_updateWeaponStorage;";
			x = 0.42; y = 0.50;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		*/
		
		class Title : VAS_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "House Weapon Storage";
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class VersionNumber : Title {
			idc = 8720;
			style = 1;
			text = "";
		};

		class ButtonAddG : VAS_RscButtonMenu
		{
			idc = -1;
			text = "Add";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_addItemToStorage";
			
			x = 0.13;
			y = 0.67;
			w = (10 / 40);
			h = (1 / 25);
		};
		class ButtonRemoveG : VAS_RscButtonMenu
		{
			idc = -1;
			text = "Remove";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] call life_fnc_removeItemFromStorage";
			
			x = 0.61;
			y = 0.67;
			w = (10 / 40);
			h = (1 / 25);
		};
		
		class ButtonClose : VAS_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.1;
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};