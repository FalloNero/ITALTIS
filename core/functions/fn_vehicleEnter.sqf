_vehicle = _this select 0; 	//Object - Vehicle the event handler is assigned to
_position = _this select 1; 	//String - Can be either "driver", "gunner", "commander" or "cargo"
_unit = _this select 2; 		//Object - Unit that entered the vehicle

if ((_vehicle getVariable "vehicle_disabled") OR (damage _vehicle >= 0.80)) exitWith {moveOut _unit ;hint "Il veicolo è troppo danneggiato";};
