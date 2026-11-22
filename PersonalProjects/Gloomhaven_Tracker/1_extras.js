/////////////////////////////////////////////
// Other functions
//

//Variables
var isPlayer = false;
var playerIs;
var canCrit = true;

function createGame() {
	sessionStorage.setItem('selected_characters', JSON.stringify(selected_characters));
	location.href = "./12_gloomhaven.html";
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


function removeStandee(element) {
	//Get Id
	var Id = element.id;

	//Remove from score_array
	if (score_array.length !== 0) {
		//If deletion target is current highlight do nextAction
		if (highlightedTarget && highlightedTarget.id == Id) {
			action_array.length = 0;
			nextAction();
		}
		//Else just remove deletion target
		else {
			score_array = score_array.filter(user => user[0] !== Id);
		}
	}

	//Remove from all_people
	if (all_people.length !== 0) {
		all_people = all_people.filter(user => user.name !== Id);
	}

	//Remove from enemy_standees
	enemy_standees = enemy_standees.filter(user => user.name !== Id);

	//Remove
	element.parentElement.remove();
}


function removeCard(element) {
	//Get Id
	var Id = element.id;

	//Remove any corresponding Standees
	var peeps = all_people;
	var name = Id.replace("_Stat","");
	for (let i = peeps.length - 1; i >= 0; i--) {
		if (Id.includes(peeps[i].name.split("_")[0] ) ) {
			var target = document.getElementById(peeps[i].name);
			removeStandee(target);
		}
	}

	//Remove Card from arrays
	enemy_score_cards = enemy_score_cards.filter(user => user[0] !== name);
	enemy_stat_cards = enemy_stat_cards.filter(user => user.name !== name);

	//Remove
	var index = enemy_stat_cards.indexOf(element.id.split("_")[0]);
	if (index > -1) { enemy_stat_cards.splice(index,1); }
	element.parentElement.remove();
}


//Give Standees their input number
document.addEventListener('input', (event) => {
	var standName = event.target.id.replace("_Standee","");
	var standNum = event.target.value;
	
	//Find Target to give number
	for (i=0; i<enemy_standees.length; i++) {
		if (enemy_standees[i].name === standName) {
			enemy_standees[i].number = Number(standNum);
		}
	}
});


//Setting Up the Battale Page
addEventListener('change', (event) => {
	if (event.target.id === "Imbuements") {
		imbuementLevel = event.target.value;
		sessionStorage.setItem("IL", imbuementLevel);
	}
});


//Game Setup
function gameSetup() {
	//Hide Plague if Plagueherald was not selected
	if (!selected_characters.find(person => person.name.includes("Plagueherald") ) ) {
		document.getElementById("Plague").style.display = "none";
	}

	//Hide Doom if no Doomstalker was not selected
	if (!selected_characters.some(person => person.name.includes("Doomstalker") ) ) {
		document.getElementById("Doom").style.display = "none";
	}

	//Set default Enemy Level
	var ESLE = document.getElementById("Enemy_Selector_Levels");
	var totalPlayers = selected_characters.length;
	var total = 0;
	for (i=0; i<selected_characters.length; i++) {
		total = total + Number(selected_characters[i].level);
	}
	ESLE.value = Math.ceil( Math.ceil(total / totalPlayers) / 2);
}


function startRound() {
	//Un-Highlight "Start Round" Button
	var press = document.getElementById("Next_Round_Btn");
	press.style.color = "white";

	//Un-Highlight Selected Modifier
	if (selectedModifier) { selectedModifier.style.border = "none"; }

	//Make all Summon Enemies Normal
	for (i=0; i<enemy_standees.length; i++) {
		enemy_standees[i].summoned = false;
	}

	//Update Rounnd Tracker Display
	var tracker = document.getElementById("Round_Tracker");
	tracker.textContent = Number(tracker.textContent) + 1;

	//Move Elements Down
	moveElementsFrom("Waning", "Inert");
	moveElementsFrom("Strong", "Waning");

	//Flip and Score
	flipAllScoreCards();
	startingScores();

	//Do Wound
	var person = all_people.find(user => user.name === score_array[0][0]);
	if (person.negCons.find(con => con.name === "Wound") ) {
		var target = document.getElementById(person.name + "_Health");
		var health = Number(target.textContent);
		if (health > 0) {
			health--;
		}
		target.textContent = health;
	}

	//
	inRound = true;
}



function startingScores() {
	//Reset Score Array
	score_array = [];
	all_people = [];

	//Get Player Scores
	for (i=0; i<selected_characters.length; i++) {
		var pS01 = document.getElementById(selected_characters[i].name + "_Score");
		var pS02 = document.getElementById(selected_characters[i].name + "_Score02");
		//Name, Score 1, Score 2, Player or Enemy, Elite or Normal, Standee Number
		score_array.push( [selected_characters[i].name, pS01.value, pS02.value, 1, 0, 0] );
		all_people.push(selected_characters[i]);
	}

	//Get Enemy Scores
	for (i=0; i<enemy_standees.length; i++) {
		var index = enemy_score_cards.findIndex(row => row.includes(enemy_standees[i].name.split("_")[0]));
		var cardScore = enemy_score_cards[index][3][1];
		//Name, Score 1, Score 2, Player or Enemy, Elite or Normal, Standee Number
		score_array.push( [enemy_standees[i].name, cardScore, 99, 2, enemy_standees[i].type, enemy_standees[i].number] );
		all_people.push(enemy_standees[i]);
	}

	//Sort Scores
	score_array.sort( (a,b) => a[1] - b[1] || a[2] - b[2] || a[3] - b[3] || a[4] - b[4] || a[5] - b[5] );

	//Highlight Card(s)
	highlight(score_array[0][0]);
	var found = normal_enemies.flat(Infinity).find(val => val === score_array[0][0].split("_")[0]);
	if (found) { highlight(score_array[0][0].split("_")[0] + "_Card"); }

	//Set Action Array
	setActionArray(score_array[0]);
}



function nextAction() {
	if (score_array.length > 0) {
		//No New Action, hightlight next guy
		if (action_array.length === 0) {

			//Subtract 1 from the current highlighted targets conditions and remove if timer = 0
			if (highlightedTarget !== null) {
				var person = all_people.find(user => user.name === score_array[0][0]);
				//Pos
				for (let i = person.posCons.length - 1; i >= 0; i--) {
					person.posCons[i].timer--;
					if (person.posCons[i].timer === 0) {
						removeCondition(person.posCons, person.posCons[i].name, person.name);
					}
				}
				//Neg
				for (let i = person.negCons.length - 1; i >= 0; i--) {
					person.negCons[i].timer--;
					if (person.negCons[i].timer === 0) {
						removeCondition(person.negCons, person.negCons[i].name, person.name);
					}
				}
			}

			//Unhighlight Current Card
			unHighlight(score_array[0][0]);
			var found = normal_enemies.flat(Infinity).find(val => val === score_array[0][0].split("_")[0]);
			if (found) { unHighlight(score_array[0][0].split("_")[0] + "_Card"); }

			//Reset Card Action Counter
			if (found) { document.getElementById(score_array[0][0].split("_")[0] + "_Action_Next").textContent = 0; }

			if (score_array.length > 1) {
				//If next card has a different score
				if (score_array[0][1] != score_array[1][1]) {
					var previous_scorer = score_array[0][0];
					score_array.shift();

					score_array.push(...temp_score_array);
					temp_score_array = [];

					for (let i = score_array.length - 1; i >= 0; i--) {
						if (score_array[i][0].split("_")[0] === previous_scorer.split("_")[0]) {
							score_array.splice(i, 1);
						}
					}

					score_array.sort( (a,b) => a[1] - b[1] || a[2] - b[2] || a[3] - b[3] || a[4] - b[4] || a[5] - b[5] );
				}
				else {
					score_array.shift();
				}
				
				//Highlight New Card
				highlight(score_array[0][0]);
				found = normal_enemies.flat(Infinity).find(val => val === score_array[0][0].split("_")[0]);
				if (found) { highlight(score_array[0][0].split("_")[0] + "_Card"); }

				//Reset Card Action Counter
				if (found) { document.getElementById(score_array[0][0].split("_")[0] + "_Action_Next").textContent = 0; }

				//Clear Attack Modifier Visual
				if (selectedModifier) {
					selectedModifier.style.border = "none";
				}

				//Reset Card Attack Values
				for (i=0; i<enemy_stat_cards.length; i++) {
					var nAction = document.getElementById(enemy_stat_cards[i].name + "_Action_nAttack");
					var eAction = document.getElementById(enemy_stat_cards[i].name + "_Action_eAttack");
					nAction.textContent = enemy_stat_cards[i].nAttack;
					eAction.textContent = enemy_stat_cards[i].eAttack;
				}
				
				//Do Wound
				var person = all_people.find(user => user.name === score_array[0][0]);
				if (person.negCons.find(con => con.name === "Wound") ) {
					var target = document.getElementById(person.name + "_Health");
					var health = Number(target.textContent);
					if (health > 0) {
						health--;
					}
					target.textContent = health;
				}
				
				//Set Actions
				setActionArray(score_array[0]);
			}
		}
		
		//New Action
		else {
			action_array.shift();
			applyCardAttackAction()
			var card = document.getElementById(score_array[0][0].split("_")[0] + "_Action_Next");
			card.textContent = Number(card.textContent) + 1;

			//Un-Highlight Selected Modifier
			if (selectedModifier) { selectedModifier.style.border = "none"; }
		}

		//End of Round
		if (highlightedTarget === null) {
			//Remove Standees with 0 Health
			for (let i = all_people.length - 1; i >= 0; i--) {
				var target = document.getElementById(all_people[i].name + "_Health");
				var health = Number(target.textContent);
				if (health === 0) {
					var standee = document.getElementById(all_people[i].name);
					removeStandee(standee);
				}
			}

			//Remove any Cards with 0 corrsponding standees
			for (let i = enemy_score_cards.length - 1; i >= 0; i--) {
				if (!all_people.find(user => user.name.includes(enemy_score_cards[i][0]) ) ) {
					var card = document.getElementById(enemy_score_cards[i][0] + "_Stat");
					removeCard(card);
				}
			}
		}
	}
}

function unHighlight(Id) {
	var element = document.getElementById(Id);
	element.style.border = "none";
	if (!Id.includes("Card")) {
		highlightedTarget = null;
	}
}

function highlight(Id) {
	var element = document.getElementById(Id);
	element.style.border = "3px solid chartreuse";
	if (!Id.includes("Card")) {
		highlightedTarget = element;
	}
}


function setActionArray(target) {
	if (highlightedTarget.id.includes("_")) {
		//Get index of where name is at
		var index = enemy_score_cards.findIndex(row => row.includes(highlightedTarget.id.split("_")[0]));

		//Give Cards Actions to Action Array
		action_array = enemy_score_cards[index][3][2].slice();
		applyCardAttackAction()
	}
}

document.addEventListener('keydown', (event) => {
	//Activate Once
	if (event.repeat) return;

	//Start Game on Enter
	if (event.key === 'Enter') {
		startRound();
	}

	//Clear Pointer on Esc
	else if (event.key === 'Escape') {
		document.documentElement.style.cursor = "default";
		conditionMod = null;
		follower.style.display = "none";
		attackMode = false;
		healMode = false;
		conditionsMode = false;
	}

	//Next Turn/Action on Q
	else if (event.key === 'q' || event.key === 'Q') {
		nextAction();
	}

	//Enter Attack mode
	else if (event.key === 'a' || event.key === 'A') {
		//Set Array
		var Id = highlightedTarget.id;
		var name = Id.split("_")[0];
		var person = all_people.find(user => user.name === Id);
		var splitCount = Id.split("_").length - 1;
		var action;

		//If =1 then Enemy
		if (splitCount == 1) {
			var type = "n";
			if (person.type === 2) {
				type = "e";
			}
			var attackValue = document.getElementById(name + "_Action_" + type + "Attack");
			enemyAttack = true;
			attacker = name;
		}

		//If =0 then Player
		else {
			var attackValue = document.getElementById(name + "_Attack");
			enemyAttack = false;
			attacker = null;
		}

		//Set Cursor
		document.documentElement.style.cursor = `url("${ './Images/Icons/Cursors/Attack_Cursor.png' }"), auto`;
		follower.innerText = attackValue.textContent;
		follower.style.display = "block";

		attackMode = true;
	}
});

//Follow cursor with attack value
document.addEventListener('mousemove', (event) => {
	if (attackMode || healMode || conditionsMode) {
		follower.style.left = (event.clientX + 50) + 'px';
		follower.style.top = (event.clientY) + 'px';
	}
});




