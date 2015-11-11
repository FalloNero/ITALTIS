/*
	Ricrea pacchi di denaro , hitpoint e reset status telecamere
*/
_bank = _this select 0;
_vault = _this select 1;

_bank setVariable ["bank_robbery_ip",false,true];
_vault setVariable ["vault_hacking_ip",false,true];
_vault setVariable ["vault_hacked",false,true];
_vault setVariable ["hackingProgess",0.01,true];

bank_camera_1 setVariable ["active_camera",true,true];
bank_camera_2 setVariable ["active_camera",true,true];
bank_camera_3 setVariable ["active_camera",true,true];

[] spawn life_fnc_lockExtDoors;
[] spawn life_fnc_lockVaultDoors;

_targets = nearestObjects [_vault,["il_money_stack_500s"],20];  {deleteVehicle _x}foreach _targets;  // CANCELLO I VECCHI PACCHI DI DENARO PER RICREARLI

//CREO I PACCHI DI DENARO - LAVORO DA STRONZI SPERO DI MIGLIORARLO
_money = "il_money_stack_500s" createvehicle position _vault;
_money setPosATL (_vault modelToWorld [-8,-0.1,1.5]);
_money setDir (getDir _vault);
_money setVariable ["qta_money",200000,true];

_money1 = "il_money_stack_500s" createvehicle position _vault;
_money1 setPosATL (_vault modelToWorld [-9,-0.1,1.5]);
_money1 setDir (getDir _vault);
_money1 setVariable ["qta_money",200000,true];

_money2 = "il_money_stack_500s" createvehicle position _vault;
_money2 setPosATL (_vault modelToWorld [-8,-0.1,2.4]);
_money2 setDir (getDir _vault);
_money2 setVariable ["qta_money",200000,true];

_money3 = "il_money_stack_500s" createvehicle position _vault;
_money3 setPosATL (_vault modelToWorld [-9,-0.1,2.4]);
_money3 setDir (getDir _vault);
_money3 setVariable ["qta_money",200000,true];

_money4 = "il_money_stack_500s" createvehicle position _vault;
_money4 setPosATL (_vault modelToWorld [-8,-4,1.5]);
_money4 setDir (getDir _vault);
_money4 setVariable ["qta_money",200000,true];

_money5 = "il_money_stack_500s" createvehicle position _vault;
_money5 setPosATL (_vault modelToWorld [-9,-4,1.5]);
_money5 setDir (getDir _vault);
_money5 setVariable ["qta_money",200000,true];

_money6 = "il_money_stack_500s" createvehicle position _vault;
_money6 setPosATL (_vault modelToWorld [-8,-4,2.4]);
_money6 setDir (getDir _vault);
_money6 setVariable ["qta_money",200000,true];

_money7 = "il_money_stack_500s" createvehicle position _vault;
_money7 setPosATL (_vault modelToWorld [-9,-4,2.4]);
_money7 setDir (getDir _vault);
_money7 setVariable ["qta_money",200000,true];

_money8 = "il_money_stack_500s" createvehicle position _vault;
_money8 setPosATL (_vault modelToWorld [-10,-2,1.5]);
_money8 setDir (getDir _vault);
_money8 setVariable ["qta_money",200000,true];

_money9 = "il_money_stack_500s" createvehicle position _vault;
_money9 setPosATL (_vault modelToWorld [-10,-3,1.5]);
_money9 setDir (getDir _vault);
_money9 setVariable ["qta_money",200000,true];

_money10 = "il_money_stack_500s" createvehicle position _vault;
_money10 setPosATL (_vault modelToWorld [-10,-2,2.4]);
_money10 setDir (getDir _vault);
_money10 setVariable ["qta_money",200000,true];

_money11 = "il_money_stack_500s" createvehicle position _vault;
_money11 setPosATL (_vault modelToWorld [-10,-3,2.4]);
_money11 setDir (getDir _vault);
_money11 setVariable ["qta_money",200000,true];

_money12 = "il_money_stack_500s" createvehicle position _vault;
_money12 setPosATL (_vault modelToWorld [-10,-1,1.5]);
_money12 setDir (getDir _vault);
_money12 setVariable ["qta_money",200000,true];

