/////////////////////////////
// Cards
//
var prevScore;

const modDeck = document.getElementById("EnemyModDeck");
const modDeckOld = document.getElementById("EnemyModDeckOld");

function flipScoreCard(element) {
	//Get Id
	var Id = element.id;

	//Get index of where name is at
	var index = enemy_score_cards.findIndex(row => row.includes(Id.split("_")[0]));

	//Check if card can be flipped
	if (enemy_stat_cards[index].flipped && !enemy_stat_cards[index].fresh) {
		enemy_stat_cards[index].flipped = false;
		return;
	}

	//Check if current card says to shuffle
	if (enemy_score_cards[index][3]) {
		if (enemy_score_cards[index][3][7] === true) {
			while (enemy_score_cards[index][2].length > 0) {
				enemy_score_cards[index][1].push(enemy_score_cards[index][2].shift())
			}
			enemy_score_cards[index][1].push(enemy_score_cards[index][3]);
		}
	}
	
	//Ranomly Choose a Useable score card to use
	var total = enemy_score_cards[index][1].length;
	//If non then shuffle
	if (total === 0) {
		while (enemy_score_cards[index][2].length > 0) {
			enemy_score_cards[index][1].push(enemy_score_cards[index][2].shift())
		}
	}
	total = enemy_score_cards[index][1].length - 1;
	//Select random usable card
	var kndex = getRandomIntInclusive(0, total)
	//Move active card to used
	if (enemy_score_cards[index][3]) {
		enemy_score_cards[index][2].push(enemy_score_cards[index][3]);
	}
	//Move useable card to active
	enemy_score_cards[index][3] = enemy_score_cards[index][1][kndex];
	enemy_score_cards[index][1].splice(kndex, 1);


	//Reset Score Card Attack Values
	var nAction = document.getElementById(enemy_stat_cards[index].name + "_Action_nAttack");
	var eAction = document.getElementById(enemy_stat_cards[index].name + "_Action_eAttack");
	nAction.textContent = enemy_stat_cards[index].nAttack;
	eAction.textContent = enemy_stat_cards[index].eAttack;

	//Update Dsiplayed Card
	var scoreImg = document.getElementById(enemy_score_cards[index][0] + "_Card_Img");
	scoreImg.src = enemy_score_cards[index][3][4];

	//Reset Enemy Standee Shields to Zero
	for (j=0; j<enemy_standees.length; j++) {
		if (enemy_standees[j].name.includes(enemy_stat_cards[index].name)) {
			var standee = document.getElementById(enemy_standees[j].name + "_Shield");
			standee.textContent = enemy_standees[j].shield;
		}
	}

	//
//	if (inRound) {
//		enemy_stat_cards[index].flipped = true;
//	}
	
//	enemy_stat_cards[index].fresh = false;
}

function flipAllScoreCards() {
	for (i=0; i<enemy_stat_cards.length; i++) {
		flipScoreCard(document.getElementById(enemy_stat_cards[i].name + "_Card"));
	}
}

////////////////////////
// Enemy Modifier Deck
//
var curses = 0;
var number;
var modType = "EnemyModDeck";
var imbuementLevel;
var enemyModifiers;
var selectedModifier;
const enemy_types = ["_Normal", "_Elite"];
const simple_enemy_types = ["_n", "_e"];

function setDifficulty() {
	//Re-assign Imbuement Level
	const tempString = sessionStorage.getItem('IL');
	imbuementLevel = JSON.parse(tempString);

	//Get Modifeir Values
	switch (imbuementLevel) {
		case 1:
			enemyModifiers = [0,0,0,0,0,0,"0_Poison",1,1,1,1,1,1,1,1,-1,-1,-2,2,"2_Muddle","Null","Crit"];
			break;

		case 2:
			enemyModifiers = [0,0,0,0,"0_Poison","0_Wound",1,1,1,1,1,1,1,1,"1_Curse","1_Heal","1_Heal",-1,-1,2,"2_Muddle",3,"Null","Crit"];
			break;

		default:
			enemyModifiers = [0,0,0,0,0,0,1,1,1,1,1,-1,-1,-1,-1,-1,-2,2,"Null","Crit"];
	}

	//Create Actual Deck
	for (i=0; i<enemyModifiers.length; i++) {
		modifier_deck[0].push(new ModifierCard(enemyModifiers[i]) );
	}
}

