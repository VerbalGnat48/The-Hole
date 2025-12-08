/////////////////////////////////////////////////
// Values and Variables
//

//Input
const inputBox = document.getElementById("input-box");
const listContainer = document.getElementById("task-list");
const inputFile = document.getElementById("input-file");
const plantContainer = document.getElementById("plants");
const plantType = document.getElementById("plantTypes");
const inputPlant = document.getElementById("input-box-plant");
const storyNum = document.getElementById("info");

var plantDecayRate = 10-1;
var plantDecayValue = 25;
var firstRun = true;
var plantUpdateFlag = true;

var plantFileName;

const storyArray = [];
storyArray[0] = "Dave had a plant. Dave sometimes forgot to water his plant";
storyArray[1] = "Daves plant started to wilt";
storyArray[2] = "To fix this Dave started to set reminders";
storyArray[3] = "Dave watered the plant almost every day";
storyArray[4] = "The plant got better and never died. The End";

const bucket = document.getElementById("bucket");

//listContainer.setAttribute('data-waterPoints',parseInt(listContainer.getAttribute('data-waterPoints') )+50 );

/////////////////////////////////////////////////
// Methods
//
//get/setAttribute**

function addPlants() {
	if(plantFileName === '') {
		alert("You must selcted a plant!");
	}
	else if(inputPlant.value === '') {
		alert("You must provide a name for your plant!");
	}
	else {
		refresh();
		//Add plantContainer Child
		const plant = document.createElement("div");
		var plantInstance = plantContainer.children.length;
		//Plant Child 0-1
		plant.className = "plant";
		plant.id = `plant${plantInstance}`;
		plant.innerHTML = `<img src="./Images/${plantFileName}">
		<button id="plantInstanceBtn">name="${plantInstance}"</button>`;
		plantContainer.appendChild(plant);
		//Plant Child 2
		const name = document.createElement("label");
		name.innerHTML = inputPlant.value;
		plant.appendChild(name);
		//Plant Child 3
		const water = document.createElement("p");
		water.innerHTML = "100";														//Plant Healthi Value
		plant.appendChild(water);
		plant.style.filter = `sepia(`+(1.00 - (parseInt(water.innerHTML)/100))+`)`;		//Plant Health Visual
		//Child 4
		const remove = document.createElement("span");
		remove.id = "plantRemover";
		remove.innerHTML = "\u00d7";
		plant.appendChild(remove);
		//Child 5
		const sick = document.createElement("img");
		sick.id = "sick";
		sick.src = "./Images/Sick01.png";
		sick.style.display = "none";
		plant.appendChild(sick);
		//Child 6
		const dead = document.createElement("img");
		dead.id = "dead";
		dead.src = "./Images/Skull.png";
		dead.style.display = "none";
		plant.appendChild(dead);

		savePlant();
		showPlant();
	}
}

function updatePlants() {
	if(listContainer.hasChildNodes() ) {
		//Get time since epoch in seconds
		var nowSeconds = Math.floor(Date.now()/1000);
		if(plantUpdateFlag || firstRun) {
			plantUpdateFlag = false;
			for(var i=0; i<plantContainer.children.length; i++) {
				var plant = plantContainer.children[i];
				plant.children[0].name = nowSeconds + plantDecayRate;
			}
			firstRun = false;
		}
		//Plant Decay
		else {
			for(var i=0; i<plantContainer.children.length; i++) {
				var plant = plantContainer.children[i];
				var sec = parseInt(plant.children[0].name);
				var health = parseInt(plant.children[3].innerHTML);
				if(sec <= nowSeconds && health > 0) {
					plantUpdateFlag = true;
					health -= plantDecayValue;
					plant.children[3].innerHTML = health.toString();
					plant.children[0].style.filter = `sepia(`+(1.00 - (parseInt(health)/100))+`)`;
					plant.children[3].style.filter = `sepia(`+(1.00 - (parseInt(health)/100))+`)`;
					//Thermometer
					if(health <= 50) {
						plant.children[5].style.display = "block";
					}
				}
				else if (health == 0) {
					plant.children[5].style.display = "none";
					plant.children[6].style.display = "block";
				}
			}
		}
		savePlant();
	}
}


