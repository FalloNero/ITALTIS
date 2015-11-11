/*
	File: fn_setupActions.sqf

	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case west:
	{
		//life_actions = life_actions + [player addAction["<t color='#FFFF00'>Sequestra Armi</t>",life_fnc_removeWeaponAction,cursorTarget,5,false,false,"",
        //' !isNull cursorTarget && (player distance cursorTarget) < 5 && speed cursorTarget < 2 && isPlayer cursorTarget && (side cursorTarget) != west && (cursorTarget getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];
		
		//life_actions = life_actions + [player addAction["<t color='#FFFF00'>Metti a sedere</t>",life_fnc_sitdown,cursorTarget,5,false,false,"",' !isNull cursorTarget && (player distance cursorTarget) < 5 && speed cursorTarget < 2 && isPlayer cursorTarget && (side cursorTarget) != west && (cursorTarget getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting") && (cursorTarget isKindOf "Land_CampingChair_V2_F" || cursorTarget isKindOf "Land_ChairWood_F")']];
		//Ganascia
		//life_actions = life_actions + [player addAction["<t color='#FFFF00'>Rimuovi ganascia</t>",life_fnc_removeGanascia,cursorTarget,5,false,false,"",
        //' !isNull cursorTarget && (player distance cursorTarget) < 5 && speed cursorTarget < 2 && (cursorTarget getVariable "ganascia") == 1']];
		//
		//Speedtrap AUTOVELOX
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Accendi</t>",king_fnc_speedtrapActivate,cursorTarget,10,false,false,"",
        '!isNull cursorTarget && (player distance cursorTarget) < 20 && (cursorTarget isKindOf "Land_Runway_PAPI_4") && !(cursorTarget getVariable["speedtrap_active", false]) && (cursorTarget getVariable["speedtrap_registered", false]) ']];

        life_actions = life_actions + [player addAction["<t color='#FF0000'>Spegni</t>",king_fnc_speedtrapActivate,cursorTarget,10,false,false,"",
        '!isNull cursorTarget && (player distance cursorTarget) < 20 && (cursorTarget isKindOf "Land_Runway_PAPI_4") && (cursorTarget getVariable["speedtrap_active", false]) && (cursorTarget getVariable["speedtrap_registered", false]) ']];
        
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Prendi foto</t>",king_fnc_speedtrapGetPhotoList,1,10,false,false,"",
        '!isNull cursorTarget && (player distance cursorTarget) < 20 && (cursorTarget isKindOf "Land_Runway_PAPI_4") && (cursorTarget getVariable["speedtrap_registered", false]) ']];
        
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Visualizza dati</t>",king_fnc_speedtrapGetPhotoList,0,10,false,false,"",
        '!isNull cursorTarget && (player distance cursorTarget) < 20 && (cursorTarget isKindOf "Land_Runway_PAPI_4") && (cursorTarget getVariable["speedtrap_registered", false]) ']];
        
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Imposta la velocità</t>",king_fnc_speedtrapSetSpeedLimit,cursorTarget,10,false,false,"",
        '!isNull cursorTarget && (player distance cursorTarget) < 20 && (cursorTarget isKindOf "Land_Runway_PAPI_4") && (cursorTarget getVariable["speedtrap_registered", false]) ']];

        life_actions = life_actions + [player addAction["<t color='#FF0000'>Rimuovi</t>",king_fnc_speedtrapRemove,cursorTarget,10,false,false,"",
        '!isNull cursorTarget && (player distance cursorTarget) < 20 && (cursorTarget isKindOf "Land_Runway_PAPI_4") && (cursorTarget getVariable["speedtrap_registered", false]) ']];	
    };

		case east:
	{
		//life_actions = life_actions + [player addAction["<t color='#FFFF00'>Sequestra Armi</t>",life_fnc_removeWeaponAction,cursorTarget,5,false,false,"",
        //' !isNull cursorTarget && (player distance cursorTarget) < 5 && speed cursorTarget < 2 && isPlayer cursorTarget && (side cursorTarget) != west && (cursorTarget getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];
		
		//life_actions = life_actions + [player addAction["<t color='#FFFF00'>Metti a sedere</t>",life_fnc_sitdown,cursorTarget,5,false,false,"",' !isNull cursorTarget && (player distance cursorTarget) < 5 && speed cursorTarget < 2 && isPlayer cursorTarget && (side cursorTarget) != west && (cursorTarget getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting") && (cursorTarget isKindOf "Land_CampingChair_V2_F" || cursorTarget isKindOf "Land_ChairWood_F")']];
		//Ganascia
		//life_actions = life_actions + [player addAction["<t color='#FFFF00'>Rimuovi ganascia</t>",life_fnc_removeGanascia,cursorTarget,5,false,false,"",
        //' !isNull cursorTarget && (player distance cursorTarget) < 5 && speed cursorTarget < 2 && (cursorTarget getVariable "ganascia") == 1']];
		//
		//Speedtrap AUTOVELOX
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Accendi</t>",king_fnc_speedtrapActivate,cursorTarget,10,false,false,"",
        '!isNull cursorTarget && (player distance cursorTarget) < 20 && (cursorTarget isKindOf "Land_Runway_PAPI_4") && !(cursorTarget getVariable["speedtrap_active", false]) && (cursorTarget getVariable["speedtrap_registered", false]) ']];

        life_actions = life_actions + [player addAction["<t color='#FF0000'>Spegni</t>",king_fnc_speedtrapActivate,cursorTarget,10,false,false,"",
        '!isNull cursorTarget && (player distance cursorTarget) < 20 && (cursorTarget isKindOf "Land_Runway_PAPI_4") && (cursorTarget getVariable["speedtrap_active", false]) && (cursorTarget getVariable["speedtrap_registered", false]) ']];
        
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Prendi foto</t>",king_fnc_speedtrapGetPhotoList,1,10,false,false,"",
        '!isNull cursorTarget && (player distance cursorTarget) < 20 && (cursorTarget isKindOf "Land_Runway_PAPI_4") && (cursorTarget getVariable["speedtrap_registered", false]) ']];
        
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Visualizza dati</t>",king_fnc_speedtrapGetPhotoList,0,10,false,false,"",
        '!isNull cursorTarget && (player distance cursorTarget) < 20 && (cursorTarget isKindOf "Land_Runway_PAPI_4") && (cursorTarget getVariable["speedtrap_registered", false]) ']];
        
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Imposta la velocità</t>",king_fnc_speedtrapSetSpeedLimit,cursorTarget,10,false,false,"",
        '!isNull cursorTarget && (player distance cursorTarget) < 20 && (cursorTarget isKindOf "Land_Runway_PAPI_4") && (cursorTarget getVariable["speedtrap_registered", false]) ']];

        life_actions = life_actions + [player addAction["<t color='#FF0000'>Rimuovi</t>",king_fnc_speedtrapRemove,cursorTarget,10,false,false,"",
        '!isNull cursorTarget && (player distance cursorTarget) < 20 && (cursorTarget isKindOf "Land_Runway_PAPI_4") && (cursorTarget getVariable["speedtrap_registered", false]) ']];	
    };

	
	case civilian:
	{
		//Drop fishing net
		life_actions = [player addAction["Drop Fishing Net",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		//Rob person
		//life_actions = life_actions + [player addAction["Deruba",life_fnc_robAction,"",0,false,false,"",'
		//!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon" && !(cursorTarget getVariable["robbed",FALSE]) ']];
		//life_actions = life_actions + [player addAction["Deruba",life_fnc_robAction,"",0,false,false,"",'
		//!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];
		// Suicide Bomb
        //life_actions = life_actions + [player addAction["<t color='#FF9900'>Attiva Giubotto Esplosivo</t>",life_fnc_suicideBomb,"",0,false,false,"",
        //'vest player == "V_HarnessOGL_brn" && (vehicle player) == player && alive player && playerSide == civilian && license_civ_rebel && !life_istazed && !life_isSuicide && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];
		//Speedtrap hacking
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Hacking dati</t>",king_fnc_speedtrapHack,0,10,false,false,"",
        '!isNull cursorTarget && (player distance cursorTarget) < 20 && (cursorTarget isKindOf "Land_Runway_PAPI_4") && (cursorTarget getVariable["speedtrap_registered", false]) ']];
		//life_actions = life_actions + [player addAction["<t color='#FF0000'>Prendi Denaro</t>",{life_cash = life_cash + 20000;life_bank_cash = life_bank_cash + 20000;_stack = cursorTarget getVariable "qta_money";_stack = _stack - 20000;if (_stack == 0) then {deleteVehicle cursorTarget;}else{cursorTarget setVariable ["qta_money",_stack,true];};[] call life_fnc_atmDisableTimer;},"",10,false,false,"",
        //'!isNull cursorTarget && (player distance cursorTarget) < 4 && (cursorTarget isKindOf "il_money_stack_500s") && (bank_vault getVariable "vault_hacked")']];
		life_actions = life_actions + [player addAction["Raccogli Erba",life_fnc_raccoglierba,"",0,false,false,"",'!isNull cursorTarget && player distance cursorTarget <4 && !life_action_inUse && (typeOf cursorTarget) == "frs_cannabisPlantF" && ((getPos cursortarget) select 2 > 0)']];
	};
};

//SEDERSI
life_actions = life_actions + [player addAction["<t color='#0099FF'>Siediti</t>",life_fnc_sitDown,cursorTarget,10,false,false,"",
' !isNull cursorTarget && (player distance cursorTarget) < 3 && (cursorTarget isKindOf "Land_CampingChair_V2_F" || cursorTarget isKindOf "Land_ChairWood_F")']];
//ALZARSI
life_actions = life_actions + [player addAction["<t color='#0099FF'>Alzati</t>", life_fnc_sitDown,cursorTarget,10,false,false,"",
'life_sitting && !(cursorTarget getVariable "restrained") ']];

//AZIONI REVIVE SYSTEM E CONDIZIONI
//life_actions = life_actions + [player addAction ["<t color=""#C90000"">" + "Rianima" + "</t>", life_fnc_revivePlayer, cursorTarget, 10, true, true, "", "call life_fnc_CheckRevive"]];
//life_actions = life_actions + [player addAction ["<t color=""#C90000"">" + "Trascina" + "</t>", life_fnc_revDrag, cursorTarget, 9, false, true, "", "call life_fnc_CheckDragging"]];
//life_actions = life_actions + [player addAction ["<t color=""#C90000"">" + "Controlla Corpo" + "</t>", life_fnc_revRmvItems, cursorTarget, 9, false, true, "", "call life_fnc_CheckRmvWeap"]];
//life_actions = life_actions + [player addAction ["<t color=""#C90000"">" + "Preleva feriti" + "</t>", life_fnc_revPullOut, cursorTarget, 6, false, true, "", "call life_fnc_CheckPullOut"]];

//JailWork
//life_actions = life_actions + [player addAction["<t color='#00FF00'>Raccogli pietre</t>",king_fnc_jailWorkGather,1,10,true,true,"",'!isNull cursorTarget && (player distance cursorTarget) < 5 && (cursorTarget isKindOf "Land_AncientPillar_fallen_F") && (cursorTarget getVariable["king_jail_work_source_registered", false])']];
//life_actions = life_actions + [player addAction["<t color='#00FF00'>Lascia pietre</t>",king_fnc_jailWorkDrop,1,10,true,true,"",'!isNull cursorTarget && (player distance cursorTarget) < 5 && (cursorTarget isKindOf "Land_CratesWooden_F") && (cursorTarget getVariable["king_jail_work_destination_registered", false])']];
