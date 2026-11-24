///////////////////////////////
// Actions
//
var enemyAttack = false;
var attacker = null;

function Attack(Id) {
	//Set Array
	var name = Id.split("_")[0];
	var splitCount = Id.split("_").length - 1;
	var action;

	//If >2 then Enemy
	if (splitCount > 2) {
		action = Id.split("_")[2].slice(1);
		var attackValue = document.getElementById(name + "_" + Id.split("_")[1] + "_" + Id.split("_")[2]);
		enemyAttack = true;
		attacker = name;
		attackerType = 1;
		//Set attacker type to elite
		if (Id.split("_")[2].at(0) === "e" ) {
			attackerType = 2;
		}
	}

	//If <2 then Player
	else {
		var action = Id.split("_")[1];
		var attackValue = document.getElementById(name + "_" + action);
		enemyAttack = false;
		attacker = null;
		attackerType = null;
	}

	//Set Cursor
	document.documentElement.style.cursor = `url("${ './Images/Icons/Cursors/' + action +'_Cursor.png' }"), auto`;
	follower.innerText = attackValue.textContent;
	follower.style.display = "block";

	attackMode = true;
}

function addAttribute(element) {
	var selected = document.getElementById(element.id);
	var attribute = Number(selected.textContent);
	attribute++;
	selected.textContent = attribute;
}

function subAttribute(element) {
	var selected = document.getElementById(element.id);
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
	selected.textContent = attribute;
}

