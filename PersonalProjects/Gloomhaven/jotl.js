////////////////////////////////////////////////////////////////////////////
// Page 01 Functions
//

function addCharacter(elementID) {
	//Create Charater ID and see if Already Exists
	const ID_name = elementID.replace("add-", "");
	if (!ID_name) {
		ID_name.charAt(0).toUpperCase() + ID_name.slice(1);
	}
	const character = document.getElementById(ID_name)

	//If Not Exist then make
	if (!character) {
		//Create a new Character
		const character = document.createElement("box-container");
		
		//Create Character Name
		const name = document.createTextNode(ID_name);

		//Append Name to Character/Set ID
		character.appendChild(name);
		character.id = ID_name;

		//Append Character to Character List
		document.getElementById("character-list").appendChild(character);

		//Add Charachter Level Input Field
		const inputField = document.createElement("input");
		inputField.type = "number";
		inputField.placeholder = "Enter Level";
		inputField.id = ID_name + "_Level"; 
		document.getElementById(character.id).appendChild(inputField);
	}

	// If Exist then Kill
	else {
		character.remove();
	}
}

function flipCharacterCard(selectorID) {
	//Get ID
	const cardID = selectorID.replace("Flipper", "Card");
	const cardBoxID = selectorID.replace("Flipper", "Box");
	const cardSrc = document.getElementById(cardID).src;
	const cardBox = document.getElementById(cardBoxID);

	//Flip Front to Back
	if(cardSrc.includes("Front")) {
		document.getElementById(cardID).src = cardSrc.replace("Front", "Back");
		//Disable Level Buttons
		for (let child of cardBox.children) {
			if( child.id.includes("Level") || child.id.includes("Select") ) {
				document.getElementById(child.id).disabled = true;
				document.getElementById(child.id).style.display = "none";
			}
		}
	}

	//Flip Back to Front
	else {
		document.getElementById(cardID).src = cardSrc.replace("Back", "Front");
		//Enable Level Buttons
		for (let child of cardBox.children) {
			if( child.id.includes("Level") || child.id.includes("Select") ) {
				document.getElementById(child.id).disabled = false;
				document.getElementById(child.id).style.display = "flex";
			}
		}
	}
}

function selectCharacterLevel(selectorID) {
	//Access Parent Card/Box
	cardBoxID = selectorID.split("_")[0];
	cardBoxID += "_Box";
	const cardBox = document.getElementById(cardBoxID);

	//Change Card Level Value
	const level = selectorID.slice(-2);
	cardBox.dataset.level = level;

	//Clear Selected Level
	for (let child of cardBox.children) {
		if(child.id.includes("Level")) {
			document.getElementById(child.id).style.webkitTextStroke = "0px #e1e0df";
		}
	}

	//Change Selected Level Color to indicate it being Chosen
	document.getElementById(selectorID).style.webkitTextStroke = cardBox.dataset.color;
}

function selectCharacterStatus(selectorID) {
	//Access Parent Card/Box
	const cardBoxID = selectorID.replace("Selector", "Box");
	const cardBox = document.getElementById(cardBoxID);
	const src = document.getElementById(selectorID).src;

	//Change Card Status to True
	if (cardBox.dataset.selected === "false") {
		document.getElementById(selectorID).src = src.replace("Null","Plus_1");
		cardBox.dataset.selected = true;
	}

	//Change Card Status to False
	else {
		document.getElementById(selectorID).src = src.replace("Plus_1","Null");
		cardBox.dataset.selected = false;
	}
}

function setCharacters() {
	//Demolitionist
	sessionStorage.setItem("Demolitionist_Status",  document.getElementById("Demolitionist_Box").dataset.selected );
	sessionStorage.setItem("Demolitionist_Level",  document.getElementById("Demolitionist_Box").dataset.level );

	//Hatchet
	sessionStorage.setItem("Hatchet_Status",  document.getElementById("Hatchet_Box").dataset.selected );
	sessionStorage.setItem("Hatchet_Level",  document.getElementById("Hatchet_Box").dataset.level );

	//RedGuard
	sessionStorage.setItem("RedGuard_Status",  document.getElementById("RedGuard_Box").dataset.selected );
	sessionStorage.setItem("RedGuard_Level",  document.getElementById("RedGuard_Box").dataset.level );

	//Void Warden
	sessionStorage.setItem("Voidwarden_Status",  document.getElementById("Voidwarden_Box").dataset.selected );
	sessionStorage.setItem("Voidwarden_Level",  document.getElementById("Voidwarden_Box").dataset.level );

	location.href = "./02_jotl.html";
	getCharacters();
}

