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
ctrlSetText[3103,"Polizia Messicana"];

_ret = [];
switch (_filter) do
{
//Uniforms
    case 0:
    {
        _ret pushBack["police_biker_uniform","Uniforme Recluta",100];
        _ret pushBack["FBI_uni","Uniforme da Battaglia",100];
        
        if(__GETC__(life_coplevel) > 1) then
            {
                _ret pushBack["plice_man_uniform","Uniforme Agente",100];
            };

        if(__GETC__(life_coplevel) > 3) then
            {
                _ret pushBack["police_GL_uniform","Uniforme Ufficiali",100];            
            };

        if(__GETC__(life_coplevel) > 5) then
            {
                _ret pushBack["police_officer_uniform","Uniforme Vice Capo",100];
            };
if(__GETC__(life_coplevel) > 6) then
            {
                _ret pushBack["rds_uniform_policeman","Uniforme Capo",100];
            };
            
        
    };

	//Hats
	case 1:
	{
		//_ret pushBack["Campaign_hat","Cappello di Servizio",100];
				
			
		if(__GETC__(life_coplevel) > 6) then
			{
				_ret pushBack["rds_police_cap","Tesa da Capo",100];
_ret pushBack["H_Beret_Colonel","Basco da Capo",100];
			};	
	};

	//Glasses
	case 2:
	{
		_ret pushBack["Mask_M40","Antigas M40",300];
				
		
		if(__GETC__(life_coplevel) > 3) then
			{
				_ret pushBack["Mask_m40_OD","Antigas M40V",300];
			};
		if(__GETC__(life_coplevel) > 5) then
			{
				_ret pushBack["Mask_M50","Antigas M50",500];
			};
	};

	//Vest
	case 3:
	{
		_ret =
			[
				["SWATVest1","Giubbotto Antiproiettile Visibile",500],
				["SWATVest2","Giubbotto Antiproiettile Invisibile",500],
				["V_TacVest_blk_POLICE","Giubbotto da Battaglia",500]
			];
	};

	//Backpacks
	case 4:
	{
		_ret =
			[
				["B_Kitbag_cbr",nil,100],
				["B_FieldPack_blk",nil,150],
				["B_AssaultPack_blk",nil,150],
				["B_Bergen_blk",nil,350],
				["B_Carryall_cbr",nil,550],
				["B_OutdoorPack_blk",nil,550]
			];
	};
};

_ret;