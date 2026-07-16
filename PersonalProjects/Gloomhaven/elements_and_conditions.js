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
	ev.target.appendChild(document.getElementById(data));
}

function dropConditionHandler(ev) {
	//"Copy and Paste" Condition to Player Condition Boxes
	ev.preventDefault();
	const data = ev.dataTransfer.getData("text");
	const condition = document.getElementById(data);

	//Only Put + Conditions in + Box
	if (ev.target.id.split("_")[1] === "Positives" && conditions[0][1].includes(condition.id) ) {
		const clonedCondition = condition.cloneNode(true);
		clonedCondition.id = ev.target.id.split("_")[0] + "_" + condition.id;
		clonedCondition.onclick = removeElement(clonedCondition);
		ev.target.appendChild(clonedCondition);
	}

	//Only Put - Conditions in - Box
	else if (ev.target.id.split("_")[1] === "Negatives" && conditions[1][1].includes(condition.id) ) {
		const clonedCondition = condition.cloneNode(true);
		clonedCondition.id = ev.target.id.split("_")[0] + "_" + condition.id;
		ev.target.appendChild(clonedCondition);
	}

	//Put Conditions in Specific Enemy Condition Boxes
	else if ( ev.target.id.split("_")[2] === "All" && (conditions[0][1].includes(condition.id) || conditions[1][1].includes(condition.id) ) ) {
		const clonedCondition = condition.cloneNode(true);
		clonedCondition.id = ev.target.id.split("_")[0] + "_" + condition.id;
		clonedCondition.style.height = "30px";
		ev.target.appendChild(clonedCondition);
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


const conditions = [
	["Positive", ["Safeguard", "Ward", "Invisible", "Strengthen"] ],
	["Negative", ["Wound", "Poison", "Immobilize", "Disarm", "Stun", "Muddle"] ],
];

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
	var clonedCondition = conditionElement.cloneNode(true);
	clonedCondition.id = idOne + "_" + idTwo;
	clonedCondition.style.height = size;
	clonedCondition.style.cursor = "pointer";
	if (conditionElement.id === "Invisible") {
		clonedCondition.style.border = "3px solid chartreuse";
	}
	targetElement.appendChild(clonedCondition);
}