////////////////////////////////////////////////////////////////////////////
// Page 02 Functions
//
const characters = ["Demolitionist","Hatchet","RedGuard","Voidwarden"];
var alive = [];

function getCharacters() {
	const selected = [];
	const level = [];
	alive = selected;

	//Demolitionist
	selected.push(sessionStorage.getItem("Demolitionist_Status"));
	level.push(sessionStorage.getItem("Demolitionist_Level"));

	//Hatchet
	selected.push(sessionStorage.getItem("Hatchet_Status"));
	level.push(sessionStorage.getItem("Hatchet_Level"));

	//RedGuard
	selected.push(sessionStorage.getItem("RedGuard_Status"));
	level.push(sessionStorage.getItem("RedGuard_Level"));

	//Void Warden
	selected.push(sessionStorage.getItem("Voidwarden_Status"));
	level.push(sessionStorage.getItem("Voidwarden_Level"));

	//Disappear Characters that were not selected
	for (i=0; i<selected.length; i++) {
		if (selected[i] === "false") {
			document.getElementById(characters[i]).style.display = "none";
		}
	}
	makeTables();
	makeCharacterStats(selected, level);
}

function makeCharacterStats(selected, level) {
	//Make Attributes for selected characters
	for (i=0; i<selected.length; i++) {
		if (selected[i] === "true") {
			//Create Attributes
			const box = document.createElement("box-long");
			box.id = characters[i] + "_Attributes";
			box.textContent = "L:" + level[i] + " H:" + "1" + "/" + "1" + " S:" + "0";
			document.getElementById(characters[i] + "_Container").appendChild(box);
		}
	}
}

function makeTables() {
	//Make Tables Array
	const message = ["Demolitionist_Sheet","Hatchet_Sheet","RedGuard_Sheet","Voidwarden_Sheet"];

	//Make Tables
	for (k=0; k<message.length; k++) {
		//Get Sheet
		const sheet = document.getElementById(message[k]);

		//Make Rows Array
		const rows = ["Tiles Moved","Attack","Damage","Kills","Consumed","Infused","Healing Recieved","Healing Done","Positive","Negative","Traps","Coins","Chests","Objective","Exhausted"];
		//Making Table
		for (i=0; i<rows.length; i++) {	
			//Make Rows
			const row = document.createElement("tr");
			row.id = message[k] + "_" + rows[i];

			//Make First Row Cell
			const cell = document.createElement("th");
			cell.textContent = rows[i];

			//Append Cell and Row
			row.appendChild(cell);
			sheet.firstElementChild.appendChild(row);
		}
		makeTableCells(message[k]);
		document.getElementById(message[k]).style.display = "none";
	}
	for (i=0; i<alive.length; i++) {
		if (alive[i] === "true") {
			document.getElementById(message[i]).style.display = "flex";
			break;
		}
	}
}

function makeTableCells(message) {
	//Get Sheet
	const sheet = document.getElementById(message);

	//Iterate through Sheet grandchildren
	for (i=1; i<sheet.firstElementChild.children.length; i++) {
		row = sheet.firstElementChild.children[i];
		//Make X amount of Row Cells
		for (j=1; j<=20; j++) {
			cell = row.insertCell(j);
			const input = document.createElement("input");
			cell.appendChild(input);
		}
	}
}

function showCharacterSheet(selectorID) {
	//Get Charater and Box Sheets
	const characterSheet = selectorID.replace("Btn", "Sheet");
	const sheetBox = document.getElementById("Sheet_Box");

	//Make all Sheets Invisible
	for (const child of sheetBox.children) {
		child.style.display = "none";
	}
	
	//Turn the selected one back on
	document.getElementById(characterSheet).style.display = "flex";
}

//Table Math Calculations
document.addEventListener("keypress", (event) => {
	if (event.key === "Enter") {
		var expression = event.target.value;
		var operands = expression.split(/[+-]/);
		var results = expression.replace(/[^+-]/g, "");
		var sum = 0;
		for (var i = 0; i < operands.length; i++) {
			console.log(operands[i] + " and " + results[i]);
			if (sum === 0) {
				sum += parseInt(operands[i]);
			}
			if (results[i-1] === "+") {
				sum += parseInt(operands[i]);
			}
			else if (results[i-1] === "-") {
				sum -= parseInt(operands[i]);
			}
		}
		event.target.value = sum;
	}
});









