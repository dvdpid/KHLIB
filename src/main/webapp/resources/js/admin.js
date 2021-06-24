const toggleBtn = document.querySelector('.toggleBtn');
const menu = document.querySelector('.topLists');

toggleBtn.addEventListener('click', () => {
	menu.classList.toggle('active'); // 클릭 시 active없으면 active 추가
});