#include "macro.hpp"
/*
	File: fn_getItemIndex.sqf
	Author: Mario2002
	
	Description:
	returns the index of storage item 
*/
private["_needle", "_haystack", "_index", "_i"];

_needle = _this select 0;
_haystack = _this select 1;

_index = -1;
_i = 0;

{
    if (_needle == _x) exitWith {
        _index = _i;
    };    
    _i = _i + 1;
} forEach _haystack;

_index;

