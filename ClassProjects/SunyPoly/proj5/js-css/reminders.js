function addTask() {
	let taskInput = document.getElementById("task").value;
	let dueDate = document.getElementById("due-date").value;
	let taskList = document.getElementById("task-list");

	if(taskInput && dueDate) {
		let li = document.createElement("li");
		li.innerHTML = `${taskInput} <span>${new Date(dueDate).toLocaleString()}</span>`;
		taskList.appendChild(li);

		let timeDiff = new Date(dueDate) - new Date();
		if(timeDiff > 0) {
			setTimeout( () => alert(`Reminder: ${taskInput} is due!`), timeDiff);
		}
	}
}
