/////////////////////////////////////////////////
// Values and Variables
//
const inputBox = document.getElementById("input-box");
const listContainer = document.getElementById("task-list");
const inputFile = document.getElementById("input-file");
const plant = document.getElementById("plant1");

/////////////////////////////////////////////////
// Event Listeners
//
//inputFile.addEventListener("change", uploadImage);

/////////////////////////////////////////////////
// Methods
//


var plantUpdateFlag = true;
var sepia = 0;
function updatePlant() {
	//Get seconds since epoch
	var nowSeconds = Math.floor(Date.now()/1000);
	var plantHealth = document.getElementById("waterCountOne").innerHTML;

	if(plantUpdateFlag === true) {
		plantUpdateFlag = false;
		plant.name = nowSeconds + 10-1;
	}
	//Make plant "sicker" every time task isn't done in time
	else if(plant.name <= nowSeconds) {
		plantUpdateFlag = true;
		sepia += 0.25;
		plant1.style.filter = 'sepia('+sepia+')';
		plantHealth -= 25;
		document.getElementById("waterCountOne").innerHTML = plantHealth;
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
	saveData();
}

//Add/Remove Task
listContainer.addEventListener("click", function(e) {
	//Check off a task that is unchecked
	if(e.target.tagName === "LI" && !e.target.classList.contains("checked") ) {
		e.target.classList.toggle("checked");
		saveData();
	}
	//Remove Button
	else if(e.target.tagName === "SPAN" && e.target.id === "remover" ) {
		e.target.parentElement.remove();
		saveData();
	}
	//Upload Button that checks for image before deleting task
	else if( e.target.tagName === "LABEL" && e.target.id === "uploadBtn") {
		var fileName = inputFile.value;
		if( inputFile.files.length <= 0 ) {
			inputFile.addEventListener("change", uploadImage);
			//Set a "image uploaded" variable in e
			inputFile.addEventListener("change", (event) => {
				if(event.target.files.length > 0) {
					e.target.parentElement.remove();
					saveData();
					window.location.reload();
				}
			});
		}
	}
}, false);

//Save Task
function saveData() {
	localStorage.setItem("data", listContainer.innerHTML);
}

//Show Task
function showTask() {
	listContainer.innerHTML = localStorage.getItem("data");
}

//Clear Tasks
function clearTask() {
	localStorage.clear();
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
setInterval(updatePlant, 1000);
showTask();










//
