//////////////////////////////
// Characters
//
var selected_characters = [];

function selectCharacterLevel(selectorID) {
	//Access Parent Card/Box
	cardBoxID = selectorID.split("_")[0];
	cardBoxID += "_Box";
	const cardBox = document.getElementById(cardBoxID);

	//Clear Selected Level
	for (let child of cardBox.children) {
		if(child.id.includes("Level")) {
			document.getElementById(child.id).style.webkitTextStroke = "0px #e1e0df";
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

	selectCharacterStatus(selectorID.split("_")[0] + "_Selector", 1)
}

function selectCharacterStatus(selectorID, type) {
	//Access Src and See if Character is in Selected Array
	const src = document.getElementById(selectorID).src;
	const exists = selected_characters.some(row => row.includes(selectorID.split("_")[0]) );

	//Change Card Status to True
	if (!exists) {
		document.getElementById(selectorID).src = src.replace("Null","Plus_1");

		//Add Selected Characer to list
		for (i=0; i<characters.length; i++ ) {
			if (characters[i][0] === selectorID.split("_")[0]) {
				selected_characters.push(characters[i]);

				//Set Health Value
				var level = selected_characters.at(-1)[1] - 1;
				selected_characters.at(-1)[2] = selected_characters.at(-1)[2][level];
			}
		}
	}

	//Change Card Status to False
	else if (type === 0) {
		document.getElementById(selectorID).src = src.replace("Plus_1","Null");

		//Remove Selected Characer to list
		for (i=0; i<characters.length; i++ ) {
			if (characters[i][0] === selectorID.split("_")[0]) {
				selected_characters.splice( i, 1 );
			}
		}
	}
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
		const charSrc = "./Images/Gloomhaven_1e/" + charName + ".png";

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
						<img src="./Images/Icons/Heal.png" id="${charName + '_Heal_Btn'}" onclick="characterAction(this.id)" class="action-Btn">
						<div class="box-long">
							<p id="${charName + '_Health'}" class="attribute-input">${selected_characters[i][2]}</p>
							<p class="attribute-input">${'/ ' + selected_characters[i][2]}</p>
							<div class="box-tall">
								<img src="./Images/Icons/Arrow.png" onclick="addAttribute(${charName + '_Health'})" style="width:10px;height:10px; cursor:pointer;">
								<img src="./Images/Icons/Arrow.png" onclick="subAttribute(${charName + '_Health'})" style="width:10px;height:10px; rotate:180deg; cursor:pointer;">
							</div>
						</div>
					</div>
					<div class="box-long">
						<img src="./Images/Icons/Shield.png" id="${charName + '_Shield_Btn'}" class="action-Btn">
						<p id="${charName + '_Shield'}" class="attribute-input">0</p>
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
// Enemies
//
var enemyNumber = 0;
var enemy_stat_cards = [];
var inflictsPierce;

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
	const box = document.getElementById("Enemy_Box");
	enemyNumber++;

	//Make Enemy Container(s)
	const enemySelection = document.getElementById("Enemy_Selector")
	const enemyBoxContainer = document.createElement("box-container");
	box.appendChild(enemyBoxContainer);

	//Set Type
	if (array_type.includes("normal") ) {
		enemies = normal_enemies;
		color = "3px solid white";
	}
	else if (array_type.includes("elite") ) {
		enemies = elite_enemies;
		color = "3px solid gold";
	}

	//Set Values
	const enemySrc = "./Images/Gloomhaven_1e/Enemies/" + enemies[enemySelection.value][0] + ".avif";
	const level = Number(document.getElementById("Enemy_Selector_Levels").value);
	var enemyName = enemies[enemySelection.value][0].replace(/\s+/g,"");
	var health = 0;
	var shield = 0;
	var enemies;
	var color;

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
	const enemy = enemyName + "_" + enemyNumber;

	enemyBoxContainer.innerHTML = `
	<div class="box-long" style="column-gap:5px;">
		<div class="box-tall" id="${enemy}" style="position:relative">
			<img src="${enemySrc}" class="enemy-image" style="border:${color};">
			<img class="enemy-delete" onclick="removeEnemy(${enemy})">
			<input type="number" class="enemy-ID">
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
		var enemyStatCardSrc = "./Images/Gloomhaven_1e/Enemies/Cards/" + normal_enemies[enemySelection.value][0].replace(/\s+/g,"") + ".png";
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
							<p style="margin:5px; color:green; font-size:20px;">A:${NA}</p>
							<p style="margin:5px; color:blue; font-size:20px;">S:${NS}</p>
						</div>
						<div class="box-tall" id="${eStatName + '_Elite'}">
							<p style="margin:5px; color:gold; font-size:20px;">M:${EM}</p>
							<p style="margin:5px; color:lawngreen; font-size:20px;">A:${EA}</p>
							<p style="margin:5px; color:cyan; font-size:20px;">S:${ES}</p>
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
						<img src="./Images/Icons/Flip.png" onclick="flipEnemy(${eCardName})" class="action-Btn" style="height:25px;">
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
	}
}

function removeEnemy(element) {
	if (element.id.includes("Stat") ) {
		const index = enemy_stat_cards.indexOf(element.id.split("_")[0]);
		if (index > -1) { enemy_stat_cards.splice(index,1); }
	}
	element.parentElement.remove();
}

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
	document.documentElement.style.cursor = `url("${ './Images/Icons/' + action +'_Cursor.png' }"), auto`;
}

function nextAction(enemyElement) {
	//Start exists incase I want to add some Element Consumption
	var start = 0;
	enemyElement.dataset.infliction = null;
	for (i=0; i<enemy_cards.length; i++) {
		//If Action exists
		if (enemy_cards[i][3][start] && enemy_cards[i][0] === enemyElement.id.split("_")[0]) {
			if (document.getElementById(enemy_cards[i][0] + "_Action_Next").style.pointerEvents === "none") {
				break;
			}
			else {
				//+1 Action Counter
				const actionCount = document.getElementById(enemyElement.id.split("_")[0] + "_Action_Next" );
				actionCount.textContent = Number(actionCount.textContent) + 1;

				//Variables
				var act = enemy_cards[i][3][start];
				var actNext = enemy_cards[i][3][start + 1];
				var enemyBox = document.getElementById("Enemy_Box");
				var nextFlag = false;
				if (actNext) { nextFlag = true; }

				//If no next action then make clicker temporarily unclickable
				if (!actNext) {
					document.getElementById(enemy_cards[i][0] + "_Action_Next").style.pointerEvents = "none";
				}

				//If Attack and no Consume
				if (act.includes("Attack") && !act.includes("Consume") ) {
					var attack = Number(act.replace("Attack ", "") );
					//If Attack and Pierce
					inflictsPierce = 0;
					if (nextFlag && actNext.includes("Pierce") ) {
						inflictsPierce = actNext.split(" ")[1];
						//Remove It
						enemy_cards[i][3].splice(start+1,1);
					}

					//If Attack and Neg Condition
					else if (conditions[1][1].includes(actNext) && !actNext.includes("Consume") ) {
						enemyElement.dataset.infliction = actNext.replace(" ","");
						//Remove It
						enemy_cards[i][3].splice(start+1,1);
					}

					//Add New Attack Value to Displayed Enemy Attack Value
					for (index=0; index<enemy_types.length; index++) {
						var enemyAttack = document.getElementById(enemy_cards[i][0] + "_Action" + enemy_types[index] + "_Attack");
						enemyAttack.textContent = Number(enemyAttack.dataset.baseAttack) + attack;
						enemyAttack.dataset.extraAttack = Number(enemyAttack.textContent);
					}
				}

				//If Consume to Attack
				else if (act.includes("Consume") && act.includes("Attack") && !act.includes("Any") ) {
					//Get Element
					var element = document.getElementById(act.split(":")[1]);
					var hasElement = document.getElementById("Inert").querySelector(`:scope > [id*="${element.id}"]`) !== null;

					//If Inert Box does not have Element then Consume it and do thing
					if (!hasElement) {
						//Chanage Attack Value
						var attack = 0;
						attack = Number(act.split(":")[2].replace("Attack ", "") );

						//If Attack Effect(Neg)
						if (nextFlag && conditions[1][1].includes(actNext) ) {
							enemyElement.dataset.infliction = actNext.replace(" ","");
							//Remove It
							enemy_cards[i][3].splice(start+1,1);
						}

						//Add New Attack Value to Displayed Enemy Attack Value
						for (index=0; index<enemy_types.length; index++) {
							var enemyAttack = document.getElementById(enemy_cards[i][0] + "_Action" + enemy_types[index] + "_Attack");
							enemyAttack.textContent = Number(enemyAttack.dataset.baseAttack) + attack;
							enemyAttack.dataset.extraAttack = Number(enemyAttack.textContent);
						}

						//Consume It
						moveElementTo(element.id, "Inert");
					}
				}

				//If Consume to anything else
				else if (act.includes("Consume") ) {
					//Get Elements
					var element01 = document.getElementById(act.split(":")[1]);
					var element02 = document.getElementById(act.split(":")[2]);
					var inert = document.getElementById("Inert");
					var waning = document.getElementById("Waning");
					var strong = document.getElementById("Strong");

					//Variables
					var waning01; var strong01;
					if (element01) {
						waning01 = document.getElementById("Waning").querySelector(`[id*="${element01.id}"]`) !== null;
						strong01 = document.getElementById("Strong").querySelector(`[id*="${element01.id}"]`) !== null;
					}

					//Consume X to X
					if ( !act.includes("Any") && elements.includes(act.split(":")[1]) && elements.includes(act.split(":")[2]) ) {
						moveElementTo(element01.id, "Inert");
						moveElementTo(element02.id, "Strong");
					}

					//Consume Any to X (If the only element is what is being infused don't run it)
					var waning02; var strong02;
					if (element02) {
						strong02 = document.getElementById("Strong").querySelector(`[id*="${element02.id}"]`) !== null;
						waning02 = document.getElementById("Waning").querySelector(`[id*="${element02.id}"]`) !== null;
					}
					if (act.includes("Any") && (strong.children.length > 0 && !strong02 || waning.children.length > 0) ) {
						//If Infusion in only element on board and in waning don't do it
						if (waning.children.length === 1 && document.getElementById("Waning").querySelector(`[id*="${element02.id}"]`) != null) {
							console.log("Fire in the hole");
						}
						else {
							//Randomly Choose an active Element to Consume
							var newElement = false;
							var random;
							do {
								random = getRandomIntInclusive(0, 5);
								var hasElement = document.getElementById("Inert").querySelector(`[id*="${elements[random]}"]`) !== null;
								if (!elements[random].includes(element02.id) && !hasElement ) {
									newElement = true;
								}
							} while (!newElement);

							//Consume Element
							moveElementTo(elements[random], "Inert");

							//Check if Inert has Infused Element and move it if so
							var hasElement = document.getElementById("Inert").querySelector(`:scope > [id*="${element02.id}"]`) !== null;
							if (hasElement) { moveElementTo(element02.id, "Strong"); }

							//If not check Waning and repeat
							else {
								hasElement = document.getElementById("Waning").querySelector(`:scope > [id*="${element02.id}"]`) !== null;
								if (hasElement) { moveElementTo(element02.id, "Strong"); }
							}
						}
					}

					//If Element to Consume Exists
					else if (waning01 || strong01) {
						//Consume to Suffer
						if (act.includes("Suffer")) {
							var allEnemyHealthsArray = Array.from(enemyBox.querySelectorAll(`[id*="${enemyElement.id.split('_')[0]}"] [id*="Health"]`) );
							for (p=0; p<allEnemyHealthsArray.length; p++) {
								var enemy = allEnemyHealthsArray[p];
								//Heal until max health or limit
								for (l=0; l<Number(act.split(" ")[1]); l++) {
									if (Number(enemy.textContent) - 1 >= 0) {
										enemy.textContent = Number(enemy.textContent) - 1;
									}
								}
							}
						}

						//Consume to Heal
						else if (act.includes("Heal")) {
							var allEnemyHealthsArray = Array.from(enemyBox.querySelectorAll(`[id*="${enemyElement.id.split('_')[0]}"] [id*="Health"]`) );
							for (p=0; p<allEnemyHealthsArray.length; p++) {
								var enemy = allEnemyHealthsArray[p];
								//Heal until max health or limit
								for (l=0; l<Number(act.split(" ")[1]); l++) {
									if (Number(enemy.textContent) + 1 <= enemy.dataset.health) {
										enemy.textContent = Number(enemy.textContent) + 1;
									}
								}
							}
						}

						//Consume to Shield
						else if (act.includes("Shield")) {
							var allEnemyShieldsArray = Array.from(enemyBox.querySelectorAll(`[id*="${enemyElement.id.split('_')[0]}"] [id*="Shield"]`) );
							for (p=0; p<allEnemyShieldsArray.length; p++) {
								var enemy = allEnemyShieldsArray[p];
								enemy.textContent = Number(enemy.textContent) + Number(act.replace("Shield ", "") );
							}
						}

						//Consume to Apply Condition to Self
						else if (act.includes("Self")) {
							var condition = act.split(":")[2].split(" ")[0].trim();
							if (curses < 10 && condition === "Curse" ) {
								enemyModifiers[0].push(condition);
								enemyModifiers[1].push(true);
								curses++;
							}
							//Other Conditions
							else {
								var condition = document.getElementById(act.split(":")[2].replace(" Self", "") );
								var allEnemyArray = Array.from(enemyBox.querySelectorAll(`[id*="${enemyElement.id.split('_')[0]}"]`) );
								for (p=0; p<allEnemyArray.length; p++) {
									if (allEnemyArray[p].id.includes("All_Conditions") ) {
										var hasCon = allEnemyArray[p].querySelector(`:scope > [id*="${condition.id}"]`) !== null;
										if (!hasCon) {
											var conElement = document.getElementById(condition);
											applyConditionTo(allEnemyArray[p], condition, allEnemyArray[p].id.split("_")[0], condition.id, "30px");
										}
									}
								}
							}
						}

						//Consume Element
						moveElementTo(element01.id, "Inert");
					}
				}

				//If Infuse
				else if (act.includes("Infuse") ) {
					const element = document.getElementById(act.split(":")[1]);
					moveElementTo(element.id, "Strong");
				}

				//If Shield
				else if (act.includes("Shield") ) {
					var allEnemyShieldsArray = Array.from(enemyBox.querySelectorAll(`[id*="${enemyElement.id.split('_')[0]}"] [id*="Shield"]`) );
					for (p=0; p<allEnemyShieldsArray.length; p++) {
						var enemy = allEnemyShieldsArray[p];
						enemy.textContent = Number(enemy.textContent) + Number(act.replace("Shield ", "") );
					}
				}

				//If Heal
				else if (act.includes("Heal") ) {
					var allEnemyHealthsArray = Array.from(enemyBox.querySelectorAll(`[id*="${enemyElement.id.split('_')[0]}"] [id*="Health"]`) );
					for (p=0; p<allEnemyHealthsArray.length; p++) {
						var enemy = allEnemyHealthsArray[p];
						//Heal until max health or limit
						for (l=0; l<Number(act.split(" ")[1]); l++) {
							if (Number(enemy.textContent) + 1 <= enemy.dataset.health) {
								enemy.textContent = Number(enemy.textContent) + 1;
							}
						}
					}
				}

				//If Pos Effect
				else if (conditions[0][1].includes(act) ) {
					var condition = document.getElementById(act);
					var allEnemyArray = Array.from(enemyBox.querySelectorAll(`[id*="${enemyElement.id.split('_')[0]}"]`) );
					for (p=0; p<allEnemyArray.length; p++) {
						if (allEnemyArray[p].id.includes("All_Conditions") ) {
							var hasCon = allEnemyArray[p].querySelector(`:scope > [id*="${condition.id}"]`) !== null;
							if (!hasCon) {
								var conElement = document.getElementById(condition);
								applyConditionTo(allEnemyArray[p], condition, allEnemyArray[p].id.split("_")[0], condition.id, "30px");
							}
						}
					}
				}

				//If Suffer
				else if (act.includes("Suffer")) {
					var allEnemyHealthsArray = Array.from(enemyBox.querySelectorAll(`[id*="${enemyElement.id.split('_')[0]}"] [id*="Health"]`) );
					for (p=0; p<allEnemyHealthsArray.length; p++) {
						var enemy = allEnemyHealthsArray[p];
						//Heal until max health or limit
						for (l=0; l<Number(act.split(" ")[1]); l++) {
							if (Number(enemy.textContent) - 1 >= 0) {
								enemy.textContent = Number(enemy.textContent) - 1;
							}
						}
					}
				}

				//Consume to Apply Condition to Self
				else if (act.includes("Self")) {
					var condition = act.split(" ")[0].trim();
					if (condition === "Bless" ) {
						enemyModifiers[0].push(condition);
						enemyModifiers[1].push(true);
					}
				}
				
				//Remove Current first Action
				enemy_cards[i][3].splice(start,1);
			}
		}
	}
	//Add New Attack Value to Displayed Enemy Attack Value(s)
	addAttackModifier(modType);
}

document.addEventListener('click', function(event) {
    // This is the exact DOM element under the mouse
    const clickedElement = event.target; 
    
	//If Player Action is Attack and Target is Enemy
	if ( (clickedElement.className === "enemy-image" || clickedElement.className === "action-Btn") && action_array[0] === "Attack" ) {
		if (clickedElement.className === "action-Btn") {
			return;
		}

		//Get Enemy Helath
		const enemy = document.getElementById(clickedElement.parentElement.id);
		const health = document.getElementById(enemy.id + "_Health");
		const healthValue = health.textContent;

		//Make Enemy new Health
		var newHealth = Number(healthValue);
		var attackValue = Number(action_array[2]);

		//See if enemy has Negative Conditions
		const negBox = document.getElementById(enemy.id + "_All_Conditions");
		if (negBox.querySelector('[id*="Poison"]') !== null) {
			attackValue++;
		}

		//Make Enemy new Health Continued
		var shield = Number(document.getElementById(enemy.id + "_Shield").textContent);
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
		action_array.length = 0;
		document.documentElement.style.cursor = "default";
	}

	//If Enemy Action is Attack and Target is Player
	else if ( (clickedElement.className === "Player" || clickedElement.className === "action-Btn") && action_array[0] === "Attack" ) {
		if (clickedElement.className === "action-Btn") {
			return;
		}

		//Get Player Helath
		const player = document.getElementById(clickedElement.parentElement.parentElement.id);
		const health = document.getElementById(player.id + "_Health");
		const healthValue = health.textContent;

		//Make Player new Health
		var newHealth = Number(healthValue);
		var attackValue = Number(action_array[2]);

		//If Player is not dead update health
		if (newHealth !== 0) {
			//Get Player Conditions
			var conArray = [];
			for (p=0; p<document.getElementById(player.id + "_Negatives").children.length; p++) {
				conArray.push(document.getElementById(player.id + "_Negatives").children[p].id.split("_")[0] );
			}

			//See if Player has Negative Conditions
			const negBox = document.getElementById(player.id + "_Negatives");
			if (negBox.querySelector('[id*="Poison"]') !== null) {
				attackValue++;
			}

			//Make Player new Health Continued
			var shield = Number(document.getElementById(player.id + "_Shield").textContent);

			//Apply Pierce from Stat Card
			var specialFlag = false;
			if (action_array[4]) {
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
			if (inflictsPierce > 0) {
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
				if (shield !== 0 ) {
					attackValue -= shield;
					if (attackValue < 0) { attackValue = 0; }
				}
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

			//Apply Negative Condition from Enemy Stat card if Applicable
			allEnemyConditions.forEach((img) => {
				//Check if Player does not have effect and no pierce/retaliate, apply it
				if (!playerNegConArray.some(str => str.includes(img.id.split("_")[4]) ) && !specialFlag && !img.id.split("_")[4].includes("Retaliate") ) {
					var target = document.getElementById(player.id + "_Negatives");
					applyConditionTo(target, img, player.id, img.id.split("_")[4], "50px");
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
					applyConditionTo(target, condition, player.id, condition.id, "50px");
				}
			}
		}

		//Clear Array/Cursor
		action_array.length = 0;
		document.documentElement.style.cursor = "default";
	}
	
	//Remove Player Condition if Clicked
	else if ( (conditions[0][1].includes(clickedElement.id.split("_")[1]) || conditions[1][1].includes(clickedElement.id.split("_")[1]) ) && clickedElement.id.split("_")[1] ) {
		clickedElement.remove();
	}

	//Select Enemy Modifier
	else if (clickedElement.id === "EnemyModDeck") {
		clickedElement.style.border = "3px solid chartreuse";
		document.getElementById("EnemyModDeckOld").style.border = "none";
		addAttackModifier("EnemyModDeck");
		modType = "EnemyModDeck";
	}
	else if (clickedElement.id === "EnemyModDeckOld") {
		clickedElement.style.border = "3px solid chartreuse";
		document.getElementById("EnemyModDeck").style.border = "none";
		addAttackModifier("EnemyModDeckOld");
		modType = "EnemyModDeckOld";
	}

	else {
		//Clear Array/Cursor
		action_array.length = 0;
		document.documentElement.style.cursor = "default";
	}
});
