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

var plantDecayRate = 5-1;
var plantDecayValue = 25;
var firstRun = true;
var plantUpdateFlag = true;

var plantFileName;

/////////////////////////////////////////////////
// Methods
//

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
		//Plant Child 0
		plant.className = "plant";
		plant.id = `plant${plantInstance}`;
		plant.innerHTML = `<img src="./Images/${plantFileName}">`;
		plantContainer.appendChild(plant);
		//Plant Child 1
		const name = document.createElement("label");
		name.innerHTML = inputPlant.value;
		plant.appendChild(name);
		//Plant Child 2
		const water = document.createElement("p");
		water.innerHTML = "100";														//Plant Healthi Value
		plant.appendChild(water);
		plant.style.filter = `sepia(`+(1.00 - (parseInt(water.innerHTML)/100))+`)`;		//Plant Health Visual

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
				var health = parseInt(plant.children[2].innerHTML);
				if(sec <= nowSeconds && health > 0) {
					plantUpdateFlag = true;
					health -= plantDecayValue;
					plant.children[2].innerHTML = health.toString();
					plant.children[0].style.filter = `sepia(`+(1.00 - (parseInt(health)/100))+`)`;
					plant.children[2].style.filter = `sepia(`+(1.00 - (parseInt(health)/100))+`)`;
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
		li.innerHTML = `${inputBox.value} is due at ${new Date(dueDate).toLocaleString()}`;
		listContainer.appendChild(li);
		li.name = `${inputBox.value}`;
		li.data = `${new Date(dueDate)}`;

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
			setTimeout( () => alert(`Reminder: ${inputBox.value} is due!`), timeDiff);
		}
	}
	inputBox.value = "";
	saveTask();
}

//Add/Remove Task
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
						for(var i=0; i<plantContainer.children.length; i++) {
							var plant = plantContainer.children[i];
							let health = parseInt(plant.children[2].innerHTML);
							//Plant Improve
							if(health < 100) {			
								health += plantDecayValue;
								plant.children[2].innerHTML = health.toString();
								plant.children[0].style.filter = `sepia(`+(1.00 - (parseInt(health)/100))+`)`;
								plant.children[2].style.filter = `sepia(`+(1.00 - (parseInt(health)/100))+`)`;
							}
						}
					}
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

plantType.addEventListener("click", function(e) {
	for(var i=0; i<plantType.children.length; i++) {
		plantType.children[i].classList.remove("selected");
	}
	e.target.classList.toggle("selected");
	var plantFullPath = e.target.src;
	plantFileName = plantFullPath.replace(/^.*[\\\/]/, '');
});


//Save Data
function saveTask() {
	localStorage.setItem("taskData", listContainer.innerHTML);
}
function savePlant() {
	localStorage.setItem("plantData", plantContainer.innerHTML);
}

//Show Data
function showData() {
	listContainer.innerHTML = localStorage.getItem("taskData");
	plantContainer.innerHTML = localStorage.getItem("plantData");
}

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



/////////////////////////////////////////////////
// "main"
//

setInterval(updatePlants, 1000);
showData();







//