_money13 = "il_money_stack_500s" createvehicle position _vault;
_money13 setPosATL (_vault modelToWorld [-10,-1,2.4]);
_money13 setDir (getDir _vault);
_money13 setVariable ["qta_money",200000,true];

sleep 10;

_targets = nearestObjects [_bank,["il_bank_hit"],40];  {deleteVehicle _x}foreach _targets; 

_hitPoint1 = "il_bank_hit" createVehicle getPos _bank;
_selection = (_bank selectionPosition "osa_h1f");
_pos = _bank modelToWorld _selection;
_hitPoint1 setPosATL _pos;
_hitPoint1 setDir (130);
_hitPoint1 addEventHandler ["HandleDamage",{
	if ((side (_this select 3) != west) and (side (_this select 3) != east)) then{
		if !(fed_bank getVariable "bank_block") then{
			if(((west countSide playableUnits) + (east countSide playableUnits) > 4)||(fed_bank getVariable "bank_robbery_ip")) then{
				if ((_this select 4) in ["prpl_B_12Gauge_Pellets","prpl_B_12Gauge_Slug","FH_545x39_Ball","FH_545x39_EP","HLC_762x39_Ball","TMR_B_762x51_M11BLR","R3f_762x51_Ball"]) then {
					fed_bank setVariable ["osa_h1f",1,true];
					fed_bank setVariable ["h1f_forced",1,true];
					fed_bank animate ["h1fAnim",0] ;
					fed_bank animate ["h1bAnim",1];
					fed_bank setObjectTextureGlobal [1,"\il_bank\textures\unlocked.paa"];
					[_this select 3] spawn life_fnc_startRobbery;
					deletevehicle (_this select 0);
				};
			};
		};
	};
 }];

_hitPoint2 = "il_bank_hit" createVehicle getPos _bank;
_selection = (_bank selectionPosition "osa_h2f");
_pos = _bank modelToWorld _selection;
_hitPoint2 setPosATL _pos;
_hitPoint2 setDir (40);
_hitPoint2 addEventHandler ["HandleDamage",{
	if ((side (_this select 3) != west) and (side (_this select 3) != east)) then{
		if !(fed_bank getVariable "bank_block") then{
			if(((west countSide playableUnits) + (east countSide playableUnits) > 4)||(fed_bank getVariable "bank_robbery_ip")) then{
				if ((_this select 4) in ["prpl_B_12Gauge_Pellets","prpl_B_12Gauge_Slug","FH_545x39_Ball","FH_545x39_EP","HLC_762x39_Ball","TMR_B_762x51_M11BLR","R3f_762x51_Ball"]) then {
					fed_bank setVariable ["osa_h2f",1,true];
					fed_bank setVariable ["h2f_forced",1,true];
					fed_bank animate ["h2fAnim",1] ;
					fed_bank animate ["h2bAnim",0] ;
					fed_bank setObjectTextureGlobal [2,"\il_bank\textures\unlocked.paa"];
					[_this select 3] spawn life_fnc_startRobbery;
					deletevehicle (_this select 0);
				};
			};
		};
	};
}];

_hitPoint3 = "il_bank_hit" createVehicle getPos _bank;
_selection = (_bank selectionPosition "osa_h3f");
_pos = _bank modelToWorld _selection;
_hitPoint3 setPosATL _pos;
_hitPoint3 setDir (40);
_hitPoint3 addEventHandler ["HandleDamage",{
	if((side (_this select 3) != west) and (side (_this select 3) != east)) then{
		if !(fed_bank getVariable "bank_block") then{
			if(((west countSide playableUnits) + (east countSide playableUnits) > 4)||(fed_bank getVariable "bank_robbery_ip")) then{
				if ((_this select 4) in ["prpl_B_12Gauge_Pellets","prpl_B_12Gauge_Slug","FH_545x39_Ball","FH_545x39_EP","HLC_762x39_Ball","TMR_B_762x51_M11BLR","R3f_762x51_Ball"]) then {
					fed_bank setVariable ["osa_h3f",1,true];
					fed_bank setVariable ["h3f_forced",1,true];
					fed_bank animate ["h3fAnim",1] ;
					fed_bank animate ["h3bAnim",0] ;
					fed_bank setObjectTextureGlobal [3,"\il_bank\textures\unlocked.paa"];
					[_this select 3] spawn life_fnc_startRobbery;
					deletevehicle (_this select 0);
				};
			};
		};
	};
}];


