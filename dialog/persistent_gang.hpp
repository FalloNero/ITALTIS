class Life_Persistent_Gang_Menu {
	idd = 8600;
	name= "life_persistent_gang_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[false] spawn life_fnc_persistentGangManagement;";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Persistent Gang Management";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class GangMemberList : Life_RscListBox 
		{
			idc = 8601;
			text = "";
			sizeEx = 0.035;
			
			x = 0.12; y = 0.26;
			w = 0.350; h = 0.370;
		};

		class CloseLoadMenu : Life_RscButtonMenu {
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangKick : Life_RscButtonMenu 
		{
			idc = 8603;
			text = "Kick";
			colorBackground[] = {1.0, 0, 0, 0.5};
			onButtonClick = "[] spawn life_fnc_kickPersistentGang";
			x = 0.50;
			y = 0.26;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangPromote : Life_RscButtonMenu 
		{
			idc = 8607;
			text = "Promote";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[1] spawn life_fnc_setMemberLevel";
			x = 0.50;
			y = 0.31;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangDegrade : Life_RscButtonMenu 
		{
			idc = 8608;
			text = "Degrade";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[-1] spawn life_fnc_setMemberLevel";
			x = 0.50;
			y = 0.36;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangLeave : Life_RscButtonMenu {
			idc = 8609;
			text = "Leave";
			colorBackground[] = {1.0, 0, 0, 0.5};
			onButtonClick = "closeDialog 0; [] call life_fnc_leavePersistentGang";
			x = 0.12; 
			y = 0.66;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangInvite : Life_RscButtonMenu 
		{
			idc = 8604;
			text = "Invite";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "closeDialog 0; createDialog ""life_invite_persistent_gang_menu"";";
			x = 0.12 + (6.25 / 40) + 0.005;
			y = 0.66;
			w = (6.25 / 40);
			h = (1 / 25);
		};		
		
		class GangDelete : Life_RscButtonMenu 
		{
			idc = 8605;
			text = "Delete";
			colorBackground[] = {1.0, 0, 0, 0.5};
			onButtonClick = "[] call life_fnc_deletePersistentGang";
			x = 0.12 + (6.25 / 40) + (6.25 / 40) + 0.01;
			y = 0.71;
			w = (6.25 / 40);
			h = (1 / 25);
		};		
		/*
		class GangBankAccount : Life_RscButtonMenu {
			idc = 8609;
			text = "Bank";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "closeDialog 0; createDialog ""life_gang_bank_account"";";
			x = 0.12; 
			y = 0.71;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		*/
		class GangName : Title {
			idc = 8606;
			style = 1;
			text = "";
		};
		
		class unlockDeleteEdit : Life_RscEdit {
        
			idc = 10211;
			
			text = "Type DELETE";
			sizeEx = 0.040;
			x = 0.12 + (6.25 / 40) + (6.25 / 40) + 0.01;
			y = 0.66;
			w = (6.25 / 40);
			h = (1 / 25);
			
			onKeyUp = "_display = findDisplay 8600; _btn = _display displayCtrl 8605; _text = _display displayCtrl 10211; if((ctrlText _text) == ""DELETE"") then { _btn ctrlEnable true } else { _btn ctrlEnable false };";
        
        };
	};
};

/**
 * Invitation menu
*/
class Life_Invite_Persistent_Gang_Menu {
	idd = 8620;
	name= "life_invite_persistent_gang_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[false] spawn life_fnc_fillInvitationPlayerList;";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Gang Invitation";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class GangMemberList : Life_RscListBox 
		{
			idc = 8621;
			text = "";
			sizeEx = 0.035;
			
			x = 0.12; y = 0.26;
			w = 0.350; h = 0.370;
		};

		class CloseLoadMenu : Life_RscButtonMenu {
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangCancelInvitaion : Life_RscButtonMenu {
			idc = -1;
			text = "Cancel";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "closeDialog 0; createDialog ""life_persistent_gang_menu"";";
			x = 0.50;
			y = 0.26;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class GangSendInvitation : Life_RscButtonMenu 
		{
			idc = 8622;
			text = "Invite";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_sendInvitation";
			x = 0.50;
			y = 0.31;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

class Life_Create_Persistent_Gang_Diag {
	idd = 8610;
	name= "life_persistent_gang_menu_create";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.5 - (22 / 250);
		};
	};
	
	class controls {
	
		class InfoMsg : Life_RscStructuredText
		{
			idc = -1;
			sizeEx = 0.020;
			text = "<t align='center'>To create a gang it costs $1,000,000</t>";
			x = 0.1;
			y = 0.25;
			w = 0.5; h = 0.32;
		};
		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Persistent Gang Management";
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};

		class CloseLoadMenu : Life_RscButtonMenu {
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class CreateGangText : Life_RscEdit
		{
			idc = 8611;
			text = "Your Gang Name";
			
			x = 0.04 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.35;
			w = (13 / 40);
			h = (1 / 25);
		};	
		
		class CreateGangTag : Life_RscEdit
		{
			idc = 8612;
			text = "Your Gang Tag";			
			x = 0.04 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.40;
			w = (13 / 40);
			h = (1 / 25);
		};
		
		class GangCreateField : Life_RscButtonMenu {
			idc = -1;
			text = "Create";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_createPersistentGang;";
			x = 0.27;
			y = 0.45;
			w = (6.25 / 40);
			h = (1 / 25);
		};	
	};
};

class Life_Gang_Invitation_Prompt
{
	idd = 8630;
	name = "life_gang_invitation_prompt";
	movingEnabled = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.67;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.3;
			y = 0.2 + (11 / 250);
			w = 0.67;
			h = 0.5 - (22 / 250);
		};
	};
	
	class controls 
	{
		class InfoMsg : Life_RscStructuredText
		{
			idc = 8631;
			sizeEx = 0.020;
			text = "";
			x = 0.4;
			y = 0.287 + (11 / 250);
			w = 0.5; 
			h = 0.12;
		};

		class life_gang_browse : Life_RscButtonMenu {
			idc = 8632;
			text = "Accept";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "closeDialog 0; life_gang_invitation_accepted = true;";
			x = 0.287 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class life_gang_create_button : Life_RscButtonMenu {
			idc = 8633;
			text = "Deny";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "closeDialog 0; life_gang_invitation_accepted = false;";
			x = 0.287 + (6.25 / 40) + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.42 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

class Life_Gang_Bank_Account
{
	idd = 8650;
	name = "life_gang_bank_account";
	movingEnabled = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_gangBankManagement;";
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls 
	{			
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Persistent Gang Bank Account";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class BankCash : Life_RscStructuredText
		{
			idc = 8651;
			sizeEx = 0.020;
			text = "0";
			x = 0.50;
			y = 0.26;
			w = (6.25 / 40);
			h = (1 / 25);
		};	
		
		class BankAccountEdit : Life_RscEdit
		{
			idc = 8652;
			text = "";
			x = 0.50;
			y = 0.31;
			w = (6.25 / 40);
			h = (1 / 25);
		};	
		
		class BankAccountListBox : Life_RscListBox 
		{
			idc = 8653;
			text = "";
			sizeEx = 0.035;
			
			x = 0.12; y = 0.26;
			w = 0.350; h = 0.370;
		};
		
		class BankAccountDeposite : Life_RscButtonMenu {
			idc = 8654;
			text = "Deposite";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_gangDeposite;";
			x = 0.50;
			y = 0.36;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class BankAccountWithdraw : Life_RscButtonMenu {
			idc = 8655;
			text = "Withdraw";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_gangWithdraw;";
			x = 0.50;
			y = 0.41;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class BankAccountTransfer : Life_RscButtonMenu {
			idc = 8656;
			text = "Transfer";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[] spawn life_fnc_gangTransfer;";
			x = 0.50;
			y = 0.46;
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class CloseLoadMenu : Life_RscButtonMenu {
			idc = -1;
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};