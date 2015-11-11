private ["_targets","_curTarget"];

_curTarget = fed_bank;

_curTarget setVariable[format ["osa_b1"],1,true];
_curTarget setVariable[format ["osa_b2"],1,true];
_curTarget setVariable[format ["osa_b3"],1,true];
_curTarget animate ["gatebolt_2Anim",1]; 
_curTarget setObjectTextureGlobal [11,"\il_bank\textures\unlocked.paa"];
_curTarget animate ["gatebolt_3Anim",1]; 
_curTarget setObjectTextureGlobal [12,"\il_bank\textures\unlocked.paa"];

titleText["Porte Vault Sbloccate","PLAIN"];