_hitPoint4 = "il_bank_hit" createVehicle getPos _bank;
_selection = (_bank selectionPosition "osa_h4f");
_pos = _bank modelToWorld _selection;
_hitPoint4 setPosATL _pos;
_hitPoint4 setDir (130);
_hitPoint4 addEventHandler ["HandleDamage",{
	if ((side (_this select 3) != west) and (side (_this select 3) != east)) then{
		if !(fed_bank getVariable "bank_block") then{
			if(((west countSide playableUnits) + (east countSide playableUnits) > 4)||(fed_bank getVariable "bank_robbery_ip")) then{
				if ((_this select 4) in ["prpl_B_12Gauge_Pellets","prpl_B_12Gauge_Slug","FH_545x39_Ball","FH_545x39_EP","HLC_762x39_Ball","TMR_B_762x51_M11BLR","R3f_762x51_Ball"]) then {
					fed_bank setVariable ["osa_h4f",1,true];
					fed_bank setVariable ["h4f_forced",1,true];
					fed_bank animate ["h4fAnim",1] ;
					fed_bank animate ["h4bAnim",0] ;
					fed_bank setObjectTextureGlobal [4,"\il_bank\textures\unlocked.paa"];
					[_this select 3] spawn life_fnc_startRobbery;
					deletevehicle (_this select 0);
				};
			};
		};
	};
}];

_hitPoint5 = "il_bank_hit" createVehicle getPos _bank;
_selection = (_bank selectionPosition "osa_h5f");
_pos = _bank modelToWorld _selection;
_hitPoint5 setPosATL _pos;
_hitPoint5 setDir (130);
_hitPoint5 addEventHandler ["HandleDamage",{
	if ((side (_this select 3) != west) and (side (_this select 3) != east)) then{
		if !(fed_bank getVariable "bank_block") then{
			if(((west countSide playableUnits) + (east countSide playableUnits) > 4)||(fed_bank getVariable "bank_robbery_ip")) then{
				if ((_this select 4) in ["prpl_B_12Gauge_Pellets","prpl_B_12Gauge_Slug","FH_545x39_Ball","FH_545x39_EP","HLC_762x39_Ball","TMR_B_762x51_M11BLR","R3f_762x51_Ball"]) then {
					fed_bank setVariable ["osa_h5f",1,true];
					fed_bank setVariable ["h5f_forced",1,true];
					fed_bank animate ["h5fAnim",1] ;
					fed_bank animate ["h5bAnim",0] ;
					fed_bank setObjectTextureGlobal [5,"\il_bank\textures\unlocked.paa"];
					[_this select 3] spawn life_fnc_startRobbery;
					deletevehicle (_this select 0);
				};
			};
		};
	};
}];


_hitPoint7 = "il_bank_hit" createVehicle getPos _bank;
_selection = (_bank selectionPosition "osa_h7f");
_pos = _bank modelToWorld _selection;
_hitPoint7 setPosATL _pos;
_hitPoint7 setDir (130);
_hitPoint7 addEventHandler ["HandleDamage",{
	if ((side (_this select 3) != west) and (side (_this select 3) != east)) then{
		if !(fed_bank getVariable "bank_block") then{
			if(((west countSide playableUnits) + (east countSide playableUnits) > 4)||(fed_bank getVariable "bank_robbery_ip")) then{
				if ((_this select 4) in ["prpl_B_12Gauge_Pellets","prpl_B_12Gauge_Slug","FH_545x39_Ball","FH_545x39_EP","HLC_762x39_Ball","TMR_B_762x51_M11BLR","R3f_762x51_Ball"]) then {
					fed_bank setVariable ["osa_h7f",1,true];
					fed_bank setVariable ["h7f_forced",1,true];
					fed_bank animate ["h7fAnim",1] ;
					fed_bank animate ["h7bAnim",0] ;
					fed_bank setObjectTextureGlobal [7,"\il_bank\textures\unlocked.paa"];
					[_this select 3] spawn life_fnc_startRobbery;
					deletevehicle (_this select 0);
				};
			};
		};
	};
}];

_vault animate ["d_o_Anim",0];
sleep 90;
_vault animate ["d_l_Anim",0];
