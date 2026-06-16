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

	selectCharacterStatus(selectorID.split("_")[0] + "_Selector")
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
	["#582715","#0f2a37","#440f0f","#322e2d"],
	["#ebb96e","#71b6d1","#ed8da2","#c6c4c2"],
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

	makeCharacterStats(selected, level);
	makeEnemyList();
	makeEnemyScoreCards();
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
				<div class="box-long" id="${character}" style="column-gap:10px;">
					<div class="box-tall" id="${character + '_Positives'}" ondrop="dropConditionHandler(event)" ondragover="dragoverHandler(event)"
						style="min-width:50px;max-width:100px;height:172px; border:2px solid ${jotl_characters[3][i]};"></div>
					<div class="box-tall" id="${character + '_Negatives'}" ondrop="dropConditionHandler(event)" ondragover="dragoverHandler(event)" 
						style="min-width:50px;max-width:100px;height:172px; border:2px solid ${jotl_characters[2][i]};"></div>
					<div class="box-tall" id="${character + '_Container'}" style="position:relative">
						<img src="${characterSrc}" class="Player" height="172" width="auto">
						<div class="box-long" style="column-gap:10px">
							<p style="margin:5px; color:white;">L: ${level[i]}</p>
						</div>
					</div>
					<div class="box-tall" style="row-gap:15px;">
						<div class="box-long">
							<img src="./Images/Icons/Attack.png" id="${character + '_Attack_Btn'}" onclick="characterAction(this.id)" class="action-Btn">
							<p id="${character + '_Attack'}" class="attribute-input">0</p>
							<div class="box-tall">
								<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${character + '_Attack'})" style="width:10px;height:10px; cursor:pointer;">
								<img src="./Images/Icons/Arrow.png" onclick="subAttribute(${character + '_Attack'})" style="width:10px;height:10px; rotate:180deg; cursor:pointer;">
							</div>
						</div>
						<div class="box-long">
							<img src="./Images/Icons/Heal.png" id="${character + '_Heal_Btn'}" onclick="characterAction(this.id)" class="action-Btn">
							<p id="${character + '_Health'}" class="attribute-input">${jotl_characters[1][i][Number(level[i]) - 1]}</p>
							<p class="attribute-input">${'/ ' + jotl_characters[1][i][Number(level[i]) - 1]}</p>
							<div class="box-tall">
								<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${character + '_Health'})" style="width:10px;height:10px; cursor:pointer;">
								<img src="./Images/Icons/Arrow.png" onclick="subAttribute(${character + '_Health'})" style="width:10px;height:10px; rotate:180deg; cursor:pointer;">
							</div>
						</div>
						<div class="box-long">
							<img src="./Images/Icons/Shield.png" id="${character + '_Shield_Btn'}" class="action-Btn">
							<p id="${character + '_Shield'}" class="attribute-input">0</p>
							<div class="box-tall">
								<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${character + '_Shield'})" style="width:10px;height:10px; cursor:pointer;">
								<img src="./Images/Icons/Arrow.png" onclick="subAttribute(${character + '_Shield'})" style="width:10px;height:10px; rotate:180deg; cursor:pointer;">
							</div>
						</div>
					</div>
				</div>
			`;
		}
	}
}

function characterAction(ID) {
	//Clear Array
	actionArray.length = 0;

	//Set Array
	const character = ID.split("_")[0];
	const action = ID.split("_")[1];
	const attackValue = document.getElementById(character + "_" + action);
	actionArray.push(action, character, attackValue.textContent);

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

//////////////////////////////
// Elements and Conditions/Drag and Drops
//

const elements = ["Fire", "Ice", "Grass", "Wind", "Dark", "Light"];
const conditions = [
	["Positive", ["Strengthen"] ],
	["Negative", ["Wound", "Poison", "Muddle"] ],
];
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
		clonedCondition.id = condition.id +"_"+ ev.target.id.split("_")[0];
		clonedCondition.onclick = removeElement(clonedCondition);
		ev.target.appendChild(clonedCondition);
	}

	//Only Put - Conditions in - Box
	else if (ev.target.id.split("_")[1] === "Negatives" && conditions[1][1].includes(condition.id) ) {
		const clonedCondition = condition.cloneNode(true);
		clonedCondition.id = condition.id +"_"+ ev.target.id.split("_")[0];
		ev.target.appendChild(clonedCondition);
	}

	//Put Conditions in Specific Enemy Condition Boxes
	else if (conditions[0][1].includes(condition.id) || conditions[1][1].includes(condition.id) ) {
		const clonedCondition = condition.cloneNode(true);
		clonedCondition.id = condition.id +"_"+ ev.target.id.split("_")[0];
		clonedCondition.style.height = "30px";
		ev.target.appendChild(clonedCondition);
	}
}

function moveElementFrom(from, to) {
	const fromBox = document.getElementById(from);
	const toBox = document.getElementById(to);
	toBox.prepend(...fromBox.children);
}

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
//	[ "Giant Viper", [2,3,4,4,6,7,8,10,3,5,7,8,11,13,14,18], [1,1,1,2,2,3,3,3,2,2,2,3,3,3,4,4], [2,2,3,3,3,3,4,4,2,2,3,3,3,4,4,4] ],
//	[ "Living Corpse", [5,7,9,10,11,13,14,16,10,11,14,14,16,18,23,29], [3,3,3,4,4,4,4,5,3,4,4,5,5,6,6,6], [1,1,1,1,2,2,2,2,1,1,1,2,2,2,2,2] ],
//	[ "Rat Monstrosity", [4,4,5,6,8,10,12,12,6,7,8,10,12,13,14,16], [1,2,2,3,3,3,3,4,2,2,3,3,3,4,4,5], [1,1,2,2,2,3,3,3,1,1,1,2,2,2,3,3] ],
//	[ "Stone Golem", [10,10,11,11,12,13,16,16,10,11,13,14,16,18,20,21], [3,3,4,4,4,5,5,5,4,4,5,5,6,6,7,7], [1,1,1,1,2,2,2,2,2,2,2,2,2,3,3,3] ],
//	[ "Vermling Raider", [4,5,9,12,12,15,17,19,8,10,14,16,19,23,27,31], [2,2,2,2,3,3,3,4,2,2,3,4,4,4,5,6], [1,1,2,3,3,3,4,4,1,1,3,3,4,4,4,4] ],
//	[ "Vermling Scout", [2,3,3,5,6,8,10,13,4,5,5,7,8,11,13,17], [1,1,2,2,3,3,3,3,2,2,3,3,4,4,4,4], [3,3,3,3,3,3,4,4,3,3,4,4,4,4,5,5] ],
//	[ "Zealot", [4,6,7,8,10,12,14,16,7,8,11,13,17,18,22,26], [2,2,3,3,3,3,4,5,3,3,3,4,4,5,6,7], [2,2,3,3,3,4,4,4,2,2,3,3,3,4,4,4] ],
//	[ "", [], [] ],
];

const jotl_enemy_extras = [
	//Name, Shield/Elite Shield, Effects
	[ "Black Imp", [], [0, "Poison", "Poison", "Poison", "Poison", "Poison", "Poison", "Poison", "Poison", "Poison", "Poison", "Poison", "Poison", "Poison", "Poison", "Poison"] ],
	[ "Black Sludge", [0,1,1,1,1,1,1,1,0,1,1,1,1,1,2,2], [] ],
	[ "Blood Imp", [], [0, "Muddle", "Muddle", "Muddle", "Muddle", "Muddle", "Muddle", "Muddle", "Muddle", "Muddle", "Muddle", "Muddle", "Muddle", "Muddle", "Muddle", "Muddle"] ],
	[ "Chaos Demon", [], ["Muddle", "Muddle", "Muddle", "Muddle", "Muddle", "Muddle", "Muddle", "Muddle", "Muddle", "Muddle", "Muddle", "Muddle", "Muddle", "Muddle", "Muddle", "Muddle"] ],
//	[ "Giant Viper", [] ],
//	[ "Living Corpse", [] ],
//	[ "Rat Monstrosity", [] ],
//	[ "Stone Golem", [0,1,1,2,2,2,2,3,1,2,2,3,3,3,3,4] ],
//	[ "Vermling Raider", [] ],
//	[ "Vermling Scout", [] ],
//	[ "Zealot", [] ],
//	[ "", [], [] ],
];

var enemy_stat_cards = [];

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

	const enemySrc = "./Images/JoTL/Enemies/" + jotl_enemies[enemySelection.value][0].replace(/\s+/g,"") + ".png";
	const level = document.getElementById("Enemy_Selector_Levels");
	var total = Number(start) + Number(level.value);
	var enemyName = jotl_enemies[enemySelection.value][0].replace(/\s+/g,"");
	var health = 0;
	var move = 0;
	var attack = 0;
	var shield = 0;
	var condition;

	var NM = 0;
	var NA = 0;
	var NS = 0;
	var NC;
	var EM = 0;
	var EA = 0;
	var ES = 0;
	var EC;

	//Get Enemy Name Index
	var index = 0;
	for (i=0; i<jotl_enemies.length; i++) {
		if (jotl_enemies[i][0].includes(jotl_enemies[enemySelection.value][0]) ) {
			health = jotl_enemies[i][1][total];
			move = jotl_enemies[i][3][total];
			attack = jotl_enemies[i][2][total];
			//Shield
			if (jotl_enemy_extras[i][1].length > 0) {
				shield = jotl_enemy_extras[i][1][total];
				if (total < 8) { NS = jotl_enemy_extras[i][1][total]; ES = jotl_enemy_extras[i][1][total + 8]; }
				else if (total >= 8) { NS = jotl_enemy_extras[i][1][total - 8]; ES = jotl_enemy_extras[i][1][total]; }
			}
			//Condition
			if (jotl_enemy_extras[i][2].length > 0) {
				condition = jotl_enemy_extras[i][2][total];
				if (total < 8) { NC = jotl_enemy_extras[i][2][total]; EC = jotl_enemy_extras[i][2][total + 8]; }
				else if (total >= 8) { NC = jotl_enemy_extras[i][2][total - 8]; EC = jotl_enemy_extras[i][2][total]; }
			}
			if (total < 8) {
				NM = jotl_enemies[i][1][total]; NA = jotl_enemies[i][2][total];
				EM = jotl_enemies[i][1][total + 8]; EA = jotl_enemies[i][2][total + 8];
			}
			else if (total >= 8) {
				NM = jotl_enemies[i][1][total - 8]; NA = jotl_enemies[i][2][total - 8];
				EM = jotl_enemies[i][1][total]; EA = jotl_enemies[i][2][total];
			}
		}
	}
	const enemy = enemyName + "_" + enemyTotal;

	enemyBoxContainer.innerHTML = `
	<div class="box-long" style="column-gap:5px;">
		<div class="box-tall" id="${enemy}" style="position:relative">
			<img src="${enemySrc}" class="enemy-image" style="border:${color}">
			<img class="enemy-delete" onclick="removeEnemy(${enemy})">
			<input type="number" class="enemy-ID">
			<div class="box-long" style="column-gap:5px;">
				<div class="box-long">
					<p id="${enemy + "_Health"}" style="margin:5px; color:red; font-size:24px;">${health}</p>
					<div class="box-tall">
						<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${enemy + '_Health'})" style="width:10px;height:10px; cursor:pointer;">
						<img src="./Images/Icons/Arrow.png" onclick="subAttribute(${enemy + '_Health'})" style="width:10px;height:10px; rotate:180deg; cursor:pointer;">
					</div>
				</div>
				<div class="box-long">
					<p id="${enemy + "_Shield"}" style="margin:5px; color:cyan; font-size:24px;">${shield}</p>
					<div class="box-tall">
						<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${enemy + '_Shield'})" style="width:10px;height:10px; cursor:pointer;">
						<img src="./Images/Icons/Arrow.png" onclick="subAttribute(${enemy + '_Shield'})" style="width:10px;height:10px; rotate:180deg; cursor:pointer;">
					</div>
				</div>
			</div>
		</div>
		<div class="box-tall" id="${enemy + '_Conditions'}" style="border:${color}; min-width:35px;max-width:60px;height:160px;"
			ondrop="dropConditionHandler(event)" ondragover="dragoverHandler(event)"></div>
	</div>
	`;

	//Track different types of enemies on screen
	for (let child of box.children) {
		var guy = child.children[0].children[0].id;
		var name = guy.split("_")[0];
		if (!enemy_stat_cards.includes(name) ) {
			enemy_stat_cards.push(name);

			//Adding Enemy Type Stat Card
			const statBox = document.getElementById("Enemy_Stat_Box");
			const enemyStatSrc = "./Images/JoTL/Enemies/Cards/" + jotl_enemies[enemySelection.value][0].replace(/\s+/g,"") + ".png";
			const enemyStatContainer = document.createElement("box-container");
			statBox.appendChild(enemyStatContainer);
			
			enemyStatContainer.innerHTML = `
			<div class="box-long" style="position:relative; column-gap:10px;">
				<div class="box-tall" id="${enemyName + "_Stat"}" style="position:relative">
					<img src="${enemyStatSrc}" class="enemy-stat-image">
					<img class="enemy-delete" onclick="removeEnemy(${enemyName + "_Stat"})">
					<div class="box-long">
						<div class="box-tall" id="${enemyName + "_Normal"}">
							<p style="margin:5px; color:white; font-size:20px;">M:${NM}</p>
							<p style="margin:5px; color:green; font-size:20px;">A:${NA}</p>
							<p style="margin:5px; color:blue; font-size:20px;">M:${NS}</p>
						</div>
						<div class="box-tall" id="${enemyName + "_Elite"}">
							<p style="margin:5px; color:gold; font-size:20px;">M:${EM}</p>
							<p style="margin:5px; color:lawngreen; font-size:20px;">A:${EA}</p>
							<p style="margin:5px; color:cyan; font-size:20px;">A:${ES}</p>
						</div>
					</div>
					<div class="box-long" id="${enemyName + "_Conditions"}"></div>
				</div>
				<div class="box-tall" id="${enemyName + "_Card"}" style="position:relative">
					<div class="box-long" style="column-gap:10px;">
						<div class="box-long">
							<img src="./Images/Icons/Attack.png" id="${enemyName + '_Normal_Attack_Btn'}" onclick="enemyAction(this.id)" class="action-Btn" style="height:35px;">
							<p id="${enemyName + '_Attack_Normal'}" class="attribute-input" style="font-size:20px;" data-base-Attack="${NA}" data-extra-Attack="${NA}" >${NA}</p>
							<div class="box-tall">
								<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${enemyName + '_Attack_Normal'})" style="width:10px;height:10px; cursor:pointer;">
								<img src="./Images/Icons/Arrow.png" onclick="subAttribute(${enemyName + '_Attack_Normal'})" style="width:10px;height:10px; rotate:180deg; cursor:pointer;">
							</div>
						</div>
						<div class="box-long">
							<img src="./Images/Icons/Attack_Elite.png" id="${enemyName + '_Elite_Attack_Btn'}" onclick="enemyAction(this.id)" class="action-Btn" style="height:35px;">
							<p id="${enemyName + '_Attack_Elite'}" class="attribute-input" style="font-size:20px; color:gold; border-color:gold" data-base-Attack="${EA}" data-extra-Attack="${EA}" >${EA}</p>
							<div class="box-tall">
								<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${enemyName + '_Attack_Elite'})" style="width:10px;height:10px; cursor:pointer;">
								<img src="./Images/Icons/Arrow.png" onclick="subAttribute(${enemyName + '_Attack_Elite'})" style="width:10px;height:10px; rotate:180deg; cursor:pointer;">
							</div>
						</div>
						<img src="./Images/Icons/Shuffle.png" onclick="shuffleScores(${enemyName + '_Card'})" class="action-Btn" style="height:25px;">
						<img src="./Images/Icons/Flip.png" onclick="flipEnemy(${enemyName + '_Card'})" class="action-Btn" style="height:25px;">
					</div>
					<img src="./Images/JoTL/Enemies/Initiatives/Monster_Back.jpg" id="${enemyName + '_Score_Img'}" style="height:auto;width:300px;">
				</div>
			</div>
			`;

			//Show Enemy Applied Conditions
			if (NC) {
				var conBox = document.getElementById(enemyName + "_Normal");
				var image = document.createElement("img");
				image.id = enemyName + "_Neg_" + NC;
				image.src = "./Images/Conditions/" + NC + ".png";
				image.style.height = "25px";
				image.style.width = "auto";
				conBox.appendChild(image);
			}
			if (EC) {
				var conBox = document.getElementById(enemyName + "_Elite");
				var image = document.createElement("img");
				image.id = enemyName + "_Neg_" + EC;
				image.src = "./Images/Conditions/" + EC + ".png";
				image.style.height = "25px";
				image.style.width = "auto";
				conBox.appendChild(image);
			}
		}
	}

}

function removeEnemy(selectorID) {
	const selection = document.getElementById(selectorID.id);
	selection.parentElement.remove();
}




//////////////////////////////
// Ememy Cards
//
const jotl_enemy_cards = [
	//Name, Usabel Score Cards, Unusable Score Cards
	[ "Black Imp", [] ],
	[ "Black Sludge", [] ],
	[ "Blood Imp", [] ],
	[ "Chaos Demon", [] ],
//	[ "Giant Viper", [], [] ],
//	[ "Living Corpse", [], [] ],
//	[ "Rat Monstrosity", [], [] ],
//	[ "Stone Golem", [], [] ],
//	[ "Vermling Raider", [], [] ],
//	[ "Vermling Scout", [], [] ],
//	[ "Zealot", [], [] ],
];

const enemy_types = ["_Normal", "_Elite"];

function makeEnemyScoreCard(enemyName, score, move, attack01, attack02, shield, heal, img) {
	//Have an array that has [ [enemyName], [score values/these cards] ] that these cards ar added to
	var image = img;
	if (img === "A") {
		image = img.replace("A","");
	}
	var cardSrc = "./Images/JoTL/Enemies/Initiatives/" + enemyName.replaceAll(" ","") + "_" + score + image + ".png";
	var array = [];
	for (i=0; i<jotl_enemy_cards.length; i++ ) {
		if (jotl_enemy_cards[i][0] === enemyName) {
			array.push(enemyName, score, move, attack01, attack02, shield, heal, cardSrc, img, true);
			jotl_enemy_cards[i][1].push(array);
		}
	}
}

function makeEnemyScoreCards() {
	//Black Imp
	makeEnemyScoreCard("Black Imp", 5, 0, 0, 0, 5, 1, "");
	makeEnemyScoreCard("Black Imp", 37, 0, 0, 0, 0, 0, "A");
	makeEnemyScoreCard("Black Imp", 37, 0, 0, 0, 0, 0, "");
	makeEnemyScoreCard("Black Imp", 42, 1, 0, 0, 0, 0, "_1");
	makeEnemyScoreCard("Black Imp", 42, 0, -1, 0, 0, 0, "_2");
	makeEnemyScoreCard("Black Imp", 76, -1, 1, 0, 0, 0, "");
	makeEnemyScoreCard("Black Imp", 42, 0, -1, 0, 0, 0, "_3");
	makeEnemyScoreCard("Black Imp", 24, 0, 0, 0, 0, 0, "");

	//Black Sludge
	makeEnemyScoreCard("Black Sludge", 36, 1, -1, 0, 0, 0, "");
	makeEnemyScoreCard("Black Sludge", 57, 0, 0, 0, 0, 0,"_1");
	makeEnemyScoreCard("Black Sludge", 57, 0, 0, 0, 0, 0, "_2");
	makeEnemyScoreCard("Black Sludge", 66, -1, 1, 0, 0, 0, "_1");
	makeEnemyScoreCard("Black Sludge", 66, 0, 0, 0, 0, 2, "_2");
	makeEnemyScoreCard("Black Sludge", 85, 0, 1, 0, 0, 0, "_1");
	makeEnemyScoreCard("Black Sludge", 85, 0, 0, 0, 0, 1, "_2"); //1+L/2
	makeEnemyScoreCard("Black Sludge", 85, 0, 0, 0, 0, 1, "_3"); //1+L/2

	//Blood Imp
	makeEnemyScoreCard("Blood Imp", 5, 0, 0, 0, 5, 1, "");
	makeEnemyScoreCard("Blood Imp", 37, 0, 0, 0, 0, 0, "A");
	makeEnemyScoreCard("Blood Imp", 37, 0, 0, 0, 0, 0, "");
	makeEnemyScoreCard("Blood Imp", 42, 1, 0, 0, 0, 0, "_1");
	makeEnemyScoreCard("Blood Imp", 42, 0, -1, 0, 0, 0, "_2");
	makeEnemyScoreCard("Blood Imp", 76, -1, 1, 0, 0, 0, "");
	makeEnemyScoreCard("Blood Imp", 42, 0, -1, 0, 0, 0, "_3");
	makeEnemyScoreCard("Blood Imp", 24, 0, 0, 0, 0, 0, "");

	//Chaos Demon
	makeEnemyScoreCard("Chaos Demon", 13, -1, 0, 0, 0, 0, "");
	makeEnemyScoreCard("Chaos Demon", 1, 1, -1, 0, 0, 0, "");
	makeEnemyScoreCard("Chaos Demon", 67, -2, 1, 0, 0, 0, "");
	makeEnemyScoreCard("Chaos Demon", 20, 0, -1, 0, 0, 0, "");
	makeEnemyScoreCard("Chaos Demon", 41, 0, 0, 0, 0, 0, "");
	makeEnemyScoreCard("Chaos Demon", 52, -1, 1, 0, 0, 0, "");
	makeEnemyScoreCard("Chaos Demon", 76, 0, 0, 0, 0, 0, "");
	makeEnemyScoreCard("Chaos Demon", 98, -1, -1, 0, 0, 0, "A");
	makeEnemyScoreCard("Chaos Demon", 76, 0, 0, 0, 0, 0, "");

	//Name, Active Array, Card, [1] is Score
//	console.log(jotl_enemy_cards[0][1][0]);
//	console.log(jotl_enemy_cards[0][1][0][1]);
//	console.log(jotl_enemy_cards[0][1][7]);
//	console.log(jotl_enemy_cards[0][1][7][1]);
}

function enemyAction(ID) {
	//Clear Array
	actionArray.length = 0;

	//Set Array
	const enemy = ID.split("_")[0];
	const action = ID.split("_")[2];
	const type = ID.split("_")[1];
	const attackValue = document.getElementById(enemy + "_" + action + "_" + type);
	actionArray.push(action, enemy, attackValue.textContent, type);

	//Set Cursor
	document.documentElement.style.cursor = `url("${ './Images/Icons/' + action +'_Cursor.png' }"), auto`;
}

function flipEnemy(element) {
	//Flip Enemy Score Card
	var scoreArray = [];
	for (i=0; i<jotl_enemy_cards.length; i++ ) {
		if (jotl_enemy_cards[i][0].replace(" ","") === element.id.split("_")[0]) {
			//Make Array of Enemy Scores
			for (j=0; j<jotl_enemy_cards[i][1].length; j++) {
				if (jotl_enemy_cards[i][1][j][9] === true) {
					var card = jotl_enemy_cards[i][1][j][1] + jotl_enemy_cards[i][1][j][8];
					scoreArray.push(card);
				}
			}

			//Shuffle Cards if hand is empty
			if (scoreArray.length === 0) {
				shuffleScores(element);
				break;
			}

			//Randomly select a Number/Score
			var number = getRandomIntExclusive(0,scoreArray.length);
			var score = scoreArray[number];

			//Get/Combine Attack Value(s)
			for (j=0; j<jotl_enemy_cards[i][1].length; j++) {
				var card = jotl_enemy_cards[i][1][j][1] + jotl_enemy_cards[i][1][j][8];
				if (card === score) {
					jotl_enemy_cards[i][1][j][9] = false;
					var attack = jotl_enemy_cards[i][1][j][3] + jotl_enemy_cards[i][1][j][4];
					break;
				}
			}

			//Add New Attack Value to Displayed Enemy Attack Value
			var enemyName = jotl_enemy_cards[i][0].replace(" ","");
			for (index=0; index<enemy_types.length; index++) {
				var enemyAttack = document.getElementById(enemyName + "_Attack" + enemy_types[index]);
				enemyAttack.textContent = Number(enemyAttack.dataset.baseAttack) + attack;
				enemyAttack.dataset.extraAttack = Number(enemyAttack.textContent);
			}

			//Update Displayed Card
			var enemyScoreImage = document.getElementById(enemyName + "_Score_Img");
			enemyScoreImage.src = jotl_enemy_cards[i][1][j][7];
		}
	}
}

function shuffleScores(element) {
	for (i=0; i<jotl_enemy_cards.length; i++ ) {
		if (jotl_enemy_cards[i][0].replace(" ","") === element.id.split("_")[0]) {
			for (j=0; j<jotl_enemy_cards[i][1].length; j++) {
				jotl_enemy_cards[i][1][j][9] = true
			}
			var enemyName = jotl_enemy_cards[i][0].replace(" ","");
			var enemyScoreImage = document.getElementById(enemyName + "_Score_Img");
			enemyScoreImage.src = "./Images/JoTL/Enemies/Initiatives/Monster_Back.jpg";
			break;
		}
	}
}

function flipEnemyAll() {
	var index = 0;
	while (index < jotl_enemy_cards.length ) {
		if (document.getElementById(jotl_enemy_cards[index][0].replace(" ","") + "_Card") ) {
			flipEnemy( document.getElementById(jotl_enemy_cards[index][0].replace(" ","") + "_Card") );
		}
		index++;
	}
}

function shuffleEnemyAll() {
	var index = 0;
	while (index < jotl_enemy_cards.length ) {
		if (document.getElementById(jotl_enemy_cards[index][0].replace(" ","") + "_Card") ) {
			shuffleScores( document.getElementById(jotl_enemy_cards[index][0].replace(" ","") + "_Card") );
		}
		index++;
	}
}

////////////////////////
// Enemy Modifier Deck
//
var curses = 0;
const enemyModifiers = [
	[0,0,0,0,0,0,+1,+1,+1,+1,+1,-1,-1,-1,-1,-1,-2,+2,"Null","Crit"],
	[true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true],
];

function flipEnemyModifierDeck() {
	//Random Number
	var number;
	do {
		number = getRandomIntExclusive(0,enemyModifiers[0].length);
	} while (!enemyModifiers[1][number] && enemyModifiers[1].includes(true) );

	//Make Display match selected Number/Card
	if (enemyModifiers[1][number]) {
		const modDeck = document.getElementById("EnemyModDeck");
		const modDeckOld = document.getElementById("EnemyModDeckOld");
		modDeckOld.src = modDeck.src;
		modDeck.src = "./Images/AttackModifiers/" + enemyModifiers[0][number] + ".png";
	}
	enemyModifiers[1][number] = false;
	var attack = enemyModifiers[0][number];

	//Shuffle at End of Cards
	if (enemyModifiers[1].every(value => value === false) ) {
		shuffleEnemyModifierDeck();
	}

	//Add New Attack Value to Displayed Enemy Attack Value(s)
	for (i=0; i<enemy_stat_cards.length; i++) {
		var enemyName = enemy_stat_cards[i].replace(" ","");
		for (index=0; index<enemy_types.length; index++) {
			var enemyAttack = document.getElementById(enemyName + "_Attack" + enemy_types[index]);
			console.log(attack);
			if (attack != "Null" && attack != "Curse" && attack != "Crit" && attack != "Bless" && enemyAttack) {
				enemyAttack.textContent = Number(enemyAttack.dataset.extraAttack) + attack;
			}
			if ( (attack === "Crit" || attack === "Bless" ) && enemyAttack) {
				enemyAttack.textContent = Number(enemyAttack.dataset.extraAttack) + Number(enemyAttack.dataset.extraAttack);
			}
		}
	}

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
}

function shuffleEnemyModifierDeck() {
	for (i=0; i<enemyModifiers[1].length; i++) {
		enemyModifiers[1][i] = true;
	}
	const modDeck = document.getElementById("EnemyModDeck");
	modDeck.src = "./Images/AttackModifiers/Back.png";

	for (i=0; i<enemy_stat_cards.length; i++) {
		var enemyName = enemy_stat_cards[i].replace(" ","");
		var enemyAttack = document.getElementById(enemyName + "_Attack");
		enemyAttack.textContent = Number(enemyAttack.dataset.baseAttack);
	}
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
		const healthValue = health.textContent;

		//Make Enemy new Health
		var newHealth = Number(healthValue);
		var attackValue = Number(actionArray[2]);

		//See if enemy has Negative Conditions
		const negBox = document.getElementById(ID.id + "_Conditions");
		if (negBox.querySelector('[id*="Poison"]') !== null) {
			attackValue++;
		}

		//Make Enemy new Health Continued
		var shield = Number(document.getElementById(ID.id + "_Shield").textContent);
		if (shield !== 0 ) {
			attackValue -= shield;
			if (attackValue < 0) { attackValue = 0; }
		}
		if (newHealth !== 0) {
			for (i=1; i<=attackValue; i++) {
				newHealth = newHealth - 1;
				if (newHealth === 0) {
					break;
				}
			}
			health.textContent = newHealth;
		}
		//Clear Array/Cursor
		actionArray.length = 0;
		document.documentElement.style.cursor = "default";
	}

	//If Enemy Action is Attack and Target is Player
	else if ( (clickedElement.className === "Player" || clickedElement.className === "action-Btn") && actionArray[0] === "Attack" ) {
		if (clickedElement.className === "action-Btn") {
			return;
		}

		//Get Player Helath
		const ID = document.getElementById(clickedElement.parentElement.parentElement.id);
		const health = document.getElementById(ID.id + "_Health");
		const healthValue = health.textContent;

		//Make Player new Health
		var newHealth = Number(healthValue);
		var attackValue = Number(actionArray[2]);

		//Get Player Conditions
		var conArray = [];
		for (p=0; p<document.getElementById(ID.id + "_Negatives").children.length; p++) {
			conArray.push(document.getElementById(ID.id + "_Negatives").children[p].id.split("_")[0] );
		}

		//Apply Negative Condition is Applicable
		var enemyConditions = document.getElementById(actionArray[1] + "_" + actionArray[3]);
		for (p=0; p<enemyConditions.children.length; p++) {
			let child = enemyConditions.children[p];
			if (child.id.includes("Neg") && !conArray.includes(child.id.split("_")[2]) ) {
				const clonedCondition = child.cloneNode(true);
				clonedCondition.id = child.id.split("_")[2] +"_"+ ID.id;
				clonedCondition.style.height = "50px";
				document.getElementById(ID.id + "_Negatives").appendChild(clonedCondition);
			}
		}

		//See if Player has Negative Conditions
		const negBox = document.getElementById(ID.id + "_Negatives");
		if (negBox.querySelector('[id*="Poison"]') !== null) {
			attackValue++;
		}

		//Make Player new Health Continued
		var shield = Number(document.getElementById(ID.id + "_Shield").textContent);
		if (shield !== 0 ) {
			attackValue -= shield;
			if (attackValue < 0) { attackValue = 0; }
		}
		if (newHealth !== 0) {
			for (i=1; i<=attackValue; i++) {
				newHealth = newHealth - 1;
				if (newHealth === 0) {
					break;
				}
			}
			health.textContent = newHealth;
		}
		//Clear Array/Cursor
		actionArray.length = 0;
		document.documentElement.style.cursor = "default";
	}
	
	//Remove Player Condition is Clicked
	else if ( (conditions[0][1].includes(clickedElement.id.split("_")[0]) || conditions[1][1].includes(clickedElement.id.split("_")[0]) ) && jotl_characters[0].includes(clickedElement.id.split("_")[1]) ) {
		clickedElement.remove();
	}
	else {
		//Clear Array/Cursor
		actionArray.length = 0;
		document.documentElement.style.cursor = "default";
	}
});

function addAttribute(ID) {
	const selected = document.getElementById(ID.id);
	var attribute = Number(selected.textContent);
	attribute++;
	selected.textContent = attribute;
}

function subAttribute(ID, extra) {
	const selected = document.getElementById(ID.id);
	var attribute = Number(selected.textContent);
	attribute--;
	if (attribute < 0) { attribute = 0; }
	selected.textContent = attribute;
}










//////////////////////////////
// Extra
//
function getRandomIntExclusive(min, max) {
	return Math.floor(Math.random() * (max - min)) + min;
}

function removeElement(ID) {
	const element = document.getElementById(ID.id);
}



















