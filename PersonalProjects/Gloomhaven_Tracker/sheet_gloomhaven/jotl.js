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
	const level = selectorID.slice(-1);
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
//
// Page 02 Functions
//
//////////////////////////////
// Characters
//
//Name, Health
const jotl_characters = [
	["Demolitionist","Hatchet","RedGuard","Voidwarden"],
	[ [8,9,11,12,14,15,17,18,20], [8,9,11,12,14,15,17,18,20], [10,12,14,16,18,20,22,24,26], [6,7,8,9,10,11,12,13,14], ],
];
var alive = [];
var actionArray = [];

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

	makeTables();
	makeCharacterStats(selected, level);
	makeEnemyList();
}

function makeCharacterStats(selected, level) {
	const box = document.getElementById("Character_Box_Container")
	//Make Attributes for selected characters
	for (i=0; i<selected.length; i++) {
		if (selected[i] === "true") {

			const characterBoxContainer = document.createElement("box-container");
			box.appendChild(characterBoxContainer);
			const character = jotl_characters[0][i];
			const characterSrc = "./Images/JoTL/" + character + ".png";
			characterBoxContainer.innerHTML = `
				<div class="box-long" id="${character}">
					<div class="box-tall" id="${character + '_Container'}" style="position:relative">
						<img src="${characterSrc}" height="172" width="auto">
						<button class="character-sheet-selector" id="${character + '_Btn'}" onclick="showCharacterSheet(this.id)"></button>
						<div class="box-long" style="column-gap:10px;">
							<p style="margin:5px; color:white;">L: ${level[i]}</p>
							<p style="margin:5px; color:white;">H: ${jotl_characters[1][i][Number(level[i]) - 1]}</p>
							<div class="box-long">
								<p id="${character + '_Shield'}" style="margin:5px; color:white;">S:0</p>
								<div class="box-tall">
									<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${character + '_Shield'}, 'S:')" style="width:10px;height:10px; cursor:pointer;">
									<img src="./Images/Icons/Arrow.png" onclick="subAttribute(${character + '_Shield'}, 'S:')" style="width:10px;height:10px; rotate:180deg; cursor:pointer;">
								</div>
							</div>
						</div>
					</div>
					<div class="box-tall" style="row-gap:15px;">
						<img src="./Images/Icons/Attack.png" id="${character + '_Attack_Btn'}" onclick="characterAction(this.id)" class="action-Btn">
						<img src="./Images/Icons/Heal.png" id="${character + '_Heal_Btn'}" onclick="characterAction(this.id)" class="action-Btn">
						<img src="./Images/Icons/Shield.png" id="${character + '_Shield_Btn'}" onclick="characterAction(this.id)" class="action-Btn">
					</div>
					<div class="box-tall" style="row-gap:43px;">
						<input type="number" id="${character + '_Attack_Value'}" class="attribute-input">
						<input type="number" id="${character + '_Heal_Value'}" class="attribute-input">
						<input type="number" id="${character + '_Shield_Value'}" class="attribute-input">
					</div>
				</div>
			`;
		}
	}
}

function getAttribute() {
	
}

function characterAction(ID) {
	//Clear Array
	actionArray.length = 0;

	//Set Array
	const character = ID.split("_")[0];
	const action = ID.split("_")[1];
	const attackValue = document.getElementById(character + "_" + action + "_Value");
	actionArray.push(action, character, attackValue.value);

	//Hide Tables
	for (k=0; k<sheets[0].length; k++) {
		document.getElementById(sheets[0][k]).style.display = "none";
	}

	//Show Selected Table
	document.getElementById(character + "_Sheet").style.display = "flex";

	//Set Cursor
	document.documentElement.style.cursor = `url("${ './Images/Icons/' + action +'_Cursor.png' }"), auto`;
}

//Change Character Action Input Size based on Value
window.addEventListener('load', (event) => {
	const numberInputs = document.querySelectorAll('input[type="number"]');
	numberInputs.forEach(input => {
		input.addEventListener('input', (event) => {
			if (input.value < 0) { input.value = 0; }
			if (input.value >= 10) { input.style.width = "32px"; }
			else { input.style.width = "27px"; }
		});
	});
});


