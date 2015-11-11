
_veh = "frs_cannabisPlantF" createVehicle position player;
_veh2 = "Land_HelipadEmpty_F" createVehicle position player;
_veh setPos [getPos _veh2 select 0, getPos _veh2 select 1, (getPos _veh2 select 2) -2];
sleep 4;
_veh setPos [getPos _veh2 select 0, getPos _veh2 select 1, (getPos _veh2 select 2) -1.5];
sleep 4;
_veh setPos [getPos _veh2 select 0, getPos _veh2 select 1, (getPos _veh2 select 2) -1];
sleep 4;
_veh setPos [getPos _veh2 select 0, getPos _veh2 select 1, (getPos _veh2 select 2) +0];