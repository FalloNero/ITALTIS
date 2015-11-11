/*
	File: fn_releaseMeFromJail.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	all keys found so release me from jail
    
    Das Script darf nicht verändert werden!
    Der Einsatz ist nur auf von mir genehmigten Servern/Clients erlaubt!    
*/

player setVariable["king_jail_work_all_keys_found",false,false];
king_jail_work_keys_found = 0;
king_jail_work_gathering_amount = 0;
king_get_out_of_jail_for_free = true;