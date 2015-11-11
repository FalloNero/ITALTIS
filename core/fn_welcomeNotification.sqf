/*
	File: fn_welcomeNotification.sqf
	
	Description:
	Called upon first spawn selection and welcomes our player.
*/
//format["Benvenuto! %1, Per favore leggi tutto, è importante :)",name player] hintC
format["Benvenuto! %1, Per favore leggi tutto, è importante :)",player getVariable["realname",name player]] hintC
[
	"ATTENZIONE: La mod è in continuo sviluppo, stiamo ancora lavorando ad una versione finale! ",
	"Benvenuto nel server! Cerca di applicare uno stile di gioco più realistico possibile",
	"Il tasto di interazione Windows, rimpiazza la maggior parte dei menu con la rotellina. Questo tasto e' usato per le seguenti azioni:",
	"Prendere Oggetti e Soldi.",
	"Ghatering",
	"Interagire con le persone (da poliziotto)",
	"Interagire con i veicoli(riparare, etc..)",
	"Rapina in banca"
	
];
	