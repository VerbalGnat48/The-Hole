/////////////////////////////
// Cards
//
var prevScore;

function flipEnemy(element) {
	//Get ID
	var ID = element.id;

	//Flip Enemy Score Card
	var scoreArray = [];
	var i = enemy_cards.findIndex(row => row.includes(ID.split("_")[0]) );

	//Shuffle card Stack if score card has shuffle icon
	if (enemy_cards[i][4] && enemy_cards[i][1][enemy_cards[i][4]][7]) {
		enemy_cards[i][4] = null;
		shuffleScores(element);
	}


	//Make Array of Enemy Scores
	for (j=0; j<enemy_cards[i][1].length; j++) {
		if (enemy_cards[i][1][j][6] === true) {
			var card = enemy_cards[i][1][j][1] + enemy_cards[i][1][j][5];
			scoreArray.push(card);
		}
	}

	//Reset Attack Values
	for (index=0; index<enemy_types.length; index++) {
		var enemyAttack = document.getElementById(enemy_cards[i][0] + "_Action" + enemy_types[index] + "_Attack");
		enemyAttack.textContent = Number(enemyAttack.dataset.baseAttack);
		enemyAttack.dataset.extraAttack = Number(enemyAttack.textContent);
	}

	//Make Next Action Button clickable again
	document.getElementById(enemy_cards[i][0] + "_Action_Next").style.pointerEvents = "auto";

	//Shuffle Cards if hand is empty
	if (scoreArray.length === 0) {
		shuffleScores(element);
	}

	//Randomly select a Number/Score
	var number = getRandomIntExclusive(0,scoreArray.length);
	var score = scoreArray[number];
	enemy_cards[i][2] = score;

	//Get/Combine Attack Value(s)
	var jndex = 0;
	for (j=0; j<enemy_cards[i][1].length; j++) {
		var card = enemy_cards[i][1][j][1] + enemy_cards[i][1][j][5];
		if (card === score) {
			enemy_cards[i][1][j][6] = false;
			enemy_cards[i][3].length = 0;
			for ( k=0; k<enemy_cards[i][1][j][2].length; k++) {
				//Get Array of Enemy Attack values
				enemy_cards[i][3].push(enemy_cards[i][1][j][2][k]);
				enemy_cards[i][4] = jndex;
			}
			break;
		}
		jndex++;
	}

	//Update Displayed Card/Values
	var enemyScoreImage = document.getElementById(enemy_cards[i][0] + "_Card_Img");
	if (jndex != 8) { enemyScoreImage.src = enemy_cards[i][1][jndex][4]; }

	//Reset Shield to base value
	const enemyBox = document.getElementById("Enemy_Box");
	var allEnemyShieldsArray = Array.from(enemyBox.querySelectorAll(`[id*="${element.id.split('_')[0]}"] [id*="Shield"]`) );
	for (p=0; p<allEnemyShieldsArray.length; p++) {
		var enemy = allEnemyShieldsArray[p];
		enemy.textContent = enemy.dataset.shield;
	}

	//+1 Action Counter
	const actionCount = document.getElementById(enemy_cards[i][0] + "_Action_Next" );
	actionCount.textContent = 0;

	nextAction(document.getElementById(enemy_cards[i][0] + "_Card") );

	//
	if (inRound) {
		element.dataset.flipped = "true";
	}
}

function shuffleScores(element) {
	//Reset Score Card to base info
	for (i=0; i<enemy_cards.length; i++ ) {
		if (enemy_cards[i][0] === element.id.split("_")[0]) {
			for (j=0; j<enemy_cards[i][1].length; j++) {
				enemy_cards[i][1][j][6] = true;
			}

			//Reset Attack Value
			var enemyScoreImage = document.getElementById(enemy_cards[i][0] + "_Card_Img");
			enemyScoreImage.src = "./Images/Monster_Back.jpg";
			for (h=0; h<enemy_types.length; h++) {
				var attack = document.getElementById(enemy_cards[i][0] + "_Action" + enemy_types[h] + "_Attack");
				attack.textContent = document.getElementById(enemy_cards[i][0] + "_Stat" + enemy_types[h] + "_A").textContent.replace("A:","");
			}

			//+1 Action Counter
			const actionCount = document.getElementById(enemy_cards[i][0] + "_Action_Next" );
			actionCount.textContent = 0;

			if (element.dataset.flipped === "false") {
				flipEnemy(element);
			}

			break;
		}
	}
}

function flipEnemyAll() {
	for (jerry=0; jerry<enemy_stat_cards.length; jerry++) {
		var enemyCard = document.getElementById(enemy_stat_cards[jerry] + "_Card");
		if (enemyCard.dataset.flipped === "false") {
			flipEnemy(enemyCard);
		}
	}
}

