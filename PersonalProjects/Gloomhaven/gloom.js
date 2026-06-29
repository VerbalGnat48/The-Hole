////////////////////////////////////////////////////////////////////////////
// Page 01 Functions
//
//////////////////////////////
// Characters
//
//Name, Level, Health, Color 01, Color 02
//Pics start at 32,34 and box is 190,240
const characters = [
	["Bruiser",			1, [10,12,14,16,18,20,22,24,26],	"#6896c8", "#03233c"],
	["Cragheart",		1, [10,12,14,16,18,20,22,24,26],	"#cace70", "#313713"],
	["Mindthief",		1, [6,7,8,9,10,11,12,13,14],		"#8891b0", "#2e292f"],
	["SilentKnife",		1, [8,9,11,12,14,15,17,18,20],		"#90c654", "#1d2e1b"],
	["Spellweaver",		1, [6,7,8,9,10,11,12,13,14],		"#a279b5", "#381b47"],
	["Tinkerer",		1, [8,9,11,12,14,15,17,18,20],		"#cbb699", "#291f1d"],

	["Berserker",		1, [10,12,14,16,18,20,22,24,26],	"#a3301e", "#3a2720"],
	["Bladeswarm",		1, [8,9,11,12,14,15,17,18,20],		"#bc8045", "#593215"],
	["Doomstalker", 	1, [8,9,11,12,14,15,17,18,20],		"#008eae", "#00374b"],
	["Elementalist",	1, [6,7,8,9,10,11,12,13,14],		"#497e8e", "#1a272d"],
	["Nightshroud",		1, [8,9,11,12,14,15,17,18,20],		"#3f4d67", "#222433"],
	["Plagueherald",	1, [6,7,8,9,10,11,12,13,14],		"#206463", "#242336"],

	["Quartermaster",	1, [10,12,14,16,18,20,22,24,26],	"#8f481a", "#292019"],
	["Sawbones",		1, [8,9,11,12,14,15,17,18,20],		"#a9aaac", "#492115"],
	["Sunkeeper",		1, [10,12,14,16,18,20,22,24,26],	"#b7892b", "#621505"],
	["Soothsinger",		1, [6,7,8,9,10,11,12,13,14],		"#945077", "#520529"],
	["Soultether",		1, [6,7,8,9,10,11,12,13,14],		"#784882", "#541f2f"],
	["Wildfury",		1, [6,7,8,9,10,11,12,13,14],		"#7f3c29", "#1a1f23", [10,12,14,16,18,20,22,24,26] ],
];

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

	selectCharacterStatus(selectorID.split("_")[0] + "_Selector")
}

function selectCharacterStatus(selectorID) {
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
	else {
		document.getElementById(selectorID).src = src.replace("Plus_1","Null");

		//Remove Selected Characer to list
		for (i=0; i<characters.length; i++ ) {
			if (characters[i][0] === selectorID.split("_")[0]) {
				selected_characters.splice( i, 1 );
			}
		}
	}
}

function startGame() {
	sessionStorage.setItem('selected_characters', JSON.stringify(selected_characters));
	location.href = "./02_gloomhaven.html";
}