//////////////////////////////
// Sheets
//
//Name, BG Color, Text Color
const sheets = [
	["Demolitionist_Sheet","Hatchet_Sheet","RedGuard_Sheet","Voidwarden_Sheet"],
	["#582715","#0f2a37","#440f0f","#322e2d"],
	["#ebb96e","#71b6d1","#ed8da2","#c6c4c2"],
];
var roundNumber = 1;
var roundRangeMin = document.getElementById("sheetRangeMin").value;
var roundRangeMax = document.getElementById("sheetRangeMax").value;

function makeTables() {
	//Make Tables
	for (k=0; k<sheets[0].length; k++) {
		//Get Sheet
		const table = document.getElementById(sheets[0][k]);

		//Make Rows Array
		const rows = ["Rounds","Tiles Moved","Attack","Damage","Kills","Consumed","Infused","Healing Recieved","Healing Done","Positive","Negative","Traps","Coins","Chests","Objective","Exhausted"];
		const nums = ['01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20'];

		//Making Table
		for (i=0; i<rows.length; i++) {	
			//Rows
			const newRow = table.insertRow(-1);
			//Cells
			for (j=0; j<=20; j++) {
				const cell = newRow.insertCell(j);
				cell.style.backgroundColor = sheets[1][k];
				cell.style.color = sheets[2][k];
				//Start of Row
				if (j === 0) {
					cell.textContent = rows[i];
					cell.style.fontWeight = "bold";
				}
				//Round Cells
				else if (i === 0 && j != 0) {
					cell.textContent = nums[j-1];
					cell.style.fontWeight = "bold";
				}
				//Other Cells
				else {
					const input = document.createElement("input");
					cell.appendChild(input);
				}
			}
		}
		//Hide Tables
		document.getElementById(sheets[0][k]).style.display = "none";
	}
	//Hide Column Range
	showRound(sheets[0], roundNumber);

	//Show First Table
	for (i=0; i<alive.length; i++) {
		if (alive[i] === "true") {
			document.getElementById(sheets[0][i]).style.display = "flex";
			break;
		}
	}
}

function showRound(pages, number) {
	for (k=0; k<pages.length; k++) {
		const table = document.getElementById(pages[k]);
		for (i=0; i<table.rows.length; i++) {
			for (j=1; j<table.rows[i].cells.length; j++) {
				//Hide all rows but 0
				table.rows[i].cells[j].style.display = "none";
				table.rows[i].cells[j].style.border = "1px solid white";

				//Get Table Show Range
				var lowerRange = Number(number) - Number(roundRangeMin);
				if (lowerRange < 1) { lowerRange = 1 }
				var higherRange = Number(number) + Number(roundRangeMax);
				if (higherRange > 20) { higherRange = 20 }

				//Show Table Range
				if (j >= lowerRange && j <= higherRange) { table.rows[i].cells[j].style.display = ""; }

				//Show Current Round Column
				if (j === number) {
					table.rows[i].cells[j].style.display = "";
					table.rows[i].cells[j].style.border = "3px solid red";
				}
			}
		}
	}
}

function nextRound() {
	if (roundNumber + 1 != 21) { roundNumber++; }
	for (k=0; k<sheets[0].length; k++) {
		const table = document.getElementById(sheets[k]);
		showRound(sheets[0], roundNumber);
	}
}

function previousRound() {
	if (roundNumber - 1 != 0) { roundNumber--; }
	for (k=0; k<sheets[0].length; k++) {
		const table = document.getElementById(sheets[k]);
		showRound(sheets[0], roundNumber);
	}
}

