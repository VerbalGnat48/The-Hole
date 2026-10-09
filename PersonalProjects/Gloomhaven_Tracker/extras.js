/////////////////////////////////////////////
// Other functions
//

//Variables
scoreArray = [];
var isPlayer = false;
var playerIs;
var canCrit = true;

function startGame() {
	sessionStorage.setItem('selected_characters', JSON.stringify(selected_characters));
	location.href = "./02_gloomhaven.html";
}

function getRandomIntInclusive(min, max) {
	return Math.floor(Math.random() * (max - min + 1)) + min;
}

function getRandomIntExclusive(min, max) {
	return Math.floor(Math.random() * (max - min)) + min;
}

function removeElement(ID) {
	const element = document.getElementById(ID.id);
}

/////////////////////////////////////////////
// Rounds and Turns
//
//Rounds
function getScores() {
	//Get Enemy Scores
	scoreArray.length = 0;
	for (i=0; i<enemy_cards.length; i++) {
		if (enemy_cards[i][2] != 0) {
			//Get enemy_cards enemies
			var card = document.getElementById(enemy_cards[i][0] + "_Card");
			var littleGuysArray = Array.from(document.getElementById("Enemy_Box").querySelectorAll(`[id*="${enemy_cards[i][0]}"] [id*="Standee"]`) );
			for (t=0; t<littleGuysArray.length; t++) {
				//Name, Score 1, Score 2, Score 3, ELite or Normal, Standee Number
				scoreArray.push( [littleGuysArray[t].id.replace("_Standee",""), enemy_cards[i][2].split("_")[0].replace("A",""), "99", "2", littleGuysArray[t].dataset.type, littleGuysArray[t].value ] );
			}
		}
	}

	//Get Player Scores
	for (i=0; i<selected_characters.length; i++) {
		var playerScore = document.getElementById(selected_characters[i][0] + "_Score");
		var playerScore02 = document.getElementById(selected_characters[i][0] + "_Score02");
		scoreArray.push( [selected_characters[i][0], playerScore.value, playerScore02.value, "1", 0, 0 ] );
	}

	//Sort Array by Score 01, Score 02, and then ny if Player or Enemy as player goes before enemy, then if Elite or Normal, and Standee Number
	scoreArray.sort( (a,b) => a[1] - b[1] || a[2] - b[2] || a[3] - b[3] || a[4] - b[4] || a[5] - b[5] );
	inRound = true;

	//Hide Delete Buttons
	var deletes = document.querySelectorAll('.enemy-delete');
	deletes.forEach(element => {
		element.style.display = "none";
	});
}

//When adding a new Enemy in the middle of a round, add it to the score Array
document.addEventListener('input', (event) => {
	if (event.target.id.includes("Standee") && event.target.value > 0 && inRound ) {
		addEnemyScore(event.target.id.replace("_Standee","") );
	}
});

function addEnemyScore(enemyStandeeID) {
	//If specific enemy is not in score array, add it
	if (!scoreArray.includes(enemyStandeeID) ) {
		//Get Enemy Score Card
		var enemyCardElement = document.getElementById(enemyStandeeID.split("_")[0] + "_Card");
		var enemyCardIndex = enemy_cards.findIndex(row => row.includes(enemyCardElement.id.split("_")[0]) );

		//Get Standee
		var enemyStandee = document.getElementById(enemyStandeeID + "_Standee");

		//Add to Score Array and Sort
		if (enemyStandee.dataset.summoned === "false") {
			scoreArray.push( [enemyStandeeID, enemy_cards[enemyCardIndex][2].split("_")[0].replace("A",""), "99", "2", enemyStandee.dataset.type, enemyStandee.value ] );
			scoreArray.sort( (a,b) => a[1] - b[1] || a[2] - b[2] || a[3] - b[3] || a[4] - b[4] || a[5] - b[5] );
		}
	}
}

