private ["_targets","_curTarget"];
//_curTarget = nearestObject [[8254,6461.4531,0],"il_bank"];

_curTarget = fed_bank;

_curTarget setVariable["osa_b1",0,true];
_curTarget setVariable["osa_b2",0,true];
_curTarget setVariable["osa_b3",0,true];

_curTarget animate ["gate_1Anim",0];
_curTarget animate ["gate_2Anim",0];
_curTarget animate ["gate_3Anim",0];
_curTarget animate ["gate_4Anim",0];
_curTarget animate ["gate_5Anim",0];
_curTarget animate ["gatebolt_1Anim",0];
_curTarget setObjectTextureGlobal [10,"\il_bank\textures\locked.paa"];
_curTarget animate ["gatebolt_2Anim",0];
_curTarget setObjectTextureGlobal [11,"\il_bank\textures\locked.paa"];
_curTarget animate ["gatebolt_3Anim",0]; 
_curTarget setObjectTextureGlobal [12,"\il_bank\textures\locked.paa"];


_curTarget setVariable ["b1_forced",0,true];
_curTarget setVariable ["b2_forced",0,true];
_curTarget setVariable ["b3_forced",0,true];

titleText["Porte Vault Bloccate","PLAIN"];