//Update Min Sheet Range
var myInput = document.querySelector("#sheetRangeMin");
myInput.addEventListener("input", (event) => {
	if (document.getElementById("sheetRangeMin").value < 0) {
		document.getElementById("sheetRangeMin").value = 0;
	}
	var min = document.getElementById("sheetRangeMin");
	roundRangeMin = min.value;
	showRound(sheets[0], roundNumber);
	if (roundRangeMin >= 10) { min.style.width = "30px"; }
	else { min.style.width = "25px"; }
});
//Update Max Sheet Range
myInput = document.querySelector("#sheetRangeMax");
myInput.addEventListener("input", (event) => {
	if (document.getElementById("sheetRangeMax").value < 0) {
		document.getElementById("sheetRangeMax").value = 0;
	}
	var max = document.getElementById("sheetRangeMax");
	roundRangeMax = max.value;
	showRound(sheets[0], roundNumber);
	if (roundRangeMax >= 10) { max.style.width = "30px"; }
	else { max.style.width = "25px"; }
});

function showCharacterSheet(selectorID) {
	//Get Charater and Box Sheets
	const characterSheet = selectorID.replace("Btn", "Sheet");
	const sheetBox = document.getElementById("Sheet_Box");

	//Make all Sheets Invisible
	for (i=0; i<sheets[0].length; i++) {
		const table = document.getElementById(sheets[0][i]);
		table.style.display = "none";
	}
	
	//Turn the selected one back on
	document.getElementById(characterSheet).style.display = "flex";
}

