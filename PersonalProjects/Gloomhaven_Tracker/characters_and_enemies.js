//////////////////////////////
// Characters
//
var selected_characters = [];
var selectedModifier;
var inRound = false;
var playerCrit = false;
var playerPierce = false;
var conditionMod;
var levelFlag = false;
var doomCounter = 0;
var plagueCounter = 0;
var attackMode = false;
var healMode = false;

var follower;
follower = document.createElement('div');
follower.style.position = 'fixed';
follower.style.pointerEvents = 'none';
follower.style.zIndex = '9999';
follower.style.fontSize = "30px";
follower.style.display = "none";
document.body.appendChild(follower);

function selectCharacterLevel(selectorID) {
	//Access Parent Card/Box
	cardBoxID = selectorID.split("_")[0] + "_Box";
	const cardBox = document.getElementById(cardBoxID);

	//Clear Selected Level
	for (let child of cardBox.children) {
		if(child.id.includes("Level")) {
			document.getElementById(child.id).style.webkitTextStroke = "0px #e2e0df";
		}
	}

	//Change Selected Level Color to indicate it being Chosen
	for (i=0; i<characters.length; i++ ) {
		if (characters[i][0] === selectorID.split("_")[0]) {
			document.getElementById(selectorID).style.webkitTextStrokeWidth = "1px";
			document.getElementById(selectorID).style.webkitTextStrokeColor = characters[i][3];
			//Change Card Level Value
			characters[i][1] = selectorID.slice(-1);
		}
	}

	levelFlag = true;
	var selected = document.getElementById(selectorID.split("_")[0] + "_Selector");
	selectCharacterStatus(selected.id);
}

function selectCharacterStatus(ID) {
	//Varibales
	var playerID = ID.split("_")[0];
	var playerSSE = document.getElementById(ID);
	var playerExists = selected_characters.some(row => row.includes(playerID) );

	//If from Level selection
	if (levelFlag) {
		//If does not exist, make it so it does
		if (!playerExists) {
			//Set Card Status to Active and Add Character
			playerSSE.src = playerSSE.src.replace("Null","Plus_1");
			addCharacter(playerID);
		}
		
		//If does then remove and re-add with new values
		else {
			removeCharacter(playerID);
			addCharacter(playerID);
		}

		levelFlag = false;
	}

	//If not from level flag
	else {
		//If does not exist, make it so it does
		if (!playerExists) {
			//Set Card Status to Active and Add Character
			playerSSE.src = playerSSE.src.replace("Null","Plus_1");
			addCharacter(playerID);
		}

		//If does then remove and re-add with new values
		else {
			//Clear Selected Level
			const cardBox = document.getElementById(playerID + "_Box");
			for (let child of cardBox.children) {
				if(child.id.includes("Level")) {
					document.getElementById(child.id).style.webkitTextStroke = "0px #e2e0df";
				}
			}

			//Set Card Status to False and Remove Character
			playerSSE.src = playerSSE.src.replace("Plus_1","Null");
			removeCharacter(playerID);
		}
	}
}

function addCharacter(playerID) {
	//Add Selected Character to List
	var playerIndex = characters.findIndex(row => row.includes(playerID));
	if (playerIndex > -1) {
		selected_characters.push(characters[playerIndex].slice());
		//Set Health
		var level = selected_characters.at(-1)[1] - 1;
		selected_characters.at(-1)[2] = characters[playerIndex][2][level];
	}
}

function removeCharacter(playerID) {
	//Remove Selected Character from List
	var playerIndex = selected_characters.findIndex(row => row.includes(playerID));
	if (playerIndex > -1) {
		selected_characters.splice( playerIndex, 1 );
	}
}

function revealCharacter(element) {
	var ID = element.id;

	element.style.display = "none";
	document.getElementById(ID.split("_")[0] + "_Icon").style.display = "none";

	var levelsArray = Array.from(element.parentElement.querySelectorAll(`[id*="Level"]`) );
	for (i=0; i<levelsArray.length; i++) {
		levelsArray[i].style.display = "flex";
	}

	document.getElementById(ID.split("_")[0] + "_Select").style.display = "";
	document.getElementById(ID.split("_")[0] + "_Selector").style.display = "flex";
	document.getElementById(ID.split("_")[0] + "_Card").style.display = "flex";
}

var alive = [];
var action_array = [];