function flipModifierDeck() {
	//Check if Current Card 2 says to Shuffle
	if (modifier_deck[3]) {
		if (modifier_deck[3].shuffle) {
			shuffleModifierDeck();
			return;
		}
	}

	//Ranomly Choose a Useable card to use
	var total = modifier_deck[0].length - 1;
	//If not then shuffle
	if (total === 0) {
		shuffleModifierDeck();
		return;
	}
	total = modifier_deck[0].length - 1;

	//Select Random Useable Card
	var index = getRandomIntInclusive(0, total);

	//Move 2nd Card to Used
	if (modifier_deck[3]) { modifier_deck[1].push(modifier_deck[3]); }

	//Move 1st Card to 2nd
	if (modifier_deck[2]) { modifier_deck[3] = modifier_deck[2]; }

	//Move Useable Card to 1st
	modifier_deck[2] = modifier_deck[0][index];
	modifier_deck[0].splice(index, 1);

	//Remove any Bless or Curse acrds
	for (i=0; i<modifier_deck[1].length; i++) {
		if ( modifier_deck[1][i].effect === "Bless" || modifier_deck[1][i].effect === "Curse"  ) {
			modifier_deck[1].splice(i, 1)
		}
	}

	//Update Display
	if (modifier_deck[2]) {	modDeck.src = "./Images/AttackModifiers/" + modifier_deck[2].name + ".png"; }
	if (modifier_deck[3]) { modDeckOld.src = "./Images/AttackModifiers/" + modifier_deck[3].name + ".png"; }
	
	//Add Attack Value to Score Cards
	addAttackModifier(modifier_deck[2], "EnemyModDeck");

	//Play Card Flip Sound
	const audio = new Audio('./Audio/Flip.wav');
	audio.play();
}

function shuffleModifierDeck() {
	//Reset Cards Visually
	modDeck.src = "./Images/AttackModifiers/Back.png";
	modDeckOld.src = "./Images/AttackModifiers/Back.png";

	//Reset All Cards to Useable
	for (i=0; i<modifier_deck[1].length; i++) {
		modifier_deck[0].push(modifier_deck[1].shift())
	}
	if (modifier_deck[2]) {
		modifier_deck[0].push(modifier_deck[2]);
		modifier_deck[2] = [];
	}
	if (modifier_deck[3]) {
		modifier_deck[0].push(modifier_deck[3]);
		modifier_deck[3] = [];
	}

	//Reset Attack Values
	for (i=0; i<enemy_stat_cards.length; i++) {
		var nAction = document.getElementById(enemy_stat_cards[i].name + "_Action_nAttack");
		var eAction = document.getElementById(enemy_stat_cards[i].name + "_Action_eAttack");
		nAction.textContent = enemy_stat_cards[i].nAttack;
		eAction.textContent = enemy_stat_cards[i].eAttack;
	}

	if (selectedModifier) { selectedModifier.style.border = "none"; }
}

function modifyModifierDeck(action) {
	if (curses < 10 && action === "Curse") {
		modifier_deck[0].push(new ModifierCard("Curse") );
		curses++;
	}
	else if (action === "Bless") {
		modifier_deck[0].push(new ModifierCard("Bless") );
	}
	shuffleModifierDeck();
}

