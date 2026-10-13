//////////////////////////////
// Elements and Conditions/Drag and Drops
//

const elements = ["Fire", "Ice", "Grass", "Wind", "Dark", "Light"];
var roundNumber = 1;

function dragstartHandler(ev) {
	ev.dataTransfer.setData("text", ev.target.id);
}

function dragoverHandler(ev) {
	ev.preventDefault();
}

function dropHandler(ev) {
	ev.preventDefault();
	const data = ev.dataTransfer.getData("text");
	if (!elements.includes(ev.target.id) ) {
		ev.target.appendChild(document.getElementById(data));
	}
}

function moveElementTo(target, to) {
	const toBox = document.getElementById(to);
	const targetElement = document.getElementById(target);
	toBox.prepend(targetElement);
}

function moveElementsFrom(from, to) {
	const fromBox = document.getElementById(from);
	const toBox = document.getElementById(to);
	toBox.prepend(...fromBox.children);
}

function getRandomElement() {
	//Randomly Choose an active Element to Consume
	var newElement = false;
	var random;
	do {
		random = getRandomIntInclusive(0, 5);
		var hasElement = document.getElementById("Inert").querySelector(`[id*="${elements[random]}"]`) !== null;
		if (!hasElement) {
			newElement = true;
		}
	} while (!newElement);

	return elements[random];
}


const conditions = [
	["Positive", ["Safeguard", "Ward", "Invisible", "Strengthen"] ],
	["Negative", ["Wound", "Poison", "Immobilize", "Disarm", "Stun", "Muddle", "Plague", "Doom"] ],
];

const nextTurnConditions = ["Strengthen", "Invisible", "Muddle", "Immobilize", "Disarm", "Stun"];

function makeStatCardsConditions(enemy, enemyType, conNum) {
	//Get Enemy Stat Column to Apply Condition to
	var enemyStatColumn = document.getElementById(enemy.name + "_Stat_" + enemyType);

	var condition;
	var amount;

	//Check if Not Pierce
	if (conNum < 70) {
		condition = conditions[1][1][conNum - 1];
	}
	//Check if Pierce
	else if (conNum > 70 && conNum< 80) {
		condition = "Pierce";
		amount = Number(String(conNum).split("")[1] );
	}
	//Check if Retaliate
	else if (conNum > 80 && conNum < 90) {
		condition = "Retaliate";
		amount = Number(String(conNum).split("")[1] );
	}

	//Create Condition Image
	var image = document.createElement("img");
	image.id = enemyType + "_" + enemy.name + "_" + condition;
	image.src = "./Images/Conditions/" + condition + ".png";
	image.dataset.amount = amount;
	image.style.height = "25px";
	image.style.width = "auto";
	enemyStatColumn.appendChild(image);

	//Create Condition Power if applicable
	if (amount) {
		var text = document.createElement("p");
		text.textContent = amount;
		enemyStatColumn.appendChild(text);
	}
}

function dropConditionHandler(ev) {
	//Get Condition
	ev.preventDefault();
	const data = ev.dataTransfer.getData("text");
	const condition = document.getElementById(data);

	//Get Target in Score Array
	var name = ev.target.id.replace("_Conditions", "");
	var person = all_people.find(user => user.name === name);

	//Too Many Doom
	if (condition.id === "Doom" && doomCounter > 0) {
		console.log("Doom to many");
	}

	//Add Doom
	else if (condition.id === "Doom" && doomCounter < 1) {
		doomCounter++;
		addCondition(person.negCons, condition, ev.target);
	}

	//Too Many Plauge
	else if (condition.id === "Plague" && plagueCounter >= 13) {
		console.log("Plague to many");
	}

	//Other Conditions
	else {
		//Plauge Check
		if (condition.id === "Plague" && plagueCounter < 12) {
			plagueCounter++;
			if (person.negCons.filter(item => item === "Plague").length < 3 ) {
				addCondition(person.negCons, condition, ev.target);
			}
		}

		//Others
		else {
			//Check if Positive or Negative Condition
			if (conditions[0][1].includes(condition.id) && !person.posCons.includes(condition.id) ) {
				//Apply Pos
				addCondition(person.posCons, condition, ev.target);
				console.log(person.posCons);
			}
			else if (conditions[1][1].includes(condition.id) && !person.negCons.includes(condition.id) ) {
				//Apply Neg
				addCondition(person.negCons, condition, ev.target);
				console.log(person.negCons);
			}
		}
	}
}

function addCondition(conBox, condition, target) {
	//Add to Array
	conBox.push(condition.id);
	//Add to Box
	var clonedCondition = condition.cloneNode(true);
	clonedCondition.id = target.id.split("_")[0] + "_" + condition.id;
	clonedCondition.style.height = "35px";
	target.appendChild(clonedCondition);
}