function makeSelectedCharacters() {
	const box = document.getElementById("Character_Box_Container")

	//Re-assign Selected Chartacter to array
	const tempString = sessionStorage.getItem('selected_characters');
	selected_characters = JSON.parse(tempString);


	//Make Attributes for selected characters
	for (i=0; i<selected_characters.length; i++) {

		//Set Useful Variables
		const charBoxContainer = document.createElement("box-container");
		box.appendChild(charBoxContainer);
		const charName = selected_characters[i][0];
		const charSrc = "./Images/Gloomhaven_2e/" + charName + ".png";

		//Make Characters
		charBoxContainer.innerHTML = `
			<div class="box-long" id="${charName}" style="column-gap:10px;">
				<div class="box-tall" id="${charName + '_Positives'}" ondrop="dropConditionHandler(event)" ondragover="dragoverHandler(event)"
					style="min-width:50px;max-width:100px;height:172px; border:2px solid ${selected_characters[i][3]};">
				</div>
				<div class="box-tall" id="${charName + '_Negatives'}" ondrop="dropConditionHandler(event)" ondragover="dragoverHandler(event)"
					style="min-width:50px;max-width:100px;height:172px; border:2px solid ${selected_characters[i][4]};">
				</div>
				<div class="box-tall" id="${charName + '_Container'}" style="position:relative">
					<img src="${charSrc}" class="Player" height="172" width="136">
					<div class="box-long" style="column-gap:10px">
						<p style="margin:5px; color:white;">L: ${selected_characters[i][1]}</p>
						<input type="number" id="${charName + '_Score'}" class="attribute-input">
						<input type="number" id="${charName + '_Score02'}" class="attribute-input">
					</div>
				</div>
				<div class="box-tall" style="row-gap:15px;">
					<div class="box-long">
						<img src="./Images/Icons/Attack.png" id="${charName + '_Attack_Btn'}" onclick="characterAction(this.id)" class="action-Btn">
						<p id="${charName + '_Attack'}" class="attribute-input">0</p>
						<div class="box-tall">
							<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${charName + '_Attack'})" style="width:10px;height:10px; cursor:pointer;">
							<img src="./Images/Icons/Arrow.png" onclick="subAttribute(${charName + '_Attack'})" style="width:10px;height:10px; rotate:180deg; cursor:pointer;">
						</div>
					</div>
					<div class="box-long" style="column-gap:10px;">
						<img src="./Images/Icons/Heal.png" id="${charName + '_Heal_Btn'}" data-max="${selected_characters[i][2]}" class="action-Btn">
						<div class="box-long">
							<p id="${charName + '_Health'}" data-health="${selected_characters[i][2]}" class="attribute-input" style="color:red;font-size:24px;width:40px;">${selected_characters[i][2]}</p>
							<p id="${charName + '_Health_Perm'}" class="attribute-input" style="display:none"></p>
							<div class="box-tall">
								<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${charName + '_Health'})" style="width:10px;height:10px; cursor:pointer;">
								<img src="./Images/Icons/Arrow.png" onclick="subAttribute(${charName + '_Health'})" style="width:10px;height:10px; rotate:180deg; cursor:pointer;">
							</div>
						</div>
					</div>
					<div class="box-long">
						<img src="./Images/Icons/Shield.png" id="${charName + '_Shield_Btn'}" class="action-Btn">
						<p id="${charName + '_Shield'}" class="attribute-input" style="color:cyan; font-size:18px;">0</p>
						<p id="${charName + '_Shield_Perm'}" class="attribute-input" style="display:none">/ 0</p>
						<div class="box-tall">
							<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${charName + '_Shield'})" style="width:10px;height:10px; cursor:pointer;">
							<img src="./Images/Icons/Arrow.png" onclick="subAttribute(${charName + '_Shield'})" style="width:10px;height:10px; rotate:180deg; cursor:pointer;">
						</div>
					</div>
				</div>
			</div>
		`;
	}

	makeEnemyList();
	makeEnemyScoreCards();
}

function characterAction(ID) {
	//Clear Array
	action_array.length = 0;

	//Set Array
	const character = ID.split("_")[0];
	const action = ID.split("_")[1];
	const attackValue = document.getElementById(character + "_" + action);
	action_array.push(action, character, attackValue.textContent);

	//Set Cursor
	document.documentElement.style.cursor = `url("${ './Images/Icons/Cursors/' + action +'_Cursor.png' }"), auto`;

	//Add corresponding attack value to follow the cursor
	follower.innerText = attackValue.textContent;
	follower.style.display = "block";
}

addEventListener('change', (event) => {
	if (event.target.id === "Imbuements") {
		imbuementLevel = event.target.value;
		sessionStorage.setItem("IL", imbuementLevel);
	}
});

var noDie = false;
document.addEventListener('click', function(event) {
    // This is the exact DOM element under the mouse
    const clickedElement = event.target; 
	var ID = clickedElement.id;
	const isCtrlOrCmd = event.ctrlKey || event.metaKey;

	//If Player Shield Button is pressed
	if (ID.includes("_Shield_Btn") ) {
		var permShield = document.getElementById(ID.replace("_Btn", "") + "_Perm");
		var total = Number(permShield.textContent.replace("/ ", "") );
		//If Just Click
		if (event.button === 0 && !isCtrlOrCmd) {
			total++;
			permShield.textContent = "/ " + total;
		}
		//If Click and Control Key
		else if (event.button === 0 && isCtrlOrCmd) {
			total--;
			if (total < 0) { total = 0; }
			permShield.textContent = "/ " + total;
		}
	}

	//If Player Heal Button is pressed
	if (ID.includes("_Heal_Btn") ) {
		var permHealth = document.getElementById(ID.replace("Heal_Btn", "") + "Health_Perm");
		var total = Number(permHealth.textContent.replace("/ ", "") );
		//If Just Click
		if (event.button === 0 && !isCtrlOrCmd) {
			total++;
			permHealth.textContent = "/ " + total;
		}
		//If Click and Control Key
		else if (event.button === 0 && isCtrlOrCmd) {
			total--;
			if (total < Number(clickedElement.dataset.max) ) { total = Number(clickedElement.dataset.max); }
			permHealth.textContent = "/ " + total;
		}
	}
});

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

	//Hide Plague Stuff if no Plauge guy selected
	if (!selected_characters.some(element => element.includes("Plagueherald") ) ) {
		document.getElementById("Plague").style.display = "none";
	}

	//Hide Doom Stuff if no Doom guy selected
	if (!selected_characters.some(element => element.includes("Doomstalker") ) ) {
		document.getElementById("Doom").style.display = "none";
	}

	//Set default Enemy Level
	var ESLE = document.getElementById("Enemy_Selector_Levels");
	var totalPlayers = selected_characters.length;
	var total = 0;
	for (i=0; i<selected_characters.length; i++) {
		total = total + Number(selected_characters[i][1]);
	}
	ESLE.value = Math.ceil( Math.ceil(total / totalPlayers) / 2);
});

//////////////////////////////
// Enemies
//
var enemyNumber = 0;
var enemy_stat_cards = [];
var inflictsPierce;

var atkModCon = "none";

var highlightedEnemy;
var highlightedTarget;