function applyCardAttackAction() {
	action_conditions = [];
	var action = action_array[0];
	
	if (action) {
		//
		document.getElementById("Attack_Info").textContent = action.replace("Fill ", "");

		//Reset Atack Values
		var person = enemy_stat_cards.find(user => user.name === score_array[0][0].split("_")[0]);
		var nAction = document.getElementById(score_array[0][0].split("_")[0] + "_Action_nAttack");
		var eAction = document.getElementById(score_array[0][0].split("_")[0] + "_Action_eAttack");
		nAction.textContent = Number(person.nAttack);
		eAction.textContent = Number(person.eAttack);

		if (action.includes("Fill") ) {
			return;
		}

		//If Attack and No Consume
		if (action.includes("Attack") && !action.includes("Consume") ) {
			//If Attack has Pierce
			cardPierce = 0;
			if (action.includes("Pierce") ) {
				cardPierce = action.at(-1);
			}
			
			//If No Pierce set Negative Condition if Applicable
			else if (conditions[1][1].some(substring => action.includes(substring) ) ) {
				action_conditions.push(action.split("/")[1].replace(" ", "") );
			}

			//Apply Attack
			var attack = action.substring(0, action.indexOf("Attack") + "Attack".length + 3).replace(/[^0-9+\-*/.]/g, "");
			var nAction = document.getElementById(score_array[0][0].split("_")[0] + "_Action_nAttack");
			var eAction = document.getElementById(score_array[0][0].split("_")[0] + "_Action_eAttack");
			nAction.textContent = Number(nAction.textContent) + Number(attack);
			eAction.textContent = Number(eAction.textContent) + Number(attack);;
		}

		//If Attack and Consume and No Any
		else if (action.includes("Attack") && action.includes("Consume")  && !action.includes("Any")) {
			//Get Element
			var element = document.getElementById(action.split(":")[1]);
			var hasElement = document.getElementById("Inert").querySelector(`[id*="${element.id}"]`) !== null;

			//If Inert Box does not have Element then Consume it and do thing
			if (!hasElement) {
				//If No Pierce set Negative Condition if Applicable
				cardPierce = 0;
				if (conditions[1][1].some(substring => action.includes(substring) ) ) {
					action_conditions.push(action.split("/")[1].replace(" ", "") );
				}

				//Apply Attack
				var attack = action.substring(0, action.indexOf("Attack") + "Attack".length + 3).replace(/[^0-9+\-*/.]/g, "");
				var nAction = document.getElementById(score_array[0][0].split("_")[0] + "_Action_nAttack");
				var eAction = document.getElementById(score_array[0][0].split("_")[0] + "_Action_eAttack");
				nAction.textContent = Number(nAction.textContent) + Number(attack);
				eAction.textContent = Number(eAction.textContent) + Number(attack);;
			}
		}

		//Consume
		else if (action.includes("Consume") ) {
			//Detect if Waning/Strong have Elements to Consume
			var waningHas = document.getElementById("Waning").children.length;
			var strongHas = document.getElementById("Strong").children.length;

			//Get Element Boxes
			var inert = document.getElementById("Inert");
			var waning = document.getElementById("Waning");
			var strong = document.getElementById("Strong");

			//Consume Any Element to do Nothing
			if (action.replace(" ", "") === "Consume:Any" && action.split(":").length === 2 && (waningHas > 0 || strongHas > 0) ) {
				//Randomly Choose an active Element to Consume
				var chosen = getRandomElement();
				moveElementTo(chosen, "Inert");
			}

			//Consume Any Element to Attack
			else if (action.includes("Any") && action.includes("Attack")  && (waningHas > 0 || strongHas > 0) ) {
				//Randomly Choose an active Element to Consume
				var chosen = getRandomElement();
				moveElementTo(chosen, "Inert");

				//If Attack has Pierce
				cardPierce = 0;
				if (action.includes("Pierce") ) {
					cardPierce = action.splice(0, -1);
				}
				
				//If No Pierce set Negative Condition if Applicable
				else if (conditions[1][1].some(substring => action.includes(substring) ) ) {
					action_conditions.push(action.split("/")[1].replace(" ", "") );
				}

				//Apply Attack
				var attack = action.substring(0, action.indexOf("Attack") + "Attack".length + 3).replace(/[^0-9+\-*/.]/g, "");
				var nAction = document.getElementById(score_array[0][0].split("_")[0] + "_Action_nAttack");
				var eAction = document.getElementById(score_array[0][0].split("_")[0] + "_Action_eAttack");
				nAction.textContent = Number(nAction.textContent) + Number(attack);
				eAction.textContent = Number(eAction.textContent) + Number(attack);;
			}

			//Consume Any Element to Make New Element
			else if (action.includes("Any") && elements.some(substring => action.split(":")[2].includes(substring) ) && (waningHas > 0 || strongHas > 0) ) {
				//Get Infused Element
				var infuse = document.getElementById(action.split(":")[2]);

				//If Strong does not have Infusion then Infuse
				if (!strong.querySelector(`[id*="${infuse.id}"]`)) {
					//Randomly Choose an active Element to Consume
					var chosen = getRandomElement();
					moveElementTo(chosen, "Inert");
					moveElementTo(infuse.id, "Strong");
				}
			}

			//Consume Element to X
			else if (elements.includes(action.split(":")[1]) ) {
				//Get Consumed Element
				var consume = document.getElementById(action.split(":")[1]);

				//Check if Consumed Element is in Inert, if not then procced
				if(!inert.querySelector(`[id*="${consume.id}"]`)) {
					var index = enemy_score_cards.findIndex(row => row.includes(highlightedTarget.id.split("_")[0]));
					//To Suffer
					if (action.includes("Suffer") ) {
						var enemy = document.getElementById(highlightedTarget.id + "_Health");
						var total = Number(action.split(":")[2].replace("Suffer ", "") );
						for (t=0; t<total; t++) {
							if (Number(enemy.textContent) - 1 >= 0 ) {
								enemy.textContent = Number(enemy.textContent) - 1;
							}
						}
					}

					//To Heal
					if (action.includes("Heal") ) {
						var enemy = document.getElementById(highlightedTarget.id + "_Health");
						var total = Number(action.split(":")[2].replace("Heal ", "") );
						for (t=0; t<total; t++) {
							if (Number(enemy.textContent) + 1 <= enemy_standees[index].maxHealth ) {
								enemy.textContent = Number(enemy.textContent) + 1;
							}
						}
					}

					//To Shield
					if (action.includes("Shield") ) {
						var enemy = document.getElementById(highlightedTarget.id + "_Shield");
						var total = Number(action.split(":")[2].replace("Shield ", "") );
						for (t=0; t<total; t++) {
							enemy.textContent = Number(enemy.textContent) + 1;
						}
					}

					//To Aply Condition to Self
					else if (action.includes("Self") ) {
						//Get new condition
						var condition = action.split(":")[2].split(" ")[0].trim();
						var conditionElement = document.getElementById(condition);
						var conBox = document.getElementById(highlightedTarget.id + "_Conditions");

						//Curse and Bless
						if (curses < 10 && action === "Curse") {
							modifier_deck[0].push(new ModifierCard("Curse") );
							curses++;
							shuffleModifierDeck();
						}
						else if (action === "Bless") {
							modifier_deck[0].push(new ModifierCard("Bless") );
							shuffleModifierDeck();
						}
						//Others
						else {
							//Pos
							if (!enemy_standees[index].posCons.includes(condition) ) {
								addCondition(enemy_standees[index].posCons, conditionElement, conBox)
							}
							//Neg
							else if (!enemy_standees[index].negCons.includes(condition) ) {
								addCondition(enemy_standees[index].negCons, conditionElement, conBox)
							}
						}
					}

					//Consume Element
					moveElementTo(consume.id, "Inert");
				}
			}
		}

		//Self
		else if (action.includes("Self") ) {
			//Get new condition
			var index = enemy_score_cards.findIndex(row => row.includes(highlightedTarget.id.split("_")[0]));
			var condition = action.replace(" Self", "");
			var conditionElement = document.getElementById(condition);
			var conBox = document.getElementById(highlightedTarget.id + "_Conditions");

			//Curse and Bless
			if (curses < 10 && action === "Curse") {
				modifier_deck[0].push(new ModifierCard("Curse") );
				curses++;
				shuffleModifierDeck();
			}
			else if (action === "Bless") {
				modifier_deck[0].push(new ModifierCard("Bless") );
				shuffleModifierDeck();
			}
			//Others
			else {
				//Pos
				if (!enemy_standees[index].posCons.includes(condition) ) {
					addCondition(enemy_standees[index].posCons, conditionElement, conBox)
				}
				//Neg
				else if (!enemy_standees[index].negCons.includes(condition) ) {
					addCondition(enemy_standees[index].negCons, conditionElement, conBox)
				}
			}
		}

		//Suffer
		else if (action.includes("Suffer") ) {
			var enemy = document.getElementById(highlightedTarget.id + "_Health");
			var total = Number(action.replace("Suffer ", "") );
			for (t=0; t<total; t++) {
				if (Number(enemy.textContent) - 1 >= 0 ) {
					enemy.textContent = Number(enemy.textContent) - 1;
				}
			}
		}

		//Infuse
		else if (action.includes("Infuse") ) {
			//Randomly Choose an Active Element to Infuse
			if (action.split(":")[1].includes("Any") ) {
				var random = getRandomIntInclusive(0, 5);
				moveElementTo(elements[random], "Strong");
			}
			//Infuse All
			if (action.split(":")[1].includes("All") ) {
				moveElementsFrom("Inert", "Waning");
				moveElementsFrom("Waning", "Strong");
			}
			//Normal Infuse
			else {
				var element = document.getElementById(action.split(":")[1]);
				moveElementTo(element.id, "Strong");
			}
		}
	}
}



