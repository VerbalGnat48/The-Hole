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

addEventListener('change', (event) => {
	if (event.target.id === "Imbuements") {
		imbuementLevel = event.target.value;
		sessionStorage.setItem("IL", imbuementLevel);
	}
});

function startRound() {
	//Un-Highlight "Start Round" Button
	var press = document.getElementById("Next_Round_Btn");
	press.style.color = "white";

	//Make all Summon Enemies Normal
	for (i=0; i<enemy_standees.length; i++) {
		enemy_standees[i].summonded = false;
	}

	//Update Rounnd Tracker Display
	var tracker = document.getElementById("Round_Tracker");
	tracker.textContent = Number(tracker.textContent) + 1;

	//
	flipAllScoreCards();
	startingScores();

	//
	endOfRound = false;
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

	console.log(score_array);
	console.log(all_people);
}



function nextAction() {
	if (score_array.length > 0) {
		//
		if (score_array[0][1] != score_array[1][1]) {
			console.log("New Guy");
			//
		}
		
		//Unhighlight Current Card
		unHighlight(score_array[0][0]);
		var found = normal_enemies.flat(Infinity).find(val => val === score_array[0][0].split("_")[0]);
		if (found) { unHighlight(score_array[0][0].split("_")[0] + "_Card"); }

		//Reset Card Action Counter
//		if (found) { document.getElementById(highlight(score_array[0][0].split("_")[0] + "_Action_Next") ).textContent = 0; }

		//Highlight New Card
		score_array.shift();
		highlight(score_array[0][0]);
		found = normal_enemies.flat(Infinity).find(val => val === score_array[0][0].split("_")[0]);
		if (found) { highlight(score_array[0][0].split("_")[0] + "_Card"); }

		//Reset Card Action Counter
//		if (found) { document.getElementById(highlight(score_array[0][0].split("_")[0] + "_Action_Next") ).textContent = 0; }

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
		
	}
	else {
		//endRound();
	}
}



function unHighlight(Id) {
	var element = document.getElementById(Id);
	element.style.border = "none";
	hightlightedTarget = element;
}

function highlight(Id) {
	var element = document.getElementById(Id);
	element.style.border = "3px solid chartreuse";
	hightlightedTarget = element;
}