//Add Task
function addTask() {
	let dueDate = document.getElementById("due-date").value;
	if(inputBox.value === '') {
		alert("You must write something!");
	}
	else if(dueDate === '') {
		alert("You must provide a time!");
	}
	else {
		//Making Task
		let li = document.createElement("li");
		li.innerHTML = `${inputBox.value}<br>is due at ${new Date(dueDate).toLocaleString()}`;
		listContainer.appendChild(li);
		li.name = `${inputBox.value}`;
		li.className = "sortable-item";
		li.draggable = true;
		li.ondragstart="dragStart(event)";
		li.ondragover="dragOver(event)";
//		li.data = `${new Date(dueDate)}`;
//		li.setAttribute('data-time', `${new Date(dueDate).toLocaleString()}`);

		//Adding "x"
		let span = document.createElement("span");
		span.id = "remover";
		span.innerHTML = "\u00d7";
		li.appendChild(span);

		let uploads = document.createElement("input");
		uploads.type = "file";
		uploads.accept = "image/*";
		uploads.id = "input-file";

		//Adding the photo upload
		let uploadBtn = document.createElement("label");
		uploadBtn.htmlFor = "input-file"
		uploadBtn.id = "uploadBtn";
		uploadBtn.innerHTML = "\u0055";
		li.appendChild(uploadBtn);

		let timeDiff = new Date(dueDate) - new Date();
		if(timeDiff > 0) {
			setTimeout( () => alert(`Reminder: ${li.name} is due!`), timeDiff);
		}
	}
	inputBox.value = "";
	saveTask();
}

function openTab(event, tabName) {
	var i, tabContent, tabLinks;
	tabContent = document.getElementsByClassName("tabContent");
	for(i=0; i<tabContent.length; i++) {
		tabContent[i].style.display = "none";
	}
	tabLinks = document.getElementsByClassName("tabLinks");
	for(i=0; i<tabLinks.length; i++) {
		tabLinks[i].className = tabLinks[i].className.replace(" active", "");
	}
	document.getElementById(tabName).style.display = "block";
	event.currentTarget.className += " active";
}

/////////////////////////////////////////////////
// Listeners
//

//Add/Remove Stuff
listContainer.addEventListener("click", function(e) {
	//Check off a task that is unchecked
	if(e.target.tagName === "LI" && !e.target.classList.contains("checked") ) {
		e.target.classList.toggle("checked");
		saveTask();
	}
	//Remove Button
	else if(e.target.tagName === "SPAN" && e.target.id === "remover" ) {
		e.target.parentNode.remove();
		saveTask();
		savePlant();
	}
	//Upload Button that checks for image before deleting task
	else if( e.target.tagName === "LABEL" && e.target.id === "uploadBtn") {
		var fileName = inputFile.value;
		if( inputFile.files.length <= 0 ) {
			inputFile.addEventListener("change", uploadImage);
			//Set a "image uploaded" variable in e
			inputFile.addEventListener("change", (event) => {
				if(event.target.files.length > 0) {
					//Plants
					if(plantContainer.hasChildNodes() ) {
						//Give Water Token
						var point = parseInt(bucket.innerHTML);
						point++;
						bucket.innerHTML = point.toString();
						saveWater();
					}
					//Story
					var number = parseInt(storyNum.innerHTML,10);
					if(storyNum.innerHTML === "" || number === storyArray.length-1) {
						storyNum.innerHTML = 0;
					}
					else if(number < storyArray.length-1 ) {
						number++;
						storyNum.innerHTML = number;
					}
					alert(storyArray[storyNum.innerHTML]);
					saveStory();
					//Tasks
					e.target.parentElement.remove();
					saveTask();
					savePlant();
					refresh();
				}
			});
		}
	}
}, false);

