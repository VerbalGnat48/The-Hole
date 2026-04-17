////////////
//
//
const follower_01 = document.getElementById('follower_01');
const follower_02 = document.getElementById('follower_02');
const follower_03 = document.getElementById('follower_03');
const follower_04 = document.getElementById('follower_04');
const follower_05 = document.getElementById('follower_05');
const follower_06 = document.getElementById('follower_06');
const follower_07 = document.getElementById('follower_07');

window.addEventListener('mousemove', (e) => {
	follower_01.style.left = e.clientX + 'px';
	follower_01.style.top = e.clientY + 'px';
	follower_02.style.left = e.clientX + 'px';
	follower_02.style.top = e.clientY + 'px';
	follower_03.style.left = e.clientX + 'px';
	follower_03.style.top = e.clientY + 'px';
	follower_04.style.left = e.clientX + 'px';
	follower_04.style.top = e.clientY + 'px';
	follower_05.style.left = e.clientX + 'px';
	follower_05.style.top = e.clientY + 'px';
	follower_06.style.left = e.clientX + 'px';
	follower_06.style.top = e.clientY + 'px';
	follower_07.style.left = e.clientX + 'px';
	follower_07.style.top = e.clientY + 'px';
});
