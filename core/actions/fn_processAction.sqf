/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handling for processing an item.
*/
private["_ciosba","_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."

_itemInfo = switch (_type) do {
	
	case "a": {["luppolo","birra",5000,"Processando Luppoli in Birra [LEGALE]"];};
	case "2": {["rame","ldrame",5000,"Processando rame in lingotto di rame [LEGALE]"];};
	case "3": {["canapa","fdcanapa",5000,"Processndo canapa in fibra di fabri-canapa [LEGALE]"];};
	case "4": {["canapa","marijuana",5000,"Processando canapa in marijuana [ILLEGALE]"];};
	case "5": {["alluminio","ldalluminio",6000,"Processando alluminio in lingotto di alluminio [LEGALE]"];};
	case "6": {["papavero","morfina",6000,"Processando papaveri in morfina [ILLEGALE]"];};
	case "7": {["papavero","eroina",6000,"Processando papaveri in eroina [ILLEGALE]"];};
	case "8": {["ferro","ldferro",5000,"Processando ferro in lingotto di ferro [LEGALE]"];};
	case "9": {["petrolio","benzina",5000,"Distillando Petrolio in Benzina [LEGALE]"];};
	case "10": {["petrolio","napalm",5000,"Distillando Petrolio in Napalm [ILLEGALE]"];};
	case "11": {["oro","ldoro",5000,"Processando Oro in Lingotto di oro [LEGALE]"];};
	case "12": {["platino","ldplatino",6000,"Processando platino in lingotto di platino [LEGALE]"];};
	case "13": {["cocaina","cocainapura",6000,"Processando cocaina in cocaina pura [ILLEGALE]"];};
	case "14": {["uranio","uranioarricchito",7000,"Arricchendo uranio... [ILLEGALE]"];};
	default {[];};
};

//Error checking
if(count _itemInfo == 0) exitWith {};



//Setup vars.
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;

//if(_vendor in [mari_processor,coke_processor,heroin_processor]) then {
 //   _hasLicense = true;
//} else {

_ciosba = switch (_type) do
{
case "a": {"birra"};
case "2": {"ldrame"};
case "3": {"fdcanapa"};
case "4": {"marijuana"};
case "5": {"ldalluminio"};
case "6": {"morfina"};
case "7": {"eroina"};
case "8": {"ldferro"};
case "9": {"benzina"};
case "10": {"napalm"};
case "11": {"ldoro"};
case "12": {"ldplatino"};
case "13": {"cocainapura"};
case "14": {"uranioarricchito"};
default {""};
};

if(playerside==independent) then {_ciosba="morfina2";};

_hasLicense = missionNamespace getVariable (([_ciosba,0] call life_fnc_licenseType) select 0);


//};

_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_oldVal = missionNamespace getVariable ([_oldItem,0] call life_fnc_varHandle);

_cost = _cost * _oldVal;
//Some more checks
if(_oldVal == 0) exitWith {};

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;

if(_hasLicense) then
{
	while{true} do
	{
		sleep  0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};

	if(player distance _vendor > 10) exitWith {hint "Devi stare entro i 10m dal processo"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format["Hai processato %1 in %2",_oldVal,_itemName],"PLAIN"];
	life_is_processing = false;
}
	else
{
	if(life_cash < _cost) exitWith {hint format["Hai bisogno di €%1 per processare senza licenza!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};

	while{true} do
	{
		sleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};

	if(player distance _vendor > 10) exitWith {hint "Devi stare entro i 10m dal processo."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(life_cash < _cost) exitWith {hint format["You need $%1 to process  without a license!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format["You have processed %1 into %2 for $%3",_oldVal,_itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	life_cash = life_cash - _cost;
	life_is_processing = false;
};