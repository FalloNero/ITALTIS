private ["_targets","_curTarget"];

_curTarget = fed_bank;

_curTarget setVariable[format ["osa_h1f",_door],1,true];
_curTarget setVariable[format ["osa_h2f",_door],1,true];
_curTarget setVariable[format ["osa_h3f",_door],1,true];
_curTarget setVariable[format ["osa_h4f",_door],1,true];
_curTarget setVariable[format ["osa_h5f",_door],1,true];
_curTarget setVariable[format ["osa_h6f",_door],1,true];
_curTarget setVariable[format ["osa_h7f",_door],1,true];

_curTarget animate ["h1fAnim",1];
_curTarget animate ["h1bAnim",0];
_curTarget setObjectTextureGlobal [1,"\il_bank\textures\unlocked.paa"];
_curTarget animate ["h2fAnim",0];
_curTarget animate ["h2bAnim",1];
_curTarget setObjectTextureGlobal [2,"\il_bank\textures\unlocked.paa"];
_curTarget animate ["h3fAnim",0];
_curTarget animate ["h3bAnim",1];
_curTarget setObjectTextureGlobal [3,"\il_bank\textures\unlocked.paa"];
_curTarget animate ["h4fAnim",0];
_curTarget animate ["h4bAnim",1];
_curTarget setObjectTextureGlobal [4,"\il_bank\textures\unlocked.paa"];
_curTarget animate ["h5fAnim",0];
_curTarget animate ["h5bAnim",1];
_curTarget setObjectTextureGlobal [5,"\il_bank\textures\unlocked.paa"];
_curTarget animate ["h6fAnim",0];
_curTarget animate ["h6bAnim",1];
_curTarget animate ["cdl_Anim",0]; 
_curTarget setObjectTextureGlobal [0,"\il_bank\textures\green_light.paa"];
_curTarget setObjectTextureGlobal [6,"\il_bank\textures\unlocked.paa"];
_curTarget animate ["h7fAnim",0];
_curTarget animate ["h7bAnim",1];
_curTarget setObjectTextureGlobal [7,"\il_bank\textures\unlocked.paa"];


titleText["Porte Hall Sbloccate","PLAIN"];