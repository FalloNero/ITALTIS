/*
	File: fn_jailWorkGather.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	jailWorkGather
    
    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!    
*/

if(!king_jail_work_is_active) exitWith {};
if(king_jail_work_gathering_is_running) exitWith {};
if(king_jail_work_gathering_amount >= king_jail_work_gathering_max_amount) exitWith {titleText[format["Deine Taschen sind voll bringe die Steine zuerst in die Kisten."],"PLAIN"];};

king_jail_work_gathering_is_running = true;

[] spawn
{
    private["_obj","_progress_text","_gathered_amount","_key_roll","_success"];
    _obj = king_jail_work_source;
        
	_progress_text = format["Raccogli pietre"];

    _success = [20, _progress_text, _obj] call life_fnc_progressWaitUntilFinished;
    if(!_success) exitWith {king_jail_work_gathering_is_running = false;};
    
    _gathered_amount = floor(1 + (random 10));
    
    titleText[format["Hai rotto %1 Pietre.", _gathered_amount],"PLAIN"];

    if(king_jail_work_keys_found < king_jail_work_needed_keys) then
    {
        _key_roll = random 100;
        if(_key_roll < king_jail_work_dropchance_key) then
        {
            king_jail_work_keys_found = king_jail_work_keys_found + 1;
            ["InformationMessage",[format["%1 su %2 lavori per uscire di prigione",king_jail_work_keys_found,king_jail_work_needed_keys]]] call bis_fnc_showNotification;
        };
        if(king_jail_work_keys_found == king_jail_work_needed_keys) then
        {
            player setVariable["king_jail_work_all_keys_found",true,false];
            sleep 2;
            ["InformationMessage",[format["Vai ora sei libero"]]] call bis_fnc_showNotification;
        };
    };
    
    sleep 1;
    
    king_jail_work_gathering_amount = king_jail_work_gathering_amount + _gathered_amount;
    if(king_jail_work_gathering_amount > king_jail_work_gathering_max_amount) then
    {
        king_jail_work_gathering_amount = king_jail_work_gathering_max_amount;
        titleText[format["Deine Taschen sind voll, trage die Steine zu den Kisten."],"PLAIN"];
    };
    
    king_jail_work_gathering_is_running = false;
};


    