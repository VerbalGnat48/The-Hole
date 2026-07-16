
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

scoreArray = [];
function getScores() {
	//Get Enemy Scores
	scoreArray.length = 0;
	for (i=0; i<enemy_cards.length; i++) {
		if (enemy_cards[i][2] != 0) {
			scoreArray.push( [enemy_cards[i][0] + "_Card", enemy_cards[i][2].split("_")[0].replace("A",""), "99", "2"] );
		}
	}

	//Get Player Scores
	for (i=0; i<selected_characters.length; i++) {
		var playerScore = document.getElementById(selected_characters[i][0] + "_Score");
		var playerScore02 = document.getElementById(selected_characters[i][0] + "_Score02");
		scoreArray.push( [selected_characters[i][0], playerScore.value, playerScore02.value, "1"] );
	}

	//Sort Array by Score 01, Score 02, and then ny if Player or Enemy as player goes before enemy
	scoreArray.sort( (a,b) => a[1] - b[1] || a[2] - b[2] || a[3] - b[3]);
}

var scorePrev = "blah";
function highlightPlay() {
	if (scoreArray.length != 0) {
		//Get New Element
		const element = document.getElementById(scoreArray[0][0]);

		//Apply Wound if applicable
		const negBox = document.getElementById(element.id + "_Negatives");
		if (selected_characters.some(row => row.includes(element.id)) && negBox.querySelector('[id*="Wound"]') !== null ) {
			const health = document.getElementById(element.id + "_Health");
			if (Number(health.textContent) - 1 >= 0) { health.textContent = Number(health.textContent) - 1; }
		}

		//If previous element exists set it border to none
		if (scorePrev && !scorePrev.includes("blah") ) {
			const elementPrev = document.getElementById(scorePrev[0]);
			elementPrev.style.border = "none"
		}

		//"Activate" New Element
		scorePrev = scoreArray.shift();
		element.style.border = "3px solid red"
	}
	//Clear Player Scores
	else {
		//Get Player Scores
		for (i=0; i<selected_characters.length; i++) {
			document.getElementById(selected_characters[i][0] + "_Score").value = "";
			document.getElementById(selected_characters[i][0] + "_Score02").value = "";
		}
	}
}

function nextRound() {
	//Flip and Score
	flipEnemyAll();
	getScores();

	//Move Elements Down
	moveElementsFrom("Waning", "Inert");
	moveElementsFrom("Strong", "Waning");
}