function nextRound() {
	//Un-Highlight "Start Round" Button
	var press = document.getElementById("Next_Round_Btn");
	press.style.color = "white";

	//Make all Summon Enemies Normal
	var littleGuysArray = Array.from(document.getElementById("Enemy_Box").querySelectorAll(`[id*="Standee"]`) );
	for (t=0; t<littleGuysArray.length; t++) {
		if (littleGuysArray[t].dataset.summoned === "true") {
			littleGuysArray[t].dataset.summoned = "false";
		}
	}

	//Make all Cards added mid-round Normal
	for (i=0; i<enemy_stat_cards.length; i++) {
		var guy = document.getElementById(enemy_stat_cards[i] + "_Card");
		if (guy.dataset.middle === "2") {
			guy.dataset.middle = "1";
		}
	}

	//Flip and Score
	flipEnemyAll();
	getScores();

	//Move Elements Down
	moveElementsFrom("Waning", "Inert");
	moveElementsFrom("Strong", "Waning");

	//Clear Player Shields
	for (i=0; i<selected_characters.length; i++) {
		var tempShield = document.getElementById(selected_characters[i][0] + "_Shield");
		var permShield = document.getElementById(selected_characters[i][0] + "_Shield_Perm");
		tempShield.textContent = permShield.textContent.replace("/ ", "");
	}

	//Clear Player Attacks
	for (i=0; i<selected_characters.length; i++) {
		var tempAttack = document.getElementById(selected_characters[i][0] + "_Attack");
		tempAttack.textContent = "0";
	}

	highlightPlay();

	//Update Rounnd Tracker Display
	var tracker = document.getElementById("Round_Tracker");
	tracker.textContent = Number(tracker.textContent) + 1;

	//
	var enemyCardArray = Array.from(document.getElementById("Enemy_Stat_Box").querySelectorAll(`[id$="Card"]`) );
	for (i=0; i<enemyCardArray.length; i++) {
		enemyCardArray[i].dataset.flipped = "false";
	}
	
	endOfRound = false;
	inRound = true;
}

function endRound() {
	//Know when end of round
	if (scorePrev[0] === highlightedTarget.id) {
		//Clear Highlighted Elements
		document.getElementById(scorePrev[0]).style.border = "none";
		highlightedTarget = null;
		highlightedEnemy = null;
		for (k=0; k<enemy_stat_cards.length; k++) {
			var card = document.getElementById(enemy_stat_cards[k] + "_Card");
			card.style.border = "none";
		}

		//Kill Enemies with 0 Health
		var standeeArray = Array.from(document.getElementById("Enemy_Box").querySelectorAll(`[id*="Standee"]`) );
		for (i=0; i<standeeArray.length; i++) {
			var healthElement = document.getElementById(standeeArray[i].id.replace("_Standee", "") + "_Health" );
			if (Number(healthElement.textContent) === 0) {
				standeeArray[i].parentElement.parentElement.remove();
			}
		}

		//Get Player Scores and Clear them
		for (i=0; i<selected_characters.length; i++) {
			document.getElementById(selected_characters[i][0] + "_Score").value = "";
			document.getElementById(selected_characters[i][0] + "_Score02").value = "";
		}
		inRound = false;

		//Highlight "Start Round" Button
		var press = document.getElementById("Next_Round_Btn");
		press.style.color = "chartreuse";

		//Remove Stat Cards that have no corresponding Enemies
		for (k=0; k<enemy_stat_cards.length; k++) {
			if (document.getElementById("Enemy_Box").querySelectorAll(`[id*=${enemy_stat_cards[k]}]`).length === 0) {
				removeEnemy(document.getElementById(enemy_stat_cards[k] + "_Stat") );
			}
		}

		//Show Deletes
		var deletes = document.querySelectorAll('.enemy-delete');
		deletes.forEach(element => {
			element.style.display = "block";
		});
	}
}

