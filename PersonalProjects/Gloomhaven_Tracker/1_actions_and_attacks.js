///////////////////////////////
// Actions
//
function characterAttack(Id) {
	//Set Array
	var name = Id.split("_")[0];
	var action = Id.split("_")[1];
	var attackValue = document.getElementById(name + "_" + action);

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

//Attack Mode

//Heal Mode
