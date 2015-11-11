#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Police Department Gear Shop"];

_ret = [];
switch (_filter) do
{
    //Uniforms
    case 0:
    {
        _ret pushBack["U_B_Wetsuit","Muta da Sommozzatore",200];
        _ret pushBack["U_Rangemaster","Uniforme Agente",200];
        
        if(__GETC__(life_coplevel) > 5) then
            {
                _ret pushBack["U_B_CombatUniform_mcam_vest","Uniforme Forze Speciali",200];
            };
        
    };

	//Hats
	case 1:
	{
		_ret pushBack["H_PilotHelmetHeli_B","Cappello Polizia",100];
		_ret pushBack["H_Watchcap_blk","Cuffia con auricolare",100];
				
		if(__GETC__(life_coplevel) > 5) then
			{
				_ret pushBack["H_HelmetCrew_B","Elmo Antisommossa",500];
				_ret pushBack["H_HelmetB_light_black","Casco Forze Speciali",100];
			};	
	};

	//Glasses
	case 2:
	{
		_ret pushBack["G_Balaclava_blk","Passamontagna",100];
		_ret pushBack["G_Tactical_Clear","Occhiali Tattici",100];
		_ret pushBack["G_Aviator","Rayban",100];
		_ret pushBack["G_B_Diving","Maschera da Sommozzatore",100];
	};

	//Vest
	case 3:
	{
		_ret =
			[
				["V_TacVest_blk_POLICE","Giubbotto Anti-Proiettile",1000],
				["Vest_V_RebreatherB","Respiratore",1000]
			];
	};

	//Backpacks
	case 4:
	{
		_ret =
			[
				["B_Carryall_oucamo","Zaino",5000]
			];
	};
};

_ret;