//Turns
var scorePrev = "blah";
var endOfRound = false;
function highlightPlay() {
	if (scoreArray.length != 0) {
		//Get New Element
		var element = document.getElementById(scoreArray[0][0]);
		var ID = element.id;
		highlightedTarget = element;

		//Apply Wound if applicable (Player)
		if (document.getElementById(element.id + "_Negatives") != null) {
			var negBox = document.getElementById(element.id + "_Negatives");
			var posBox = document.getElementById(element.id + "_Positives");
			if (selected_characters.some(row => row.includes(element.id)) && negBox.querySelector('[id*="Wound"]') !== null ) {
				//If Ward then no wound damage and remove ward
				if (!posBox.querySelector('[id*="Ward"]')) {
					var health = document.getElementById(element.id + "_Health");
					if (Number(health.textContent) - 1 >= 0) { health.textContent = Number(health.textContent) - 1; }
				}
				else {
					posBox.querySelector('[id*="Ward"]').remove();
				}
			}
		}

		//Apply Wound if applicable (Enemies)
		if (document.getElementById(element.id + "_All_Conditions") != null ) {
			var enemyConBox = document.getElementById(element.id + "_All_Conditions");
			//If Ward then no wound damage and remove ward
			if (enemyConBox.querySelector('[id*="Wound"]')) {
				if (!enemyConBox.querySelector('[id*="Ward"]')) {
					var health = document.getElementById(element.id + "_Health");
					if (Number(health.textContent) - 1 >= 0) { health.textContent = Number(health.textContent) - 1; }
				}
				else {
					enemyConBox.querySelector('[id*="Ward"]').remove();
				}
			}
		}

		//If previous element exists set it border to none
		if (scorePrev && !scorePrev.includes("blah") ) {
			var elementPrev = document.getElementById(scorePrev[0]);
			if (elementPrev) {
				elementPrev.style.border = "none";

				//Update Condition Timers
				for (i=0; i<nextTurnConditions.length; i++ ) {
					var cons = elementPrev.parentElement.querySelectorAll(`[id*=${nextTurnConditions[i]}]`);
					for (p=0; p<cons.length; p++ ) {
						cons[p].dataset.timer--;
						if (cons[p].dataset.timer === "0") {
							cons[p].remove();
						}
					}
				}
			}	
		}

		//"Activate" New Element
		scorePrev = scoreArray.shift();
		element.style.border = "3px solid chartreuse";

		//Clear Score Card highlights and highlight current Highlighted Standee coresponding score card
		for (k=0; k<enemy_stat_cards.length; k++) {
			var card = document.getElementById(enemy_stat_cards[k] + "_Card");
			card.style.border = "none";
		}
		if (enemy_stat_cards.includes(element.id.slice(0, -2) ) ) {
			var card = document.getElementById(element.id.slice(0, -2) + "_Card");
			card.style.border = "3px solid chartreuse";
		}

		//Clear Attack Modifier Visual Selection when next turn
		if (selectedModifier) {
			selectedModifier.style.border = "none";
		}

		//Clear Action Counter of Cards
		if (enemy_stat_cards.includes(element.id.slice(0, -2) ) ) {
			highlightedEnemy =  document.getElementById(element.id);

			//Clear Action Counters
			var enemyStandee = document.getElementById(highlightedEnemy.id + "_Standee");
			enemyStandee.dataset.action = 0;
			var card = document.getElementById(element.id.slice(0, -2) + "_Action_Next");
			card.textContent = "0";
		}
		else {
			highlightedEnemy = null;
		}
	}

	//End of Round Stuff
	else {
		if (!endOfRound) {
			endOfRound = true;
			endRound();
		}
	}
}

//Other
function playerCritToggle(ID) {
	var button = document.getElementById(ID);
	if (playerCrit) {
		playerCrit = false;
		button.style.border = "none";
	}
	else {
		playerCrit = true;
		button.style.border = "3px solid chartreuse";
		button.style.borderRadius = "50%";
	}
}

function playerPierceToggle(ID) {
	var button = document.getElementById(ID);
	if (playerPierce) {
		playerPierce = false;
		button.style.border = "none";
	}
	else {
		playerPierce = true;
		button.style.border = "3px solid chartreuse";
		button.style.borderRadius = "50%";
	}
}

//Enter is Start Round
//Esc clears pointer
//Q is next round
//W is next action
//E is flip enemy attack modifier