function makeEnemyList() {
	//Make Enemy Selection List
	var father = document.getElementById("Enemy_Selector");
	for (i=0; i<normal_enemies.length; i++) {
		const option = document.createElement("option");
		option.value = i;
		option.text = normal_enemies[i][0];
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

function addEnemy(array_type) {
	//Get Values set
	var box = document.getElementById("Enemy_Box");
	enemyNumber++;
	var enemyType;

	//Make Enemy Container(s)
	var enemySelection = document.getElementById("Enemy_Selector")
	var enemyBoxContainer = document.createElement("box-container");
	box.appendChild(enemyBoxContainer);

	//Set Type
	if (array_type.includes("normal") ) {
		enemies = normal_enemies;
		color = "3px solid grey";
		enemyType = "2";
	}
	else if (array_type.includes("elite") ) {
		enemies = elite_enemies;
		color = "3px solid goldenrod";
		enemyType = "1";
	}

	//Random Liam Generator
	var tempName = enemies[enemySelection.value][0];
	if (getRandomIntInclusive(0, 200) === 52) {
		tempName = "NurseLiamCard";
	}

	//Set Values
	var enemySrc = "./Images/Gloomhaven_2e/Enemies/" + tempName + ".avif";
	var level = Number(document.getElementById("Enemy_Selector_Levels").value);
	var enemyName = enemies[enemySelection.value][0].replace(/\s+/g,"");
	var health = 0;
	var shield = 0;
	var enemies;
	var color;
	var wasSummoned = document.getElementById("Enemy_Selector_Summons").value;

	//Get Enemy Values
	for (i=0; i<enemies.length; i++) {
		if (enemies[i][0].includes(enemies[enemySelection.value][0]) ) {
			//Health
			health = enemies[i][1][level];
			if (enemies[i][0].includes("Boss") ) {
				health = enemies[i][1][level] * selected_characters.length;
			}
			//Shield
			if (enemies[i][5].length > 0) {
				shield = enemies[i][5][level];
			}
		}
	}
	var enemy = enemyName + "_" + enemyNumber;

	enemyBoxContainer.innerHTML = `
	<div class="box-long" style="column-gap:5px;">
		<div class="box-tall" id="${enemy}" style="position:relative">
			<img src="${enemySrc}" class="enemy-image">
			<img class="enemy-delete" onclick="removeEnemy(${enemy})">
			<input type="number" class="enemy-ID" id="${enemy + '_Standee'}" data-type="${enemyType}" data-summoned="${wasSummoned}" data-action="0">
			<div class="box-long" style="column-gap:5px;">
				<div class="box-long">
					<p id="${enemy + "_Health"}" style="margin:5px; color:red; font-size:24px;" data-health="${health}">${health}</p>
					<div class="box-tall">
						<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${enemy + '_Health'})" style="width:10px;height:10px; cursor:pointer;">
						<img src="./Images/Icons/Arrow.png" onclick="subAttribute(${enemy + '_Health'})" style="width:10px;height:10px; rotate:180deg; cursor:pointer;">
					</div>
				</div>
				<div class="box-long">
					<p id="${enemy + "_Shield"}" style="margin:5px; color:cyan; font-size:24px;" data-shield="${shield}">${shield}</p>
					<div class="box-tall">
						<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${enemy + '_Shield'})" style="width:10px;height:10px; cursor:pointer;">
						<img src="./Images/Icons/Arrow.png" onclick="subAttribute(${enemy + '_Shield'})" style="width:10px;height:10px; rotate:180deg; cursor:pointer;">
					</div>
				</div>
			</div>
		</div>
		<div class="box-tall" id="${enemy + '_All_Conditions'}" style="border:${color}; min-width:35px;max-width:60px;height:160px;"
			ondrop="dropConditionHandler(event)" ondragover="dragoverHandler(event)"></div>
	</div>
	`;

	//Track different types of enemies on screen
	var NH = 0; var EH = 0;
	var NM = 0;	var EM = 0;
	var NA = 0; var EA = 0;
	var NS = 0; var ES = 0;
	var NC = 0; var EC = 0;
	var NC2 = 0; var EC2 = 0;

	//Get Enemy Values
	for (i=0; i<normal_enemies.length; i++) {
		if (normal_enemies[i][0].includes(normal_enemies[enemySelection.value][0]) ) {
			//Health
			NH = normal_enemies[i][1][level];	EH = elite_enemies[i][1][level];
			if (normal_enemies[i][0].includes("Boss") ) {
				NH = normal_enemies[i][1][level] * selected_characters.length;	EH = elite_enemies[i][1][level] * selected_characters.length;
			}
			//Move
			NM = normal_enemies[i][2][level];	EM = elite_enemies[i][2][level];
			//Attack
			NA = normal_enemies[i][3][level];	EA = elite_enemies[i][3][level];
			if (normal_enemies[i][0].includes("BossC") ) {
				NA = normal_enemies[i][3][level] + selected_characters.length;	EA = elite_enemies[i][3][level] + selected_characters.length;
			}
			//Shield
			NS = normal_enemies[i][5][level];	ES = elite_enemies[i][5][level];
			//Condition(s)
			NC = normal_enemies[i][6][level];	EC = elite_enemies[i][6][level];
			NC2 = normal_enemies[i][7][level];	EC2 = elite_enemies[i][7][level];
		}
	}

	////////////////////////////////////////////////////////
	// Adding Enemy Stat Card to Enemy Stat Card Box
	//

	//If Enemy does not have a Stat Card, Make One
	var newEnemyName = enemies[enemySelection.value][0];
	if (!enemy_stat_cards.includes(newEnemyName) ) {
		//Add to Array
		enemy_stat_cards.push(newEnemyName);

		//Get Parent(s)
		var enemyStatBox = document.getElementById("Enemy_Stat_Box");
		var enemyStatCardSrc = "./Images/Gloomhaven_2e/Enemies/Cards/" + normal_enemies[enemySelection.value][0].replace(/\s+/g,"") + ".png";
		var enemyStatCardBox = document.createElement("box-container");
		enemyStatBox.appendChild(enemyStatCardBox);

		//Name Variables
		var eStatName = enemyName + "_Stat";
		var eActionName = enemyName + "_Action";
		var eCardName = enemyName + "_Card";

		enemyStatCardBox.innerHTML = `
			<div class="box-long" style="position:relative; column-gap:10px;">
				<div class="box-tall" id="${eStatName}" style="position:relative">
					<img src="${enemyStatCardSrc}" class="enemy-stat-image" style="position:relative">
					<img class="enemy-delete" onclick="removeEnemy(${eStatName})">
					<div class="box-long">
						<div class="box-tall" id="${eStatName + '_Normal'}">
							<p style="margin:5px; color:white; font-size:20px;">M:${NM}</p>
							<p style="margin:5px; color:white; font-size:20px;" id="${eStatName + '_Normal_A'}">A:${NA}</p>
							<p style="margin:5px; color:white; font-size:20px;">S:${NS}</p>
						</div>
						<div class="box-tall" id="${eStatName + '_Elite'}">
							<p style="margin:5px; color:gold; font-size:20px;">M:${EM}</p>
							<p style="margin:5px; color:gold; font-size:20px;" id="${eStatName + '_Elite_A'}">A:${EA}</p>
							<p style="margin:5px; color:gold; font-size:20px;">S:${ES}</p>
						</div>
					</div>
				</div>
				<div class="box-tall" id="${eCardName}" style="position:relative" data-middle="1" data-flipped="false">
					<div class="box-long" style="column-gap:10px;">
						<div class="box-long">
							<img src="./Images/Icons/Flip.png" onclick="nextAction(${eCardName})" class="action-Btn" style="height:25px;">
							<p id="${eActionName + '_Next'}" class="attribute-input" style="font-size:20px;">0</p>
						</div>
						<div class="box-long">
							<img src="./Images/Icons/Attack.png" id="${eActionName + '_Normal_Attack_Btn'}" onclick="enemyAction(this.id)" class="action-Btn" style="height:35px;">
							<p id="${eActionName + '_Normal_Attack'}" class="attribute-input" style="font-size:20px;" data-base-Attack="${NA}" data-extra-Attack="${NA}">${NA}</p>
							<div class="box-tall">
								<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${eActionName + '_Normal_Attack'})" style="width:10px;height:10px; cursor:pointer;">
								<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${eActionName + '_Noraml_Attack'})" style="width:10px;height:10px; cursor:pointer; rotate:180deg;">
							</div>
						</div>
						<div class="box-long">
							<img src="./Images/Icons/Attack_Elite.png" id="${eActionName + '_Elite_Attack_Btn'}" onclick="enemyAction(this.id)" class="action-Btn" style="height:35px;">
							<p id="${eActionName + '_Elite_Attack'}" class="attribute-input" style="font-size:20px; color:gold;border-color:gold" data-base-Attack="${EA}" data-extra-Attack="${EA}">${EA}</p>
							<div class="box-tall">
								<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${eActionName + '_Elite_Attack'})" style="width:10px;height:10px; cursor:pointer;">
								<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${eActionName + '_Elite_Attack'})" style="width:10px;height:10px; cursor:pointer; rotate:180deg;">
							</div>
						</div>
						<img src="./Images/Icons/Shuffle.png" onclick="shuffleScores(${eCardName})" class="action-Btn" style="height:25px;">
						<img src="./Images/Icons/Flip.png" onclick="flipEnemy(${eCardName})" id="${eCardName} + _Flip" class="action-Btn" style="height:25px;">
					</div>
					<div class="box-tall" style="position:relative">
						<img src="./Images/Monster_Back.jpg" id="${eCardName + '_Img'}" style="height:auto;width:300px;">
					</div>
				</div>
			</div>
		`;

		//Getting Conditions that Enemy default Inflicts
		if (NC) { applyConditionfromStats(eStatName, "_Normal", NC) }
		if (EC) { applyConditionfromStats(eStatName, "_Elite", EC) }
		if (NC2) { applyConditionfromStats(eStatName, "_Normal", NC2) }
		if (EC2) { applyConditionfromStats(eStatName, "_Elite", EC2) }

		//Flip newly added enemy card if in middle of round
		if (inRound) {
			var eCard = document.getElementById(eCardName);
			flipEnemy(eCard);
			eCard.dataset.middle = "2";
		}
	}
}

function removeEnemy(element) {
	if (element.id.includes("Stat") ) {
		const index = enemy_stat_cards.indexOf(element.id.split("_")[0]);
		if (index > -1) { enemy_stat_cards.splice(index,1); }
		element.parentElement.remove();
	}
	else if (element !== highlightedEnemy) {
		element.parentElement.remove();
	}
	else if (element = highlightedEnemy) {
		var lastGuy = element.parentElement;
		highlightPlay();
		lastGuy.remove();
	}
}

function addAttribute(ID) {
	var selected = document.getElementById(ID.id);
	var attribute = Number(selected.textContent);
	attribute++;
	selected.textContent = attribute;
}

function subAttribute(ID, extra) {
	var selected = document.getElementById(ID.id);
	var attribute = Number(selected.textContent);
	attribute--;
	if (attribute < 0) { attribute = 0; }
	selected.textContent = attribute;
}

function addPierce() {
	var selected = document.getElementById("playerPierce");
	var attribute = Number(selected.textContent);
	attribute++;
	selected.textContent = attribute;
}

function subPierce() {
	var selected = document.getElementById("playerPierce");
	var attribute = Number(selected.textContent);
	attribute--;
	if (attribute < 0) { attribute = 0; }
	selected.textContent = attribute;
}

/////////////////////////////
// Actions
//

function enemyAction(element) {
	//Clear Array
	action_array.length = 0;

	//Get Array Values
	const enemy = element.split("_")[0];
	const type = element.split("_")[2];
	const action = element.split("_")[3];
	const attackValue = document.getElementById(enemy + "_Action_" + type + "_" + action);

	//Get Pierce or Retaliate values
	var amount;
	for (let child of document.getElementById(enemy + "_Stat_" + type).children) {
		 if (child.tagName === "IMG" && child.id.includes("Pierce") ) {
			amount = child.dataset.amount;
		}
	}

	//Make Array
	action_array.push(action, enemy, attackValue.textContent, type, amount);

	//Set Cursor
	document.documentElement.style.cursor = `url("${ './Images/Icons/Cursors/' + action +'_Cursor.png' }"), auto`;

	//Add corresponding attack value to follow the cursor
	follower.innerText = attackValue.textContent;
	follower.style.display = "block";
}

function nextAction(enemyElement) {
	if (selected_characters.some(subArray => subArray.includes(enemyElement.id) )) {
		highlightPlay();
	}

	else if (highlightedEnemy) {
		//Get Enemy Standee
		var enemyStandee = document.getElementById(highlightedEnemy.id + "_Standee");

		//Get Enemy from Cards
		var enemyCardElement = document.getElementById(highlightedEnemy.id.split("_")[0] + "_Card");
		var cndex = enemy_cards.findIndex(row => row.includes(enemyCardElement.id.split("_")[0]) );

		//Action Counter +1
		var actionCountStatCard = document.getElementById(enemyElement.id.split("_")[0] + "_Action_Next" );
		var AN = Number(enemyStandee.dataset.action);

		//Reset Attacks
		for (index=0; index<enemy_types.length; index++) {
			var enemyAttack = document.getElementById(enemy_cards[cndex][0] + "_Action" + enemy_types[index] + "_Attack");
			enemyAttack.textContent = Number(enemyAttack.dataset.baseAttack);
			enemyAttack.dataset.extraAttack = Number(enemyAttack.textContent);
		}

		if (enemy_cards[cndex][3][AN]) {
			//Variables
			var nowAction = enemy_cards[cndex][3][AN];
			var nextAction = enemy_cards[cndex][3][AN + 1];
			var enemyBox = document.getElementById("Enemy_Box");
			
			//If Attack(s)
			if (nowAction.includes("Attack")) {
				var attack = 0;
				//If Attack and no Consume
				if (!nowAction.includes("Consume") ) {
					inflictsPierce = 0;
					//If Attack has Pierce
					if (nowAction.includes("Pierce")) {
						inflictsPierce = nowAction.slice(0, -1);
						attack = nowAction.split("/")[0].replace("Attack", "").trim();
					}

					//If no Pierce apply Negative Condition (See if string contains substring from array)
					else if (conditions[1][1].some(substring => nowAction.includes(substring) ) ) {
						enemyElement.dataset.infliction = nowAction.split("/")[1].replace(" ", "");
						attack = nowAction.split("/")[0].replace("Attack", "").trim();
					}

					//Else No Conditions
					else {
						attack = nowAction.replace("Attack", "").trim();
					}

					//Apply Attack
					for (index=0; index<enemy_types.length; index++) {
						var enemyAttack = document.getElementById(enemy_cards[cndex][0] + "_Action" + enemy_types[index] + "_Attack");
						enemyAttack.textContent = Number(enemyAttack.dataset.baseAttack) + Number(attack);
						enemyAttack.dataset.extraAttack = Number(enemyAttack.textContent);
					}
				}

				//If Attack and Consume and no Any
				else if (nowAction.includes("Consume") && !nowAction.includes("Any") ) {	
					//Get Element
					var element = document.getElementById(nowAction.split(":")[1]);
					var hasElement = document.getElementById("Inert").querySelector(`[id*="${element.id}"]`) !== null;

					//If Inert Box does not have Element then Consume it and do thing
					if (!hasElement) {
						//If no Pierce apply Negative Condition (See if string contains substring from array)
						if (conditions[1][1].some(substring => nowAction.includes(substring) ) ) {
							enemyElement.dataset.infliction = nowAction.split(":")[2].split("/")[1].replace(" ", "");
							attack = nowAction.split(":")[2].split("/")[0].replace("Attack", "").trim();
						}

						//Else No Conditions
						else {
							attack = nowAction.split(":")[2].replace("Attack", "").trim();
						}

						//Apply Attack
						for (index=0; index<enemy_types.length; index++) {
							var enemyAttack = document.getElementById(enemy_cards[cndex][0] + "_Action" + enemy_types[index] + "_Attack");
							enemyAttack.textContent = Number(enemyAttack.dataset.baseAttack) + Number(attack);
							enemyAttack.dataset.extraAttack = Number(enemyAttack.textContent);
						}

						//Consume Element
						moveElementTo(element.id, "Inert");
					}
				}

			}

			//Consume
			if (nowAction.includes("Consume") ) {
				//Detect if Waning/Strong have Elements to Consume
				var waningHas = document.getElementById("Waning").children.length;
				var strongHas = document.getElementById("Strong").children.length;

				//Get Element Boxes
				var inert = document.getElementById("Inert");
				var waning = document.getElementById("Waning");
				var strong = document.getElementById("Strong");

				//Consume Any Element to do Nothing
				if (nowAction.replace(" ", "") === "Consume:Any" && nowAction.split(":").length === 2 && (waningHas > 0 || strongHas > 0) ) {
					//Randomly Choose an active Element to Consume
					var chosen = getRandomElement();
					moveElementTo(chosen, "Inert");
				}

				//Consume Any Element to Attack
				else if (nowAction.includes("Any") && nowAction.includes("Attack")  && (waningHas > 0 || strongHas > 0) ) {
					//Randomly Choose an active Element to Consume
					var chosen = getRandomElement();
					moveElementTo(chosen, "Inert");

					//If no Pierce apply Negative Condition (See if string contains substring from array)
					if (conditions[1][1].some(substring => nowAction.includes(substring) ) ) {
						enemyElement.dataset.infliction = nowAction.split(":")[2].split("/")[1].replace(" ", "");
						attack = nowAction.split(":")[2].split("/")[0].replace("Attack", "").trim();
					}

					//Else No Conditions
					else {
						attack = nowAction.split(":")[2].replace("Attack", "").trim();
					}

					//Apply Attack
					for (index=0; index<enemy_types.length; index++) {
						var enemyAttack = document.getElementById(enemy_cards[cndex][0] + "_Action" + enemy_types[index] + "_Attack");
						enemyAttack.textContent = Number(enemyAttack.dataset.baseAttack) + Number(attack);
						enemyAttack.dataset.extraAttack = Number(enemyAttack.textContent);
					}
				}

				//Consume Any Element to Make New Element
				else if (nowAction.includes("Any") && elements.some(substring => nowAction.split(":")[2].includes(substring) ) && (waningHas > 0 || strongHas > 0) ) {
					//Get Infused Element
					var infuse = document.getElementById(nowAction.split(":")[2]);

					//If Strong does not have Infusion then Infuse
					if (!strong.querySelector(`[id*="${infuse}"]`) != null) {
						//Randomly Choose an active Element to Consume
						var chosen = getRandomElement();
						moveElementTo(chosen, "Inert");
						moveElementTo(infuse.id, "Strong");
					}
				}

				//Consume Element to X
				else if (elements.includes(nowAction.split(":")[1]) ) {
					//Get Consumed Element
					var consume = document.getElementById(nowAction.split(":")[1]);

					//Check if Consumed Element is in Inert, if not then procced
					if(!inert.querySelector(`[id*="${consume}"]`) != null) {
						//To Suffer
						if (nowAction.includes("Suffer") ) {
							var enemy = document.getElementById(highlightedEnemy.id + "_Health");
							var damage = Number(nowAction.split(":")[2].replace("Suffer ", "") );
							for (f=0; f<damage; f++) {
								if (Number(enemy.textContent) - 1 >= 0 ) {
									enemy.textContent = Number(enemy.textContent) - 1;
								}
							}
						}

						//To Heal
						else if (nowAction.includes("Heal") ) {
							var enemy = document.getElementById(highlightedEnemy.id + "_Health");
							var heal = Number(nowAction.split(":")[2].replace("Heal ", "") );
							for (f=0; f<heal; f++) {
								if (Number(enemy.textContent) + 1 >= enemy.dataset.health) {
									enemy.textContent = Number(enemy.textContent) + 1;
								}
							}
						}

						//To Shield
						else if (nowAction.includes("Shield") ) {
							var enemy = document.getElementById(highlightedEnemy.id + "_Shield");
							var shield = Number(nowAction.split(":")[2].replace("Shield ", "") );
							for (f=0; f<shield; f++) {
								enemy.textContent = Number(enemy.textContent) + 1;
							}
						}

						//To Apply Condition to Self
						else if (nowAction.includes("Self") ) {
							//Get new condition
							var condition = nowAction.split(":")[2].split(" ")[0].trim();
							var conditionElement = document.getElementById(condition);
							//Curse
							if (curses < 10 && condition === "Curse") {
								enemyModifiers[0].push(condition);
								enemyModifiers[1].push(true);
								curses++;
							}
							//Bless
							else if (condition === "Bless") {
								enemyModifiers[0].push(condition);
								enemyModifiers[1].push(true);
							}
							//Others
							else {
								var enemy = document.getElementById(highlightedEnemy.id + "_All_Conditions");
								var hasCon = enemy.querySelector(`[id*="${condition}"]`) !== null;
								if (!hasCon) {
									var conditionElement = document.getElementById(condition);
									applyConditionTo(enemy, conditionElement, enemy.id.split("_")[0], condition, "30px");
								}
							}
						}

						//Consume Elements
						moveElementTo(consume.id, "Inert");
					}
				}
			}

			//Infuse
			if (nowAction.includes("Infuse") ) {
				//Randomly Choose an Element to Infuse
				if (nowAction.split(":")[1].includes("Any") ) {
					//Randomly Choose an active Element to Infuse
					random = getRandomIntInclusive(0, 5);
					moveElementTo(elements[random], "Strong");
				}
				//Infuse All
				else if (nowAction.split(":")[1].includes("All") ) {
					moveElementsFrom("Inert", "Waning");
					moveElementsFrom("Waning", "Strong");
				}
				//Normal Infuse
				else {
					var element = document.getElementById(nowAction.split(":")[1]);
					moveElementTo(element.id, "Strong");
				}
			}

			//Shield
			if (nowAction.includes("Shield") ) {
				var enemy = document.getElementById(highlightedEnemy.id + "_Shield");
				var shield = Number(nowAction.replace("Shield ", "") );
				for (f=0; f<shield; f++) {
					enemy.textContent = Number(enemy.textContent) + 1;
				}
			}

			//Health
			if (nowAction.includes("Heal") ) {
				var enemy = document.getElementById(highlightedEnemy.id + "_Health");
				var heal = Number(nowAction.replace("Heal ", "") );
				for (f=0; f<heal; f++) {
					if (Number(enemy.textContent) + 1 <= enemy.dataset.health) {
						enemy.textContent = Number(enemy.textContent) + 1;
					}
				}
			}

			//To Suffer
			if (nowAction.includes("Suffer") ) {
				var enemy = document.getElementById(highlightedEnemy.id + "_Health");
				var damage = Number(nowAction.replace("Suffer ", "") );
				for (f=0; f<damage; f++) {
					if (Number(enemy.textContent) - 1 >= 0 ) {
						enemy.textContent = Number(enemy.textContent) - 1;
					}
				}
			}

			//Positive Condition
			if (conditions[0][1].some(substring => nowAction.includes(substring) ) ) {
				var condition = nowAction;
				var enemy = document.getElementById(highlightedEnemy.id + "_All_Conditions");
				var hasCon = enemy.querySelector(`[id*="${condition}"]`) !== null;
				if (!hasCon) {
					var conditionElement = document.getElementById(condition);
					applyConditionTo(enemy, conditionElement, enemy.id.split("_")[0], condition, "30px");
				}
			}

			//Self
			if (nowAction.includes("Self") ) {
				var condition = nowAction.split(" ")[0];
				//Bless
				if (condition === "Bless") {
					enemyModifiers[0].push(condition);
					enemyModifiers[1].push(true);
				}
				//Others
				else {
					var enemy = document.getElementById(highlightedEnemy.id + "_All_Conditions");
					var hasCon = enemy.querySelector(`[id*="${condition}"]`) !== null;
					if (!hasCon) {
						var conditionElement = document.getElementById(condition);
						applyConditionTo(enemy, conditionElement, enemy.id.split("_")[0], condition, "30px");
					}
				}
			}

			AN++;
			actionCountStatCard.textContent = AN;
			enemyStandee.dataset.action = AN;
		}
		else {
			highlightPlay();
		}
	}
}

document.addEventListener('click', function(event) {
    // This is the exact DOM element under the mouse
    const clickedElement = event.target; 
	const isCtrlOrCmd = event.ctrlKey || event.metaKey;

	//Heal Target when in Heal Mode
	if (healMode && ((clickedElement.className === "enemy-image" || clickedElement.className === "Player")) ) {
		var string = clickedElement.parentElement.id.replace("_Container","");
		var target = document.getElementById(string + "_Health");
		var heal = Number(follower.innerText);

		//Enemy Wound/Poison Check
		if (clickedElement.className === "enemy-image") {
			if (document.getElementById(clickedElement.parentElement.id + "_All_Conditions" ).querySelector(`[id*="Wound"]`) !== null) {
				document.getElementById(clickedElement.parentElement.id + "_All_Conditions" ).querySelector(`[id*="Wound"]`).remove();
				heal = 0;
			}
			else if (document.getElementById(clickedElement.parentElement.id + "_All_Conditions" ).querySelector(`[id*="Poison"]`) !== null) {
				document.getElementById(clickedElement.parentElement.id + "_All_Conditions" ).querySelector(`[id*="Poison"]`).remove();
				heal = 0;
			}
		}

		//Player Wound/Poison Check
		if (clickedElement.className === "Player") {
			if (document.getElementById(string + "_Negatives" ).querySelector(`[id*="Wound"]`) !== null) {
				document.getElementById(string + "_Negatives" ).querySelector(`[id*="Wound"]`).remove();
				heal = 0;
			}
			else if (document.getElementById(string + "_Negatives" ).querySelector(`[id*="Poison"]`) !== null) {
				document.getElementById(string + "_Negatives" ).querySelector(`[id*="Poison"]`).remove();
				heal = 0;
			}
		}

		if (heal > 0) {
			for (f=0; f<heal; f++) {
				if (Number(target.textContent) + 1 <= target.dataset.health) {
					target.textContent = Number(target.textContent) + 1;
				}
			}
		}
	}
    
	//If Player Action is Attack and Target is Enemy
	else if ( (clickedElement.className === "enemy-image" || clickedElement.className === "action-Btn") && action_array[0] === "Attack" ) {
		if (clickedElement.className === "action-Btn") {
			return;
		}

		//Get Enemy Helath
		const enemy = document.getElementById(clickedElement.parentElement.id);
		const health = document.getElementById(enemy.id + "_Health");
		const healthValue = health.textContent;

		//Get Ward
		var hasWard = document.getElementById(enemy.id + "_All_Conditions" ).querySelector(`[id*="Ward"]`) !== null;
		var ward = document.getElementById(enemy.id.split("_")[0] + "_Ward");

		//Make Enemy new Health
		var newHealth = Number(healthValue);
//		var attackValue = Number(action_array[2]);
		var attackValue = Number(follower.innerText);

		//See if enemy has Negative Conditions
		const negBox = document.getElementById(enemy.id + "_All_Conditions");
		if (negBox.querySelector('[id*="Poison"]') !== null) {
			attackValue++;
		}

		//Apply Crit
		if (playerCrit) {
			attackValue = attackValue * 2;
		}

		//Apply Pierce
		if (playerPierce && attackValue > 0 && newHealth > 0 ) {
			var pierce = Number(document.getElementById("playerPierce").textContent);
			for (i=1; i<=pierce; i++) {
				newHealth = newHealth - 1;
				attackValue--;
				if (newHealth === 0 || attackValue === 0) { break; }
			}
			health.textContent = newHealth;
		}

		//Make Enemy new Health Continued
		var shield = Number(document.getElementById(enemy.id + "_Shield").textContent);
		//If Ward half attack
		if (hasWard && attackValue > 0) {
			attackValue = Math.floor(attackValue / 2);
			ward.remove();
		}
		//Shield
		if (shield !== 0 ) {
			attackValue -= shield;
			if (attackValue < 0) { attackValue = 0; }
		}
		//Attack
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
		action_array.length = 0;
		attackMode = false;
		healMode = false;
		follower.style.display = "none";
		document.documentElement.style.cursor = "default";
	}

	//If Enemy Action is Attack and Target is Player
	else if ( (clickedElement.className === "Player" || clickedElement.className === "action-Btn") && action_array[0] === "Attack" ) {
		if (clickedElement.className === "action-Btn") {
			return;
		}

		//Get Player Helath
		var player = document.getElementById(clickedElement.parentElement.parentElement.id);
		var health = document.getElementById(player.id + "_Health");
		var healthValue = health.textContent;

		//Make Player new Health
		var newHealth = Number(healthValue);
//		var attackValue = Number(action_array[2]);
		var attackValue = Number(follower.innerText);

		//Get Ward
		var hasWard = document.getElementById(player.id + "_Positives" ).querySelector(`[id*="Ward"]`) !== null;
		var ward = document.getElementById(player.id + "_Ward");

		//If Player is not dead update health
		if (newHealth !== 0) {
			//Get Player Conditions
			var conArray = [];
			for (p=0; p<document.getElementById(player.id + "_Negatives").children.length; p++) {
				conArray.push(document.getElementById(player.id + "_Negatives").children[p].id.split("_")[0] );
			}

			//See if Player has Negative Conditions
			var negBox = document.getElementById(player.id + "_Negatives");
			//If Poison
			if (negBox.querySelector('[id*="Poison"]') !== null) {
				attackValue++;
				var deck = selectedModifier;
				if (deck.dataset.add === "Crit" || deck.dataset.add === "Bless") {
					attackValue++;
				}
			}

			//Make Player new Health Continued
			var shield = Number(document.getElementById(player.id + "_Shield").textContent);

			//Apply Pierce from Stat Card
			var specialFlag = false;
			if (action_array[4] && attackValue > 0 && newHealth > 0 ) {
				var pierce = action_array[4];
				for (i=1; i<=pierce; i++) {
					newHealth = newHealth - 1;
					attackValue--;
					if (newHealth === 0 || attackValue === 0) { break; }
				}
				health.textContent = newHealth;
				specialFlag = true;
			}

			//Apply Pierce from Score Card
			if (inflictsPierce > 0 && attackValue > 0 && newHealth > 0 ) {
				var pierce = inflictsPierce;
				for (i=0; i<pierce; i++) {
					newHealth = newHealth - 1;
					attackValue--;
					if (newHealth === 0 || attackValue === 0) { break; }
				}
				health.textContent = newHealth;
			}

			//Continue if health not 0
			if (newHealth !== 0) {
				//Check for Shield
				if (shield !== 0 ) {
					attackValue -= shield;
					if (attackValue < 0) { attackValue = 0; }
				}
				//If Ward (ward is half incoming damage and round up)
				if (hasWard && attackValue > 0) {
					attackValue = Math.floor(attackValue / 2);
					ward.remove();
				}
				//Attack
				for (i=1; i<=attackValue; i++) {
					newHealth = newHealth - 1;
					if (newHealth === 0) { break; }
				}
			}
			health.textContent = newHealth;

			/////////////////////////////////
			// Apply Conditions to Player

			//Get Enemy Variables
			var enemyStatConditions = document.getElementById(action_array[1] + "_Stat_" + action_array[3]);
			var allEnemyConditions = enemyStatConditions.querySelectorAll("img");

			//Get Player Variables
			var playerNegConditions = document.getElementById(player.id + "_Negatives" );
			var playerNegConArray = Array.from(playerNegConditions.children).map(child => child.id);

			//Get Safeguard
			var hasSafeguard = document.getElementById(player.id + "_Positives" ).querySelector(`[id*="Safeguard"]`) !== null;
			var safe = document.getElementById(player.id + "_Safeguard");

			//Apply Negative Condition from Enemy Stat card if Applicable
			allEnemyConditions.forEach((img) => {
				//Check if Player does not have effect and no pierce/retaliate, apply it
				if (!playerNegConArray.some(str => str.includes(img.id.split("_")[4]) ) && !specialFlag && !img.id.split("_")[4].includes("Retaliate") ) {
					var target = document.getElementById(player.id + "_Negatives");
					//Check for Safeguard
					if (!hasSafeguard) {
						var con = document.getElementById(img.id.split("_")[4]);
						applyConditionTo(target, con, player.id, img.id.split("_")[4], "40px");
					}
					if (safe) {
						safe.remove();
						hasSafeguard = false;
					}
				}
			});

			//Get Player Variables Again (As to not double inflict a condition)
			playerNegConArray = Array.from(playerNegConditions.children).map(child => child.id);

			//Aplly Condition from Score Card if Applicable
			var enemyCard = document.getElementById(action_array[1] + "_Card");
			if (conditions[1][1].includes(enemyCard.dataset.infliction) ) {
				//If Player does not have effect and no pierce, apply it
				if (!playerNegConArray.includes(player.id + "_" + enemyCard.dataset.infliction) && inflictsPierce === 0 ) {
					var condition = document.getElementById(enemyCard.dataset.infliction);
					var target = document.getElementById(player.id + "_Negatives");
					//Check for Safeguard
					if (!hasSafeguard) {
						applyConditionTo(target, condition, player.id, condition.id, "40px");
					}
					if (safe) {
						safe.remove();
					}
				}
			}

			//Get Player Variables Again (As to not double inflict a condition)
			playerNegConArray = Array.from(playerNegConditions.children).map(child => child.id);

			//Apply Condition from Attack Modifier if Applicable
			if (atkModCon !== "none" && atkModCon !== null) {
				if (!playerNegConArray.some(row => row.includes(atkModCon) ) && atkModCon !== "Curse" ) {
					if (atkModCon === "Heal") {
						var tDawg = document.getElementById(highlightedEnemy.id + "_Health");
						if (Number(tDawg.textContent) < tDawg.dataset.health) {
							tDawg.textContent = Number(tDawg.textContent)+1;
						}
					} else {
						var condition = document.getElementById(atkModCon);
						var target = document.getElementById(player.id + "_Negatives");
						//Check for Safeguard
						if (!hasSafeguard) {
							console.log(atkModCon)
							applyConditionTo(target, condition, player.id, condition.id, "40px");
						}
						if (safe) {
							safe.remove();
						}
					}
				}
			}
		}

		//Clear Array/Cursor
		action_array.length = 0;
		follower.style.display = "none";
		attackMode = false;
		healMode = false;
		document.documentElement.style.cursor = "default";
	}
	
	//Condition is clicked in Condition Box make it so that a new click on target will aplly to them (See if string contains substring from array)
	else if (conditions[0][1].includes(clickedElement.id) || conditions[1][1].includes(clickedElement.id) ) {
		//Set Cursor to Condition
		document.documentElement.style.cursor = `url("${ './Images/Icons/Cursors/' + clickedElement.id + '_Cursor.png' }"), auto`;
		conditionMod = clickedElement;
	}

	//Continued from Above
	else if (conditionMod && (clickedElement.className === "Player" || clickedElement.className === "enemy-image") ) {
		//If Player
		if (clickedElement.className === "Player") {
			var player = clickedElement.parentElement.parentElement;
			if (player.querySelector(`[id*="${conditionMod.id}"]`) === null) {
				//If Positve Condition
				if (conditions[0][1].includes(conditionMod.id) ) {
					target = document.getElementById(player.id + "_Positives");
				}
				//If Negative Condition
				if (conditions[1][1].includes(conditionMod.id) ) {
					target = document.getElementById(player.id + "_Negatives");
				}
				applyConditionTo(target, conditionMod, player.id, conditionMod.id, "40px");
			}
		}
		//If Enemy
		else {
			var enemy = clickedElement.parentElement;
			if (enemy.querySelector(`[id*="${conditionMod.id}"]`) === null) {
				var conditionElement;
				target = document.getElementById(enemy.id + "_All_Conditions");
				applyConditionTo(target, conditionMod, enemy.id.split("_")[0], conditionMod.id, "40px");
			}
		}
	}

	//Make Condition Permanant if Clicked and Control key is pressed
	else if ( (conditions[0][1].includes(clickedElement.id.split("_")[1]) || conditions[1][1].includes(clickedElement.id.split("_")[1]) ) && clickedElement.id.split("_")[1] && isCtrlOrCmd ) {
		clickedElement.dataset.timer = 1000;
		clickedElement.style.border = "3px solid white"
	}
	//Remove Condition if Clicked
	else if ( (conditions[0][1].includes(clickedElement.id.split("_")[1]) || conditions[1][1].includes(clickedElement.id.split("_")[1]) ) && clickedElement.id.split("_")[1] ) {
		//Doom
		if (clickedElement.id.includes("Doom")) { doomCounter--; }
		//Plague
		if (clickedElement.id.includes("Plague")) { plagueCounter--; }
		//Rest
		clickedElement.remove();
	}

	//Click Elements to Move
	else if (elements.includes(clickedElement.id) ) {
		//Infuse Element
		if (clickedElement.parentElement.id === "Inert") {
			moveElementTo(clickedElement.id, "Strong");
		}
		//Consume Elements
		else if (clickedElement.parentElement.id === "Strong") {
			moveElementTo(clickedElement.id, "Inert");
		}
	}

	else {
		//Clear Array/Cursor
		action_array.length = 0;
		follower.style.display = "none";
		document.documentElement.style.cursor = "default";
		conditionMod = null;
		attackMode = false;
		healMode = false;
	}
});