function addAttackModifier(mod_card, Id) {
	//Reset Attack Values
	for (i=0; i<enemy_score_cards.length; i++) {
		var nAction = document.getElementById(enemy_stat_cards[i].name + "_Action_nAttack");
		var eAction = document.getElementById(enemy_stat_cards[i].name + "_Action_eAttack");
		nAction.textContent = enemy_stat_cards[i].nAttack;
		eAction.textContent = enemy_stat_cards[i].eAttack;

		//Add Modifier Value
		//If Normal
		if (mod_card.effect != "Null" && mod_card.effect != "Curse" && mod_card.effect != "Crit" && mod_card.effect != "Bless" ) {
			nAction.textContent = Number(nAction.textContent) + Number(mod_card.value);
			eAction.textContent = Number(eAction.textContent) + Number(mod_card.value);
		}
		//If Crit/Bless
		else if (mod_card.effect === "Crit" || mod_card.effect === "Bless" ) {
			nAction.textContent = Number(nAction.textContent) + Number(nAction.textContent);
			eAction.textContent = Number(eAction.textContent) + Number(eAction.textContent);
		}
	}

	//Select First Modifier
	selectedModifier = document.getElementById(Id);
	selectedModifier.style.border = "3px solid chartreuse";
}



function makeEnemyScoreCard(enemyName, score, actions, enemyType, img, shuffle) {
	//Seperate all actions
	var all_actions = [];
	var seperate_actions = actions.split("|");
	for (i=0; i<seperate_actions.length; i++) {
		all_actions.push(seperate_actions[i].trim() );
	}

	//Make all cards temporarily unique
	var image = img;
	if (img === "A") {
		image = img.replace("A","");
	}

	//Get Image(s)
	var cardSrc = "./Images/Gloomhaven_2e/Enemies/Initiatives/" + enemyName + "_" + score + image + ".png";
	var cardSrc02 = cardSrc;
	if (enemyType.includes("Scout") ) {
		cardSrc02 = "./Images/Gloomhaven_2e/Enemies/Initiatives/" + "Scout_" + score + image + ".png";
	}
	else if (enemyType.includes("Archer") ) {
		cardSrc02 = "./Images/Gloomhaven_2e/Enemies/Initiatives/" + "Archer_" + score + image + ".png";
	}
	else if (enemyType.includes("Guard") ) {
		cardSrc02 = "./Images/Gloomhaven_2e/Enemies/Initiatives/" + "Guard_" + score + image + ".png";
	}
	else if (enemyType.includes("Shaman") ) {
		cardSrc02 = "./Images/Gloomhaven_2e/Enemies/Initiatives/" + "Shaman_" + score + image + ".png";
	}
	else if (enemyType.includes("Priest") ) {
		cardSrc02 = "./Images/Gloomhaven_2e/Enemies/Initiatives/" + "Priest_" + score + image + ".png";
	}
	else if (enemyType.includes("Imp") ) {
		cardSrc02 = "./Images/Gloomhaven_2e/Enemies/Initiatives/" + "Imp_" + score + image + ".png";
	}
	else if (enemyType.includes("Boss") ) {
		cardSrc02 = "./Images/Gloomhaven_2e/Enemies/Initiatives/" + "Boss_" + score + image + ".png";
	}

	//Make Array of Enemy Initiative Cards
	var array = [];
	for (i=0; i<enemy_cards.length; i++ ) {
		if (enemy_cards[i][0] === enemyName) {
			array.push(enemyName, score, all_actions, cardSrc, cardSrc02, img, true, shuffle);
			enemy_cards[i][1].push(array);
		}
	}
}

document.addEventListener('click', function(event) {
    // This is the exact DOM element under the mouse
    const clickedElement = event.target; 
	const ID = clickedElement.id;
	const isCtrlOrCmd = event.ctrlKey || event.metaKey;

	//Select Enemy Modifier
	if (clickedElement.id === "EnemyModDeck") {
		clickedElement.style.border = "3px solid chartreuse";
		document.getElementById("EnemyModDeckOld").style.border = "none";
		addAttackModifier(modifier_deck[2], "EnemyModDeck");
		selectedModifier = clickedElement;
		modType = "EnemyModDeck";
	}
	else if (clickedElement.id === "EnemyModDeckOld") {
		clickedElement.style.border = "3px solid chartreuse";
		document.getElementById("EnemyModDeck").style.border = "none";
		addAttackModifier(modifier_deck[3], "EnemyModDeckOld");
		selectedModifier = clickedElement;
		modType = "EnemyModDeckOld";
	}
});