//Table Math Calculations
document.addEventListener('click', function(event) {
	const clickedCell = event.target.closest("td"); 
	if (clickedCell) {
		document.addEventListener("keypress", (event) => {
			if (event.key === "Enter") {
				var expression = clickedCell.children[0].value;
				var operands = expression.split(/[+-]/);
				var results = expression.replace(/[^+-]/g, "");
				var sum = 0;
				for (var i = 0; i < operands.length; i++) {
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
				clickedCell.children[0].value = sum;
			}
		});
	}
});

//////////////////////////////
// Enemies
//
var enemyTotal = 0;
const jotl_enemies = [
	//Name, Health/Elite Health, Attack/Elite Attack, Move/Elite Move
	[ "Black Imp",	[3,4,5,5,7,9,10,13,4,6,8,8,11,14,15,19], [1,1,1,2,2,2,3,3,2,2,2,3,3,3,4,4], [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] ],
	[ "Black Sludge", [4,5,7,8,9,10,12,16,8,9,11,11,13,15,16,18], [2,2,2,3,3,3,4,4,2,2,3,3,4,4,4,5], [1,1,1,1,2,2,2,2,1,1,1,2,2,3,3,3] ],
	[ "Blood Imp", [3,4,5,5,7,8,9,12,4,6,7,10,11,13,17,21], [1,1,1,2,2,2,3,3,2,2,2,2,3,3,3,4], [2,2,3,3,3,4,4,4,2,2,3,3,3,4,4,4] ],
	[ "Chaos Demon", [7,8,11,12,15,16,20,22,10,12,14,18,21,26,30,35], [2,3,3,4,4,5,5,6,3,4,5,5,6,6,7,8], [3,3,3,3,4,4,4,4,4,4,4,5,5,5,5,5] ],
	[ "Giant Viper", [2,3,4,4,6,7,8,10,3,5,7,8,11,13,14,18], [1,1,1,2,2,3,3,3,2,2,2,3,3,3,4,4], [2,2,3,3,3,3,4,4,2,2,3,3,3,4,4,4] ],
	[ "Living Corpse", [5,7,9,10,11,13,14,16,10,11,14,14,16,18,23,29], [3,3,3,4,4,4,4,5,3,4,4,5,5,6,6,6], [1,1,1,1,2,2,2,2,1,1,1,2,2,2,2,2] ],
	[ "Rat Monstrosity", [4,4,5,6,8,10,12,12,6,7,8,10,12,13,14,16], [1,2,2,3,3,3,3,4,2,2,3,3,3,4,4,5], [1,1,2,2,2,3,3,3,1,1,1,2,2,2,3,3] ],
	[ "Stone Golem", [10,10,11,11,12,13,16,16,10,11,13,14,16,18,20,21], [3,3,4,4,4,5,5,5,4,4,5,5,6,6,7,7], [1,1,1,1,2,2,2,2,2,2,2,2,2,3,3,3] ],
	[ "Vermling Raider", [4,5,9,12,12,15,17,19,8,10,14,16,19,23,27,31], [2,2,2,2,3,3,3,4,2,2,3,4,4,4,5,6], [1,1,2,3,3,3,4,4,1,1,3,3,4,4,4,4] ],
	[ "Vermling Scout", [2,3,3,5,6,8,10,13,4,5,5,7,8,11,13,17], [1,1,2,2,3,3,3,3,2,2,3,3,4,4,4,4], [3,3,3,3,3,3,4,4,3,3,4,4,4,4,5,5] ],
	[ "Zealot", [4,6,7,8,10,12,14,16,7,8,11,13,17,18,22,26], [2,2,3,3,3,3,4,5,3,3,3,4,4,5,6,7], [2,2,3,3,3,4,4,4,2,2,3,3,3,4,4,4] ],
//	[ "", [], [] ],
];

const jotl_enemy_extras = [
	//Name, Shield/Elite Shield, Effects
	[ "Black Imp", [] ],
	[ "Black Sludge", [0,1,1,1,1,1,1,1,0,1,1,1,1,1,2,2] ],
	[ "Blood Imp", [] ],
	[ "Chaos Demon", [] ],
	[ "Giant Viper", [] ],
	[ "Living Corpse", [] ],
	[ "Rat Monstrosity", [] ],
	[ "Stone Golem", [0,1,1,2,2,2,2,3,1,2,2,3,3,3,3,4] ],
	[ "Vermling Raider", [] ],
	[ "Vermling Scout", [] ],
	[ "Zealot", [] ],
//	[ "", [], [] ],
];

function makeEnemyList() {
	//Make Enemy Selection List
	var father = document.getElementById("Enemy_Selector");
	for (i=0; i<jotl_enemies.length; i++) {
		const option = document.createElement("option");
		option.value = i;
		option.text = jotl_enemies[i][0];
		father.appendChild(option);
	}

	//Make Enemy Level List
	father = document.getElementById("Enemy_Selector_Levels");
	for (i=0; i<8; i++) {
		const option = document.createElement("option");
		option.value = i;
		option.text = i;
		father.appendChild(option);
	}
}

function addEnemy(selectorID) {
	//Get Values set
	const box = document.getElementById("Enemy_Box");
	var start = 0;
	var end = 8;
	var color = "3px solid white";
	if (selectorID.includes("Elite") ) {
		start += 8;
		end += 8;
		color = "3px solid gold"
	}
	enemyTotal++;

	//Make Enemy Container(s)
	const enemySelection = document.getElementById("Enemy_Selector")
	const enemyBoxContainer = document.createElement("box-container");
	box.appendChild(enemyBoxContainer);

	const enemySrc = "./Images/Enemies/" + jotl_enemies[enemySelection.value][0].replace(/\s+/g,"") + ".png";
	const level = document.getElementById("Enemy_Selector_Levels");
	var total = Number(start) + Number(level.value);
	var enemyName = jotl_enemies[enemySelection.value][0].replace(/\s+/g,"");
	var health = 0;
	var move = 0;
	var attack = 0;
	var shield = 0;

	//Get Enemy Name Index
	var index = 0;
	for (i=0; i<jotl_enemies.length; i++) {
		if (jotl_enemies[i][0].includes(jotl_enemies[enemySelection.value][0]) ) {
			health = jotl_enemies[i][1][total];
			move = jotl_enemies[i][3][total];
			attack = jotl_enemies[i][2][total];
			if (jotl_enemy_extras[i][1].length > 0) {
				shield = jotl_enemy_extras[i][1][total];
			}
		}
	}
	const enemy = enemyName + "_" + enemyTotal;

	enemyBoxContainer.innerHTML = `
	<div class="box-long" style="column-gap:5px;">
		<div class="box-tall" id="${enemyName + "_" + enemyTotal}" style="position:relative">
			<img src="${enemySrc}" class="enemy-image" style="border:${color}">
			<img class="enemy-delete" onclick="removeEnemy(${enemyName + "_" + enemyTotal})">
			<input type="number" class="enemy-ID">
			<div class="box-long" width="79px">
				<p style="margin:5px; color:white;">M:${move}</p>
				<p style="margin:5px; color:green;">A:${attack}</p>
			</div>
		</div>
		<div class="box-tall" style="row-gap:10px;">
			<div class="box-tall">
				<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${enemy + '_Health'}, 'H:')" style="width:10px;height:10px; cursor:pointer;">
				<p id="${enemy + "_Health"}" style="margin:5px; color:red;">H:${health}</p>
				<img src="./Images/Icons/Arrow.png" onclick="subAttribute(${enemy + '_Health'}, 'H:')" style="width:10px;height:10px; rotate:180deg; cursor:pointer;">
			</div>
			<div class="box-tall">
				<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${enemy + '_Shield'}, 'S:')" style="width:10px;height:10px; cursor:pointer;">
				<p id="${enemy + "_Shield"}" style="margin:5px; color:blue;">S:${shield}</p>
				<img src="./Images/Icons/Arrow.png" onclick="subAttribute(${enemy + '_Shield'}, 'S:')" style="width:10px;height:10px; rotate:180deg; cursor:pointer;">
			</div>
		</div>
	</div>
	`;

}

function removeEnemy(selectorID) {
	const selection = document.getElementById(selectorID.id);
	selection.parentElement.remove();
}

//////////////////////////////
// Actions/Attributes
//
//Action Selected
document.addEventListener('click', function(event) {
    // This is the exact DOM element under the mouse
    const clickedElement = event.target; 
    
	//If Player Action is Attack and Target is Enemy
	if ( (clickedElement.className === "enemy-image" || clickedElement.className === "action-Btn") && actionArray[0] === "Attack" ) {
		if (clickedElement.className === "action-Btn") {
			return;
		}
		//Get Enemy Helath
		const ID = document.getElementById(clickedElement.parentElement.id);
		const health = document.getElementById(ID.id + "_Health");
		const healthValue = health.textContent.split(":")[1];

		//Make Enemy new Health
		var newHealth = Number(healthValue);
		var damageDone = 0;
		var attackValue = Number(actionArray[2]);
		var shield = Number(document.getElementById(ID.id + "_Shield").textContent.split(":")[1]);
		if (shield !== 0 ) {
			attackValue -= shield;
			if (attackValue < 0) { attackValue = 0; }
		}
		if (newHealth !== 0) {
			for (i=1; i<=attackValue; i++) {
				newHealth = newHealth - 1;
				damageDone++;
				if (newHealth === 0) {
					break;
				}
			}
			health.textContent = "H:" + newHealth;
		}

		//Update Character Sheet(Attack)
		const table = document.getElementById(actionArray[1] + "_Sheet");
		var attackValue = table.rows[2].cells[roundNumber].children[0].value;
		attackValue = Number(attackValue) + damageDone;
		table.rows[2].cells[roundNumber].children[0].value = attackValue;

		//Clear Array/Cursor
		actionArray.length = 0;
		document.documentElement.style.cursor = "default";
	}
	else {
		//Clear Array/Cursor
		actionArray.length = 0;
		document.documentElement.style.cursor = "default";
	}
});

function addAttribute(ID, extra) {
	const selected = document.getElementById(ID.id);
	var attribute = Number(selected.textContent.split(":")[1]);
	attribute++;
	selected.textContent = extra + attribute;
}

function subAttribute(ID, extra) {
	const selected = document.getElementById(ID.id);
	var attribute = Number(selected.textContent.split(":")[1]);
	attribute--;
	if (attribute < 0) { attribute = 0; }
	selected.textContent = extra + attribute;
}

































