/*
	APPLICA LA GANASCIA SUL VEICOLO	
*/
private ["_veh","_obj"];
_veh = _this select 0;
_obj = "Land_Target_Oval_F" createVehicle [0,0,0];

_selection = _veh selectionPosition "wheel_1_1_axis"; 
_selection set [0,(_selection select 0)+0.1];
_selection set [2,(_selection select 2)+0.3];
_obj attachto [_veh,_selection];
_obj setdir 90;
_obj attachto [_veh,_selection];
_obj setdir 90;



/*
switch (typeOf _veh) do
{
	case "C_Quadbike_01_F":
	{
		_obj attachto [_veh,[-1.015625,-0.775,-0.75]]; 
		_obj setdir 270; 
		_obj attachto [_veh,[-1.015625,-0.775,-0.75]]; 
		_obj setdir 270;
	};
	case "C_Hatchback_01_sport_F":
	{
		_obj attachto [_veh,[-1.337891,-1.667969,-0.71]]; 
		_obj setdir 270; 
		_obj attachto [_veh,[-1.337891,-1.667969,-0.71]]; 
		_obj setdir 270;
	};
	case "C_Hatchback_01_F":
	{
		_obj attachto [_veh,[-1.337891,-1.667969,-0.71]]; 
		_obj setdir 270; 
		_obj attachto [_veh,[-1.337891,-1.667969,-0.71]]; 
		_obj setdir 270;
	};
	case "C_SUV_01_F":
	{
		_obj attachto [_veh,[-1.46875,-1.871094,-0.76924775]]; 
		_obj setdir 270; 
		_obj attachto [_veh,[-1.46875,-1.871094,-0.76924775]]; 
		_obj setdir 270;
	};
	case "I_G_Offroad_01_F":
	{
		_obj attachto [_veh,[-1.517578,-1.9296875,-0.87677245]]; 
		_obj setdir 270; 
		_obj attachto [_veh,[-1.517578,-1.9296875,-0.87677245]]; 
		_obj setdir 270;
	};
	case "C_Van_01_transport_F":
	{
		_obj attachto [_veh,[-1.389648,-1.9921875,-1.13299655]]; 
		_obj setdir 270; 
		_obj attachto [_veh,[-1.389648,-1.9921875,-1.13299655]]; 
		_obj setdir 270;
	};
	case "C_Van_01_box_F":
	{
		_obj attachto [_veh,[-1.389648,-1.9921875,-1.13299655]]; 
		_obj setdir 270; 
		_obj attachto [_veh,[-1.389648,-1.9921875,-1.13299655]]; 
		_obj setdir 270;
	};
	case "B_Truck_01_box_F":
	{
		_obj attachto [_veh,[-1.625,-2.058594,-1.41344842]]; 
		_obj setdir 270; 
		_obj attachto [_veh,[-1.625,-2.058594,-1.41344842]]; 
		_obj setdir 270;
	};
	case "B_Truck_01_transport_F":
	{
		_obj attachto [_veh,[-1.577148,-2.191406,-1.335]]; 
		_obj setdir 270; 
		_obj attachto [_veh,[-1.577148,-2.191406,-1.335]]; 
		_obj setdir 270;
	};
	case "I_Truck_02_covered_F":
	{
		_obj attachto [_veh,[-1.546875,-0.646484,-1.56664467]]; 
		_obj setdir 270; 
		_obj attachto [_veh,[-1.546875,-0.646484,-1.56664467]]; 
		_obj setdir 270;
	};
	case "O_Truck_03_covered_F":
	{
		_obj attachto [_veh,[-1.662109,-3.432,-1.63774184]]; 
		_obj setdir 270; 
		_obj attachto [_veh,[-1.662109,-3.432,-1.63774184]]; 
		_obj setdir 270;
	};
	case "O_Truck_03_transport_F":
	{
		_obj attachto [_veh,[-1.662109,-3.432,-1.615]]; 
		_obj setdir 270; 
		_obj attachto [_veh,[-1.662109,-3.432,-1.615]]; 
		_obj setdir 270;
	};
	case "O_Truck_03_device_F":
	{
		_obj attachto [_veh,[-1.668945,-3.703125,-1.369]]; 
		_obj setdir 270; 
		_obj attachto [_veh,[-1.668945,-3.703125,-1.369]]; 
		_obj setdir 270;
	};
	case "B_MRAP_01_F":
	{
		_obj attachto [_veh,[-1.742187,-3.445312,-1.39308516]]; 
		_obj setdir 270; 
		_obj attachto [_veh,[-1.742187,-3.445312,-1.39308516]]; 
		_obj setdir 270;
	};
	case "O_MRAP_02_F":
	{
		_obj attachto [_veh,[-1.820312,-3.445312,-1.63702885]]; 
		_obj setdir 270; 
		_obj attachto [_veh,[-1.820312,-3.445312,-1.63702885]]; 
		_obj setdir 270;
	};
	case "I_MRAP_03_F":
	{
		_obj attachto [_veh,[-1.800781,-1.820312,-0.94619887]]; 
		_obj setdir 270; 
		_obj attachto [_veh,[-1.800781,-1.820312,-0.94619887]]; 
		_obj setdir 270;
	};
	case "C_Kart_01_F":
	{
		_obj attachto [_veh,[-0.9863281,-0.597656,-0.385]]; 
		_obj setdir 270; 
		_obj attachto [_veh,[-0.9863281,-0.597656,-0.385]]; 
		_obj setdir 270;
	};
	default 
	{
		_obj attachto [_veh,[-1.800781,-1.820312,-0.94619887]]; 
		_obj setdir 270; 
		_obj attachto [_veh,[-1.800781,-1.820312,-0.94619887]]; 
		_obj setdir 270;
	};
};
*/

