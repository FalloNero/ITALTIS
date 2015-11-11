/*

	DISABILITA INPUT UTENTE

*/

disableUserInput true;
waitUntil {!(player getVariable "restrained")};
disableUserInput false;