document.addEventListener('click', function(event) {
	//Get Element under mouse that i sbeing targetted
	const clickedElement = event.target;
	const isCtrlOrCmd = event.ctrlKey || event.metaKey;

	//If Attack Mode
	if (attackMode && !clickedElement.id.includes("Btn") && clickedElement.id.includes("Image") ) {
		//Overalls
		var target; var health; var healthValue; var applied_conditions = [];

		//If Enemy Attacking Player
		if (enemyAttack) {
			//Get Player Health
			target = document.getElementById(clickedElement.parentElement.parentElement.id);
			health = document.getElementById(target.id + "_Health");
			healthValue = health.textContent;

			//Get Target in enemy_stat_cards array for refernce
			var index = 0;
			for (i=0; i<enemy_stat_cards.length; i++) {
				if (attacker && enemy_stat_cards[i].name == attacker) {
					index = i; break;
				}
			}

			//If Enemy has status conditions to inflict grab them
			//Normal Enemy Attack
			if (attackerType === 1) {
				applied_conditions.push(getStatConditions(enemy_stat_cards[index].nCon01) );
				applied_conditions.push(getStatConditions(enemy_stat_cards[index].nCon02) );	
			}
			//Elite Enemy Attack
			else if (attackerType === 2) {
				applied_conditions.push(getStatConditions(enemy_stat_cards[index].eCon01) );
				applied_conditions.push(getStatConditions(enemy_stat_cards[index].eCon02) );	
			}
		}

		//If Player Attacking Enemy
		else {
			//Get Enemy Helath
			target = document.getElementById(clickedElement.parentElement.id);
			health = document.getElementById(target.id + "_Health");
			healthValue = health.textContent;
		}

		//Get Targets Shield
		var shield = document.getElementById(target.id + "_Shield").textContent;

		//Everything else if not dead
		if (target && Number(healthValue) != 0 ) {
			//Make New Healt Refernece
			var newHealth = Number(healthValue);
			var attackValue = Number(follower.innerText);

			//Get Target in all_peoples array for refernce
			var index = 0;
			for (i=0; i<all_people.length; i++) {
				if (all_people[i].name == target.id) {
					index = i; break;
				}
			}

			//Apply Posion Damage
			if (all_people[index].negCons.find(con => con.name === "Poison") ) {
				attackValue++;
				if (crit) { attackValue++; }
			}

			//Negative Conditions from Applied Conditions
			for (i=0; i<applied_conditions.length; i++) {
				//Pierce from Stat Card
				if (applied_conditions[i] && applied_conditions[i].includes("Pierce") ) {
					var pierce = Number(applied_conditions[i].at(-1));
					for (i=1; i<=pierce; i++) {
						newHealth--;
						attackValue--;
						if (newHealth === 0 || attackValue === 0) { break; }
					}
				}
			}

			//Pierce from Score Card
			if (cardPierce > 0 && newHealth > 0) {
				for (i=1; i<=cardPierce; i++) {
					newHealth--;
					attackValue--;
					if (newHealth === 0 || attackValue === 0) { break; }
				}
			}

			//Apply Pierce from Player to Enemy if that is the attack order
			if (playerPierce && !enemyAttack && newHealth > 0) {
				var pierce = Number(document.getElementById("playerPierce").textContent);
				for (i=1; i<=pierce; i++) {
					newHealth--;
					attackValue--;
					if (newHealth === 0 || attackValue === 0) { break; }
				}
			}

			//If Health > 0
			if (newHealth > 0) {
				//Calculate Shield
				if (shield !== 0) {
					attackValue -= shield;
					if (attackValue < 0) { attackValue = 0; }
				}

				//Calculate Ward (half incoming damage and round up is removed)
				if (all_people[index].posCons.find(con => con.name === "Ward") ) {
					attackValue = Math.floor(attackValue / 2);
					//Remove Ward
					removeCondition(all_people[index].posCons, "Ward", (all_people[index].name) );
				}
			
				//Attack
				for (i=1; i<=attackValue; i++) {
					newHealth--;
					if (newHealth === 0) { break; }
				}
			}

			//Update Health Visual
			health.textContent = newHealth;


			/////////////////////////////////
			// Apply Conditions to Target

			//Negative Conditions from Applied Conditions
			for (i=0; i<applied_conditions.length; i++) {
				//If target does not have the confition apply it
				if (applied_conditions[i] && !all_people[index].negCons.find(con => con.name === applied_conditions[i]) ) {
					var condition = document.getElementById(applied_conditions[i]);
					var targetBox = document.getElementById(all_people[index].name + "_Conditions");
					addCondition(all_people[index].negCons, condition, targetBox);
				}
			}

			//Negative Conditions from Action Conditions
			for (i=0; i<action_conditions.length; i++) {
				//If target does not have the confition apply it
				if (action_conditions[i] && !all_people[index].negCons.find(con => con.name === action_conditions[i]) ) {
					var condition = document.getElementById(action_conditions[i]);
					var targetBox = document.getElementById(all_people[index].name + "_Conditions");
					addCondition(all_people[index].negCons, condition, targetBox);
				}
			}

			//Apply Condition from Attack Modifier Deck if Applicable
			if (enemyAttack) {
				//Determine what card to use
				var jndex = 0;
				if (selectedModifier && selectedModifier.id.includes("Old") ) { jndex = 3; }
				else { jndex = 2; }

				if (modifier_deck[jndex]) {
					if (modifier_deck[jndex].name.includes("Heal") ) {
						var standee = all_people.find(user => user.name === attacker);
						var sH = Number(highlightedTarget.textContent);
						if (sH < standee.maxHealth) {
							highlightedTarget.textContent = sH++;
						}
					}
					else {
						//If target does not have the confition apply it
						if (!all_people[index].negCons.find(con => con.name === modifier_deck[jndex].effect) ) {
							var condition = document.getElementById(modifier_deck[jndex].effect);
							var targetBox = document.getElementById(all_people[index].name + "_Conditions");
							addCondition(all_people[index].negCons, condition, targetBox);
						}
					}
				}
			}
		}	
	}

	//If Heal Mode
	else if (healMode && !clickedElement.id.includes("Btn") && clickedElement.id.includes("Image") ) {
		//Overalls
		var name = clickedElement.id.replace("_Image", "");
		var person = all_people.find(user => user.name === name);
		var target = document.getElementById(name);
		var health = document.getElementById(target.id + "_Health");
		var healthValue = health.textContent;

		//If Poison then only heal that
		if (person.negCons.find(con => con.name === "Poison") ) {
			removeCondition(person.negCons, "Poison", person.name );
		}
		
		//If Wound then heal it
		if (person.negCons.find(con => con.name === "Wound") ) {
			removeCondition(person.negCons, "Wound", person.name );
		}

		//Else heal the amount up to max health
		var newHealth = Number(health.textContent);
		for (i=0; i<Number(follower.textContent); i++) {
			newHealth++;
			if (person.maxHealth === newHealth) {
				health.textContent = newHealth;
				break;
			}
		}
	}

});



//Heal Mode



//Other
function playerPierceToggle(ID) {
	var button = document.getElementById(ID);
	if (playerPierce) {
		playerPierce = false;
		button.style.border = "none";
	}
	else {
		playerPierce = true;
		button.style.border = "3px solid chartreuse";
		button.style.borderRadius = "50%";
	}
}


//Switch Case for Conditions
function getStatConditions(value) {
	switch (value) {
		case 1:
			return "Wound";	
		case 2:
			return "Poison";
		case 3:
			return "Immobilize";
		case 4:
			return "Disarm";
		case 5:
			return "Stun";
		case 6:
			return "Muddle";
		case 9:
			return "Curse";
		default:
			if (value > 70 && value < 80) { return "Pierce" + String(value).split("")[1]; }
			else { return null; }
	}
}
















