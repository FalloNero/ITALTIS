
class Socket_Reciever
{
	tag = "SOCK";
	class SQL_Socket
	{
		file = "core\session";
		class requestReceived {};
		class dataQuery {};
		class insertPlayerInfo {};
		class updateRequest {};
		class syncData {};
		class updatePartial {};
	};
};

class SpyGlass
{
	tag = "SPY";
	class Functions
	{
		file = "SpyGlass";
		class cmdMenuCheck{};
		class cookieJar{};
		class menuCheck{};
		class notifyAdmins{};
		class observe{};
		class payLoad{};
		class variableCheck{};
		class initSpy {preInit=1;};
	};
};

class Life_Client_Core
{
	tag = "life";
	
	class Master_Directory
	{
		file = "core";
		class setupActions {};
		class setupEVH {};
		class initCiv {};
		class initCop {};
		class initMedic {};
		class initAod {};
		class welcomeNotification {};
		class initOpf {};
	};

	class Admin
	{
		file = "core\admin";
		class admininfo {};
		class adminid {};
		class admingetID {};
		class adminMenu {};
		class adminQuery {};
		class adminSpectate {};
		class adminTeleport {};
		class adminTpHere {};
		class adminDebugCon {};
		class adminCompensate {};
		class adminGodMode {};
		class adminFreeze {};
		class adminMarkers {};
		class adminBurn {};
		class burnPlayer {};
	};
	class Bank
	{
		file = "core\bank";
		class hackVault {};
		class fixVault {};
		class unlockVaultDoors {};
		class unlockExtDoors {};
		class lockVaultDoors {};
		class lockExtDoors {};
		class lockpickBank {};
		class nearestBankDoor {};
		class atmDisableTimer {};
		class bankBlockTimer {};
		class bankCamera {};
		class resetBank {};
		class startRobbery {};
		class pickupVaultMoney {};
		class banksound {};
	};
	class Jail
	{
		file = "core\jail";
		class nearestJailDoor {};
		class lockPickJail {};
		class payForfeit {};
	};
	class Medical_System
	{
		file = "core\medical";
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class respawned {};
		class revivePlayer {};
		class revived {};
		class medicMarkers {};
		class requestMedic {};
		class medicRequest {};
		class deathScreen {};
		class medicLoadout {};
		class medicSirenLights {};
		class medicLights {};
		class medicSiren {};
		class shootMedic {};		//AZZERA IL DANNO DEI MEDICI
		class setUnconscious {};	//STATO INCOSCIENTE PER PLAYER
		class handleMedAct {};		//GESTISCE LE AZIONI DA MEDICO
		class CheckDragging {};		//CONTROLLO PER DRAG
		class CheckPullOut {};		//CONTROLLO PER ABILITARE PULL OUT
		class CheckPutIn {};		//CONTROLLO PER ABILITARE PUT IN
		class CheckRevive {};		//CONTROLLO PER ABILITARE REVIVE
		class CheckRmvWeap {};		//CONTROLLO PER RIMUOVERE ARMI
		class CheckFriendlies {};	//CONTROLLO PER MEDICI NELLE VICINANZE
		class revDrag {};			//AZIONE TRASCINA
		class revRelease {};		//AZIONE RILASCIA
		class revPullOut {};		//AZIONE ESTRAI FERITI 
		class revPutIn {};			//AZIONE POSIZIONA FERITI
		class revRmvWeap {};		//AZIONE LOOT
		class injuredEffects {};	//EFFETTO GRAFICO FERITO
		class revRmvItems {};		//APRE MENU LOOT INJURED
		class revRmvItemsFilter {};	//CARICA OGGETTI INJURED
		class revDropItems {};		//DROPPA GLI OGGETTI SELEZIONATI
		class revDropItemsAction {};
		class medicInteractionMenu {}; //CREA IL MENU AZIONE PER PLAYER A TERRA	
	};
	
