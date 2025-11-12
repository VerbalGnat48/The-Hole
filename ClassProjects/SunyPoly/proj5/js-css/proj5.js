/////////////////////////////////////////////////
// Values and Variables
//
const inputBox = document.getElementById("input-box");
const listContainer = document.getElementById("list-container");
const inputFile = document.getElementById("input-file");

inputFile.addEventListener("change", uploadImage);

/////////////////////////////////////////////////
// Methods
//

//Image Upload
function uploadImage() {
//	if( inputFile.value != "" ) {
		let imgLink = URL.createObjectURL(inputFile.files[0]);
//	}
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

		//Adding "x"
		let span = document.createElement("span");
		span.innerHTML = "\u00d7";
		li.appendChild(span);

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
	//Can't "uncheck" task
	if(e.target.tagName === "LI" && !e.target.classList.contains("checked") ) {
		e.target.classList.toggle("checked");
		saveData();
	}
	else if(e.target.tagName === "SPAN") {
		e.target.parentElement.remove();
		saveData();
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


/////////////////////////////////////////////////
// "main"
//
showTask();












//