function shuffleEnemyAll() {
	var index = 0;
	while (index < enemy_cards.length ) {
		if (document.getElementById(enemy_cards[index][0].replace(" ","") + "_Card") ) {
			shuffleScores( document.getElementById(enemy_cards[index][0].replace(" ","") + "_Card") );
		}
		index++;
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

function setDifficulty() {
	//Re-assign Imbuement Level
	const tempString = sessionStorage.getItem('IL');
	imbuementLevel = JSON.parse(tempString);

	switch (imbuementLevel) {
		case 1:
			enemyModifiers = [ [0,0,0,0,0,0,"0_Poison",+1,+1,+1,+1,+1,+1,+1,+1,-1,-1,-2,+2,"+2_Muddle","Null","Crit"],
			[true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true], ];
			break;

		case 2:
			enemyModifiers = [ [0,0,0,0,"0_Poison","0_Wound",+1,+1,+1,+1,+1,+1,+1,+1,"+1_Curse","+1_Heal","+1_Heal",-1,-1,+2,"+2_Muddle",+3,"Null","Crit"],
			[true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true], ];
			break;

		default:
			enemyModifiers = [ [0,0,0,0,0,0,+1,+1,+1,+1,+1,-1,-1,-1,-1,-1,-2,+2,"Null","Crit"],
			[true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true], ];
	}
}

function flipEnemyModifierDeck() {
	//Random Number
	do {
		number = getRandomIntExclusive(0,enemyModifiers[0].length);
	} while (!enemyModifiers[1][number] && enemyModifiers[1].includes(true) );

	//Make Display match selected Number/Card
	if (enemyModifiers[1][number]) {
		const modDeck = document.getElementById("EnemyModDeck");
		const modDeckOld = document.getElementById("EnemyModDeckOld");
		modDeckOld.src = modDeck.src;
		modDeckOld.dataset.add = modDeck.dataset.add;
		modDeckOld.dataset.condition = modDeck.dataset.condition;
		modDeck.src = "./Images/AttackModifiers/" + enemyModifiers[0][number] + ".png";
		if (enemyModifiers[0][number].length > 4) {
			modDeck.dataset.add = enemyModifiers[0][number].split("_")[0];
			modDeck.dataset.condition = enemyModifiers[0][number].split("_")[1];
		} else {
			modDeck.dataset.add = enemyModifiers[0][number];
			modDeck.dataset.condition = "none";
		}
	}
	enemyModifiers[1][number] = false;
	var attack;
	if (enemyModifiers[0][number].length > 4) {
		attack = enemyModifiers[0][number].split("_")[0];
	} else {
		attack = enemyModifiers[0][number];
	}

	//Shuffle at End of Cards
	if (enemyModifiers[1].every(value => value === false) ) {
		shuffleEnemyModifierDeck();
	}

	//Add New Attack Value to Displayed Enemy Attack Value(s)
	addAttackModifier(modType);

	//Remove any Bless/Curse cards after being pulled
	if (attack === "Bless" || attack === "Curse") {
		if (number > -1) {
			enemyModifiers[0].splice(number,1);
			enemyModifiers[1].splice(number,1);
		}
		if (attack === "Curse") { 
			curses--;
		}
	}

	//Play Card Flip Sound
	const audio = new Audio('./Audio/Flip.wav');
	audio.play();
}

function shuffleEnemyModifierDeck() {
	for (i=0; i<enemyModifiers[1].length; i++) {
		enemyModifiers[1][i] = true;
	}
	var modDeck = document.getElementById("EnemyModDeck");
	modDeck.src = "./Images/AttackModifiers/Back.png";
	modDeck = document.getElementById("EnemyModDeckOld");
	modDeck.src = "./Images/AttackModifiers/Back.png";

	for (i=0; i<enemy_stat_cards.length; i++) {
		var enemyName = enemy_stat_cards[i].replace(" ","");
		var enemyAttack = document.getElementById(enemyName + "_Attack");
		enemyAttack.textContent = Number(enemyAttack.dataset.baseAttack);
	}

	selectedModifier.style.border = "none";
}

function modifyEnemyModifierDeck(action) {
	if (curses < 10 && action === "Curse") {
		enemyModifiers[0].push(action);
		enemyModifiers[1].push(true);
		curses++;
	}
	else {
		enemyModifiers[0].push(action);
		enemyModifiers[1].push(true);
	}
}

function addAttackModifier(ID) {
	//Add New Attack Value to Displayed Enemy Attack Value(s)
	var attack = document.getElementById(ID).dataset.add;
	atkModCon = document.getElementById(ID).dataset.condition
	for (i=0; i<enemy_stat_cards.length; i++) {
		var enemyName = enemy_stat_cards[i].replace(" ","");
		for (index=0; index<enemy_types.length; index++) {

			//Update Enemy Attack Number
			var enemyAttack = document.getElementById(enemyName + "_Action" + enemy_types[index] + "_Attack");
			if (attack != "Null" && attack != "Curse" && attack != "Crit" && attack != "Bless" && enemyAttack) {
				enemyAttack.textContent = Number(enemyAttack.dataset.extraAttack) + Number(attack);
			}
			else if ( (attack === "Crit" || attack === "Bless" ) && enemyAttack) {
				enemyAttack.textContent = Number(enemyAttack.dataset.extraAttack) + Number(enemyAttack.dataset.extraAttack);
			}
		}
	}
	selectedModifier = document.getElementById(ID);
	selectedModifier.style.border = "3px solid chartreuse";
}

const enemy_types = ["_Normal", "_Elite"];

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
		addAttackModifier("EnemyModDeck");
		selectedModifier = clickedElement;
		modType = "EnemyModDeck";
	}
	else if (clickedElement.id === "EnemyModDeckOld") {
		clickedElement.style.border = "3px solid chartreuse";
		document.getElementById("EnemyModDeck").style.border = "none";
		addAttackModifier("EnemyModDeckOld");
		selectedModifier = clickedElement;
		modType = "EnemyModDeckOld";
	}
});