document.addEventListener('keydown', (event) => {
	//Activate Once
	if (event.repeat) return;

	//Start Round on Enter
	if (event.key === 'Enter') {
		event.preventDefault();
		nextRound();
	}
	
	//Clear Pointer on Esc
	if (event.key === 'Escape') {
		action_array.length = 0;
		document.documentElement.style.cursor = "default";
		conditionMod = null;
		follower.style.display = "none";
		attackMode = false;
		healMode = false;
	}
	
	//Next Turn/Action on Q
	if (event.key === 'q' || event.key === 'Q') {
		nextAction(highlightedTarget);
	}

	//Flip Enemy Modifier Deck on E
	if (event.key === 'e' || event.key === 'E') {
		flipEnemyModifierDeck();
	}

	//Enter Heal Mode
	if (event.key === 's' || event.key === 'S') {
		//Reset
		action_array.length = 0;
		document.documentElement.style.cursor = "default";
		conditionMod = null;
		follower.style.display = "none";
		follower.style.color = "white";
		attackMode = false;
		canCrit = true;

		healMode = true;
		follower.style.display = "";
		follower.innerText = 1;
		document.documentElement.style.cursor = `url("${ './Images/Icons/Cursors/Heal_Cursor.png' }"), auto`;
	}

	//Enter Attack Mode
	if (event.key === 'a' || event.key === 'A') {
		//Reset
		action_array.length = 0;
		document.documentElement.style.cursor = "default";
		conditionMod = null;
		follower.style.display = "none";
		follower.style.color = "white";
		healMode = false;
		canCrit = true;

		var enemyID = highlightedTarget.id.split("_")[0];

		//If Enemy Attack
		if (normal_enemies.some(substring => substring.includes(enemyID) ) ) {
			isPlayer = false;
			attackMode = true;
			enemyAction(enemyID + "_Action_Normal_Attack_Btn");
			playerIs = null;
		}

		//If Player Attack
		if (characters.some(substring => substring.includes(enemyID) ) ) {
			isPlayer = true;
			attackMode = true;
			characterAction(enemyID + "_Attack_Btn");
			playerIs = document.getElementById(highlightedTarget.id.split("_")[0] + "_Attack");
		}
	}

	//Do Heal Mode
	if (healMode === true) {
		//Add 1 to Heal Value
		if (event.key === "ArrowUp") {
			event.preventDefault();
			follower.innerText = Number(follower.innerText) + 1;
		}

		//Subtract 1 to Heal Value
		else if (event.key === "ArrowDown") {
			event.preventDefault();
			if (Number(follower.innerText) > 0) {
				follower.innerText = Number(follower.innerText) - 1;
			}
		}
	}

	//Do Attack Mode
	if (attackMode === true) {
		//Add 1 to Attack Value
		if (event.key === "ArrowUp") {
			event.preventDefault();
			follower.innerText = Number(follower.innerText) + 1;
			//Add 1 to Player Attack Display
			if (isPlayer) {
				playerIs.textContent = Number(playerIs.textContent) + 1;
			}

			//Crit +1
			if (canCrit === false) {
				follower.innerText = Number(follower.innerText) + 1;
				if (isPlayer) {
					playerIs.textContent = Number(playerIs.textContent) + 1;
				}
			}
		}

		//Subtract 1 to Attack Value
		else if (event.key === "ArrowDown") {
			event.preventDefault();
			if (Number(follower.innerText) > 0) {
				follower.innerText = Number(follower.innerText) - 1;
			}
			//Subtract 1 to Player Attack Display
			if (isPlayer &&  Number(playerIs.textContent) - 1 >= 0) {
				playerIs.textContent = Number(playerIs.textContent) - 1;
			}

			//Crit -1
			if (canCrit === false && Number(follower.innerText) - 1 >= 0) {
				follower.innerText = Number(follower.innerText) - 1;
				if (isPlayer) {
					playerIs.textContent = Number(playerIs.textContent) - 1;
				}
			}
		}

		//Crit
		else if (event.key === "ArrowLeft" && canCrit === true) {
			event.preventDefault();
			follower.innerText = Number(follower.innerText) * 2;
			follower.style.color = "darkorchid";
			canCrit = false;
		}

		//No Crit
		else if (event.key === "ArrowRight" && canCrit === false &&  Number(follower.innerText) > 1 && Number(follower.innerText) % 2 === 0) {
			event.preventDefault();
			follower.innerText = Number(follower.innerText) / 2;
			follower.style.color = "white";
			canCrit = true;
		}
	}
});

//Follow cursor with attack value
document.addEventListener('mousemove', (event) => {
	if (attackMode || healMode) {
		follower.style.left = (event.clientX + 50) + 'px';
		follower.style.top = (event.clientY) + 'px';
	}
});

























