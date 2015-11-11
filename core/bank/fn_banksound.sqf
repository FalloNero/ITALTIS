/* 
by cry, this useless shit does sound things 
*/
_cP=0;

while {true} do
{

[[player,"bank_alarm"],"life_fnc_playsound",nil,true] spawn life_fnc_MP;
sleep 9;
_cP = _cP + 1;
if(_cP >= 30) exitWith {};
};