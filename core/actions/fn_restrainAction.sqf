/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Retrains the target.
*/
private["_unit","_restrain","_runscp"];
_unit = cursorTarget;
_runscp = true;
if(isNull _unit) exitWith {}; //Not valid
if((player distance _unit > 2)) exitWith {};
if((_unit getVariable "restrained")) exitWith {};
if(side _unit == west) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//if(_unit getVariable "FAR_isUnconscious" == 1) exitWith {};
if (animationState player  ==  "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon") exitWith {}; 	//SURREND	QUIT
if (animationState player  ==  "Incapacitated") exitWith {};										//KNOCKED OUT	QUIT


if (( animationState _unit != "AinjPfalMstpSnonWnonDf_carried_fallwc" )&&( animationState _unit != "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon" )) then
{
	private ["_dirTar","_dirP","_frontDir","_frontDirMin","_frontDirMax "];
	//Check if we are behind target
	_dirTar = getDir _unit; 
	_dirP = getDir Player ;  
	_frontDir = 0;
	if (_dirTar < 180) then
	{
		_frontDir = _dirTar + 180;  
	}else{
		_frontDir = _dirTar - 180;  
	};

	_frontDirMin = _frontDir  - 80;  
	_frontDirMax = _frontDir  + 80;  


	_frontDirMin =  ( _frontDirMin / 360) ;
	_frontDirMax =  ( _frontDirMax / 360) ;
	_dirP = (_dirP/ 360) ;

	if ((_dirP >= (_frontDirMin))&&(_dirP <= (_frontDirMax))) then {_runscp = false;};
};

if (_runscp) then
{
	//Broadcast!
	[[player],"life_fnc_restrainSound",nil,true] spawn life_fnc_MP;		//Suono manette
	_unit setVariable["restrained",true,true];
	[[player], "life_fnc_restrain", _unit, false] spawn life_fnc_MP;
	[[0,format[localize "STR_NOTF_Restrained",_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
};