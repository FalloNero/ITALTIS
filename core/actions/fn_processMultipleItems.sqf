/* author: CRY
*
* processMulitpleItems.sqf
* processes any number of input items into one output item. progress bar is from bryan "tonic" boardwines fn_processAction.sqf.
*
* 
*
* PARAMS:
* _this select 3: String - processor type
*
*/

private ["_inputItems", "_outputItem", "_inputItemsNeeded", "_outputItemAmount", "_itemsInv", "_itemsNeeded", "_inputItemsDeleted", "_ui", "_progress", "_pgText", "_cP", "_productionAmount", "_possibleProductionAmount","_processor","_formatedProcessingInfo","_hasLicense","_licenseNeeded","_processingCost","_type","_productionInfo"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if (isServer) exitWith {};

if (life_is_processing) exitWith {hint "Der Kollege ist beschäftigt. Bitte nicht stressen!";};    

//parameter
_processor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;

//Error check. taken from tonic.
if(isNull _processor OR _type == "" OR (player distance _processor > 5)) exitWith {};
if(vehicle player != player) exitwith {hint format["Du darfst nicht im Fahrzeug sitzen"];};

life_is_processing = true;

//define your production line here
_productionInfo = switch (_type) do
{
	case "1": {["life_inv_birra",32,"life_inv_obirra",1,"license_civ_birra",25000];};
	case "2": {["life_inv_ldrame",32,"life_inv_orame",1,"license_civ_rame",15000];};
	case "3": {["life_inv_fdcanapa",32,"life_inv_ocanapa",1,"license_civ_fdcanapa",35000];};
	case "4": {["life_inv_marijuana",32,"life_inv_omarijuana",1,"license_civ_marijuana",55000];};
	case "5": {["life_inv_ldalluminio",32,"life_inv_oalluminio",1,"license_civ_ldalluminio",65000];};
	case "6": {["life_inv_morfina",32,"life_inv_omorfina",1,"license_civ_morfina",100000];};
	case "7": {["life_inv_eroina",32,"life_inv_oeroina",1,"license_civ_eroina",65000];};
	case "8": {["life_inv_ldferro",32,"life_inv_oferro",1,"license_civ_ldferro",55000];};
	case "9": {["life_inv_benzina",32,"life_inv_obenzina",1,"license_civ_benzina",65000];};
	case "10":{["life_inv_napalm",32,"life_inv_onapalm",1,"license_civ_napalm",110000];};
	case "11":{["life_inv_ldplatino",32,"life_inv_oplatino",1,"license_civ_ldplatino",85000];};
	case "12":{["life_inv_cocainapura",32,"life_inv_ococainapura",1,"license_civ_cocainapura",115000];};
	case "13":{["life_inv_ldoro",32,"life_inv_ooro",1,"license_civ_ldoro",25000];};
	case "14":{["life_inv_morfina",1,"MedKit",1,"license_med_morfina",25000];};
	default {[]};
};


//initialize
_inputItems = _productionInfo select 0;
_inputItemsNeeded = _productionInfo select 1;
_outputItem = _productionInfo select 2;
_outputItemAmount = [(_productionInfo select 3),0,0,[0]] call BIS_fnc_param;
_licenseNeeded = _productionInfo select 4;
_processingCost = [(_productionInfo select 5),0,0,[0]] call BIS_fnc_param;


//hint format["%1 %2 %3 %4 %5 %6",_inputItems,_inputItemsNeeded,_outputItem,_outputItemAmount,_licenseNeeded,_processingCost];

_aaa = [_inputItems,1] call life_fnc_varHandle;
_bbb = [_outputItem,1] call life_fnc_varHandle;

if(!([false,_aaa,_inputItemsNeeded] call life_fnc_handleInv)) exitWith {hint format ["Non hai gli oggetti richiesti per il processo, ti servono 32 %1",_aaa]; life_is_processing = false;};



disableSerialization;
_title = localize "Processando...";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	
	sleep 0.5;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	life_is_processing = true;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {life_is_processing = false;};
	if(life_istazed) exitWith {life_is_processing = false;}; //Tazed
	if(life_interrupted) exitWith {life_is_processing = false;};
if(player distance _vendor > 10) exitWith {life_is_processing = false;};	
};

if(player distance _vendor > 10) exitWith {hint "Devi stare entro i 10 metri dal processo."; 5 cutText ["","PLAIN"]; life_is_processing = false;};

5 cutText ["","PLAIN"];

[false,_aaa,_inputItemsNeeded] call life_fnc_handleInv;


if (_outputItem=="MedKit") exitwith {

player addItem "FirstAidKit";
life_is_processing = false;
};


[true,_bbb,_outputItemAmount] call life_fnc_handleInv;


life_is_processing = false;