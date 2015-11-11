/*
	INIZIO RAPINA
	PER CHIUNQUE GUARDI IL CODICE SEMPLICEMENTE FOTTETEVI LO SO CHE FA CAGARE
*/
_unit = _this select 0;
if !(fed_bank getVariable "bank_robbery_ip") then
{
	fed_bank setVariable ["bank_robbery_ip",true,true];
	[[getPlayerUID player,profileName,"34"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;

	[[2,"$$$ INTRUSIONE ALLA BANCA FEDERALE DI TIJUANA $$$"],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
	
	[[2,"$$$ LA BANCA DI TIJUANA ENTRERA' IN STATO DI BLOCCO TRA 30 MIN $$$"],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
	[[],"life_fnc_bankState",false,false] spawn life_fnc_MP;							
	[[],"life_fnc_bankBlockTimer",true,false] spawn life_fnc_MP;					//TEMP
	[[fed_bank,"bank_alarm"],"life_fnc_playSound",nil,true] spawn life_fnc_MP;		//BANK ALLARM
	sleep 9.8;																		//zzzzzzzzz
	[[fed_bank,"bank_alarm"],"life_fnc_playSound",nil,true] spawn life_fnc_MP;		
};