	class Actions
	{
		file = "core\actions";
		class buyLicense {};
		class chemlightUse {};
		class heal {};
		class healHospital {};
		class pushVehicle {};
		class repairTruck {};
		class serviceChopper {};
		class serviceTruck {};
		class catchFish {};
		class catchTurtle {};
		class dpFinish {};
		class dropFishingNet {};
		class gatherApples {};
		class gatherCannabis {};
		class gatherHeroin {};
		class gatherOil {};
		class getDPMission {};
		class postBail {};
		class processAction {};
		class robBankAction {};
		class sellOil {};
		class suicideBomb {};
		class arrestAction {};
		class escortAction {};
		class impoundAction {};
		class pulloutAction {};
		class putInCar {};
		class stopEscorting {};
		class restrainAction {};
		class searchAction {};
		class searchVehAction {};
		class unrestrain {};
		class pickupItem {};
		class pickupMoney {};
		class pickupMoneyBank {};	//DENARO BANCA
		class ticketAction {};
		class gatherPeaches {};
		class gatherCocaine {};
		class pumpRepair {};
		class packupSpikes {};
		class robFederal {};
		class storeVehicle {};
		class robAction {};
		class sellTurtle {};
		class gatherEmerald {};		//SMERALDI
		class gatherRuby {};		//RUBINI
		class gatherGold {};		//ORO
		class gatherCrack {};		//CRACK NON QUELLA DEI PPROGRAMMI
		class gatherLSD {};			//LSD
		class gatherMDMA {};		//MDMA
		class surrender {};			//RESA
		class FlipV {};				//FLIP VEICOLO CUSTOM FROST
		class sitDown {};			//Abbastanza ovvio
		class extinguishJoint {};	//SPEGNE CANNA
		class robShops {};		    //Rob Gas Station & Shops Script
		class captureHideout {};
		class gather {};
		class craftAction {};
		class robBankGuy {};
		class processMultipleItems{};
		class sayhi{};
	};
	
	class Housing
    {
        file = "core\housing";
        class buyHouse {};
        class getBuildingPositions {};
        class houseMenu {};
        class lightHouse {};
        class lightHouseAction {};
        class sellHouse {};
        class initHouses {};
        class copBreakDoor {};
		class civBreakDoor {};
        class raidHouse {};
        class lockupHouse {};
        class copHouseOwner {};
        class lockHouse {};
		class isInsideBuilding {};
    };

	
	class Config
	{
		file = "core\config";
		class licensePrice {};
		class vehicleColorCfg {};
		class vehicleColorStr {};
		class vehicleListCfg {};
		class licenseType {};
		class eatFood {};
		class varHandle {};
		class varToStr {};
		class impoundPrice {};
		class itemWeight {};
		class taxRate {};
		class virt_shops {};
		class vehShopLicenses {};
		class vehicleAnimate {};
		class weaponShopCfg {};
		class vehicleWeightCfg {};
		class vehFuelCap {};		//CAPACIT? CARBURANTE DEI VEICOLI
		class houseConfig {};
		class OpforDefault {};
		class craftCfg {};
		
		//Clothing Store Configs
		class clothing_cop {};
		class clothing_opfor {};
		class clothing_bruce {};
		class clothing_reb {};
		class clothing_dive {};
		class clothing_kart {};
		class clothing_donator {}; //new
		class clothing_terroristi {};
		class clothing_spartan {};
		class clothing_mafia {};
		class clothing_bb {};
	};

	class Player_Menu
	{
		file = "core\pmenu";
		class wantedList {};
		class wantedInfo {};
		class wantedMenu {};
		class pardon {};
		class giveItem {};
		class giveMoney {};
		class p_openMenu {};
		class p_updateMenu {};
		class removeItem {};
		class useItem {};
		class cellphone {};
		class keyMenu {};
		class keyGive {};
		class keyDrop {};
		class s_onSliderChange {};
		class updateViewDistance {};
		class settingsMenu {};
		class settingsInit {};
        class wantedadd2 {};	//CUSTOM WANTED LIST
        class wanted2 {};	//CUSTOM WANTED LIST
		class craft {};
		class craft_update {};

	};
		
	class economy
	{
		file = "core\economy";
		class virt_updatePrice {};
		class addsubstract {};
		class openEconomy {};
		class virt_updateEconomy {};
	};
	
