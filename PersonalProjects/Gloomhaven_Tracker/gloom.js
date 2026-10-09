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

//////////////////////////////
// Enemies
//
var enemyTotal = 0;
var enemy_stat_cards = [];
var inflictsPierce;

const normal_enemies = [
//	Wound = 1, Poison = 2, Immobilize = 3, Disarm = 4, Stun = 5, Muddle = 6, Pierce = 7, Retaliate = 8
//	Name,						Health,						Move,				Attack,				Range,				Shield,				Effect 01,			Effect 02
	["AncientArtillery",		[4,6,7,8,9,11,14,16],		[0,0,0,0,0,0,0,0],	[2,2,2,3,4,4,4,4],	[4,4,5,5,5,6,6,7],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["BanditArcher",			[4,5,6,6,8,10,10,13],		[2,2,3,3,3,3,3,3],	[2,2,2,3,3,3,4,4],	[3,4,4,4,4,5,5,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["BanditCommanderBoss",		[8,10,12,13,15,16,19,23],	[3,3,4,4,4,5,5,5],	[3,3,3,4,4,5,5,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["BanditGuard",				[5,6,6,9,10,11,14,16],		[2,3,3,3,4,4,4,5],	[2,2,3,3,3,4,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["BlackImp",				[3,4,5,5,7,9,10,12],		[1,1,1,1,1,1,1,1],	[1,1,1,2,2,2,3,3],	[3,3,4,4,4,4,4,4],	[0,0,0,0,0,0,0,0],	[0,2,2,2,2,2,2,2],	[0,0,0,0,0,0,0,0] ],
	["CaptainoftheGuardBoss",	[7,9,11,14,16,20,21,25],	[2,2,2,2,2,2,2,2],	[3,3,4,4,5,5,6,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["CaveBear",				[7,9,11,13,16,17,19,22],	[3,3,4,4,4,5,5,5],	[3,3,3,4,4,4,5,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,1,1,1],	[0,0,0,0,0,0,0,0] ],
	["CityArcher",				[4,4,6,6,8,9,9,10],			[1,1,1,2,2,2,3,3],	[2,2,3,3,3,4,4,4],	[3,4,4,4,5,5,5,6],	[0,0,0,1,1,1,2,2],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["CityGuard",				[5,5,7,8,9,10,11,13],		[2,2,2,2,3,3,3,3],	[2,2,2,3,3,3,4,4],	[0,0,0,0,0,0,0,0],	[0,1,1,1,1,2,2,2],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["Cultist",					[4,5,7,9,10,11,14,15],		[2,2,2,3,3,3,3,3],	[1,1,1,1,2,2,2,3],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["DarkRiderBoss",			[9,10,12,13,15,16,16,18],	[2,3,3,3,3,3,4,4],	[3,3,3,4,4,5,5,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["DeepTerror",				[3,4,4,5,6,7,8,9],			[0,0,0,0,0,0,0,0],	[2,2,3,3,4,4,5,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[81,81,81,82,82,83,83,84],[0,0,0,0,0,0,0,0] ],
	["EarthDemon",				[7,9,12,13,15,17,20,22],	[1,1,1,2,2,2,2,3],	[3,3,3,3,4,4,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,3,3,3],	[0,0,0,0,0,0,0,0] ],
	["ElderDrakeBoss",			[11,12,15,16,20,22,27,29],	[0,0,0,0,0,0,0,0],	[3,4,4,5,5,6,6,7],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["FlameDemon",				[2,2,3,3,3,4,4,5],			[3,3,3,3,4,4,4,4],	[2,2,3,3,3,3,4,4],	[3,3,3,4,4,4,4,5],	[2,3,3,3,3,4,4,4],	[0,0,0,83,83,84,84],[0,0,0,0,0,0,0,0] ],
	["ForestImp",				[1,2,2,3,3,4,4,6],			[3,3,3,4,4,4,4,4],	[1,1,2,2,2,2,3,3],	[3,3,3,4,4,4,4,4],	[1,1,1,1,2,2,2,2],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["FrostDemon",				[5,6,7,8,10,11,12,14],		[2,2,3,3,3,3,3,3],	[3,3,3,4,4,4,5,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,81,82,82,82,83,83,83],[0,0,0,0,0,0,0,0] ],
	["GiantViper",				[2,3,4,4,6,7,8,10],			[2,2,3,3,3,3,4,4],	[1,1,1,2,2,3,3,3],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[2,2,2,2,2,2,2,2],	[0,0,0,0,0,0,0,0] ],
	["HarrowerInfester",		[6,7,8,10,12,12,15,17],		[2,2,2,2,3,3,3,3],	[2,2,2,3,3,4,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,81,82,82,82,83,83,84],[0,0,0,0,0,0,0,0] ],
	["Hound",					[4,4,6,8,8,9,11,15],		[3,4,4,4,4,4,5,5],	[2,2,2,2,3,3,3,3],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,81,81,81,81,82,82,82],[0,0,0,0,0,0,0,0] ],
	["InoxArcher",				[5,6,8,9,10,12,12,15],		[2,2,2,2,3,3,3,3],	[2,2,2,3,3,3,4,4],	[2,3,3,3,3,4,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,1,1],	[0,0,0,0,0,0,0,0] ],
	["InoxBodyguardBossC",		[6,7,9,10,11,13,15,17],		[2,2,2,3,3,3,4,4],	[0,1,1,2,2,3,3,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["InoxGuard",				[5,8,9,12,12,13,16,19],		[2,2,2,3,3,3,3,3],	[2,2,3,3,3,4,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,81,81,81,84],[0,0,0,0,0,0,0,0] ],
	["InoxShaman",				[4,6,7,9,10,13,15,16],		[1,1,2,2,2,2,3,3],	[2,2,2,2,3,3,3,4],	[3,3,3,4,4,4,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["JekserahBoss",			[6,7,9,12,13,15,18,22],		[2,2,3,4,4,5,5,5],	[2,3,3,4,5,5,5,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["LivingBones",				[5,5,5,7,7,9,10,13],		[2,3,3,3,3,3,4,4],	[1,1,2,2,3,3,3,3],	[0,0,0,0,0,0,0,0],	[0,1,1,1,1,1,1,1],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["LivingCorpse",			[5,7,9,10,11,13,14,15],		[1,1,1,1,2,2,2,2],	[3,3,3,4,4,4,4,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,2,2],	[0,0,0,0,0,0,0,0] ],
	["LivingSpirit",			[2,2,2,3,3,4,4,6],			[2,2,3,3,3,3,3,3],	[2,2,2,3,3,3,4,4],	[2,2,2,3,3,4,4,4],	[1,2,2,2,3,3,3,3],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["Lurker",					[5,7,9,10,10,11,12,14],		[2,2,3,3,3,3,4,4],	[2,2,2,3,3,4,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,1,1,1,1],	[0,71,71,72,72,72,73,73],[0,0,0,0,0,0,0,0] ],
	["MercilessOverseerBoss",	[6,8,9,11,12,14,16,18],		[2,2,3,3,4,4,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["NightDemon",				[3,5,6,7,8,11,14,15],		[3,3,3,4,4,4,4,4],	[3,3,4,4,5,5,5,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["Ooze",					[4,5,7,8,9,10,12,14],		[1,1,1,1,2,2,2,2],	[2,2,2,3,3,3,4,4],	[2,2,3,3,3,3,3,3],	[0,1,1,1,1,1,1,1],	[0,0,0,0,0,2,2,2],	[0,0,0,0,0,0,0,0] ],
	["PrimeDemonBoss",			[8,9,10,12,14,16,20,22],	[3,4,4,4,5,5,5,5],	[4,4,5,6,6,7,7,8],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["RendingDrake",			[5,6,7,7,9,10,11,14],		[3,3,4,4,4,4,5,5],	[3,3,3,4,4,5,5,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,1,1,1,1,1,1,1],	[0,0,0,0,0,0,0,0] ],
	["SavvasIcestorm",			[7,10,12,12,14,16,16,17],	[2,2,3,3,3,3,3,4],	[2,2,2,3,3,4,4,4],	[3,4,4,4,5,5,5,6],	[0,0,0,1,1,1,2,2],	[73,73,73,73,73,73,73,73],[0,0,0,0,0,0,0,0] ],
	["SavvasLavaflow",			[8,9,11,14,16,18,20,24],	[3,3,3,3,3,3,4,4],	[2,2,3,3,4,4,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,2,2,2,2,2,2,2],	[0,0,0,0,1,1,1,1] ],
	["SpittingDrake",			[5,6,8,8,9,12,13,16],		[3,3,3,3,4,4,4,4],	[3,3,3,4,4,4,5,5],	[3,3,3,4,4,4,4,4],	[0,0,0,0,0,0,0,0],	[0,0,6,6,6,6,6,6],	[0,0,0,0,0,0,0,0] ],
	["StoneGolem",				[10,10,11,11,12,13,16,16],	[1,1,1,1,2,2,2,2],	[3,3,4,4,4,5,5,5],	[0,0,0,0,0,0,0,0],	[0,1,1,2,2,2,2,3],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["SunDemon",				[5,7,9,10,11,11,12,15],		[2,2,2,2,3,3,3,3],	[2,2,2,3,3,3,4,4],	[0,0,0,0,0,0,0,0],	[1,1,1,1,1,2,2,2],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["TheBetrayerBoss",			[10,12,14,16,18,20,23,27],	[3,3,3,4,4,5,5,5],	[4,5,6,7,8,8,9,9],	[3,3,4,4,4,5,5,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["TheColorlessBoss",		[9,10,11,12,14,15,17,19],	[3,3,4,4,4,4,4,5],	[2,3,3,4,4,5,6,7],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["TheGloomBoss",			[20,25,29,35,39,46,50,56],	[2,2,2,2,3,3,3,3],	[5,5,6,6,7,7,8,9],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["TheSightlessEyeBoss",		[7,8,10,11,14,15,18,20],	[0,0,0,0,0,0,0,0],	[5,6,6,7,7,8,8,9],	[3,3,3,3,3,3,3,3],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["VermlingScout",			[2,3,3,5,6,8,9,11],			[3,3,3,3,3,3,4,4],	[1,1,2,2,3,3,3,3],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["VermlingShaman",			[2,2,3,3,3,4,5,7],			[2,2,2,2,3,3,3,3],	[1,1,1,2,2,3,4,4],	[3,3,4,4,4,4,4,4],	[2,3,3,3,3,3,3,3],	[0,0,0,0,6,6,6,6],	[0,0,0,0,0,0,0,0] ],
	["WindDemon",				[3,3,4,5,7,9,10,11],		[3,3,4,4,4,4,4,4],	[2,2,2,3,3,3,3,4],	[3,3,3,3,3,4,4,4],	[1,2,2,2,2,2,3,3],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["WingedHorrorBoss",		[6,7,8,10,12,14,17,20],		[3,4,4,4,5,5,5,5],	[3,3,4,4,4,5,5,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["CrystalRot",				[5,6,7,10,11,13,18,21],		[2,2,3,3,2,2,3,3],	[1,2,2,2,3,3,3,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
//	["",	[],	[],	[],	[],	[],	[],	[] ],
];

const elite_enemies = [
//	Wound = 1, Poison = 2, Immobilize = 3, Disarm = 4, Stun = 5, Muddle = 6, Pierce = 7, Retaliate = 8
//	Name,						Health,						Move,				Attack,				Range,				Shield,				Effect 01,			Effect 02
	["AncientArtillery",		[7,9,11,13,13,15,16,20],	[0,0,0,0,0,0,0,0],	[3,3,3,4,4,4,5,5],	[5,5,6,6,6,7,7,7],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["BanditArcher",			[6,7,9,10,10,12,13,17],		[3,3,3,4,4,4,5,5],	[3,5,5,5,6,6,6,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,2,2,2,2],	[0,0,0,0,0,0,0,0] ],
	["BanditCommanderBoss",		[8,10,12,13,15,16,19,23],	[3,3,4,4,4,5,5,5],	[3,3,3,4,4,5,5,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["BanditGuard",				[9,9,10,10,11,12,14,14],	[2,2,2,3,3,3,3,3],	[3,3,4,4,4,5,5,5],	[0,0,0,0,0,0,0,0],	[0,1,1,2,2,2,2,3],	[0,0,0,0,6,6,6,6],	[0,0,0,0,0,0,0,0] ],
	["BlackImp",				[4,6,8,8,11,12,14,17],		[1,1,1,1,1,1,1,1],	[2,2,2,3,3,3,4,4],	[3,3,4,4,4,5,5,5],	[0,0,0,0,0,0,0,0],	[2,2,2,2,2,2,2,2],	[0,0,0,0,0,0,0,0] ],
	["CaptainoftheGuardBoss",	[7,9,11,14,16,20,21,25],	[2,2,2,2,2,2,2,2],	[3,3,4,4,5,5,6,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["CaveBear",				[11,14,17,20,21,24,28,33],	[3,3,4,4,5,5,5,5],	[4,4,4,5,5,6,7,7],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,1,1,1,],	[0,0,0,0,0,0,0,0] ],
	["CityArcher",				[6,6,7,8,10,11,12,13],		[1,1,1,2,2,2,3,3],	[3,3,4,4,4,5,6,6],	[4,5,5,5,6,6,6,7],	[0,1,1,2,2,2,2,3],	[0,71,72,72,72,73,73,73], [0,0,0,0,0,0,0,0] ],
	["CityGuard",				[6,6,9,9,10,12,13,14],		[2,2,2,2,3,3,3,3],	[3,3,3,4,4,4,5,6],	[0,0,0,0,0,0,0,0],	[1,2,2,2,2,3,3,3],	[0,0,0,81,82,83,83],[0,0,0,0,0,0,0,0] ],
	["Cultist",					[7,9,12,13,15,18,22,25],	[2,2,2,3,3,3,3,3],	[2,2,2,2,3,3,3,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["DarkRiderBoss",			[9,10,12,13,15,16,16,18],	[2,3,3,3,3,3,4,4],	[3,3,3,4,4,5,5,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["DeepTerror",				[5,6,7,8,9,11,13,15],		[0,0,0,0,0,0,0,0],	[3,3,4,4,5,5,6,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[81,81,81,82,82,83,83,84],[0,0,0,0,0,0,0,0] ],
	["EarthDemon",				[10,13,18,20,21,25,27,32],	[2,2,2,2,3,3,3,3],	[4,4,4,4,5,5,6,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,3,3,3,3],	[0,0,0,0,0,0,0,0] ],
	["ElderDrakeBoss",			[11,12,15,16,20,22,27,29],	[0,0,0,0,0,0,0,0],	[3,4,4,5,5,6,6,7],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["FlameDemon",				[3,3,4,5,5,6,7,8],			[3,3,3,3,4,4,4,4],	[2,2,3,3,3,3,4,4],	[3,3,3,4,4,4,4,5],	[2,3,3,3,3,4,4,4],	[0,0,0,82,83,83,84,84],[0,0,0,0,0,0,0,0] ],
	["ForestImp",				[4,5,6,7,7,8,9,11],			[3,3,3,4,4,4,4,4],	[1,1,2,2,2,2,3,3],	[3,3,3,4,4,4,4,4],	[1,1,1,1,2,2,2,2],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["FrostDemon",				[10,10,12,14,18,20,22,25],	[3,3,4,4,4,4,4,4],	[3,3,4,4,4,5,5,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,82,82,83,83,83,84,84],[0,0,0,0,0,0,0,0] ],
	["GiantViper",				[3,5,7,8,11,13,14,17],		[2,2,3,3,3,4,4,4],	[2,2,2,3,3,3,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[2,2,2,2,2,2,2,2],	[0,0,0,0,0,0,0,0] ],
	["HarrowerInfester",		[12,12,14,17,19,21,22,26],	[2,3,3,3,3,3,4,4],	[2,2,3,3,4,5,5,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,82,82,83,83,83,84,84],[0,0,0,0,0,0,0,0] ],
	["Hound",					[6,6,7,8,11,12,15,15],		[5,5,5,5,5,5,6,6],	[2,2,3,4,4,4,4,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,82,82,82,82,83,83,84],[0,0,0,0,0,0,0,0] ],
	["InoxArcher",				[7,8,11,13,14,17,19,23],	[2,2,2,2,3,3,3,3],	[3,3,3,4,4,4,5,5],	[3,4,4,4,4,5,5,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,1,1,1,1],	[0,0,0,0,0,0,0,0] ],
	["InoxBodyguardBossC",		[6,7,9,10,11,13,15,17],		[2,2,2,3,3,3,4,4],	[0,1,1,2,2,3,3,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["InoxGuard",				[9,10,12,15,17,19,21,23],	[1,2,2,2,2,2,3,3],	[3,3,4,4,5,5,5,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[81,82,82,83,83,84,84,84],[0,0,0,0,0,0,0,0] ],
	["InoxShaman",				[6,9,11,14,16,20,24,27],	[2,2,3,3,3,3,4,4],	[3,3,3,3,4,4,4,5],	[3,3,3,4,4,4,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["JekserahBoss",			[6,7,9,12,13,15,18,22],		[2,2,3,4,4,5,5,5],	[2,3,3,4,5,5,5,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["LivingBones",				[6,6,7,10,11,11,11,14],		[4,4,4,4,4,4,6,6],	[2,2,3,3,4,4,4,4],	[0,0,0,0,0,0,0,0],	[0,1,1,1,1,2,2,2],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["LivingCorpse",			[10,10,13,13,15,17,21,25],	[1,1,1,2,2,2,2,2],	[3,4,4,5,5,6,6,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,2,2,2,2],	[0,0,0,0,0,0,0,0] ],
	["LivingSpirit",			[3,3,3,4,4,6,7,9],			[3,3,4,4,4,4,4,4],	[3,3,3,4,4,4,5,5],	[3,3,3,4,4,4,5,5],	[2,3,3,3,4,4,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["Lurker",					[7,9,12,14,14,15,16,18],	[2,2,3,3,3,3,4,4],	[3,3,3,4,4,5,5,5],	[0,0,0,0,0,0,0,0],	[1,1,1,1,2,2,2,2],	[0,71,72,72,73,73,74,74],[0,0,0,0,0,0,0,0] ],
	["MercilessOverseerBoss",	[6,8,9,11,12,14,16,18],		[2,2,3,3,4,4,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["NightDemon",				[5,8,11,13,15,17,21,21],	[4,4,4,4,5,5,5,5],	[4,4,4,5,5,6,6,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["Ooze",					[8,9,11,11,13,15,16,18],	[1,1,1,2,2,3,3,3],	[2,2,3,3,4,4,4,5],	[3,3,3,4,4,4,4,4],	[0,1,1,1,1,1,2,2],	[0,0,0,2,2,2,2,2],	[0,0,0,0,0,0,0,0] ],
	["PrimeDemonBoss",			[8,9,10,12,14,16,20,22],	[3,4,4,4,5,5,5,5],	[4,4,5,6,6,7,7,8],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["RendingDrake",			[7,7,9,10,11,14,15,18],		[4,4,5,5,6,6,6,6],	[4,5,5,6,6,6,7,7],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,1,1,1,1,1,1,1],	[0,0,0,0,0,0,0,0] ],
	["SavvasIcestorm",			[12,12,15,18,19,21,23,24],	[2,2,3,3,4,4,4,4],	[3,3,3,4,4,5,6,6],	[4,5,5,6,6,6,6,6],	[0,1,1,1,2,2,2,3],	[73,73,73,73,73,73,73,73],[0,0,0,0,0,0,0,0] ],
	["SavvasLavaflow",			[13,15,18,21,24,27,30,35],	[3,3,3,3,4,4,4,4],	[3,3,3,4,4,5,6,6],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,1,2,2,2,2,2,2],	[0,0,1,1,1,1,1,1] ],
	["SpittingDrake",			[8,9,10,12,14,16,19,21],	[3,3,3,3,4,4,4,4],	[4,4,5,5,5,6,6,7],	[4,4,4,5,5,5,5,5],	[0,0,0,0,0,0,0,0],	[0,6,6,6,6,6,6,6],	[0,0,0,0,0,0,0,0] ],
	["StoneGolem",				[10,11,14,15,17,19,20,21],	[2,2,2,2,2,3,3,3],	[4,4,5,5,6,6,7,7],	[0,0,0,0,0,0,0,0],	[1,2,2,3,3,3,3,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["SunDemon",				[9,12,13,15,16,16,18,22],	[2,2,2,3,3,3,4,4],	[3,3,4,4,5,5,5,5],	[0,0,0,0,0,0,0,0],	[1,1,1,1,1,2,2,2],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["TheBetrayerBoss",			[10,12,14,16,18,20,23,27],	[3,3,3,4,4,5,5,5],	[4,5,6,7,8,8,9,9],	[3,3,4,4,4,5,5,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["TheColorlessBoss",		[9,10,11,12,14,15,17,19],	[3,3,4,4,4,4,4,5],	[2,3,3,4,4,5,6,7],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["TheGloomBoss",			[20,25,29,35,39,46,50,56],	[2,2,2,2,3,3,3,3],	[5,5,6,6,7,7,8,9],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["TheSightlessEyeBoss",		[7,8,10,11,14,15,18,20],	[0,0,0,0,0,0,0,0],	[5,6,6,7,7,8,8,9],	[3,3,3,3,3,3,3,3],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["VermlingScout",			[4,5,5,7,8,11,12,15],		[3,3,4,4,4,4,5,5],	[2,2,3,3,4,4,4,4],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["VermlingShaman",			[3,3,4,5,5,6,6,8],			[3,3,3,3,3,3,3,3],	[2,2,2,3,3,4,4,4],	[3,3,4,4,4,4,4,4],	[2,3,3,3,4,4,5,5],	[0,0,0,0,6,6,6,6],	[0,0,0,0,0,0,0,0] ],
	["WindDemon",				[5,5,7,8,8,11,12,13],		[4,4,5,5,5,5,5,5],	[3,3,3,4,4,4,4,5],	[4,4,4,4,4,4,4,4],	[1,2,2,2,2,2,3,3],	[0,0,0,0,4,4,4,4],	[0,0,0,0,0,0,0,0] ],
	["WingedHorrorBoss",		[6,7,8,10,12,14,17,20],		[3,4,4,4,5,5,5,5],	[3,3,4,4,4,5,5,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
	["CystalRot",				[8,9,11,16,18,21,29,33],	[2,2,3,3,2,2,3,3],	[2,3,3,3,4,4,4,5],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0],	[0,0,0,0,0,0,0,0] ],
//	["",	[],	[],	[],	[],	[],	[],	[] ],
//	["",	[],	[],	[],	[],	[],	[],	[] ],
//	Name,						Health,						Move,				Attack,				Range,				Shield,				Effect 01,			Effect 02
//	Wound = 1, Poison = 2, Immobilize = 3, Disarm = 4, Stun = 5, Muddle = 6, Pierce = 7, Retaliate = 8
];

const conditions = [
	["Positive", ["Safeguard", "Ward", "Invisible", "Strengthen"] ],
	["Negative", ["Wound", "Poison", "Immobilize", "Disarm", "Stun", "Muddle"] ],
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



function addEnemy(array_type) {
	//Get Values set
	const box = document.getElementById("Enemy_Box");
	enemyTotal++;

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
	var move = 0;
	var attack = 0;
	var range = 0;
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
			//Move
			move = enemies[i][2][level];
			//Attack
			attack = enemies[i][3][level];
			if (enemies[i][0].includes("BossC") ) {
				attack = enemies[i][3][level] + selected_characters.length;
			}
			//Range
			range = enemies[i][4][level];
			//Shield
			if (enemies[i][5].length > 0) {
				shield = enemies[i][5][level];
			}
		}
	}
	const enemy = enemyName + "_" + enemyTotal;

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
	var NR = 0; var ER = 0;
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
			//Range
			NR = normal_enemies[i][4][level];	ER = elite_enemies[i][4][level];
			//Shield
			NS = normal_enemies[i][5][level];	ES = elite_enemies[i][5][level];
			//Condition(s)
			NC = normal_enemies[i][6][level];	EC = elite_enemies[i][6][level];
			NC2 = normal_enemies[i][7][level];	EC2 = elite_enemies[i][7][level];
		}
	}

	for (let child of box.children) {
		var guy = child.children[0].children[0].id;
			var name = guy.split("_")[0];
			if (!enemy_stat_cards.includes(name) ) {
				enemy_stat_cards.push(name);

				//Adding Enemy Type Stat Card
				const statBox = document.getElementById("Enemy_Stat_Box");
				var enemyStatSrc = "./Images/Gloomhaven_1e/Enemies/Cards/" + normal_enemies[enemySelection.value][0].replace(/\s+/g,"") + ".png";
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
								<p style="margin:5px; color:green; font-size:20px;" id="${enemyName + "_Normal_A"}">A:${NA}</p>
								<p style="margin:5px; color:crimson; font-size:20px;">R:${NR}</p>
								<p style="margin:5px; color:blue; font-size:20px;">S:${NS}</p>
							</div>
							<div class="box-tall" id="${enemyName + "_Elite"}">
								<p style="margin:5px; color:gold; font-size:20px;">M:${EM}</p>
								<p style="margin:5px; color:lawngreen; font-size:20px;" id="${enemyName + "_Elite_A"}">A:${EA}</p>
								<p style="margin:5px; color:red; font-size:20px;">R:${ER}</p>
								<p style="margin:5px; color:cyan; font-size:20px;">S:${ES}</p>
							</div>
						</div>
						<div class="box-long" id="${enemyName + "_Conditions"}"></div>
					</div>
					<div class="box-tall" id="${enemyName + "_Card"}" style="position:relative">
						<div class="box-long" style="column-gap:10px;">
							<div class="box-long">
								<img src="./Images/Icons/Flip.png" onclick="nextAction(${enemyName + '_Card'})" class="action-Btn" style="height:25px;">
								<p id="${enemyName + '_Action'}" class="attribute-input" style="font-size:20px;">0</p>
							</div>
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
						<div class="box-tall" style="position:relative">
							<img src="./Images/JoTL/Enemies/Initiatives/Monster_Back.jpg" id="${enemyName + '_Score_Img'}" style="height:auto;width:300px;">
						</div>
					</div>
				</div>
			`;

			//Getting Coniditions
			switch (NC) {
				case 1: NC = "Wound"; break; case 2: NC = "Poison"; break; case 3: NC = "Immobilize"; break; case 4: NC = "Disarm"; break;
				case 5: NC = "Stun"; break; case 6: NC = "Muddle"; break;
			}
			switch (EC) {
				case 1: EC = "Wound"; break; case 2: EC = "Poison"; break; case 3: EC = "Immobilize"; break; case 4: EC = "Disarm"; break;
				case 5: EC = "Stun"; break; case 6: EC = "Muddle"; break;
			}
			switch (NC2) {
				case 1: NC2 = "Wound"; break; case 2: NC2 = "Poison"; break; case 3: NC2 = "Immobilize"; break; case 4: NC2 = "Disarm"; break;
				case 5: NC2 = "Stun"; break; case 6: NC2 = "Muddle"; break;
			}
			switch (EC2) {
				case 1: EC2 = "Wound"; break; case 2: EC2 = "Poison"; break; case 3: EC2 = "Immobilize"; break; case 4: EC2 = "Disarm"; break;
				case 5: EC2 = "Stun"; break; case 6: EC2 = "Muddle"; break;
			}

			//Applying Conditions
			if (NC) {
				var temp = NC;
				if (NC > 70 && NC < 80) { temp = "Pierce"; } if (NC > 80 && NC < 90) { temp = "Retaliate"; }
				applyCondition(enemyName, "_Normal", temp, NC);
			}
			if (EC) {
				var temp = EC;
				if (EC > 70 && EC < 80) { temp = "Pierce"; } if (EC > 80 && EC < 90) { temp = "Retaliate"; }
				applyCondition(enemyName, "_Elite", temp, EC);
			}
			if (NC2) {
				var temp = NC2;
				if (NC2 > 70 && NC2 < 80) { temp = "Pierce"; } if (NC2 > 80 && NC2 < 90) { temp = "Retaliate"; }
				applyCondition(enemyName, "_Normal", temp, NC2);
			}
			if (EC2) {
				var temp = EC2;
				if (EC2 > 70 && EC2 < 80) { temp = "Pierce"; } if (EC2 > 80 && EC2 < 90) { temp = "Retaliate"; }
				applyCondition(enemyName, "_Elite", temp, EC2);
			}
		}
	}
}

function applyCondition(enemyName, suffix, name, value) {
	var conBox = document.getElementById(enemyName + suffix);

	//Create Image
	var image = document.createElement("img");
	image.id = enemyName + "_Neg_" + name;
	image.src = "./Images/Conditions/" + name + ".png";
	image.dataset.amount = value;
	image.style.height = "25px";
	image.style.width = "auto";
	conBox.appendChild(image);

	//Create Text
	if (Number.isFinite(value) ) {
		var text = document.createElement("p");
		text.textContent = String(value).split("")[1];
		conBox.append(text);
	}
}

function removeEnemy(ID) {
	if (ID.id.includes("Stat") ) {
		const index = enemy_stat_cards.indexOf(ID.id.split("_")[0]);
		if (index > -1) {
			enemy_stat_cards.splice(index,1);
		}
	}
	const selection = document.getElementById(ID.id);
	selection.parentElement.remove();
}




//////////////////////////////
// Ememy Cards
//
const enemy_cards = [
	//Name, Usabel Score Cards, Unusable Score Cards
	["AncientArtillery",		[], [], [] ],
	["BanditArcher",			[], [], [] ],
	["BanditCommanderBoss", 	[], [], [] ],
	["BanditGuard",				[], [], [] ],
	["BlackImp",				[], [], [] ],
	["CaptainoftheGuardBoss",	[], [], [] ],
	["CaveBear",				[], [], [] ],
	["CityArcher",				[], [], [] ],
	["CityGuard",				[], [], [] ],
	["Cultist",					[], [], [] ],
	["DarkRiderBoss",			[], [], [] ],
	["DeepTerror",				[], [], [] ],
	["EarthDemon",				[], [], [] ],
	["ElderDrakeBoss",			[], [], [] ],
	["FlameDemon",				[], [], [] ],
	["ForestImp",				[], [], [] ],
	["FrostDemon",				[], [], [] ],
	["GiantViper",				[], [], [] ],
	["HarrowerInfester",		[], [], [] ],
	["Hound",					[], [], [] ],
	["InoxArcher",				[], [], [] ],
	["InoxBodyguardBossC",		[], [], [] ],
	["InoxGuard",				[], [], [] ],
	["InoxShaman",				[], [], [] ],
	["JekserahBoss",			[], [], [] ],
	["LivingBones",				[], [], [] ],
	["LivingCorpse",			[], [], [] ],
	["LivingSpirit",			[], [], [] ],
	["Lurker",					[], [], [] ],
	["MercilessOverseerBoss",	[], [], [] ],
	["NightDemon",				[], [], [] ],
	["Ooze",					[], [], [] ],
	["PrimeDemonBoss",			[], [], [] ],
	["RendingDrake",			[], [], [] ],
	["SavvasIcestorm",			[], [], [] ],
	["SavvasLavaflow",			[], [], [] ],
	["SpittingDrake",			[], [], [] ],
	["StoneGolem",				[], [], [] ],
	["SunDemon",				[], [], [] ],
	["TheBetrayerBoss",			[], [], [] ],
	["TheColorlessBoss",		[], [], [] ],
	["TheGloomBoss",			[], [], [] ],
	["TheSightlessEyeBoss",		[], [], [] ],
	["VermlingScout",			[], [], [] ],
	["VermlingShaman",			[], [], [] ],
	["WindDemon",				[], [], [] ],
	["WingedHorrorBoss",		[], [], [] ],
	["CrystalRot",				[], [], [] ],
];

const enemy_types = ["_Normal", "_Elite"];

function makeEnemyScoreCard(enemyName, score, actions, enemyType, img) {
	//Seperate all actions
	var all_actions = [];
	var seperate_actions = actions.split("|");
	for (i=0; i<seperate_actions.length; i++) {
		if (seperate_actions[i].includes("/") ) {
			var sep_acts_2 = seperate_actions[i].split("/");
			for (j=0; j<sep_acts_2.length; j++) {
				all_actions.push(sep_acts_2[j].trim() );
			}
		} else {
			all_actions.push(seperate_actions[i].trim() );
		}
	}

	//Make all cards temporarily unique
	var image = img;
	if (img === "A") {
		image = img.replace("A","");
	}

	//Get Image(s)
	var cardSrc = "./Images/Gloomhaven_1e/Enemies/Initiatives/" + enemyName + "_" + score + image + ".png";
	var cardSrc02 = cardSrc;
	if (enemyType.includes("Archer") ) {
		cardSrc02 = "./Images/Gloomhaven_1e/Enemies/Initiatives/" + "Archer_" + score + image + ".png";
	}
	else if (enemyType.includes("Guard") ) {
		cardSrc02 = "./Images/Gloomhaven_1e/Enemies/Initiatives/" + "Guard_" + score + image + ".png";
	}
	else if (enemyType.includes("Shaman") ) {
		cardSrc02 = "./Images/Gloomhaven_1e/Enemies/Initiatives/" + "Shaman_" + score + image + ".png";
	}
	else if (enemyType.includes("Boss") ) {
		cardSrc02 = "./Images/Gloomhaven_1e/Enemies/Initiatives/" + "Boss_" + score + image + ".png";
	}

	//Make Array of Enemy Initiative Cards
	var array = [];
	for (i=0; i<enemy_cards.length; i++ ) {
		if (enemy_cards[i][0] === enemyName) {
			array.push(enemyName, score, all_actions, cardSrc, cardSrc02, img, true);
			enemy_cards[i][1].push(array);
		}
	}
}

function makeEnemyScoreCards() {
	//Ancient Artillery
	makeEnemyScoreCard("AncientArtillery", 46, "Attack -1", "", "_1");
	makeEnemyScoreCard("AncientArtillery", 71, "", "", ""); makeEnemyScoreCard("AncientArtillery", 71, "", "", "A");
	makeEnemyScoreCard("AncientArtillery", 37, "Attack -1", "", ""); makeEnemyScoreCard("AncientArtillery", 37, "Attack -1", "", "A");
	makeEnemyScoreCard("AncientArtillery", 95, "Attack 1", "", "");
	makeEnemyScoreCard("AncientArtillery", 17, "Shield 2 | Attack -2", "", "");
	makeEnemyScoreCard("AncientArtillery", 46, "Attack -1 / Immobilize", "", "_2");

	//Bandit Archer
	makeEnemyScoreCard("BanditArcher", 16, "Attack -1", "Archer", "");
	makeEnemyScoreCard("BanditArcher", 31, "", "Archer", "");
	makeEnemyScoreCard("BanditArcher", 32, "Attack 1", "Archer", "");
	makeEnemyScoreCard("BanditArcher", 44, "Attack 1", "Archer", "");
	makeEnemyScoreCard("BanditArcher", 56, "Attack -1", "Archer", "");
	makeEnemyScoreCard("BanditArcher", 68, "Attack 1", "Archer", "");
	makeEnemyScoreCard("BanditArcher", 14, "Attack -1", "Archer", "");
	makeEnemyScoreCard("BanditArcher", 29, "Attack -1 / Immobilize", "Archer", "");

	//Bandit Commander
	makeEnemyScoreCard("BanditCommanderBoss", 11, "", "Boss", "");
	makeEnemyScoreCard("BanditCommanderBoss", 14, "", "Boss", "");
	makeEnemyScoreCard("BanditCommanderBoss", 17, "", "Boss", "");
	makeEnemyScoreCard("BanditCommanderBoss", 85, "", "Boss", "");
	makeEnemyScoreCard("BanditCommanderBoss", 79, "", "Boss", "");
	makeEnemyScoreCard("BanditCommanderBoss", 73, "", "Boss", "");
	makeEnemyScoreCard("BanditCommanderBoss", 36, "", "Boss", "");
	makeEnemyScoreCard("BanditCommanderBoss", 52, "", "Boss", "");

	//Bandit Guard
	makeEnemyScoreCard("BanditGuard", 15, "Shield 1", "Guard", "_1");
	makeEnemyScoreCard("BanditGuard", 30, "Attack -1", "Guard", "");
	makeEnemyScoreCard("BanditGuard", 35, "", "Guard", "");
	makeEnemyScoreCard("BanditGuard", 50, "", "Guard", ""); makeEnemyScoreCard("BanditGuard", 50, "", "Guard", "A");
	makeEnemyScoreCard("BanditGuard", 70, "Attack 1", "Guard", "");
	makeEnemyScoreCard("BanditGuard", 55, "Attack 0 | Strengthen", "Guard", "");
	makeEnemyScoreCard("BanditGuard", 15, "Shield 1 | Attack 0 / Poison ", "Guard", "_2");

	//Black Imp
	makeEnemyScoreCard("BlackImp", 5, "Shield 5 | Heal 1", "", "");
	makeEnemyScoreCard("BlackImp", 37, "", "", ""); makeEnemyScoreCard("BlackImp", 37, "", "", "A");
	makeEnemyScoreCard("BlackImp", 42, "", "", "");
	makeEnemyScoreCard("BlackImp", 43, "Attack -1 / Poison", "", "_1");
	makeEnemyScoreCard("BlackImp", 76, "Attack 1", "", "");
	makeEnemyScoreCard("BlackImp", 43, "Attack -1", "", "_2");
	makeEnemyScoreCard("BlackImp", 24, "", "", "");

	//Captian of the Guard
	makeEnemyScoreCard("CaptainoftheGuardBoss", 11, "", "Boss", "");
	makeEnemyScoreCard("CaptainoftheGuardBoss", 14, "", "Boss", "");
	makeEnemyScoreCard("CaptainoftheGuardBoss", 17, "", "Boss", "");
	makeEnemyScoreCard("CaptainoftheGuardBoss", 85, "", "Boss", "");
	makeEnemyScoreCard("CaptainoftheGuardBoss", 79, "", "Boss", "");
	makeEnemyScoreCard("CaptainoftheGuardBoss", 73, "", "Boss", "");
	makeEnemyScoreCard("CaptainoftheGuardBoss", 36, "", "Boss", "");
	makeEnemyScoreCard("CaptainoftheGuardBoss", 52, "", "Boss", "");

	//Cave Bear
	makeEnemyScoreCard("CaveBear", 13, "Attack -1", "", "");
	makeEnemyScoreCard("CaveBear", 14, "Attack -1 / Immobilize", "", "");
	makeEnemyScoreCard("CaveBear", 34, "Attack 1 / Wound", "", "");
	makeEnemyScoreCard("CaveBear", 41, "", "", "");
	makeEnemyScoreCard("CaveBear", 60, "Attack 1", "", "");
	makeEnemyScoreCard("CaveBear", 80, "Attack -1 |fill| Attack -1 / Wound", "", "");
	makeEnemyScoreCard("CaveBear", 61, "Attack -1", "", "");
	makeEnemyScoreCard("CaveBear", 3, "Shield 1 |fill| Heal 2", "", "");

	//City Archer
	makeEnemyScoreCard("CityArcher", 16, "Attack -1", "Archer", "");
	makeEnemyScoreCard("CityArcher", 31, "", "Archer", "");
	makeEnemyScoreCard("CityArcher", 32, "Attack 1", "Archer", "");
	makeEnemyScoreCard("CityArcher", 44, "Attack 1", "Archer", "");
	makeEnemyScoreCard("CityArcher", 56, "Attack -1", "Archer", "");
	makeEnemyScoreCard("CityArcher", 68, "Attack 1", "Archer", "");
	makeEnemyScoreCard("CityArcher", 14, "Attack -1", "Archer", "");
	makeEnemyScoreCard("CityArcher", 29, "Attack -1 / Immobilize", "Archer", "");

	//City Guard
	makeEnemyScoreCard("CityGuard", 15, "Shield 1", "Guard", "_1");
	makeEnemyScoreCard("CityGuard", 30, "Attack -1", "Guard", "");
	makeEnemyScoreCard("CityGuard", 35, "", "Guard", "");
	makeEnemyScoreCard("CityGuard", 50, "", "Guard", ""); makeEnemyScoreCard("CityGuard", 50, "", "Guard", "A");
	makeEnemyScoreCard("CityGuard", 70, "Attack 1", "Guard", "");
	makeEnemyScoreCard("CityGuard", 55, "Attack 0 | Strengthen", "Guard", "");
	makeEnemyScoreCard("CityGuard", 15, "Shield 1 | Attack 0 / Poison ", "Guard", "_2");

	//Cultist
	makeEnemyScoreCard("Cultist", 10, "Attack -1", "", ""); makeEnemyScoreCard("Cultist", 10, "Attack -1", "", "A");
	makeEnemyScoreCard("Cultist", 27, "", "", ""); makeEnemyScoreCard("Cultist", 27, "", "", "A");
	makeEnemyScoreCard("Cultist", 39, "Attack 0 | Heal 1", "", "");
	makeEnemyScoreCard("Cultist", 63, "wait| Suffer 2", "", ""); makeEnemyScoreCard("Cultist", 63, "wait| Suffer 2", "", "A");
	makeEnemyScoreCard("Cultist", 31, "", "", "");

	//Dark Rider
	makeEnemyScoreCard("DarkRiderBoss", 11, "", "Boss", "");
	makeEnemyScoreCard("DarkRiderBoss", 14, "", "Boss", "");
	makeEnemyScoreCard("DarkRiderBoss", 17, "", "Boss", "");
	makeEnemyScoreCard("DarkRiderBoss", 85, "", "Boss", "");
	makeEnemyScoreCard("DarkRiderBoss", 79, "", "Boss", "");
	makeEnemyScoreCard("DarkRiderBoss", 73, "", "Boss", "");
	makeEnemyScoreCard("DarkRiderBoss", 36, "", "Boss", "");
	makeEnemyScoreCard("DarkRiderBoss", 52, "", "Boss", "");

	//Deep Terror
	makeEnemyScoreCard("DeepTerror", 65, "", "", "");
	makeEnemyScoreCard("DeepTerror", 60, "Attack 0 / Pierce 3", "", ""); makeEnemyScoreCard("DeepTerror", 60, "Attack 0 / Pierce 3", "", "A");
	makeEnemyScoreCard("DeepTerror", 84, "Attack -1 | Attack 0 / Wound", "", "");
	makeEnemyScoreCard("DeepTerror", 75, "Attack 0 / Poison | Attack -1 / Immobilize", "", "_1");
	makeEnemyScoreCard("DeepTerror", 75, "Attack -2 / Disarm | Attack 0", "", "_2");
	makeEnemyScoreCard("DeepTerror", 96, "Attack -2", "", "");
	makeEnemyScoreCard("DeepTerror", 54, "", "", "");

	//Earth Demon
	makeEnemyScoreCard("EarthDemon", 40, "Heal 3", "", "");
	makeEnemyScoreCard("EarthDemon", 42, "Attack -1", "", "");
	makeEnemyScoreCard("EarthDemon", 62, "Attack 0 | Infuse:Grass", "", "");
	makeEnemyScoreCard("EarthDemon", 71, "", "", "");
	makeEnemyScoreCard("EarthDemon", 83, "Attack 1 | Infuse:Grass", "", "");
	makeEnemyScoreCard("EarthDemon", 93, "Attack -1", "", "");
	makeEnemyScoreCard("EarthDemon", 79, "Attack 0 / Consume:Wind:Attack -2", "", "");
	makeEnemyScoreCard("EarthDemon", 87, "Attack -1 | Consume:Any:Grass", "", "");

	//Elder Drake
	makeEnemyScoreCard("ElderDrakeBoss", 11, "", "Boss", "");
	makeEnemyScoreCard("ElderDrakeBoss", 14, "", "Boss", "");
	makeEnemyScoreCard("ElderDrakeBoss", 17, "", "Boss", "");
	makeEnemyScoreCard("ElderDrakeBoss", 85, "", "Boss", "");
	makeEnemyScoreCard("ElderDrakeBoss", 79, "", "Boss", "");
	makeEnemyScoreCard("ElderDrakeBoss", 73, "", "Boss", "");
	makeEnemyScoreCard("ElderDrakeBoss", 36, "", "Boss", "");
	makeEnemyScoreCard("ElderDrakeBoss", 52, "", "Boss", "");

	//Flame Demon
	makeEnemyScoreCard("FlameDemon", 3, "Attack -1 | Infuse:Fire", "", "");
	makeEnemyScoreCard("FlameDemon", 24, "Attack 0 | Infuse:Fire", "", "");
	makeEnemyScoreCard("FlameDemon", 46, "", "", "");
	makeEnemyScoreCard("FlameDemon", 49, "Attack 0 / Consume:Fire:Attack 1 / Wound", "", "");
	makeEnemyScoreCard("FlameDemon", 67, "Attack 1 | Infuse:Fire", "", "");
	makeEnemyScoreCard("FlameDemon", 77, "Attack 0 | Consume:Ice:Suffer 1", "", "");
	makeEnemyScoreCard("FlameDemon", 30, "Attack -2 / Wound", "", "");
	makeEnemyScoreCard("FlameDemon", 8, "wait| Consume:Any:Fire", "", "");

	//Forest Imp
	makeEnemyScoreCard("ForestImp", 5, "Shield 5 | Heal 1", "", "");
	makeEnemyScoreCard("ForestImp", 37, "", "", ""); makeEnemyScoreCard("ForestImp", 37, "", "", "A");
	makeEnemyScoreCard("ForestImp", 42, "", "", "");
	makeEnemyScoreCard("ForestImp", 43, "Attack -1 / Poison", "", "_1");
	makeEnemyScoreCard("ForestImp", 76, "Attack 1", "", "");
	makeEnemyScoreCard("ForestImp", 43, "Attack -1", "", "_2");
	makeEnemyScoreCard("ForestImp", 24, "", "", "");

	//Frost Demon
	makeEnemyScoreCard("FrostDemon", 18, "wait| Consume:Ice:Heal 3", "", "_1");
	makeEnemyScoreCard("FrostDemon", 38, "Attack -1", "", "");
	makeEnemyScoreCard("FrostDemon", 58, "", "", "_1"); makeEnemyScoreCard("FrostDemon", 58, "Attack 0 / Consume:Ice:Attack 2", "", "_2");
	makeEnemyScoreCard("FrostDemon", 78, "Attack 0 | Infuse:Ice", "", ""); makeEnemyScoreCard("FrostDemon", 78, "Attack 0 | Infuse:Ice", "", "A");
	makeEnemyScoreCard("FrostDemon", 58, "Attack -1 / Pierce 3 | Consume:Any:Ice", "", "_3");
	makeEnemyScoreCard("FrostDemon", 18, "Shield 2 | Consume:Fire:Suffer 1", "", "_2");

	//Giant Viper
	makeEnemyScoreCard("GiantViper", 32, "", "", ""); makeEnemyScoreCard("GiantViper", 32, "", "", "A");
	makeEnemyScoreCard("GiantViper", 11, "Shield 1 | Attack -1", "", "");
	makeEnemyScoreCard("GiantViper", 43, "Attack -1", "", "_1");
	makeEnemyScoreCard("GiantViper", 58, "Attack 1", "", "_1");
	makeEnemyScoreCard("GiantViper", 58, "Attack -1", "", "_2");
	makeEnemyScoreCard("GiantViper", 43, "", "", "_2");
	makeEnemyScoreCard("GiantViper", 23, "Attack -1 / Immobliize | Attack -1", "", "");

	//Harrower Infester
	makeEnemyScoreCard("HarrowerInfester", 38, "Attack 1", "", "_1");
	makeEnemyScoreCard("HarrowerInfester", 7, "Attack -1 / Poison | Infuse:Dark", "", "_1");
	makeEnemyScoreCard("HarrowerInfester", 16, "Attack -1 | Heal 5", "", "_1");
	makeEnemyScoreCard("HarrowerInfester", 16, "Attack 2 / Immobilize", "", "_2");
	makeEnemyScoreCard("HarrowerInfester", 2, "Shield 2", "", "");
	makeEnemyScoreCard("HarrowerInfester", 30, "", "", "");
	makeEnemyScoreCard("HarrowerInfester", 38, "Attack -1 / Consume:Dark:Attack 2 / Disarm", "", "_2");
	makeEnemyScoreCard("HarrowerInfester", 7, "Attack -1 / Muddle | Heal 4", "", "_2");

	//Hound
	makeEnemyScoreCard("Hound", 6, "Attack 0 / Immobilize", "", "");
	makeEnemyScoreCard("Hound", 7, "", "", "");
	makeEnemyScoreCard("Hound", 19, "", "", ""); makeEnemyScoreCard("Hound", 19, "", "", "A");
	makeEnemyScoreCard("Hound", 26, "", "", ""); makeEnemyScoreCard("Hound", 26, "", "", "A");
	makeEnemyScoreCard("Hound", 83, "Attack 1", "", "");
	makeEnemyScoreCard("Hound", 72, "Attack -1 / Pierce 2 | Attack -1 / Pierce 2", "", "");

	//Inox Archer
	makeEnemyScoreCard("InoxArcher", 16, "Attack -1", "Archer", "");
	makeEnemyScoreCard("InoxArcher", 31, "", "Archer", "");
	makeEnemyScoreCard("InoxArcher", 32, "Attack 1", "Archer", "");
	makeEnemyScoreCard("InoxArcher", 44, "Attack 1", "Archer", "");
	makeEnemyScoreCard("InoxArcher", 56, "Attack -1", "Archer", "");
	makeEnemyScoreCard("InoxArcher", 68, "Attack 1", "Archer", "");
	makeEnemyScoreCard("InoxArcher", 14, "Attack -1", "Archer", "");
	makeEnemyScoreCard("InoxArcher", 29, "Attack -1 / Immobilize", "Archer", "");

	//Inox Body Guard
	makeEnemyScoreCard("InoxBodyguardBossC", 11, "", "BossC", "");
	makeEnemyScoreCard("InoxBodyguardBossC", 14, "", "BossC", "");
	makeEnemyScoreCard("InoxBodyguardBossC", 17, "", "BossC", "");
	makeEnemyScoreCard("InoxBodyguardBossC", 85, "", "BossC", "");
	makeEnemyScoreCard("InoxBodyguardBossC", 79, "", "BossC", "");
	makeEnemyScoreCard("InoxBodyguardBossC", 73, "", "BossC", "");
	makeEnemyScoreCard("InoxBodyguardBossC", 36, "", "BossC", "");
	makeEnemyScoreCard("InoxBodyguardBossC", 52, "", "BossC", "");

	//Inox Guard
	makeEnemyScoreCard("InoxGuard", 15, "Shield 1", "Guard", "_1");
	makeEnemyScoreCard("InoxGuard", 30, "Attack -1", "Guard", "");
	makeEnemyScoreCard("InoxGuard", 35, "", "Guard", "");
	makeEnemyScoreCard("InoxGuard", 50, "", "Guard", ""); makeEnemyScoreCard("InoxGuard", 50, "", "Guard", "A");
	makeEnemyScoreCard("InoxGuard", 70, "Attack 1", "Guard", "");
	makeEnemyScoreCard("InoxGuard", 55, "Attack 0 | Strengthen", "Guard", "");
	makeEnemyScoreCard("InoxGuard", 15, "Shield 1 | Attack 0 / Poison ", "Guard", "_2");

	//Inox Shaman
	makeEnemyScoreCard("InoxShaman", 8, "Attack 1 / Disarm", "Shaman", "_1");
	makeEnemyScoreCard("InoxShaman", 8, "Attack 0 / Immobilize", "Shaman", "_2");
	makeEnemyScoreCard("InoxShaman", 23, "", "Shaman", ""); makeEnemyScoreCard("InoxShaman", 23, "", "Shaman", "A");
	makeEnemyScoreCard("InoxShaman", 62, "", "Shaman", "");
	makeEnemyScoreCard("InoxShaman", 74, "Attack 1", "Shaman", "");
	makeEnemyScoreCard("InoxShaman", 89, "wait| Bless Self", "Shaman", "");
	makeEnemyScoreCard("InoxShaman", 9, "Attack -1", "Shaman", "");

	//Jekserah
	makeEnemyScoreCard("JekserahBoss", 11, "", "Boss", "");
	makeEnemyScoreCard("JekserahBoss", 14, "", "Boss", "");
	makeEnemyScoreCard("JekserahBoss", 17, "", "Boss", "");
	makeEnemyScoreCard("JekserahBoss", 85, "", "Boss", "");
	makeEnemyScoreCard("JekserahBoss", 79, "", "Boss", "");
	makeEnemyScoreCard("JekserahBoss", 73, "", "Boss", "");
	makeEnemyScoreCard("JekserahBoss", 36, "", "Boss", "");
	makeEnemyScoreCard("JekserahBoss", 52, "", "Boss", "");

	//Living Bones
	makeEnemyScoreCard("LivingBones", 64, "Attack 1", "", "");
	makeEnemyScoreCard("LivingBones", 20, "Attack 0 | Heal 2", "", "");
	makeEnemyScoreCard("LivingBones", 25, "Attack -1", "", "");
	makeEnemyScoreCard("LivingBones", 45, "", "", ""); makeEnemyScoreCard("LivingBones", 45, "", "", "A");
	makeEnemyScoreCard("LivingBones", 81, "Attack 2", "", "");
	makeEnemyScoreCard("LivingBones", 74, "", "", "");
	makeEnemyScoreCard("LivingBones", 12, "Shield 1 | Heal 2", "", "");

	//Living Corpse
	makeEnemyScoreCard("LivingCorpse", 21, "", "", "");
	makeEnemyScoreCard("LivingCorpse", 47, "Attack -1", "", "");
	makeEnemyScoreCard("LivingCorpse", 66, "", "", ""); makeEnemyScoreCard("LivingCorpse", 66, "", "", "A");
	makeEnemyScoreCard("LivingCorpse", 82, "Attack 1", "", "");
	makeEnemyScoreCard("LivingCorpse", 91, "wait| Suffer 1", "", "");
	makeEnemyScoreCard("LivingCorpse", 71, "Attack 1 / Poison", "", "");
	makeEnemyScoreCard("LivingCorpse", 32, "Attack 2 | Suffer 1", "", "");

	//Living Spirit
	makeEnemyScoreCard("LivingSpirit", 22, "Attack -1 / Muddle", "", "");
	makeEnemyScoreCard("LivingSpirit", 33, "Attack -1", "", "");
	makeEnemyScoreCard("LivingSpirit", 48, "", "", ""); makeEnemyScoreCard("LivingSpirit", 48, "", "", "A");
	makeEnemyScoreCard("LivingSpirit", 61, "", "", "");
	makeEnemyScoreCard("LivingSpirit", 75, "Attack 1 | Heal 1", "", "");
	makeEnemyScoreCard("LivingSpirit", 55, "wait| Infuse:Ice", "", "");
	makeEnemyScoreCard("LivingSpirit", 67, "Attack 1 / Consume:Ice:Stun", "", "");

	//Lurker
	makeEnemyScoreCard("Lurker", 11, "Shield 1 / Consume:Ice:Shield 2", "", "");
	makeEnemyScoreCard("Lurker", 28, "Attack -1", "", "");
	makeEnemyScoreCard("Lurker", 38, "", "", "_1"); makeEnemyScoreCard("Lurker", 38, "", "", "_2");
	makeEnemyScoreCard("Lurker", 61, "Attack 1", "", "");
	makeEnemyScoreCard("Lurker", 64, "Attack 1", "", "");
	makeEnemyScoreCard("Lurker", 41, "wait| Consume:Ice:Strengthen Self | Attack -1 / Wound", "", "");
	makeEnemyScoreCard("Lurker", 23, "Shield 1 | Attack -1 | Infuse:Ice", "", "");

	//Merciless Oversser
	makeEnemyScoreCard("MercilessOverseerBoss", 11, "", "Boss", "");
	makeEnemyScoreCard("MercilessOverseerBoss", 14, "", "Boss", "");
	makeEnemyScoreCard("MercilessOverseerBoss", 17, "", "Boss", "");
	makeEnemyScoreCard("MercilessOverseerBoss", 85, "", "Boss", "");
	makeEnemyScoreCard("MercilessOverseerBoss", 79, "", "Boss", "");
	makeEnemyScoreCard("MercilessOverseerBoss", 73, "", "Boss", "");
	makeEnemyScoreCard("MercilessOverseerBoss", 36, "", "Boss", "");
	makeEnemyScoreCard("MercilessOverseerBoss", 52, "", "Boss", "");

	//Night Demon
	makeEnemyScoreCard("NightDemon", 4, "Attack -1 | Infuse:Dark", "", "");
	makeEnemyScoreCard("NightDemon", 7, "Attack -1 | Consume:Dark:Invisible Self", "", "");
	makeEnemyScoreCard("NightDemon", 22, "wait| Infuse:Dark", "", "");
	makeEnemyScoreCard("NightDemon", 26, "Attack -2 / Consume:Dark:Muddle", "", "");
	makeEnemyScoreCard("NightDemon", 46, "Attack 1 / Consume:Dark:Attack 1", "", "");
	makeEnemyScoreCard("NightDemon", 41, "Attack 1 | Infuse:Dark", "", "");
	makeEnemyScoreCard("NightDemon", 35, "Attack -1 | Attack -1 / Pierce 2 | Consume:Light:Curse Self", "", "");
	makeEnemyScoreCard("NightDemon", 15, "Attack -1 | Consume:Any:Dark", "", "");

	//Ooze
	makeEnemyScoreCard("Ooze", 36, "Attack -1", "", "");
	makeEnemyScoreCard("Ooze", 57, "", "", "");
	makeEnemyScoreCard("Ooze", 59, "Attack 0 / Poison", "", "");
	makeEnemyScoreCard("Ooze", 66, "Attack 1", "", "_1");
	makeEnemyScoreCard("Ooze", 94, "wait| Suffer 2", "", ""); makeEnemyScoreCard("Ooze", 94, "wait| Suffer 2", "", "A");
	makeEnemyScoreCard("Ooze", 66, "Heal 2", "", "_2");
	makeEnemyScoreCard("Ooze", 85, "Attack 1", "", "");

	//Prime Demon
	makeEnemyScoreCard("PrimeDemonBoss", 11, "", "Boss", "");
	makeEnemyScoreCard("PrimeDemonBoss", 14, "", "Boss", "");
	makeEnemyScoreCard("PrimeDemonBoss", 17, "", "Boss", "");
	makeEnemyScoreCard("PrimeDemonBoss", 85, "", "Boss", "");
	makeEnemyScoreCard("PrimeDemonBoss", 79, "", "Boss", "");
	makeEnemyScoreCard("PrimeDemonBoss", 73, "", "Boss", "");
	makeEnemyScoreCard("PrimeDemonBoss", 36, "", "Boss", "");
	makeEnemyScoreCard("PrimeDemonBoss", 52, "", "Boss", "");

	//Rending Drake
	makeEnemyScoreCard("RendingDrake", 12, "Attack -1", "", "");
	makeEnemyScoreCard("RendingDrake", 13, "Attack -1 |fill| Attack -1", "", "");
	makeEnemyScoreCard("RendingDrake", 25, "", "", "");
	makeEnemyScoreCard("RendingDrake", 39, "Attack 1", "", "");
	makeEnemyScoreCard("RendingDrake", 54, "Attack -1 / Poison", "", "");
	makeEnemyScoreCard("RendingDrake", 59, "Attack 1", "", "");
	makeEnemyScoreCard("RendingDrake", 72, "Attack -1 | Attack -1 | Attack -2", "", "");
	makeEnemyScoreCard("RendingDrake", 6, "Shield 2 | Heal 2 | Strengthen", "", "");

	//Savvas Icestorm
	makeEnemyScoreCard("SavvasIcestorm", 70, "Attack 1", "", "");
	makeEnemyScoreCard("SavvasIcestorm", 98, "wait| Infuse:Wind", "", "_1"); makeEnemyScoreCard("SavvasIcestorm", 98, "wait| Infuse:Ice", "", "_2");
	makeEnemyScoreCard("SavvasIcestorm", 19, "Attack -1 | Infuse:Ice", "", "");
	makeEnemyScoreCard("SavvasIcestorm", 14, "", "", "_1");
	makeEnemyScoreCard("SavvasIcestorm", 14, "Shield 4", "", "_2");
	makeEnemyScoreCard("SavvasIcestorm", 47, "Attack -1 | Infuse:Wind", "", "");
	makeEnemyScoreCard("SavvasIcestorm", 35, "Attack -1 | Infuse:Ice", "", "");

	//Savvas Lavafloww
	makeEnemyScoreCard("SavvasLavaflow", 97, "wait| Infuse:Fire", "", "_1"); makeEnemyScoreCard("SavvasLavaflow", 97, "wait| Infuse:Grass", "", "_2");
	makeEnemyScoreCard("SavvasLavaflow", 22, "Attack -1", "", "");
	makeEnemyScoreCard("SavvasLavaflow", 68, "Attack 1 | Infuse:Grass", "", "_1");
	makeEnemyScoreCard("SavvasLavaflow", 41, "Attack -1 / Consume:Grass:Attack 2 / Immobilize", "", "");
	makeEnemyScoreCard("SavvasLavaflow", 51, "", "", "");
	makeEnemyScoreCard("SavvasLavaflow", 31, "", "", "");
	makeEnemyScoreCard("SavvasLavaflow", 68, "Attack -1 | Infuse:Fire", "", "_2");

	//Spiiting Drake
	makeEnemyScoreCard("SpittingDrake", 32, "Attack -1", "", "");
	makeEnemyScoreCard("SpittingDrake", 52, "", "", "");
	makeEnemyScoreCard("SpittingDrake", 57, "Attack -1", "", "");
	makeEnemyScoreCard("SpittingDrake", 27, "Attack 0 / Poison", "", "");
	makeEnemyScoreCard("SpittingDrake", 87, "Attack 1", "", "");
	makeEnemyScoreCard("SpittingDrake", 89, "Attack -2 / Stun", "", "_1");
	makeEnemyScoreCard("SpittingDrake", 6, "Shield 2 | Heal 2 | Strengthen", "", "");
	makeEnemyScoreCard("SpittingDrake", 89, "Attack -2 / Poison", "", "_2");

	//Stone Golem
	makeEnemyScoreCard("StoneGolem", 11, "", "", "");
	makeEnemyScoreCard("StoneGolem", 28, "Attack 0 | Suffer 1", "", "_1");
	makeEnemyScoreCard("StoneGolem", 51, "Attack -1", "", "");
	makeEnemyScoreCard("StoneGolem", 65, "", "", "");
	makeEnemyScoreCard("StoneGolem", 72, "Attack 1 | Suffer 2", "", "");
	makeEnemyScoreCard("StoneGolem", 90, "Attack 1", "", "");
	makeEnemyScoreCard("StoneGolem", 83, "Attack -1", "", "");
	makeEnemyScoreCard("StoneGolem", 28, "Attack -2 | Immobilize", "", "_2");

	//Sun Demon
	makeEnemyScoreCard("SunDemon", 17, "", "", "");
	makeEnemyScoreCard("SunDemon", 36, "wait| Infuse:Light", "", ""); makeEnemyScoreCard("SunDemon", 36, "wait| Infuse:Light", "", "A");
	makeEnemyScoreCard("SunDemon", 68, "Attack 1 | Infuse:Light", "", "");
	makeEnemyScoreCard("SunDemon", 73, "Attack 1 | Consume:Light:Heal 3", "", "");
	makeEnemyScoreCard("SunDemon", 95, "", "", "");
	makeEnemyScoreCard("SunDemon", 88, "Attack -1 | Consume:Dark:Muddle Self", "", "");
	makeEnemyScoreCard("SunDemon", 50, "Attack 0 | Consume:Any:Light", "", "");

	//The Betrayer
	makeEnemyScoreCard("TheBetrayerBoss", 11, "", "Boss", "");
	makeEnemyScoreCard("TheBetrayerBoss", 14, "", "Boss", "");
	makeEnemyScoreCard("TheBetrayerBoss", 17, "", "Boss", "");
	makeEnemyScoreCard("TheBetrayerBoss", 85, "", "Boss", "");
	makeEnemyScoreCard("TheBetrayerBoss", 79, "", "Boss", "");
	makeEnemyScoreCard("TheBetrayerBoss", 73, "", "Boss", "");
	makeEnemyScoreCard("TheBetrayerBoss", 36, "", "Boss", "");
	makeEnemyScoreCard("TheBetrayerBoss", 52, "", "Boss", "");

	//The Colorless
	makeEnemyScoreCard("TheColorlessBoss", 11, "", "Boss", "");
	makeEnemyScoreCard("TheColorlessBoss", 14, "", "Boss", "");
	makeEnemyScoreCard("TheColorlessBoss", 17, "", "Boss", "");
	makeEnemyScoreCard("TheColorlessBoss", 85, "", "Boss", "");
	makeEnemyScoreCard("TheColorlessBoss", 79, "", "Boss", "");
	makeEnemyScoreCard("TheColorlessBoss", 73, "", "Boss", "");
	makeEnemyScoreCard("TheColorlessBoss", 36, "", "Boss", "");
	makeEnemyScoreCard("TheColorlessBoss", 52, "", "Boss", "");

	//The Gloom
	makeEnemyScoreCard("TheGloomBoss", 11, "", "Boss", "");
	makeEnemyScoreCard("TheGloomBoss", 14, "", "Boss", "");
	makeEnemyScoreCard("TheGloomBoss", 17, "", "Boss", "");
	makeEnemyScoreCard("TheGloomBoss", 85, "", "Boss", "");
	makeEnemyScoreCard("TheGloomBoss", 79, "", "Boss", "");
	makeEnemyScoreCard("TheGloomBoss", 73, "", "Boss", "");
	makeEnemyScoreCard("TheGloomBoss", 36, "", "Boss", "");
	makeEnemyScoreCard("TheGloomBoss", 52, "", "Boss", "");

	//The Sightless Eye
	makeEnemyScoreCard("TheSightlessEyeBoss", 11, "", "Boss", "");
	makeEnemyScoreCard("TheSightlessEyeBoss", 14, "", "Boss", "");
	makeEnemyScoreCard("TheSightlessEyeBoss", 17, "", "Boss", "");
	makeEnemyScoreCard("TheSightlessEyeBoss", 85, "", "Boss", "");
	makeEnemyScoreCard("TheSightlessEyeBoss", 79, "", "Boss", "");
	makeEnemyScoreCard("TheSightlessEyeBoss", 73, "", "Boss", "");
	makeEnemyScoreCard("TheSightlessEyeBoss", 36, "", "Boss", "");
	makeEnemyScoreCard("TheSightlessEyeBoss", 52, "", "Boss", "");

	//Vermling Scout
	makeEnemyScoreCard("VermlingScout", 29, "Attack -1", "", "");
	makeEnemyScoreCard("VermlingScout", 40, "Attack -1", "", "");
	makeEnemyScoreCard("VermlingScout", 53, "", "", "");
	makeEnemyScoreCard("VermlingScout", 54, "Attack 0 / Poison", "", "");
	makeEnemyScoreCard("VermlingScout", 69, "Attack 1", "", "");
	makeEnemyScoreCard("VermlingScout", 92, "Attack 2 / Poison", "", "");
	makeEnemyScoreCard("VermlingScout", 79, "Attack -1", "", "");
	makeEnemyScoreCard("VermlingScout", 35, "", "", "");

	//Vermling Shaman
	makeEnemyScoreCard("VermlingShaman", 8, "Attack 1 / Disarm", "Shaman", "_1");
	makeEnemyScoreCard("VermlingShaman", 8, "Attack 0 / Immobilize", "Shaman", "_2");
	makeEnemyScoreCard("VermlingShaman", 23, "", "Shaman", ""); makeEnemyScoreCard("VermlingShaman", 23, "", "Shaman", "A");
	makeEnemyScoreCard("VermlingShaman", 62, "", "Shaman", "");
	makeEnemyScoreCard("VermlingShaman", 74, "Attack 1", "Shaman", "");
	makeEnemyScoreCard("VermlingShaman", 89, "wait| Bless Self", "Shaman", "");
	makeEnemyScoreCard("VermlingShaman", 9, "Attack -1", "Shaman", "");

	//Wind Demon
	makeEnemyScoreCard("WindDemon", 9, "Attack -1 | Heal 1 | Consume:Wind:Invisible Self", "", "");
	makeEnemyScoreCard("WindDemon", 21, "wait| Infuse:Wind", "", ""); makeEnemyScoreCard("WindDemon", 21, "wait| Infuse:Wind", "", "A");
	makeEnemyScoreCard("WindDemon", 29, "Attack -1", "", "");
	makeEnemyScoreCard("WindDemon", 37, "Attack 0 / Consume:Wind:Attack 1", "", "");
	makeEnemyScoreCard("WindDemon", 43, "Attack 1", "", "_1");
	makeEnemyScoreCard("WindDemon", 43, "", "", "_2");
	makeEnemyScoreCard("WindDemon", 2, "Shield 1 | Attack -1 | Consume:Any:Wind", "", "");

	//Winged Horror
	makeEnemyScoreCard("WingedHorrorBoss", 11, "", "Boss", "");
	makeEnemyScoreCard("WingedHorrorBoss", 14, "", "Boss", "");
	makeEnemyScoreCard("WingedHorrorBoss", 17, "", "Boss", "");
	makeEnemyScoreCard("WingedHorrorBoss", 85, "", "Boss", "");
	makeEnemyScoreCard("WingedHorrorBoss", 79, "", "Boss", "");
	makeEnemyScoreCard("WingedHorrorBoss", 73, "", "Boss", "");
	makeEnemyScoreCard("WingedHorrorBoss", 36, "", "Boss", "");
	makeEnemyScoreCard("WingedHorrorBoss", 52, "", "Boss", "");

	//
//	makeEnemyScoreCard("", , "", "", "");
}

function enemyAction(ID) {
	//Clear Array
	actionArray.length = 0;

	//Get Array Values
	const enemy = ID.split("_")[0];
	const action = ID.split("_")[2];
	const type = ID.split("_")[1];
	const attackValue = document.getElementById(enemy + "_" + action + "_" + type);

	//Get Pierce or Retaliate values
	var amount;
	for (let child of document.getElementById(enemy + "_" + type).children) {
		if (child.tagName === "IMG") { amount = child.dataset.amount; }
	}

	//Make Array
	actionArray.push(action, enemy, attackValue.textContent, type, amount);

	//Set Cursor
	document.documentElement.style.cursor = `url("${ './Images/Icons/' + action +'_Cursor.png' }"), auto`;
}

function flipEnemy(element) {
	//Flip Enemy Score Card
	var scoreArray = [];
	var i = enemy_cards.findIndex(row => row.includes(element.id.split("_")[0]) );

	//Make Array of Enemy Scores
	for (j=0; j<enemy_cards[i][1].length; j++) {
		if (enemy_cards[i][1][j][6] === true) {
			var card = enemy_cards[i][1][j][1] + enemy_cards[i][1][j][5];
			scoreArray.push(card);
		}
	}

	//Reset Attack Values
	for (index=0; index<enemy_types.length; index++) {
		var enemyAttack = document.getElementById(enemy_cards[i][0] + "_Attack" + enemy_types[index]);
		enemyAttack.textContent = Number(enemyAttack.dataset.baseAttack);
		enemyAttack.dataset.extraAttack = Number(enemyAttack.textContent);
	}

	//Make Next Action Button clickable again
	document.getElementById(enemy_cards[i][0] + "_Normal_Attack_Btn").style.pointerEvents = "auto";
	document.getElementById(enemy_cards[i][0] + "_Elite_Attack_Btn").style.pointerEvents = "auto";

	//Shuffle Cards if hand is empty
	if (scoreArray.length === 0) {
		shuffleScores(element);
	}

	//Randomly select a Number/Score
	var number = getRandomIntExclusive(0,scoreArray.length);
	var score = scoreArray[number];
	enemy_cards[i][2] = score;

	//Get/Combine Attack Value(s)
	var jndex = 0;
	for (j=0; j<enemy_cards[i][1].length; j++) {
		var card = enemy_cards[i][1][j][1] + enemy_cards[i][1][j][5];
		if (card === score) {
			enemy_cards[i][1][j][6] = false;
			enemy_cards[i][3].length = 0;
			for ( k=0; k<enemy_cards[i][1][j][2].length; k++) {
				//Get Array of Enemy Attack values
				enemy_cards[i][3].push(enemy_cards[i][1][j][2][k]);
			}
			break;
		}
		jndex++;
	}

	//Update Displayed Card/Values
	var enemyScoreImage = document.getElementById(enemy_cards[i][0] + "_Score_Img");
	if (jndex != 8) { enemyScoreImage.src = enemy_cards[i][1][jndex][4]; }

	//Reset Shield to base value
	const enemyBox = document.getElementById("Enemy_Box");
	for (let child of enemyBox.children) {
		if (child.children[0].children[0].id.split("_")[0] === element.id.split("_")[0]) {
			var enemy = document.getElementById(child.children[0].children[0].id + "_Shield");
			enemy.textContent = enemy.dataset.shield;
		}
	}

	//+1 Action Counter
	const actionCount = document.getElementById(element.id.split("_")[0] + "_Action" );
	actionCount.textContent = 0;

	nextAction(document.getElementById(enemy_cards[i][0] + "_Card") );
}

function nextAction(ID) {
	//Start exists incase I want to add some Element Consumption
	var start = 0;
	ID.dataset.infliction = null;
	for (i=0; i<enemy_cards.length; i++) {
		//If Action exists
		if (enemy_cards[i][3][start] && enemy_cards[i][0] === ID.id.split("_")[0]) {
			if(document.getElementById(enemy_cards[i][0] + "_Normal_Attack_Btn").style.pointerEvents === "none") {
				break;
			}
			else {
				//+1 Action Counter
				const actionCount = document.getElementById(ID.id.split("_")[0] + "_Action" );
				actionCount.textContent = Number(actionCount.textContent) + 1;

				var act = enemy_cards[i][3][start];
				var nextFlag = false;
				if (enemy_cards[i][3][start+1]) { nextFlag = true; }

				//If no next action then make clicker temporarily unclickable
				if (!enemy_cards[i][3][start+1]) {
					document.getElementById(enemy_cards[i][0] + "_Normal_Attack_Btn").style.pointerEvents = "none";
					document.getElementById(enemy_cards[i][0] + "_Elite_Attack_Btn").style.pointerEvents = "none";
				}

				//If Attack and no Consume
				if (act.includes("Attack") && !enemy_cards[i][3][start].includes("Consume") ) {
					var attack = Number(act.replace("Attack ", "") );
					//If Attack and Pierce
					inflictsPierce = 0;
					if (nextFlag && enemy_cards[i][3][start+1].includes("Pierce") ) {
						inflictsPierce = enemy_cards[i][3][start+1].split(" ")[1];
						//Remove It
						enemy_cards[i][3].splice(start+1,1);
					}

					//If Attack and Neg Condition
					else if (conditions[1][1].includes(enemy_cards[i][3][start+1]) && !enemy_cards[i][3][start+1].includes("Consume") ) {
						ID.dataset.infliction = enemy_cards[i][3][start+1].replace(" ","");
						//Remove It
						enemy_cards[i][3].splice(start+1,1);
					}

					//Add New Attack Value to Displayed Enemy Attack Value
					for (index=0; index<enemy_types.length; index++) {
						var enemyAttack = document.getElementById(enemy_cards[i][0] + "_Attack" + enemy_types[index]);
						enemyAttack.textContent = Number(enemyAttack.dataset.baseAttack) + attack;
						enemyAttack.dataset.extraAttack = Number(enemyAttack.textContent);
					}
				}

				//If Consume to Attack
				else if (act.includes("Consume") && act.includes("Attack") && !act.includes("Any") ) {
					//Get Element
					const element = document.getElementById(act.split(":")[1]);
					const hasElement = document.getElementById("Inert").querySelector(`:scope > [id*="${element.id}"]`) !== null;

					//If Inert Box does not have Element then Consume it and do thing
					if (!hasElement) {
						//Chanage Attack Value
						var attack = 0;
						attack = Number(act.split(":")[2].replace("Attack ", "") );

						//If Attack Effect(Neg)
						if (nextFlag && conditions[1][1].includes(enemy_cards[i][3][start+1]) ) {
							ID.dataset.infliction = enemy_cards[i][3][start+1].replace(" ","");
							//Remove It
							enemy_cards[i][3].splice(start+1,1);
						}

						//Add New Attack Value to Displayed Enemy Attack Value
						for (index=0; index<enemy_types.length; index++) {
							var enemyAttack = document.getElementById(enemy_cards[i][0] + "_Attack" + enemy_types[index]);
							enemyAttack.textContent = Number(enemyAttack.dataset.baseAttack) + attack;
							enemyAttack.dataset.extraAttack = Number(enemyAttack.textContent);
						}

						//Consume It
						moveElementTo(element.id, "Inert");
					}
				}

				//If Consume to anything else
				else if (act.includes("Consume") ) {
					//Get Element
					const element = document.getElementById(act.split(":")[1]);

					//Consume X to X
					if (elements.includes(act.split(":")[1]) && elements.includes(act.split(":")[2]) ) {
						const element02 = document.getElementById(act.split(":")[2]);
						moveElementTo(element.id, "Inert");
						moveElementTo(element02.id, "Strong");
					}

					//Consume Any to X
					if (act.includes("Any") && (document.getElementById("Strong").children.length > 0 || document.getElementById("Waning").children.length > 0) ) {
						//Randomly Choose an active Element to Consume
						var newElement = false;
						var random; var stoper = 0;
						do {
							random = getRandomIntExclusive(0, 5);
							if (!elements[random].includes(element.id) && (document.getElementById("Waning").querySelector(`:scope > [id*="${elements[random]}"]`) !== null || document.getElementById("Strong").querySelector(`:scope > [id*="${elements[random]}"]`) !== null) ) {
								newElement = true;
							}
							if (stoper > 6 ) { break; }
							stoper++;
						} while (!newElement);
						moveElementTo(elements[random], "Inert");

						//Check if Inert has Infused Element and move it if so
						var hasElement = document.getElementById("Inert").querySelector(`:scope > [id*="${element.id}"]`) !== null;
						if (hasElement) { moveElementTo(element.id, "Strong"); }

						//If not check Waning and repeat
						else {
							hasElement = document.getElementById("Waning").querySelector(`:scope > [id*="${element.id}"]`) !== null;
							if (hasElement) { moveElementTo(element.id, "Strong"); }
						}
					}

					//Consume to Suffer
					if (act.includes("Suffer")) {
						const enemyBox = document.getElementById("Enemy_Box");
						for (let child of enemyBox.children) {
							if (child.children[0].children[0].id.split("_")[0] === ID.id.split("_")[0]) {
								var enemy = document.getElementById(child.children[0].children[0].id + "_Health");
								if (Number(enemy.textContent) - 1 >= 0) { enemy.textContent = Number(enemy.textContent) - 1; }
							}
						}
					}

					//Consume to Heal
					if (act.includes("Heal")) {
						const enemyBox = document.getElementById("Enemy_Box");
						for (let child of enemyBox.children) {
							if (child.children[0].children[0].id.split("_")[0] === ID.id.split("_")[0]) {
								var enemy = document.getElementById(child.children[0].children[0].id + "_Health");
								for (p=0; p<Number(act.split(":")[2].replace("Heal ","")); p++) {
									if (Number(enemy.textContent) + 1 <= enemy.dataset.health) {
										enemy.textContent = Number(enemy.textContent) + 1;
									}
								}
							}
						}
					}

					//Consume to Shield
					if (act.includes("Shield")) {
						const enemyBox = document.getElementById("Enemy_Box");
						for (let child of enemyBox.children) {
							if (child.children[0].children[0].id.split("_")[0] === ID.id.split("_")[0]) {
								var enemy = document.getElementById(child.children[0].children[0].id + "_Shield");
								enemy.textContent = Number(enemy.textContent) + 1;
							}
						}
					}

					//Consume to Apply Condition to Self
					if (act.includes("Self")) {
						var condition = act.split(":")[2].split(" ")[0].trim();
						if (curses < 10 && condition === "Curse" ) {
							enemyModifiers[0].push(condition);
							enemyModifiers[1].push(true);
							curses++;
						}
						//Other Conditions
						else {
							const enemyBox = document.getElementById("Enemy_Box");
							for (let child of enemyBox.children) {
								if (child.children[0].children[0].id.split("_")[0] === ID.id.split("_")[0]) {
									var enemyConBox = document.getElementById(child.children[0].children[0].id + "_All_Conditions");
									var hasCon = enemyConBox.querySelector(`:scope > [id*="${condition}"]`) !== null;
									if (!hasCon) {
										var conElement = document.getElementById(condition);
										var clonedCondition = conElement.cloneNode(true);
										clonedCondition.id = condition +"_"+ child.children[0].children[0].id.split("_")[0];
										clonedCondition.style.height = "30px"; clonedCondition.style.cursor = "pointer";
										enemyConBox.appendChild(clonedCondition);
									}
								}
							}
						}
					}

					//Consume Element
					moveElementTo(element.id, "Inert");
				}

				//If Shield
				else if (act.includes("Shield") ) {
					const enemyBox = document.getElementById("Enemy_Box");
					for (let child of enemyBox.children) {
						if (child.children[0].children[0].id.split("_")[0] === ID.id.split("_")[0]) {
							var enemy = document.getElementById(child.children[0].children[0].id + "_Shield");
							enemy.textContent = Number(enemy.textContent) + Number(act.replace("Shield ", "") );
						}
					}
				}

				//If Heal
				else if (act.includes("Heal") ) {
					const enemyBox = document.getElementById("Enemy_Box");
					for (let child of enemyBox.children) {
						if (child.children[0].children[0].id.split("_")[0] === ID.id.split("_")[0]) {
							var enemy = document.getElementById(child.children[0].children[0].id + "_Health");
							//Only do if End product is below starting max health
							for (p=0; p<Number(act.split(":")[2].replace("Heal ","")); p++) {
								if (Number(enemy.textContent) + 1 <= enemy.dataset.health) {
									enemy.textContent = Number(enemy.textContent) + 1;
								}
							}
						}
					}
				}

				//If Pos Effect
				else if (conditions[0][1].includes(act) ) {
					const condition = document.getElementById(act);
					const enemyBox = document.getElementById("Enemy_Box");
					for (let child of enemyBox.children) {
						if (child.children[0].children[0].id.split("_")[0] === ID.id.split("_")[0]) {
							var enemyConBox = document.getElementById(child.children[0].children[0].id + "_All_Conditions");
							var hasCon = enemyConBox.querySelector(`:scope > [id*="${enemy_cards[i][3][0]}"]`) !== null;
							if (!hasCon) {
								const clonedCondition = document.getElementById(act).cloneNode(true);
								clonedCondition.id = act +"_"+ ID.id; clonedCondition.style.height = "30px"; clonedCondition.style.cursor = "pointer";
								enemyConBox.appendChild(clonedCondition);
							}
						}
					}
				}

				//If Infuse
				else if (act.includes("Infuse") ) {
					const element = document.getElementById(act.split(":")[1]);
					moveElementTo(element.id, "Strong");
				}

				//If Suffer
				else if (act.includes("Suffer")) {
					const enemyBox = document.getElementById("Enemy_Box");
					for (let child of enemyBox.children) {
						if (child.children[0].children[0].id.split("_")[0] === ID.id.split("_")[0]) {
							var enemy = document.getElementById(child.children[0].children[0].id + "_Health");
							if (Number(enemy.textContent) - 1 > 0) { enemy.textContent = Number(enemy.textContent) - 1; }
						}
					}
				}

				//Consume to Apply Condition to Self
				if (act.includes("Self")) {
					var condition = act.split(" ")[0].trim();
					console.log(condition);
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
	addAttackModifer(modType);
}

function shuffleScores(element) {
	//Reset Score Card to base info
	for (i=0; i<enemy_cards.length; i++ ) {
		if (enemy_cards[i][0] === element.id.split("_")[0]) {
			for (j=0; j<enemy_cards[i][1].length; j++) {
				enemy_cards[i][1][j][6] = true;
			}

			//Reset Attack Value
			var enemyScoreImage = document.getElementById(enemy_cards[i][0] + "_Score_Img");
			enemyScoreImage.src = "./Images/Monster_Back.jpg";
			document.getElementById(enemy_cards[i][0] + "_Attack" + enemy_types[0]).textContent = document.getElementById(enemy_cards[i][0] + "_Normal_A").textContent.replace("A:","");
			document.getElementById(enemy_cards[i][0] + "_Attack" + enemy_types[1]).textContent = document.getElementById(enemy_cards[i][0] + "_Elite_A").textContent.replace("A:","");

			//+1 Action Counter
			const actionCount = document.getElementById(element.id.split("_")[0] + "_Action" );
			actionCount.textContent = 0;

			break;
		}
	}
}

function flipEnemyAll() {
	var index = 0;
	const enemyBox = document.getElementById("Enemy_Box");
	for (let child of enemyBox.children) {
		const enemyCard = document.getElementById(child.children[0].children[0].id.split("_")[0] + "_Card" );
		flipEnemy(enemyCard);
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
var number;
var modType = "EnemyModDeck";

const enemyModifiers = [
	[0,0,0,0,0,0,+1,+1,+1,+1,+1,-1,-1,-1,-1,-1,-2,+2,"Null","Crit"],
	[true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true],
];

function flipEnemyModifierDeck() {
	//Random Number
	do {
		number = getRandomIntExclusive(0,enemyModifiers[0].length);
	} while (!enemyModifiers[1][number] && enemyModifiers[1].includes(true) );

	//Make Display match selected Number/Card
	if (enemyModifiers[1][number]) {
		const modDeck = document.getElementById("EnemyModDeck");
		const modDeckOld = document.getElementById("EnemyModDeckOld");
		modDeckOld.src = modDeck.src;
		modDeckOld.dataset.add = modDeck.dataset.add;
		modDeck.src = "./Images/AttackModifiers/" + enemyModifiers[0][number] + ".png";
		modDeck.dataset.add = enemyModifiers[0][number];
	}
	enemyModifiers[1][number] = false;
	var attack = enemyModifiers[0][number];

	//Shuffle at End of Cards
	if (enemyModifiers[1].every(value => value === false) ) {
		shuffleEnemyModifierDeck();
	}

	//Add New Attack Value to Displayed Enemy Attack Value(s)
	addAttackModifer(modType);

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

		//If Player is not dead update health
		if (newHealth !== 0) {
			//Get Player Conditions
			var conArray = [];
			for (p=0; p<document.getElementById(ID.id + "_Negatives").children.length; p++) {
				conArray.push(document.getElementById(ID.id + "_Negatives").children[p].id.split("_")[0] );
			}

			//See if Player has Negative Conditions
			const negBox = document.getElementById(ID.id + "_Negatives");
			if (negBox.querySelector('[id*="Poison"]') !== null) {
				attackValue++;
			}

			//Make Player new Health Continued
			var shield = Number(document.getElementById(ID.id + "_Shield").textContent);

			//Apply Pierce from Stat Card
			var specialFlag = false;
			if (actionArray[4] > 70 && actionArray[4] < 80) {
				var pierce = actionArray[4].split("")[1];
				for (i=1; i<=pierce; i++) {
					newHealth = newHealth - 1;
					attackValue--;
					if (newHealth === 0 || attackValue === 0) { break; }
				}
				health.textContent = newHealth;
				specialFlag = true;
			}
			if (actionArray[4] > 80 && actionArray[4] < 90) { specialFlag = true; }

			//Apply Pierce from Score Card
			if (inflictsPierce > 0) {
				var pierce = inflictsPierce;
				for (i=1; i<=pierce; i++) {
					newHealth = newHealth - 1;
					attackValue--;
					if (newHealth === 0 || attackValue === 0) { break; }
				}
				health.textContent = newHealth;
				inflictsPierce = 0;
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

			//Apply Negative Condition from Enemy Stat card if Applicable
			var enemyConditions = document.getElementById(actionArray[1] + "_" + actionArray[3]);
			for (p=0; p<enemyConditions.children.length; p++) {
				let child = enemyConditions.children[p];
				if (child.id.includes("Neg") && !conArray.includes(child.id.split("_")[2]) && !specialFlag ) {
					const clonedCondition = child.cloneNode(true);
					clonedCondition.id = child.id.split("_")[2] +"_"+ ID.id; clonedCondition.style.height = "50px"; clonedCondition.style.cursor = "pointer";
					document.getElementById(ID.id + "_Negatives").appendChild(clonedCondition);
				}
			}

			//Aplly Condition from Score Card if Applicable
			const enemyCard = document.getElementById(actionArray[1] + "_Card");
			if (conditions[1][1].includes(enemyCard.dataset.infliction) ) {
				const negConBox = document.getElementById(ID.id + "_Negatives");
				const ncbArray = Array.from(negConBox.children).map(child => child.id);
				//If Player does not have effect, apply it
				if (!ncbArray.includes(enemyCard.dataset.infliction + "_" + ID.id) ) {
					const element = document.getElementById(enemyCard.dataset.infliction);
					const clonedCondition = element.cloneNode(true);
					clonedCondition.id = element.id +"_"+ ID.id; clonedCondition.style.height = "50px"; clonedCondition.style.cursor = "pointer";
					document.getElementById(ID.id + "_Negatives").appendChild(clonedCondition);
				}
			}
		}

		//Clear Array/Cursor
		actionArray.length = 0;
		document.documentElement.style.cursor = "default";
	}
	
	//Remove Player Condition if Clicked
	else if ( (conditions[0][1].includes(clickedElement.id.split("_")[0]) || conditions[1][1].includes(clickedElement.id.split("_")[0]) ) && clickedElement.id.split("_")[1] ) {
		clickedElement.remove();
	}

	//Select Enemy Modifier
	else if (clickedElement.id === "EnemyModDeck") {
		clickedElement.style.border = "3px solid chartreuse";
		document.getElementById("EnemyModDeckOld").style.border = "none";
		addAttackModifer("EnemyModDeck");
		modType = "EnemyModDeck";
	}
	else if (clickedElement.id === "EnemyModDeckOld") {
		clickedElement.style.border = "3px solid chartreuse";
		document.getElementById("EnemyModDeck").style.border = "none";
		addAttackModifer("EnemyModDeckOld");
		modType = "EnemyModDeckOld";
	}

	else {
		//Clear Array/Cursor
		actionArray.length = 0;
		document.documentElement.style.cursor = "default";
	}
});

function addAttackModifer(ID) {
	//Add New Attack Value to Displayed Enemy Attack Value(s)
	var attack = document.getElementById(ID).dataset.add;
	for (i=0; i<enemy_stat_cards.length; i++) {
		var enemyName = enemy_stat_cards[i].replace(" ","");
		for (index=0; index<enemy_types.length; index++) {
			var enemyAttack = document.getElementById(enemyName + "_Attack" + enemy_types[index]);
			if (attack != "Null" && attack != "Curse" && attack != "Crit" && attack != "Bless" && enemyAttack) {
				enemyAttack.textContent = Number(enemyAttack.dataset.extraAttack) + Number(attack);
			}
			if ( (attack === "Crit" || attack === "Bless" ) && enemyAttack) {
				enemyAttack.textContent = Number(enemyAttack.dataset.extraAttack) + Number(enemyAttack.dataset.extraAttack);
			}
		}
	}
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










//////////////////////////////
// Extra
//
function getRandomIntExclusive(min, max) {
	return Math.floor(Math.random() * (max - min)) + min;
}

function removeElement(ID) {
	const element = document.getElementById(ID.id);
}

scoreArray = [];
function getScores() {
	//Get Enemy Scores
	scoreArray.length = 0;
	for (i=0; i<enemy_cards.length; i++) {
		if (enemy_cards[i][2] != 0) {
			scoreArray.push( [enemy_cards[i][0] + "_Card", enemy_cards[i][2].split("_")[0].replace("A",""), "99", "2"] );
		}
	}

	//Get Player Scores
	for (i=0; i<selected_characters.length; i++) {
		var playerScore = document.getElementById(selected_characters[i][0] + "_Score");
		var playerScore02 = document.getElementById(selected_characters[i][0] + "_Score02");
		scoreArray.push( [selected_characters[i][0], playerScore.value, playerScore02.value, "1"] );
	}

	//Sort Array by Score 01, Score 02, and then ny if Player or Enemy as player goes before enemy
	scoreArray.sort( (a,b) => a[1] - b[1] || a[2] - b[2] || a[3] - b[3]);
}

var scorePrev = "blah";
function highlightPlay() {
	if (scoreArray.length != 0) {
		//Get New Element
		const element = document.getElementById(scoreArray[0][0]);

		//Apply Wound if applicable
		const negBox = document.getElementById(element.id + "_Negatives");
		if (selected_characters.some(row => row.includes(element.id)) && negBox.querySelector('[id*="Wound"]') !== null ) {
			const health = document.getElementById(element.id + "_Health");
			if (Number(health.textContent) - 1 >= 0) { health.textContent = Number(health.textContent) - 1; }
		}

		//If previous element exists set it border to none
		if (scorePrev && !scorePrev.includes("blah") ) {
			const elementPrev = document.getElementById(scorePrev[0]);
			elementPrev.style.border = "none"
		}

		//"Activate" New Element
		scorePrev = scoreArray.shift();
		element.style.border = "3px solid red"
	}
	//Clear Player Scores
	else {
		//Get Player Scores
		for (i=0; i<selected_characters.length; i++) {
			document.getElementById(selected_characters[i][0] + "_Score").value = "";
			document.getElementById(selected_characters[i][0] + "_Score02").value = "";
		}
	}
}

function nextRound() {
	//Flip and Score
	flipEnemyAll();
	getScores();

	//Move Elements Down
	moveElementsFrom("Waning", "Inert");
	moveElementsFrom("Strong", "Waning");
}