////////////////////////////////////////////////////////////////////////////
//
// Page 02 Functions
//
//////////////////////////////
// Characters
//
var alive = [];
var actionArray = [];

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
								<img src="./Images/Icons/Arrow.png" onclick="subAttribute(${charName + '_health'})" style="width:10px;height:10px; rotate:180deg; cursor:pointer;">
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
//	makeEnemyScoreCards();
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
	else if ( ev.target.id.split("_")[2] === "All" && (conditions[0][1].includes(condition.id) || conditions[1][1].includes(condition.id) ) ) {
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
var enemy_stat_cards = [];

// Poison = P, Muddle = M, Disadvantage = DV, Wound = W, Pierce = PC, Retaliate = R, Curse = C, Immobilize = IM, Disarm = DA
// Poison = 1, Muddle = 2, Disadvantage = 3, Wound = 4, Pierce = 5, Retaliate = 6, Curse = 7, Immobilize = 8, Disarm = 9
const normal_enemies = [
//	Name,					Health,						Move,				Attack,				Range,				Shield,				Effect 01,			Effect 02
	["AncientArtillery",	[4,6,7,8,9,11,14,16],		[],					[2,2,2,3,4,4,4,4],	[4,4,5,5,5,6,6,7],	[],					[],					[] ],
	["BanditArcher",		[4,5,6,6,8,10,10,13],		[2,2,3,3,3,3,3,3],	[2,2,2,3,3,3,4,4],	[3,4,4,4,4,5,5,5],	[],					[0,0,0,0,1,1,1,1],	[] ],
	["BanditCommanderBoss",	[8,10,12,13,15,16,19,23],	[3,3,4,4,4,5,5,5],	[3,3,3,4,4,5,5,5],	[],					[],					[],					[] ],
	["BanditGuard",			[5,6,6,9,10,11,14,16],		[2,3,3,3,4,4,4,5],	[2,2,3,3,3,4,4,4],	[],					[],					[],					[] ],
	["BlackImp",			[3,4,5,5,7,9,10,12],		[1,1,1,1,1,1,1,1],	[1,1,1,2,2,2,3,3],	[3,3,4,4,4,4,4,4],	[],					[],					[] ],
//	["CaptainoftheGuard",	[], [], [], [], [], [], [] ],
//	["CaveBear",			[], [], [], [], [], [], [] ],
//	["CityArcher",			[], [], [], [], [], [], [] ],
//	["CityGuard",			[], [], [], [], [], [], [] ],
//	["Cultist",				[], [], [], [], [], [], [] ],
//	["DarkRider",			[], [], [], [], [], [], [] ],
//	["DeepTerror",			[], [], [], [], [], [], [] ],
//	["",[],[],[],[],[],[],[] ]
];

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

function addNormalEnemy(selectorID) {
	//Get Values set
	const box = document.getElementById("Enemy_Box");
	enemyTotal++;

	//Make Enemy Container(s)
	const enemySelection = document.getElementById("Enemy_Selector")
	const enemyBoxContainer = document.createElement("box-container");
	box.appendChild(enemyBoxContainer);

	const enemySrc = "./Images/Gloomhaven_2e/Enemies/" + normal_enemies[enemySelection.value][0] + ".avif";
	const level = Number(document.getElementById("Enemy_Selector_Levels").value);
	var enemyName = normal_enemies[enemySelection.value][0].replace(/\s+/g,"");
	var health = 0;
	var move = 0;
	var attack = 0;
	var shield = 0;
	var range = 0;

	//Get Enemy Name Index
	var index = 0;
	for (i=0; i<normal_enemies.length; i++) {
		if (normal_enemies[i][0].includes(normal_enemies[enemySelection.value][0]) ) {
			health = normal_enemies[i][1][level];
			if (normal_enemies[i][0].includes("Boss") ) {
				health = normal_enemies[i][1][level] * selected_characters.length;
			}
			move = normal_enemies[i][2][level];
			attack = normal_enemies[i][3][level];
			range = normal_enemies[i][4][level];

			//Shield
			if (normal_enemies[i][5].length > 0) {
				shield = enemy_extras[i][5][level];
			}
		}
	}
	const enemy = enemyName + "_" + enemyTotal;

	enemyBoxContainer.innerHTML = `
	<div class="box-long" style="column-gap:5px;">
		<div class="box-tall" id="${enemy}" style="position:relative">
			<img src="${enemySrc}" class="enemy-image" style="border:3px solid white;">
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
		<div class="box-tall" id="${enemy + '_All_Conditions'}" style="border:3px solid white; min-width:35px;max-width:60px;height:160px;"
			ondrop="dropConditionHandler(event)" ondragover="dragoverHandler(event)"></div>
	</div>
	`;

//	makeEnemyStatCards();
}
/*
function makeEnemyStatCards() {
	//Get Values set
	const box = document.getElementById("Enemy_Box");

	//Track different types of enemies on screen
	for (let child of box.children) {
		var guy = child.children[0].children[0].id;
		var name = guy.split("_")[0];
		if (!enemy_stat_cards.includes(name) ) {
			enemy_stat_cards.push(name);

			//Adding Enemy Type Stat Card
			const statBox = document.getElementById("Enemy_Stat_Box");
			const enemyStatSrc = "./Images/JoTL/Enemies/Cards/" + normal_enemies[enemySelection.value][0].replace(/\s+/g,"") + ".png";
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
		}
	}
}
*/

function removeEnemy(selectorID) {
	const selection = document.getElementById(selectorID.id);
	selection.parentElement.remove();
}




//////////////////////////////
// Ememy Cards
//
const enemy_cards = [
	//Name, Usabel Score Cards, Unusable Score Cards
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
	for (i=0; i<enemy_cards.length; i++ ) {
		if (enemy_cards[i][0] === enemyName) {
			array.push(enemyName, score, move, attack01, attack02, shield, heal, cardSrc, img, true);
			enemy_cards[i][1].push(array);
		}
	}
}

function makeEnemyScoreCards() {
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
	for (i=0; i<enemy_cards.length; i++ ) {
		if (enemy_cards[i][0].replace(" ","") === element.id.split("_")[0]) {
			//Make Array of Enemy Scores
			for (j=0; j<enemy_cards[i][1].length; j++) {
				if (enemy_cards[i][1][j][9] === true) {
					var card = enemy_cards[i][1][j][1] + enemy_cards[i][1][j][8];
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
			for (j=0; j<enemy_cards[i][1].length; j++) {
				var card = enemy_cards[i][1][j][1] + enemy_cards[i][1][j][8];
				if (card === score) {
					enemy_cards[i][1][j][9] = false;
					var attack = enemy_cards[i][1][j][3] + enemy_cards[i][1][j][4];
					break;
				}
			}

			//Add New Attack Value to Displayed Enemy Attack Value
			var enemyName = enemy_cards[i][0].replace(" ","");
			for (index=0; index<enemy_types.length; index++) {
				var enemyAttack = document.getElementById(enemyName + "_Attack" + enemy_types[index]);
				enemyAttack.textContent = Number(enemyAttack.dataset.baseAttack) + attack;
				enemyAttack.dataset.extraAttack = Number(enemyAttack.textContent);
			}

			//Update Displayed Card
			var enemyScoreImage = document.getElementById(enemyName + "_Score_Img");
			enemyScoreImage.src = enemy_cards[i][1][j][7];
		}
	}
}

function shuffleScores(element) {
	for (i=0; i<enemy_cards.length; i++ ) {
		if (enemy_cards[i][0].replace(" ","") === element.id.split("_")[0]) {
			for (j=0; j<enemy_cards[i][1].length; j++) {
				enemy_cards[i][1][j][9] = true
			}
			var enemyName = enemy_cards[i][0].replace(" ","");
			var enemyScoreImage = document.getElementById(enemyName + "_Score_Img");
			enemyScoreImage.src = "./Images/JoTL/Enemies/Initiatives/Monster_Back.jpg";
			break;
		}
	}
}

function flipEnemyAll() {
	var index = 0;
	while (index < enemy_cards.length ) {
		if (document.getElementById(enemy_cards[index][0].replace(" ","") + "_Card") ) {
			flipEnemy( document.getElementById(enemy_cards[index][0].replace(" ","") + "_Card") );
		}
		index++;
	}
}

function shuffleEnemyAll() {
	var index = 0;
	while (index < enemy_cards.length ) {
		if (document.getElementById(enemy_cards[index][0].replace(" ","") + "_Card") ) {
			shuffleScores( document.getElementById(enemy_cards[index][0].replace(" ","") + "_Card") );
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
		const negBox = document.getElementById(ID.id + "_All_Conditions");
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
	else if ( (conditions[0][1].includes(clickedElement.id.split("_")[0]) || conditions[1][1].includes(clickedElement.id.split("_")[0]) ) && clickedElement.id.split("_")[1] ) {
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


















