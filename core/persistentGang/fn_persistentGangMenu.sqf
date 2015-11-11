/*
	File: fn_persistentGangMenu.sqf
	Author: Mario2002
	
	Description:
	Checks whether it needs to open the gang management menu or the choice menu.
*/
if(isNull life_my_gang && isNull life_persistent_gang) then {
    
    createDialog "Life_Gang_Prompt";
} 
else {    
    if(!isNull life_my_gang) then {
        createDialog "Life_My_Gang_Diag";
    };
    
    if(!isNull life_persistent_gang) then {
        createDialog "Life_Persistent_Gang_Menu";
    };
};