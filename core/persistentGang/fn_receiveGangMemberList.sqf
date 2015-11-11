/*
	File: fn_receiveGangMamberList.sqf
	Author: Mario2002
	
	Description:
	gets the list data
*/
private["_data", "_dialog", "_activeUsers", "_activeUserIds", "_members", "_index"];
disableSerialization;

_data = [_this, 0, []] call BIS_fnc_param;

if(isNull (findDisplay 8600)) exitWith {diag_log "Display 8600 not found";};
_dialog = findDisplay 8600;
_members = _dialog displayCtrl 8601;
_activeUsers = [];
_activeUserIds = [];



{
    _activeUsers pushBack [_x, getPlayerUID _x];
    _activeUserIds pushBack (getPlayerUID _x);
} forEach playableUnits;

{    		
	
    _index = [(_x select 1), _activeUsers] call fnc_index;
    
	switch(_x select 2) do {
    	
        case 0 : {
            if((_x select 1) in _activeUserIds) then {
                _members lbAdd format["%1 [Trial]", (_x select 0)];
                _members lbSetData [(lbSize _members)-1, str((_activeUsers select _index) select 0)];  
                _members lbSetValue[(lbSize _members)-1, (_x select 2)];   
            } else {
                _members lbAdd format["%1 [Trial][OFFLINE]", (_x select 0)];
                _members lbSetData [(lbSize _members)-1, (_x select 1)]; 
                _members lbSetValue[(lbSize _members)-1, (_x select 2)];     
            };            
        };   
    	case 1 : {
            if((_x select 1) in _activeUserIds) then {
                _members lbAdd format["%1 [Member]", (_x select 0)];
                _members lbSetData [(lbSize _members)-1, str((_activeUsers select _index) select 0)];  
                _members lbSetValue[(lbSize _members)-1, (_x select 2)];      
            } else {
                _members lbAdd format["%1 [Member][OFFLINE]", (_x select 0)];
                _members lbSetData [(lbSize _members)-1, (_x select 1)];   
                _members lbSetValue[(lbSize _members)-1, (_x select 2)];   
            }; 
        }; 
    	case 2 : {
            if((_x select 1) in _activeUserIds) then {
                _members lbAdd format["%1 [Co-Leader]", (_x select 0)];
                _members lbSetData [(lbSize _members)-1, str((_activeUsers select _index) select 0)]; 
                _members lbSetValue[(lbSize _members)-1, (_x select 2)];       
            } else {
                _members lbAdd format["%1 [Co-Leader][OFFLINE]", (_x select 0)];
                _members lbSetData [(lbSize _members)-1, (_x select 1)];   
                _members lbSetValue[(lbSize _members)-1, (_x select 2)];   
            }; 
        }; 
    	case 3 : {
            if((_x select 1) in _activeUserIds) then {
                _members lbAdd format["%1 [Leader]", (_x select 0)];
                _members lbSetData [(lbSize _members)-1, str((_activeUsers select _index) select 0)];     
                _members lbSetValue[(lbSize _members)-1, (_x select 2)];   
            } else {
                _members lbAdd format["%1 [Leader][OFFLINE]", (_x select 0)];
                _members lbSetData [(lbSize _members)-1, (_x select 1)];   
                _members lbSetValue[(lbSize _members)-1, (_x select 2)];   
            }; 
        }; 
    };      
}forEach _data;

lbSortByValue _members;