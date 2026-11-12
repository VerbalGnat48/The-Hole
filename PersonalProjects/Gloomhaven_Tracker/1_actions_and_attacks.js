///////////////////////////////
// Actions
//
function Attack(Id) {
	//Set Array
	var name = Id.split("_")[0];
	var splitCount = Id.split("_").length - 1;
	var action;

	//If >2 then Enemy
	if (splitCount > 2) {
		action = Id.split("_")[2].slice(1);
		var attackValue = document.getElementById(name + "_" + Id.split("_")[1] + "_" + Id.split("_")[2]);
	}

	//If <2 then Player
	else {
		var action = Id.split("_")[1];
		var attackValue = document.getElementById(name + "_" + action);
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

function applyCardAttackAction() {
	action_conditions = [];
	var action = action_array[0];
	
	if (action) {
		//If Attack and No Consume
		if (action.includes("Attack") && !action.includes("Consume") ) {
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
		if (action.includes("Consume") ) {
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
				if (!strong.querySelector(`[id*="${infuse}"]`) != null) {
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
				if(!inert.querySelector(`[id*="${consume}"]`) != null) {
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
	}
}

//Attack Mode

//Heal Mode























