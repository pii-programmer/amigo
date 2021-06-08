function chatIntroduce(){
  const buyBtn = document.getElementById("buy-btn");
  buyBtn.addEventListener('click', (e) => {
    e.preventDefault();
    const popupArea = document.getElementById("popup_area");
    const HTML = `
      <div class="popup-detail">
      <p>このアイテムを買うには10アミーゴ必要です。</p>
      <a href="/chats">アミーゴ獲得方法はこちら<img src="../assets/images/amigo-icon.png" ></a>
      </div>`;
    popupArea.insertAdjacentHTML("afterend", HTML);
    return HTML
    });
};
window.addEventListener('load', chatIntroduce);