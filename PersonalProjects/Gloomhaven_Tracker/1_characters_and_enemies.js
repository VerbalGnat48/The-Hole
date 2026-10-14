/////////////////////////////////////////////
// Characters
//
var selected_characters = [];
var levelFlag = false;
var inRound = 0;

var attackMode = false;
var healMode = false;

var doomCounter = 0;
var plagueCounter = 0;

var action_array = [];
var score_array = [];
var all_people = [];
var AN = 0;

var follower;
follower = document.createElement('div');
follower.style.position = 'fixed';
follower.style.pointerEvents = 'none';
follower.style.zIndex = '9999';
follower.style.fontSize = "30px";
follower.style.display = "none";
document.body.appendChild(follower);

///////////////////////////////
// Character Functions
//
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

function makeSelectedCharacters() {
	const box = document.getElementById("Character_Box_Container");

	//Re-assign Selected Chartacter to array
	const tempString = sessionStorage.getItem('selected_characters');
	var temp = [];
	temp = JSON.parse(tempString);
	selected_characters = []

	//
	for (i=0; i<temp.length; i++) {
		selected_characters.push(new Player(temp[i][0], temp[i][1], temp[i][2], 0) );
	}

	//Make Attributes for selected character
	 for (i=0; i<selected_characters.length; i++) {
		//Set Useful Variables
		const charBoxContainer = document.createElement("box-container");
		box.appendChild(charBoxContainer);
		const charName = selected_characters[i].name;
		const charSrc = "./Images/Gloomhaven_2e/" + charName + ".png";

		//Make Characters
		charBoxContainer.innerHTML = `
			<div class="box-long" id="${charName}" style="column-gap:10px;">
				<div class="box-tall" id="${charName + '_Conditions'}" ondrop="dropConditionHandler(event)" ondragover="dragoverHandler(event)"
					style="min-width:50px;max-width:150px;height:172px; border:2px solid ${temp[i][3]};">
				</div>
				<div class="box-tall" id="${charName + '_Container'}" style="position:relative">
					<img src="${charSrc}" class="Player" height="172" width="136">
					<div class="box-long" style="column-gap:10px">
						<p style="margin:5px; color:white;">L: ${selected_characters[i].level}</p>
						<input type="number" id="${charName + '_Score'}" class="attribute-input">
						<input type="number" id="${charName + '_Score02'}" class="attribute-input">
					</div>
				</div>
				<div class="box-tall" style="row-gap:15px;">
					<div class="box-long">
						<img src="./Images/Icons/Attack.png" id="${charName + '_Attack_Btn'}" onclick="characterAttack(this.id)" class="action-Btn">
						<p id="${charName + '_Attack'}" class="attribute-input">0</p>
						<div class="box-tall">
							<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${charName + '_Attack'})" style="width:10px;height:10px; cursor:pointer;">
							<img src="./Images/Icons/Arrow.png" onclick="subAttribute(${charName + '_Attack'})" style="width:10px;height:10px; rotate:180deg; cursor:pointer;">
						</div>
					</div>
					<div class="box-long" style="column-gap:10px;">
						<img src="./Images/Icons/Heal.png" id="${charName + '_Heal_Btn'}" class="action-Btn">
						<div class="box-long">
							<p id="${charName + '_Health'}" class="attribute-input" style="color:red;font-size:24px;width:40px;">${selected_characters[i].health}</p>
							<div class="box-tall">
								<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${charName + '_Health'})" style="width:10px;height:10px; cursor:pointer;">
								<img src="./Images/Icons/Arrow.png" onclick="subAttribute(${charName + '_Health'})" style="width:10px;height:10px; rotate:180deg; cursor:pointer;">
							</div>
						</div>
					</div>
					<div class="box-long">
						<img src="./Images/Icons/Shield.png" id="${charName + '_Shield_Btn'}" class="action-Btn">
						<p id="${charName + '_Shield'}" class="attribute-input" style="color:cyan; font-size:18px;">0</p>
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



/////////////////////////////////////////////
// Enemies
//
var enemyNumber = 0;

var enemy_standees = [];
var enemy_score_cards = [];
var enemy_stat_cards = [];
var modifier_deck = [ [], [], , ];

var inflictsPierce;
var atkModCon = "none";
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

	//Set Values
	var enemySrc = "./Images/Gloomhaven_2e/Enemies/" + enemies[enemySelection.value][0] + ".avif";
	var level = Number(document.getElementById("Enemy_Selector_Levels").value);
	var enemyName = enemies[enemySelection.value][0].replace(/\s+/g,"");
	var health = 0;
	var shield = 0;
	var enemies;
	var color;
	var wasSummoned = document.getElementById("Enemy_Selector_Summons").value;
	var enemy;

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
			enemy_standees.push(new EnemyStandee(enemies[i], level, enemyType, enemyNumber, wasSummoned, selected_characters.length) );
			enemy = enemy_standees.at(-1);
		}
	}

	enemyBoxContainer.innerHTML = `
	<div class="box-long" style="column-gap:5px;">
		<div class="box-tall" id="${enemy.name}" style="position:relative">
			<img src="${enemySrc}" class="enemy-image">
			<img class="enemy-delete" onclick="removeEnemy(${enemy.name})">
			<input type="number" class="enemy-ID" id="${enemy.name + '_Standee'}">
			<div class="box-long" style="column-gap:5px;">
				<div class="box-long">
					<p id="${enemy.name + "_Health"}" style="margin:5px; color:red; font-size:24px;" data-health="${enemy.health}">${enemy.health}</p>
					<div class="box-tall">
						<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${enemy.name + '_Health'})" style="width:10px;height:10px; cursor:pointer;">
						<img src="./Images/Icons/Arrow.png" onclick="subAttribute(${enemy.name + '_Health'})" style="width:10px;height:10px; rotate:180deg; cursor:pointer;">
					</div>
				</div>
				<div class="box-long">
					<p id="${enemy.name + "_Shield"}" style="margin:5px; color:cyan; font-size:24px;" data-shield="${enemy.shield}">${enemy.shield}</p>
					<div class="box-tall">
						<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${enemy.name + '_Shield'})" style="width:10px;height:10px; cursor:pointer;">
						<img src="./Images/Icons/Arrow.png" onclick="subAttribute(${enemy.name + '_Shield'})" style="width:10px;height:10px; rotate:180deg; cursor:pointer;">
					</div>
				</div>
			</div>
		</div>
		<div class="box-tall" id="${enemy.name + '_Conditions'}" style="border:${color}; min-width:35px;max-width:60px;height:160px;"
			ondrop="dropConditionHandler(event)" ondragover="dragoverHandler(event)"></div>
	</div>
	`;


	////////////////////////////////////////////////////////
	// Adding Enemy Stat Card to Enemy Stat Card Box
	//

	//If Enemy does not have a Stat Card, Make One
	var enemyName = enemy.name.split("_")[0];
	if (!enemy_score_cards.flat(Infinity).includes(enemyName) ) {
		//Add to Array
		var index = enemy_cards.findIndex(subArray => subArray.includes(enemyName));
		enemy_score_cards.push(enemy_cards[index]);
		enemy_stat_cards.push(new EnemyCard(normal_enemies[index], elite_enemies[index], level, selected_characters.length) );
		enemy = enemy_stat_cards.at(-1);

		//Get Parent(s)
		var enemyStatBox = document.getElementById("Enemy_Stat_Box");
		var enemyStatCardSrc = "./Images/Gloomhaven_2e/Enemies/Cards/" + enemyName + ".png";
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
							<p style="margin:5px; color:white; font-size:20px;">M:${enemy.nMove}</p>
							<p style="margin:5px; color:white; font-size:20px;" id="${eStatName + '_nAttack'}">A:${enemy.nAttack}</p>
							<p style="margin:5px; color:white; font-size:20px;">S:${enemy.nShield}</p>
						</div>
						<div class="box-tall" id="${eStatName + '_Elite'}">
							<p style="margin:5px; color:gold; font-size:20px;">M:${enemy.eMove}</p>
							<p style="margin:5px; color:gold; font-size:20px;" id="${eStatName + '_eAttack'}">A:${enemy.eAttack}</p>
							<p style="margin:5px; color:gold; font-size:20px;">S:${enemy.eShield}</p>
						</div>
					</div>
				</div>
				<div class="box-tall" id="${eCardName}" style="position:relative">
					<div class="box-long" style="column-gap:10px;">
						<div class="box-long">
							<img src="./Images/Icons/Flip.png" onclick="nextAction(${eCardName})" class="action-Btn" style="height:25px;">
							<p id="${eActionName + '_Next'}" class="attribute-input" style="font-size:20px;">0</p>
						</div>
						<div class="box-long">
							<img src="./Images/Icons/Attack.png" id="${eActionName + '_nAttack_Btn'}" onclick="enemyAction(this.id)" class="action-Btn" style="height:35px;">
							<p id="${eActionName + '_nAttack'}" class="attribute-input" style="font-size:20px;">${enemy.nAttack}</p>
							<div class="box-tall">
								<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${eActionName + '_nAttack'})" style="width:10px;height:10px; cursor:pointer;">
								<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${eActionName + '_nAttack'})" style="width:10px;height:10px; cursor:pointer; rotate:180deg;">
							</div>
						</div>
						<div class="box-long">
							<img src="./Images/Icons/Attack_Elite.png" id="${eActionName + '_eAttack_Btn'}" onclick="enemyAction(this.id)" class="action-Btn" style="height:35px;">
							<p id="${eActionName + '_eAttack'}" class="attribute-input" style="font-size:20px; color:gold;border-color:gold">${enemy.eAttack}</p>
							<div class="box-tall">
								<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${eActionName + '_eAttack'})" style="width:10px;height:10px; cursor:pointer;">
								<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${eActionName + '_eAttack'})" style="width:10px;height:10px; cursor:pointer; rotate:180deg;">
							</div>
						</div>
						<img src="./Images/Icons/Shuffle.png" onclick="shuffleScores(${eCardName})" class="action-Btn" style="height:25px;">
						<img src="./Images/Icons/Flip.png" onclick="flipScoreCard(${eCardName})" id="${eCardName} + _Flip" class="action-Btn" style="height:25px;">
					</div>
					<div class="box-tall" style="position:relative">
						<img src="./Images/Monster_Back.jpg" id="${eCardName + '_Img'}" style="height:auto;width:300px;">
					</div>
				</div>
			</div>
		`;

		//Getting Conditions that Enemy default Inflicts
		if (enemy.nCon01 != 0) { makeStatCardsConditions(enemy, "Normal", enemy.nCon01); }
		if (enemy.nCon02 != 0) { makeStatCardsConditions(enemy, "Normal", enemy.nCon02); }
		if (enemy.eCon01 != 0) { makeStatCardsConditions(enemy, "Elite", enemy.eCon01); }
		if (enemy.eCon02 != 0) { makeStatCardsConditions(enemy, "Elite", enemy.eCon02); }

		//Flip newly added enemy card if in middle of round
//		if (inRound) {
//			var eCard = document.getElementById(eCardName);
//			flipEnemy(eCard);
//			eCard.dataset.middle = "2";
//		}
	
	}
}

