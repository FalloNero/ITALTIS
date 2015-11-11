/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
	case (_item == "water" or _item == "coffee"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
		};
	};
    case (_item in ["storagesmall","storagebig"]): {
        [_item] call life_fnc_storageBox;
    };

	case (_item == "redgull"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
			[] spawn
			{
				life_redgull_effect = time;
                titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
				player enableFatigue true;
			};
		};
	};

	case (_item == "spikeStrip"):
	{
        if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};
	/*
	case (_item == "barrier"):
	{
		if(!isNull life_barrierRoad) exitWith {hint "Stai già piazzando una barriera"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_barrierRoad;
		};
	};
	*/
	
	case (_item == "ganascia"):
	{
			[] spawn life_fnc_ganascia;
	};
	
	case (_item == "heroinp"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn fnc_drug_use;
		};
	};

	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint "Non puoi fare il pieno all'interno del veicolo!"};
		[] spawn life_fnc_jerryRefuel;
	};
	
	case (_item == "benzina"):
	{
		if(vehicle player != player) exitWith {hint "Non puoi fare il pieno all'interno del veicolo!"};
		[] spawn life_fnc_jerryRefuel2;
	};

	case (_item == "marijuana"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_weedUse;
		};
	};

	case (_item == "lsdp"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_lsd;
		};
	};

	case (_item == "cocainep"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_cocaineUse;
		};
	};
	case (_item == "lockpick"):
	{
	    if (cursorTarget isKindOf "il_bank") then
		{
			[] spawn life_fnc_lockpickBank;	
		}else{
			if (cursorTarget isKindOf "armat_jail2") then
			{
				[] spawn life_fnc_lockpickJail;	
			}else{
				[] spawn life_fnc_lockpick;
			};
		};
	};
	case (_item == "tenaglie"):
	{
		[] spawn life_fnc_removeGanascia;
	};
	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach"]):
	{
		[_item] call life_fnc_eatFood;
	};
	case (_item == "pickaxe"):
	{
		[] spawn life_fnc_pickAxeUse;
	};
	case (_item == "speedtrap"):
	{
        [] spawn king_fnc_speedtrapAdd;
        closeDialog 0;
	};    
       
	case (_item == "speedtrapdetector"):
	{
		hint "Attivo...";
	};
	
	//case (_item == "laptop"):
//	{
//		[] spawn life_fnc_hackVault;
//	};
	
	case (_item == "fuelManipulator"):
	{
        closeDialog 0;
		[] spawn king_fnc_fuelchangerManipulate;
	};    
       
 	case (_item == "fuelPipe"):
	{
        closeDialog 0;
		[] spawn king_fnc_fuelPipe;
	};
		case (_item == "semierba"):
	{
		[] spawn life_fnc_semi;
	};
	case (_item == "tavolo"):
	{
		[] spawn life_fnc_tavolo;
	};	
	case (_item in life_furniture_items):
	{
		closeDialog 0;
		[_item] spawn life_fnc_useFurniture;
	};
	default
	{
        hint localize "STR_ISTR_NotUsable";
	};
};

[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;