//////////////////////////////////////
// Toggle Selcted Plant from List
//
plantContainer.addEventListener("click", function(e) {
//	let name = document.querySelectorAll('[id^="plant-"]');
//	alert(name);
	if(e.target.tagName === "SPAN" && e.target.id === "plantRemover" ) {
		e.target.parentNode.remove();
		savePlant();
	}
//	else if(e.target.id === "plantInstanceBtn" ) {
	else if(e.target.tagName === "BUTTON" ) {
		//Water Plant
		let value = e.target.innerHTML;
		value = value.replace(/\D/g, "");
		value = parseInt(value);
		var plant = plantContainer.children[value];
		let health = parseInt(plant.children[3].innerHTML);
		var point = parseInt(bucket.innerHTML);
		//Plant Improve
		if(health < 100) {			
			//Take Water Token
			if(point > 0 ) {
				point--;
				bucket.innerHTML = point.toString();
			}
			//Water
			health += plantDecayValue;
			plant.children[3].innerHTML = health.toString();
			plant.children[0].style.filter = `sepia(`+(1.00 - (parseInt(health)/100))+`)`;
			plant.children[3].style.filter = `sepia(`+(1.00 - (parseInt(health)/100))+`)`;
			//Thermometer
			if(health > 50) {
				plant.children[5].style.display = "none";
			}
			if(health > 0) {
				plant.children[5].style.display = "block";
				plant.children[6].style.display = "none";
			}
			saveWater();
			savePlant();
		}
		
	}
}, false);

//////////////////////////////////////
// Toggle Selcted Plant to Make
//
plantType.addEventListener("click", function(e) {
	for(var i=0; i<plantType.children.length; i++) {
		plantType.children[i].classList.remove("selected");
	}
	e.target.classList.toggle("selected");
	var plantFullPath = e.target.src;
	plantFileName = plantFullPath.replace(/^.*[\\\/]/, '');
});


/////////////////////////////////////////////////
// More Methods
//

//Save Data
function saveTask() {
	localStorage.setItem("taskData", listContainer.innerHTML);
}
function savePlant() {
	localStorage.setItem("plantData", plantContainer.innerHTML);
}
function saveStory() {
	localStorage.setItem("storyData", storyNum.innerHTML);
}
function saveWater() {
	localStorage.setItem("waterData", bucket.innerHTML);
}

//Show Data
function showData() {
	listContainer.innerHTML = localStorage.getItem("taskData");
	plantContainer.innerHTML = localStorage.getItem("plantData");
	storyNum.innerHTML = localStorage.getItem("storyData");
}

window.onload = function() {
	const savedContent = localStorage.getItem("waterData");
	if(savedContent ) {
		document.getElementById("bucket").innerHTML = savedContent;
	}
};

//Clear Data
function clearScreen() {
	window.location.reload(true);
	localStorage.clear();
}

function refresh() {
	window.location.reload(true);
}

//Image Upload
function uploadImage() {
	if( inputFile.value != "" ) {
		let imgLink = URL.createObjectURL(inputFile.files[0]);
	}
}

//////////////////////////////////////
// Dragable List
//

const list = document.querySelector('.sortable-list');
let draggingItem = null;
list.addEventListener('dragstart', (e) => {
	draggingItem = e.target;
	e.target.classList.add('dragging');
	saveTask();
});
list.addEventListener('dragend', (e) => {
	e.target.classList.remove('dragging');
	document.querySelectorAll('.sortable-item').forEach(item => item.classList.remove('over'));
	draggingItem = null;
	saveTask();
});
list.addEventListener('dragover', (e) => {
	e.preventDefault();
	const draggingOverItem = getDragAfterElement(list, e.clientY);
	// Remove .over from all items
	document.querySelectorAll('.sortable-item').forEach(item => item.classList.remove('over'));
	if (draggingOverItem) {
		draggingOverItem.classList.add('over'); // Add .over to the hovered item
		list.insertBefore(draggingItem, draggingOverItem);
	} else {
		list.appendChild(draggingItem); // Append to the end if no item below
	}
	saveTask();
});
function getDragAfterElement(container, y) {
	const draggableElements = [...container.querySelectorAll('.sortable-item:not(.dragging)')];

	return draggableElements.reduce((closest, child) => {
		const box = child.getBoundingClientRect();
		const offset = y - box.top - box.height / 2;
		if (offset < 0 && offset > closest.offset) {
			return { offset: offset, element: child };
		} else {
			return closest;
		}
	}, { offset: Number.NEGATIVE_INFINITY }).element;
	saveTask();
}


/////////////////////////////////////////////////
// "main"
//

setInterval(updatePlants, 1000);
showData();







//
