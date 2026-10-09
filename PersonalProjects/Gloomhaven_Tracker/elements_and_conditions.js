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

function dropConditionHandler(ev) {
	//"Copy and Paste" Condition to Player Condition Boxes
	ev.preventDefault();
	const data = ev.dataTransfer.getData("text");
	const condition = document.getElementById(data);

	//Too Mnay Doom
	if (condition.id === "Doom" && doomCounter > 0) {
		console.log("Doom to many");
	}

	//Too Many Plague
	else if (condition.id === "Plague" && plagueCounter >= 12) {
		console.log("Plague to many");
	}

	//Not Enough Doom/Other Conditions
	else {
		//Doom
		if (condition.id === "Doom" && doomCounter < 1) {
			doomCounter++;
		}
		
		//Plague
		if (condition.id === "Plague" && plagueCounter <= 12) {
			plagueCounter++;
			//Only Put - Conditions in - Box
			if (ev.target.id.split("_")[1] === "Negatives" && conditions[1][1].includes(condition.id) && ev.target.querySelectorAll(`[id*="Plague"`).length < 3) {
				const clonedCondition = condition.cloneNode(true);
				clonedCondition.id = ev.target.id.split("_")[0] + "_" + condition.id;
				clonedCondition.style.height = "40px";
				ev.target.appendChild(clonedCondition);

				//Apply Round Timer
				if (nextTurnConditions.includes(condition.id) ) {
					if (highlightedTarget && highlightedTarget.id === ev.target.id.split("_")[0]) {
						clonedCondition.dataset.timer = 2;
					} else {
						clonedCondition.dataset.timer = 1;
					}
				}
			}

			//Put Conditions in Specific Enemy Condition Boxes
			else if ( ev.target.id.split("_")[2] === "All" && (conditions[0][1].includes(condition.id) || conditions[1][1].includes(condition.id) ) && ev.target.querySelectorAll(`[id*="Plague"`).length < 3 ) {
				const clonedCondition = condition.cloneNode(true);
				clonedCondition.id = ev.target.id.split("_")[0] + "_" + condition.id;
				clonedCondition.style.height = "30px";
				ev.target.appendChild(clonedCondition);

				//Apply Round Timer
				if (nextTurnConditions.includes(condition.id) ) {
					if (highlightedTarget && highlightedTarget.id === ev.target.id.split("_")[0]) {
						clonedCondition.dataset.timer = 2;
					} else {
						clonedCondition.dataset.timer = 1;
					}
				}
			}
		}

		//Only Put + Conditions in + Box
		if (ev.target.id.split("_")[1] === "Positives" && conditions[0][1].includes(condition.id) && !ev.target.querySelector(`[id*="${condition.id}"]`) ) {
			const clonedCondition = condition.cloneNode(true);
			clonedCondition.id = ev.target.id.split("_")[0] + "_" + condition.id;
			clonedCondition.style.height = "40px";
			clonedCondition.onclick = removeElement(clonedCondition);
			ev.target.appendChild(clonedCondition);

			//Apply Round Timer
			if (nextTurnConditions.includes(condition.id) ) {
				if (highlightedTarget && highlightedTarget.id === ev.target.id.split("_")[0]) {
					clonedCondition.dataset.timer = 2;
				} else {
					clonedCondition.dataset.timer = 1;
				}
			}
		}

		//Only Put - Conditions in - Box
		else if (ev.target.id.split("_")[1] === "Negatives" && conditions[1][1].includes(condition.id) && !ev.target.querySelector(`[id*="${condition.id}"]`) ) {
			const clonedCondition = condition.cloneNode(true);
			clonedCondition.id = ev.target.id.split("_")[0] + "_" + condition.id;
			clonedCondition.style.height = "40px";
			ev.target.appendChild(clonedCondition);

			//Apply Round Timer
			if (nextTurnConditions.includes(condition.id) ) {
				if (highlightedTarget && highlightedTarget.id === ev.target.id.split("_")[0]) {
					clonedCondition.dataset.timer = 2;
				} else {
					clonedCondition.dataset.timer = 1;
				}
			}
		}

		//Put Conditions in Specific Enemy Condition Boxes
		else if ( ev.target.id.split("_")[2] === "All" && (conditions[0][1].includes(condition.id) || conditions[1][1].includes(condition.id) ) && !ev.target.querySelector(`[id*="${condition.id}"]`) ) {
			const clonedCondition = condition.cloneNode(true);
			clonedCondition.id = ev.target.id.split("_")[0] + "_" + condition.id;
			clonedCondition.style.height = "30px";
			ev.target.appendChild(clonedCondition);

			//Apply Round Timer
			if (nextTurnConditions.includes(condition.id) ) {
				if (highlightedTarget && highlightedTarget.id === ev.target.id.split("_")[0] + "_" + ev.target.id.split("_")[1]) {
					clonedCondition.dataset.timer = 2;
				} else {
					clonedCondition.dataset.timer = 1;
				}
			}
		}
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

function applyConditionfromStats(enemyStatName, enemyType, conditionNumber) {
	//Get Enemy Stat Column to Apply Condition to
	var enemyStatColumn = document.getElementById(enemyStatName + enemyType);

	//Get Condition Name/Amount from Number
	var condition;
	var amount;

	//Check if Not Pierce
	if (conditionNumber < 70) {
		var realCN = conditionNumber - 1;
		condition = conditions[1][1][realCN];
	}
	//If Pierce
	else if (conditionNumber > 70 && conditionNumber < 80) {
		condition = "Pierce";
		amount = Number(String(conditionNumber).split("")[1] );
	}
	//If Retalaite
	else if (conditionNumber > 80 && conditionNumber < 90) {
		condition = "Retaliate";
		amount = Number(String(conditionNumber).split("")[1] );
	}

	//Create Condition Image
	var image = document.createElement("img");
	image.id = enemyType + "_" + enemyStatName + "_" + condition;
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

function applyConditionTo(targetElement, conditionElement, idOne, idTwo, size) {
	//Too Mnay Doom
	if (conditionElement.id === "Doom" && doomCounter > 0) {
		console.log("Doom to many");
	}

	//Too Many Plague
	else if (conditionElement.id === "Plague" && (plagueCounter >= 12 || targetElement.querySelectorAll(`[id*="Plague"]`).length >= 3) ) {
		console.log("Plague to many");
	}

	//Not Enough Doom/Other Conditions
	else {
		//Doom
		if (conditionElement.id === "Doom" && doomCounter < 1) {
			doomCounter++;
		}
		
		//Plague
		if (conditionElement.id === "Plague" && plagueCounter < 12) {
			plagueCounter++;
		}

		var clonedCondition = conditionElement.cloneNode(true);
		clonedCondition.id = idOne + "_" + idTwo;
		clonedCondition.style.height = size;
		clonedCondition.style.cursor = "pointer";
		targetElement.appendChild(clonedCondition);

		//Apply Round Timer
		if (nextTurnConditions.includes(conditionElement.id) ) {
console.log("A");
			if (highlightedTarget && highlightedTarget.id === conditionElement.id.split("_")[0]) {
				clonedCondition.dataset.timer = 2;
			} else {
				clonedCondition.dataset.timer = 1;
			}
		}
	}
}

