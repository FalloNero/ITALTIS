//TRADOTTA BY CRY&PRAY v1

waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["changelog","Lista Cambiamenti"];
player createDiarySubject ["serverrules","Regole Generali"];
player createDiarySubject ["policerules","Regole Polizia"];
player createDiarySubject ["safezones","Zone Sicure (no uccisioni)"];
//player createDiarySubject ["civrules","Regole Civili"];
player createDiarySubject ["illegalitems","Attività illegali"];
//player createDiarySubject ["gangrules","Regole Gang"];
//player createDiarySubject ["terrorrules","Regole Terroristi"];
player createDiarySubject ["controls","Controlli"];

/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];
*/
	player createDiaryRecord["changelog",
		[
			"Lista cambiamenti ufficiale",
				"
					La lista dei cambiamenti ufficiale la puoi trovare sul forum BIS (cerca Altis Life RPG)
				"
		]
	];
	
	player createDiaryRecord["changelog",
		[
			"Lista dei cambiamenti personali",
				"
					Molti...
				"
		]
	];

		player createDiaryRecord ["serverrules",
		[
			"Furbate", 
				"
				Queste cose sono considerate FURBATE e non verrai cacciato, ma bannato!.<br/><br/>

				1. Uscire di prigione in qualunque altro metodo che non sia pagare la multa o scappare con l'elicottero.<br/>
				2. Uccidendoti e uscendo dal gioco di ruolo. Uscire essendo tazerati, catturati, arrestati, imprigionati, etc. Se il LOG mostra che sei stato arrestato e dopo sei morto, verrai bannato!. Non pagare la multa e poi ti uccidi per tornare a casa velocemente... cammina idiota :3<br/>
				3. Accumulando Soldi/Oggetti, se qualcuno all'inizio del gioco ti manda un grosso numero di soldi/oggetti riportalo IMMEDIATAMENTE ad un Admin e dagli tutto ciò che hai ricevuto. Fallo il più presto possibile perchè potresti essere bannato se un Admin ti vede con tutto ciò senza domande.<br/>
				4. Usando degli oggetti chiaramente HACKERATI, se un Admin ti vede che usi un oggetto simile potresti essere bannato. Riporta immediatamente l'accaduto ad un Admin.<br/>
				5. Abusare dei bug per guadagnare, c'e' un'arma duplicata da qualche parte? lasciala li e avverti un Admin. Se un Admin ti becca... sai già come finisce, ban.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["safezones",
		[
			"Zone Sicure",
				"
					Se qualcuno fa esplodere qualcosa intenzionalmente, rubba o uccide in queste zone può essere punito con ban.<br/><br/>
					
Lista Zone:.<br/><br/>

					Qualunque spawn di veicoli (Negozio o Garage)<br/>
					Qualunque negozio d'armi<br/>
					Tutti i quartieri generali dei poliziotti<br/>
					Avamposti dei ribelli<br/>
					Negozi dei donatori<br/><br/>
				"
		]
	];
					
	
	player createDiaryRecord ["serverrules",
		[
			"Offese Gravi (possibile ban)", 
				"
				Considera questo come ultimo avvertimento.<br/><br/>
				
				1. Hackeraggio<br/>
				2. Hackeraggio/!\<br/>
				3. Fare le furbate<br/>
				4. Essere cacciato più di tre volte.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Regole polizia", 
				"
				Gli elementi qui riportati possono farti cancellare il tuo profilo dal server e/o essere cacciati/bannati, dipende dalla gentilezza degli Admin....<br/><br/>
				
				1. I civili possono essere arrestati se vanno a vedere i veicoli e/o zaini degli agenti. Se è una cosa continuata... sai già che succede.<br/>
				2. I civili possono essere arrestati se pedinano gli agenti facendo scoprire la loro posizione.<br/>
				3. I civili/Ribelli che uccidono un agente, o più senza motivo verranno considerati RDMing (sparare a cazzo). Controlla la sezione RDMing.<br/>
				4. Seguire o molestare un agente per lungo tempo porterà... indovina un po?<br/>
				5. Continuare gli agenti nel loro lavoro porterà alla stessa fine di tutto il resto.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Barche", 
				"
				Gli elementi qui riportati possono farti cancellare il tuo profilo dal server e/o essere cacciati/bannati, dipende dalla gentilezza degli Admin....<br/><br/>
				
				1. Spingere continuamente le barche.<br/>
				2. Spingere le barche con l'intento di ferire o uccidere qualcuno.<br/>
				3. Correre costantemente sopra i nuotatori.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Aviazione", 
				"
				Gli elementi qui riportati possono farti cancellare il tuo profilo dal server e/o essere cacciati/bannati, dipende dalla gentilezza degli Admin....<br/><br/>
				
				1. Speronare altri elicotteri/veivoli in qualunque cosa.<br/>
				2. Volare sotto 150m sulla città. Oltre ad essere illegale e pure pericoloso... devo proprio scrivertelo?.<br/>
				3. Rubare un elicottero senza dare il tempo materiale alla persona di bloccare il veivolo (cioè fare il paraculo), se la persona non blocca il veivolo e se ne va, va bene. Ma se fai il paraculo... lo sai ;).<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Veicoli", 
				"
				Gli elementi qui riportati possono farti cancellare il tuo profilo dal server e/o essere cacciati/bannati, dipende dalla gentilezza degli Admin....<br/><br/>
				
				1. Purposefully running people over (VRDM). There are accidents, and then there is going out of your way to run someone over.<br/>
				2. Buttarti davanti ai veicoli per essere ferito/ucciso.<br/>
				3. Piantarti di faccia in altri veicoli per fare esplosioni.<br/>
				4. Continuare a provare a fregare un veicolo non tuo, uscendo dal gioco di ruolo.<br/>
				5. Ciulare un veicolo per poi distrugerlo.<br/>
				6. Comprare tanti veicoli per fare qualunque cosa già elencata.<br/>
				7. L'unica ragione per sparare ad un veicolo e per disabilitarlo o per avvertire. Non hai il permesso di distruggere i veicoli nemici.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Regole di comunicazione", 
				"
				Gli elementi qui riportati possono farti cancellare il tuo profilo dal server e/o essere cacciati/bannati, dipende dalla gentilezza degli Admin....<br/><br/>

				
				1. Non usare la chat per mandare musica.. micspam.<br/>
				2. Spammare in qualunque canale, sai già che fai una brutta fine.<br/>
				4. Il server di TeamSpeak e fatto in canali, ognuno ha il suo posto.<br/>
				5. Nessuna paraculata tra i canali nel teamspeak per avere vantaggio, insulti, etc.. e ti becchi un bel Kick, se non un Ban.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"RDM (uccisioni random)", 
				"
				Gli elementi qui riportati possono farti cancellare il tuo profilo dal server e/o essere cacciati/bannati, dipende dalla gentilezza degli Admin....<br/><br/>

				
				1. Uccidere qualcuno senza una ragione nel gioco di ruolo.<br/>
				2. Dichiarare una ribellione non da alcun motivo di uccidere qualcuno, neanche gli agenti.<br/>
				3. Agenti e Civili/Ribelli possono solamente commerciare in pubblico se ci sono ragioni legate ad un crimine.<br/>
				4. Se sei ucciso in uno scontro a fuoco, non è RDM, solo sfortuna.<br/>
				5. Uccidere qualcuno per proteggere te o qualcun'altro non e RDM.<br/>
				6. Uccidere un giocatore senza dare tempo di eseguire eventuali ordini e considerato RDM.<br/><br/>
				
				Tutto ciò deve essere controllato da un Admin in base a caso.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["serverrules",
		[
			"Regole di una nuova vita", 
				"
				Queste regole sono per tutti, civili e agenti.<br/><br/>
				
				Gli elementi qui riportati possono farti cancellare il tuo profilo dal server e/o essere cacciati/bannati, dipende dalla gentilezza degli Admin....<br/><br/>

				1. Se sei ucciso devi aspettare 15 minuti per ritornare dove sei morto.<br/>
				2. Se muori durante il gioco di ruolo tutti i tuoi crimini verrano eliminati, ma non fare i cazzone facendoti vendetta.<br/>
				3. Se vieni RDM, non è una nuova vita.<br/>
				4. Se riappari manualmente non è una nuova vita.<br/>
				5. Se ti uccidi per evitare il gioco di ruolo, sei fregato, non è una nuova vita.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Non fare il CAZZONE!", 
				"
				Se un Admin ti dice che stai facendo il cazzone... significa che lo stai facendo.<br/>
				Se causi danni sai già.....<br/>
				Non fare il cazzone ok?<br/>
				Queste regole possono essere usate a discrezione dell'Admin.<br/><br/>
				"
		]
	];
	
// Police Section
	player createDiaryRecord ["policerules",
		[
			"Rapimento.",
				"
				Un rapimento deve essere supervisionato da un Sergente, se non è disponibile, se ne occuperà la persona con il grado più alto.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"Riserve federali",
				"
				1. E' illegale per un civile entrare nelle riserve federali, a meno che non abbia una autorizzazione. Se un civile entra in queste zone sarà accompagnato fuori, se persiste....</br>
				2. Agli elicotteri che volano sulle riserve verrà chiesto di allontanarsi, se persiste...</br>
				2. Se un una riserva federale viene rapinata tutti gli agenti dovrebbero ripiegare li.</br>
				3. Gli agenti di zona devono ripiegare li, le rapine piccole possono essere fermate facilmente.</br>
				4. Gli agenti possono uccidere durante le rapine se non c'è altra soluzione, prima provare sempre a tazerare e arrestare.<br/>
				5. Gli agenti non dovrebbero sparare alla cazzo nelle costruzioni (ei traducete buildings!).<br/>
				6. Gli agenti devono evacuare i civili durante una rapina.<br/>
				7. Qualunque civile che intralcia le operazioni della polizia verrà trattato come complice.<br/>
				8. Gli ufficiali possono assumere persone o gruppi per proteggere le banche. Guarda la sezione dei Contratti.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"Aviazione",
				"
				1. Nessun elicottero può atterrare nei limiti delle città senza permesso della persona col grado più alto connessa. (Eccezioni qui sotto.)<br/>
				Kavala: L'eliporto dell'ospedale (037129) o gli attracchi(031128).<br/>
				Athira: Il campo sportivo (138185) o dietro il negozio delle licenze.(140188).<br/>
				Pyrgos: Il campo Nord/Est del negozio delle licenze.(170127)<br/>
				Sofia: Davanti al negozio d'auto.(258214) o nel campo Sud/Est del garage. (257212)<br/>
				Small towns: Un posto appropriato. Deve essere deciso dagli ufficiali in base alla situazione.<br/><br/>
				
				2. Gli elicotteri non devono atterrare sulle strade.<br/>
				3. La polizia può bloccare l'atterraggio ma non per lunghi periodi.<br/>
				4. Gli elicotteri non possono volare sotto 150m sulle città senza autorizzazione. <br/>
				5. Gli elicotteri non possono volare sulle città, solo gli elicotteri della polizia possono se c'è un'operazione in corso.<br/><br/>

				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Zone Illegali", 
				"
				1. Le zone delle gang non sono considerate illegali. Quindi un agente può entrare tranquillamente ma non può arrestare nessuno senza prove di azioni illegali. <br/>
				2. Non entrare le zone illegali se non per una incursione. Controlla la sezione di Incursioni/Campeggio.<br/>
				3. Se insegui qualcuno in una zone illegale, chiama supporto.<br/>
				4. Per nessun motivo un agente non puo sostare in una zona illegale.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Pattugliamento", 
				"
				1. La polizia può pattugliare l'isola in cerca di veicoli abbandonati o attività illegale.<br/>
				2. I pattugliamenti possono essere fatti a piedi nelle città, o in macchina fuori.<br/>
				3. Non si può pattugliare nelle zone illegali, controlla la sezione Incursioni/Campeggio.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Posto di blocco", 
				"
				Gli agenti sono incoraggiati a fare posti di blocco per la città per controllare le attività illegali.<br/><br/>
				
				1. Un  posto di blocco consiste in almeno 3 agenti, che usano almeno 2 veicoli. Un ATV non conta ma può essere usato.<br/>
				2. Un posto di blocco non può essere piazzato a meno di 300m da una zona illegale.<br/>
				3. I posti di blocco possono essere fatti sulle strade, ma non negli incroci.<br/>
				4. I posti di blocco non devono essere segnati sulle mappe.<br/><br/>


				Procedura per i posti di blocco:<br/>
				1. Il conducente deve essere fermato ad una distanza di sicurezza e spegnere il motore.<br/>
				2. Domandate al conducente ed a eventuali passeggeri se hanno armi.<br/>
				3. Chiedete al conducente e ad eventuali passeggeri di scendere, se hanno delle armi date l'ordine di abbassarle, date il giusto tempo.<br/>
				4. Chiedete da dove vengono e dove stanno andando.<br/>
				5. Chiedete se possono essere controllati.<br/>
				6. Se accettano, dovreste legarli e controllarli.<br/>
				7. Se si rifiutano, dovete lasciarli andare, a meno che ci sia una valida causa.<br/>
				8. Quando la persecuzione e finita lasciateli rientrare nel veicolo e andare via.<br/>
				9. Se viene trovato qualcosa di illegale, la persona sarà multata e/o arrestata in base al caso.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Veicoli", 
				"
				1. I veicoli nei parcheggi, o parcheggiati bene devono essere lasciati li. Andiamo pure ste cazzate devo dirvi??.<br/>
				2. I veicoli che sembrano abbandonati, danneggiati, senza guidatore possono essere sequestrati.<br/>
				3. Le barche devono essere parcheggiare regolarmente sulla riva.<br/>
				4. Qualunque veicolo che non è stato mosso per parecchio tempo può essere sequestrato.<br/>
				5. Sequestrare i veicoli è molto importante per un poliziotto, aiuta a mantenere l'isola pulita e il server con meno lag.<br/>
				6. Se in dubbio cercare sempre il proprietario/i e messagiare prima di sequestrare.<br/>
				7. I motoscafi o gli Hunters della polizia possono essere usati per assistere la cattura di un criminale. Le armi devono essere usate per disabilitare i veicoli e non distrugerli.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Velocità", 
				"
				Le seguenti velocità massime DEVONO essere forzate dalla polizia locale ovunque.<br/><br/>
				
				Nelle città più importanti:<br/>
				Vicoli/Città: 50km/h<br/>
				Strade Principali: 65km/h<br/>
				Fuori le città più importanti:<br/>
				Strade piccole: 80km/h<br/>
				Strade Principali: 110km/h<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Protocollo cittadino", 
				"
				1. Gli ufficiali possono pattugliare le seguenti città - Kavala, Athira, Pyrgos e Sofia.<br/>
				2. Gli ufficali possono andare ai negozi di macchine e controllare se ci sono macchine da sequestrare.<br/>
				3. Gli ufficiali non possono stare in giro o bighellonare nel centro della città.<br/>
				4. Gli ufficiali possono entrare in città se ci fosse una ribellione in atto, quando l'area e sicura devono lasciarla.<br/>
				5. La legge marziale non può essere dichiarata in qualsiasi momento.<br/>
				6. Le sedi della polizia sono illegali per i civili se entrano senza autorizzazione, ma non è illegale sostare vicino a meno che non stiano causando fastidio.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Arrestare e Multare",
				"
				Devono essere arrestati i criminali che possono causare danno a loro e ad altri (ma no?).<br/><br/>

				1. non puoi arrestare una persona che ha pagato per la multa che gli è stata fatta.<br/>
				2. Devi dire il motivo percui arresti una persona prima di farlo.<br/>
				3. Se un civile è ricercato può essere arrestato. Non uccedere a meno che la situazione rientra nell'utilizzo dei armi, ""Lethal Force"".<br/><br/>


				Multare un civile è considerato un avvertimento, se la legge viene infranta ma non viene arrecato danno a nessuno si può multare.<br/><br/>

				1. Le multe devono avere un prezzo equo (non fare il merdone).<br/>
				2. Chiaramente il prezzo della multa è deciso in base al danno. (è un genio quello che ha scritto queste leggi).<br/>
				3. Se viene rifiutato il pagamento di una multa è possibile arrestare.<br/>
				4. Dare ad un civile una multa enorme tipo (100k$) ti costerà tanto....<br/><br/>
				
				Una lista completa dei crimi e di cosa fare in base ad essi dovrebbe essere data ad ogni agente, se non sai cosa fare chiedi ad uno di grado superiore.<br/><br/>
				
				La lista e disponibile qui: crime.sealteamsloth.com<br/><br/>
				"
		]
	];
		
	player createDiaryRecord ["policerules",
		[
			"Armi", 
				"
				UN POLIZIOTTO NON DEVE MANI FORNIRE ARMI AD UN CIVILE, comporterà ad un eventuale Ban e rimozione dai poliziotti.<br/><br/>

				Armi legali che i civili possono tenere con permesso:<br/>
				1. P07<br/>
				2. Rook<br/>
				3. ACP-C2<br/>
				4. Zubr<br/>
				5. 4-five<br/>
				6. PDW2000<br/><br/>

				Qualunque altra arma(Compresa la P07 Silenziata [Considerata arma d'ordinanza]) è illegale.<br/><br/>

				1. I civili non possono tenere le armi in mano dentro i limiti delle città.<br/>
				2. I civili possono tenere le armi fuori le città ma devono accettare eventuali persecuzioni per la licenza e tenere le armi abbassate (Premi Ctrl due volte).<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Uso della Forza Non Letale",
				"
				L'unica arma non letale (P07 silenziata) è il tazer <br/><br/>

				1. Il tazer può essere usato per inibire i civili che si ribellano per ammanettarli.<br/>
				2. . Non scaricare il tuo tazer se non vuoi inibire un civile, facendolo a random potrebbe farti sospendere.<br/>
				3. Usa il tazer entro i limiti delle leggi, non usarlo per imporre il tuo volere.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Incursione/Campeggio",
				"
				Una incursione è definita come una squadra di agenti che invadono una zona di altà attività criminale al fine di fermare atti illegali.<br/><br/>

				1. Per fare una incursione bisogna avere almeno 4 agenti e uno di questi deve essere un Sergente.<br/>
				2. Ogni civile che si trova in un'incursione possono essere trattenuti e ricercati. Se non viene trovato nulla di illegale è necessario lasciarli andare.<br/>
				3. Se viene trovato qualcosa di illegale, si può procedere ad arrestare come al solito.<br/>
				5. . L'uso della forza letale e solo autorizata come scritto in ""uso della forza letale"".<br/>
				6. Quando l'area è sicura gli agenti devono ripiegare.<br/>
				7. Non si può fare un'altra incursione in una zona già controllata per 20 min.<br/>
				8. Se un'incursione fallisce (tutti gli agenti muoiono) la stessa regola del tempo viene applicata.<br/>
				9. Si può chiamare supporto, ma non si possono chiamare gli agenti morti, controlla ""Una nuova vita"" <br/><br/>

				Il Campeggio è la sosta di un agente in un'area.<br/><br/>

				1. I posti di blocco non sono considerati come Campeggio, controlla ""Posti di blocco"" per info.<br/>
				2. Guarda ""Rapine banche"" e ""il protocollo di Agia Marina"" per info sul Campeggio nella città principale.<br/>
				3. Campeggio nelle zone illegali è stare li per più del tempo di un'incursione, oppure se continuano a guardare e agire contro i civili di entrare nella zona.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Gradi",
				"
				L'ufficiale con il grado più alto in gioco è in carica delle forze di polizia. Esso deve seguire le leggi del suo grado e deve chiedere ad un Admin il permesso per qualunque azione.<br/><br/>

				Gradi Polizia:<br/>
				1. Capo<br/>
				2. Vice Capo<br/>
				3. Sovrintendente<br/>
				4. Capitano<br/>
				5. Tenente<br/>
				6. Sergente<br/>
				7. Brigadiere<br/>
				8. Appuntato<br/>
				9. Agente<br/><br/>

				Gli agenti che non sono ancora Accettati nel dipartimento hanno il grado piu basso e non hanno potere nelle operazioni.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Use of Lethal Force",
				"
				1. Use of Lethal force is only permitted for the protection of your life, another officers life, or a civilians life, if and only if non-lethal force would not be effective.<br/>
				2. Discharging of a weapon when not under threat or not during training exercises is not allowed. Officers caught in violation of this rule will be removed from the server and suspended from the SPD.<br/>
				3. Failure to follow proper weapons discipline and procedure will get you removed from the server and suspended from the SPD.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Teamspeak Rule",
				"
				1. All cops must be on Teamspeak 3 in a designated cop channel. Failure to be on Teamspeak during an admin check will result in your immediate dismissal from the server.<br/>
				2. Please join Teamspeak BEFORE you spawn in as a cop, heck, join Teamspeak before you even join the server.<br/><br/>
				"
		]
	];
	
	
	
// Illegal Items Section
	player createDiaryRecord ["illegalitems",
		[
			"Rebel Rules",
				"
				A rebel is one who rises in armed resistance against a government. In this case it would be the police. However, due to the small amount of police compared to the possible amount of rebels, do not attack the police without a reason, please be civil and use common sense, and don't take the word rebel literally, but instead how it will make this server fun for all.<br/><br/>
				1. A rebel must first form a gang, and then declare intentions.<br/>
				2. Resistance does not excuse RDMing (See RDMing in General Rules)<br/>
				3. Resistance roleplay should be conducted in more ways than constantly robbing the bank or shooting police officers.<br/>
				4. Resistance must be coordinated.<br/>
				5. A PROPER reason must be behind each and every attack.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Gang Rules",
				"
				1. Being in a gang is not illegal. Only when illegal crimes are committed.<br/>
				2. Being in a gang area is not illegal. Only when partaking in illegal activities.<br/>
				3. Gangs may hold and control gang areas. Other gangs may attack a controlling gang to compete for control of a gang area.<br/>
				4. To declare war on another gang, the leader must announce it in global and all gang members of both gangs must be notified. For a more long term gang war, a declaration should be made on the forums.<br/>
				5. Gangs may not kill unarmed civilians, unless said civilian is part of a rival gang and in your gangs controlled area.<br/>
				6. Gangs may not kill civilians, unless they are under threat. Killing unarmed civilians because they do not comply is considered RDM, but you can injure/damage.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Illegal Vehicles",
				"
				A civilian in control of the following prohibited vehicles is subject to the consequences defined in the unauthorized control of a prohibited vehicle law.<br/><br/>

				1. Ifrit<br/>
				2. Speedboat<br/>
				3. Hunter<br/>
				4. Police Offroad<br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Illegal Weapons",
				"
				A civilian in possession of the following is subject to the consequences as defined in the illegal possession of a firearm law.<br/><br/>

				1. MX Series<br/>
				2. Katiba Series<br/>
				3. TRG Series<br/>
				4. Mk.20 Series<br/>
				5. Mk.18 ABR<br/>
				6. SDAR Rifle<br/>
				7. Sting SMG<br/>
				8. Silenced P07 (Taser)<br/>
				9. Any explosives<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Illegal Items",
				"
				The following items are illegal to posses:<br/><br/>
				1. Turtle<br/>
				2. Cocaine<br/>
				3. Heroin<br/>
				4. Cannabis<br/>
				5. Marijuana<br/><br/>
				"
		]
	];

	
// Controls Section

	player createDiaryRecord ["controls",
		[
			"",
				"
				Y: Open Player Menu<br/>
				U: Lock and unlock cars<br/>
				F: Cop Siren (if cop)<br/>
				T: Vehicle Trunk<br/>
				Left Shift + R: Restrain (Cop Only)<br/>
				Left Shift + G: Knock out / stun (Civ Only, used for robbing them)<br/>
				Left Windows: Main Interaction key which is used for picking up items/money, interacting with cars (repair,etc) and for cops to interact with civilians. Can be rebound to a single key like H by pressing ESC->Configure->Controls->Custom->Use Action 10<br/>
				Left Shift + L: Activates cop siren lights (as a cop).<br/>
				"
		]
	];