/*





*/

#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Btn9 37458
#define Btn10 37459
#define Back 37449
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8"];
if(!dialog) then 
{
	createDialog "pInteraction_Menu";
};

disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;}; //Bad side check?
if(!isPlayer _curTarget && side _curTarget == independent) exitWith {closeDialog 0;}; //Bad side check?
if(!isPlayer _curTarget && side _curTarget == east) exitWith {closeDialog 0;}; //Bad side check?
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
_Btn10 = _display displayCtrl Btn10;
_Back = _display displayCtrl Back;
_Btn1 ctrlEnable true;
_Btn2 ctrlEnable true;
_Btn3 ctrlEnable true;
_Btn4 ctrlEnable true;
_Btn5 ctrlEnable true;
_Btn6 ctrlEnable true;
_Btn7 ctrlEnable true;
_Btn8 ctrlEnable true;
_Btn9 ctrlEnable true;
_Btn10 ctrlEnable true;
_Back ctrlEnable true;
life_pInact_curTarget = _curTarget;

//RIMUOVI PATENTE A
_Btn1 ctrlSetText "PATENTE B";
_Btn1 buttonSetAction "hint ""Avviso: Patente B rimossa (se presente).""; [[life_pInact_curTarget,false],""life_fnc_togliLicenzaB"",life_pInact_curTarget,false] spawn life_fnc_MP;";

//RIMUOVI PATENTE C
_Btn2 ctrlSetText "PATENTE C";
_Btn2 buttonSetAction "hint ""Avviso: Patente C rimossa (se presente).""; [[life_pInact_curTarget,false],""life_fnc_togliLicenzaC"",life_pInact_curTarget,false] spawn life_fnc_MP";

//RIMUOVI BREVETTO PILOTA
_Btn3 ctrlSetText "BRV. PILOTA";
_Btn3 buttonSetAction "hint ""Avviso: Brevetto Pilota rimosso (se presente).""; [[life_pInact_curTarget,false],""life_fnc_togliLicenzaH"",life_pInact_curTarget,false] spawn life_fnc_MP";

//RIMUOVI PATENTE NAUTICA
_Btn4 ctrlSetText "P. NAUTICA";
_Btn4 buttonSetAction "hint ""Avviso: Patente Nautica rimossa (se presente)."";[[life_pInact_curTarget,false],""life_fnc_togliLicenzaN"",life_pInact_curTarget,false] spawn life_fnc_MP";

//RIMUOVI BREVETTO SUB
_Btn5 ctrlSetText "BRV. SUB";
_Btn5 buttonSetAction "hint ""Avviso: Brevetto Sub rimosso (se presente)."";[[life_pInact_curTarget,false],""life_fnc_togliLicenzaU"",life_pInact_curTarget,false] spawn life_fnc_MP";

//RIMUOVI PORTO D'ARMI
_Btn6 ctrlSetText "PORTO D'ARMI";
_Btn6 buttonSetAction "hint ""Avviso: Porto d'Armi rimosso (se presente)."";[[life_pInact_curTarget,false],""life_fnc_togliLicenzaA"",life_pInact_curTarget,false] spawn life_fnc_MP";
		
//RIMUOVI ARMI E MUNIZIONI
_Btn7 ctrlSetText "ARMI";
_Btn7 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_removeWeaponAction; closeDialog 0;";

_Btn8	ctrlShow false;
_Btn9	ctrlShow false;
_Btn10	ctrlShow false;

//MENU PRECEDENTE
_Back ctrlSetText "INDIETRO";
_Back buttonSetAction "[life_pInact_curTarget] call life_fnc_copInteractionMenu;";