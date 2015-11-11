king_jail_reduce_time = 0;
king_get_out_of_jail_for_free = false;
king_jail_work_is_active = false;
king_jail_work_gathering_is_running = false;
king_jail_work_gathering_amount = 0;
king_jail_work_keys_found = 0;

if(!isNil "king_jail_work_source" && !isNil "king_jail_work_destination") then
{
    king_jail_work_is_active = true;
    
    king_jail_work_source setVariable["king_jail_work_source_registered",true,false];
    
    king_jail_work_destination setVariable["king_jail_work_destination_registered",true,false];
};