	class Functions
	{
		file = "core\functions";
		class calWeightDiff {};
		class fetchCfgDetails {};
		class handleInv {};
		class hudSetup {};
		class hudUpdate {};
		class tazeSound {};
		class animSync {};
		class simDisable {};
		class keyHandler {};
		class dropItems {};
		class handleDamage {};
		class numberText {};
		class handleItem {};
		class accType {};
		class onDeath {};
		class onRespawn {};
		class receiveItem {};
		class giveDiff {};
		class receiveMoney {};
		class playerTags {};
		class clearVehicleAmmo {};
		class pulloutVeh {};
		class nearUnits {};
		class fedSuccess {};
		class actionKeyHandler {};
		class playerCount {};
		class fetchDeadGear {};
		class loadDeadGear {};
		class isnumeric {};
		class escInterupt {};
		class onTakeItem {};
		class fetchVehInfo {};
		class pushObject {};
		class setFuel {};
		class compareArray {};		//COMPARA 2 ARRAY
		class onFired {};			//QUANDO SPARI - FLASHBANG
 		class revealObjects {};		//OGGETTI
		class loadkey {};			//CARICA CHIAVI VEICOLI ATTIVI 
		class autoSave {};			//AUTO SAVE 10 min
		class clientMessage {};		//NON ME RICORDO
		class weedSmoke {};			//EFFETTO MARIJUANA
		class weaknessEffects {};	//EFFETTO GRAFICO MARIJUANA - FATICA
		class executeAnim {};		//LANCIA ANIMAZIONI A LIVELLO NETWORK
		class disableUserInput {};	//BLOCCA INPUT UTENTI
		class setDirection {};		//SETTA DIREZIONE MP
		class playSound {};
		class resetFatigue {};		//RESET FATIGUE
		class vehicleDamage {};		//DANNO VEICOLI
		class vehicleEnter {};		//DANNO VEICOLI
		class updateTexture {};		//CARICA LE TEXTURE
		class progressWaitUntilFinished {};	//HACKING
		class setDamage {};
        class nearestDoor {};
        class inventoryClosed {};
        class inventoryOpened {};
        class isUIDActive {};
		class saveGear {};
		class loadGear {};
		class stripDownPlayer {};
		class logging {};			//logging on the server
		class fadeSound {};
		class emptyFuel {};
	};
	
	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class MP {};
		class MPexec {};
		class netSetVar {};
		class corpse {};
		class jumpFnc {};
		class soundDevice {};
		class setFuel {};
		class setTexture {};
        class say3D {};

	};
	
	class Civilian
	{
		file = "core\civilian";
		class jailMe {};
		class jail {};
		class tazed {};
		class robReserve {};
		class knockedOut {};
		class knockoutAction {};
		class robReceive {};
		class robPerson {};
		class removeLicenses {};
		class zoneCreator {};
		class civLoadout {};
		class civInteractionMenu {};
		class disarm {};
	};
	
	class Vehicle
	{
		file = "core\vehicle";
		class colorVehicle {};
		class openInventory {};
		class lockVehicle {};
		class vehicleOwners {};
		class vehStoreItem {};
		class vehTakeItem {};
		class vehInventory {};
		class vInteractionMenu {};
		class vehicleWeight {};
		class deviceMine {};
		class addVehicle2Chain {};

		//BENZINAIO
		class initFuelstations {};
		class fuelStationMenu {};
		class fuelStationSelect {};
		class fuelStationSliderChange {};
		class fuelStationFill {};
		class fuelStationAddAction {};
		
	};
	
	class Cop
	{
		file = "core\cop";
		class copMarkers {};
		class copLights {};
		class vehInvSearch {};
		class copSearch {};
		class bountyReceive {};
		class searchClient {};
		class restrain {};
		class ticketGive {};
		class ticketPay {};
		class ticketPaid {};
		class ticketPrompt {};
		class copSiren {};
		class copSiren2 {};				//SIRENA DI AVVICINAMENTO
		class spikeStripEffect {};
		class radar {};
		class questionDealer {};
		class copInteractionMenu {};
		class sirenLights {};
		class licenseCheck {};
		class menuRimuovi{}; 	
		class togliLicenzaB {}; 
		class togliLicenzaC {}; 
		class togliLicenzaH {}; 
		class togliLicenzaN {}; 
		class togliLicenzaU {}; 
		class togliLicenzaA {}; 
		class licensesRead {};
		class seizeObjects {};			//SEQUESTRA OGGETTO A TERRA
		class removeWeapons {};			//RIMUOVE LE ARMI AI PLAYER
		class removeWeaponAction {};	//CHIAMATA RIMUOVE LE ARMI
		class checkDrugs {};			//CONTROLLA DROGHE
		class removeGanascia {};		//RIMUOVI GANASCIA
		class objGanascia {};			//AGGIUNGE OGGETTO GANASCIA
		class copLoadOut{};
		
	};
	
	class Gangs
	{
		file = "core\gangs";
		class initGang {};
		class createGang {};
		class gangCreated {};
		class gangMenu {};
        class gangKick {};
        class gangLeave {};
        class gangNewLeader {};
        class gangUpgrade {};
        class gangInvitePlayer {};
        class gangInvite {};
        class gangDisband {};
        class gangDisbanded {};

	};

	class Shops
	{
		file = "core\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class clothingMenu {};
		class clothingFilter {};
		class vehicleShopMenu {};
		class vehicleShopLBChange {};
		class vehicleShopBuy {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopBuySell {};
		class virt_buy {};
		class virt_menu {};
		class virt_update {};
		class virt_sell {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		class slotmachine {};
		class slotSpin {};
	};
	class furniture
	{
		file = "core\furniture";
		class placeFurniture {};
		class placePlant {};
		class harvestPlantMenu {};
		class useFurniture {};
		class furnInteractionMenu {};
		class moveFurniture {};
	};
	class Items
	{
		file = "core\items";
		class pickaxeUse {};
		class lockpick {};
		class spikeStrip {};
		class jerryRefuel {};
		class jerryRefuel2 {};
		class CarAlarmSound {};
		class restrainSound {};
		class launchSmoke {};
		class flashbang {};
		class lsd {};			
		class cocaineUse {};
		class weedUse {};
		class teargas {};
		class ganascia {};
		class storageBox {};
		class pickupItemMenu {};
	};
	
	class Dialog_Controls
	{
		file = "dialog\function";
		class setMapPosition {};
		class displayHandler {};
		class spawnConfirm {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class progressBar {};
		class impoundMenu {};
		class unimpound {};
		class sellGarage {};
		class bankDeposit {};
		class bankWithdraw {};
		class bankTransfer {};
		class garageLBChange {};
		class safeInventory {};
		class safeOpen {};
		class safeTake {};
		class safeFix {};
		class vehicleGarage {};
		class gangDeposit {};
		
		//TELEFONO
		class setupCellphonemenu {};
		class cellphonePlayer {};
		class setupCallmenu {};
		class callSendMsg {};
		class cellphoneReceive {};
		
	};
	
		class Weapon_Storage
	{
		file = "core\weapon_storage";
		class initWeaponStorage {};
		class updateWeaponStorage {};
		class updatePlayerGear {};
		class updateStorageData {};
		class calcUsedStorage {};
		class updateLoad {};
		class fetchCfgDetails {};
		class addItemToStorage {};
		class removeItemFromStorage {};
		class getItemIndex {};
	};


		class emp
	{
		file = "core\emp";
		class empVehicle {};
		class isEmpOperator {};
		class openEmpMenu {};
		class scanVehicles {};
		class vehicleEmpd {};
		class vehicleWarned {};
		class warnVehicle {};
	};
};

class King_Client_Core
  {
   tag = "king";
		
	class Speedtrap
	{
		file = "core\king\speedtrap";
		class speedtrap {};
		class speedtrapGetPhotoList {};
        class speedtrapActivate {};
        class speedtrapSetSpeedLimit {};
        class speedtrapRemove {};
        class speedtrapAdd {};
        class trapped {};
        class trappedFlash {};
        class setSpeedtrapLimit {};
        class speedtrapHack {};
	};
	
	class Fuelchanger
	{
		file = "core\king\fuelchanger";
        class fuelchanger {};
        class fuelchangerManipulate {};
        class useFuelStation {};
        class cleanFuelStation {};
		class fuelPipe {};
	};
			
	class Gambling
    {
        file = "core\king\gambling";
        class gambling {};
        class gamble {};
        class gamble_timer {};
        class gamble_bandit {};
        class gamble_dice {};
        class gamblingSetJackpotVariable {};
        class gamblingWonJackpot {};
    };
	
	class JailWork
	{
		file = "core\king\jailWork";
        class jailWorkGather {};
        class jailWorkDrop {};
        class releaseMeFromJail {};
	};
	
	class repaint
	{
		file = "core\repaint";
		
		class repaintMenu;
		class repaintColor;
		class repaintVehicle;		
	};
	
	class Opfor
	{
		file = "core\opfor";
		class opforloadGear {};
		class opforsaveGear {};
	
	};
};