const buildHTML = (XHR) => {
  const chat = XHR.response.chat;
  const HTML = `<div class="main-chat-detail">${chat.content}</div>`;
  return HTML;
}

function chat(){
  const buyBtn = document.getElementById("buy-btn");
  buyBtn.addEventListener('click', (e) => {
    const popupArea = document.getElementById("popup_area");
    const HTML = `
      <div class="popup-detail">
      <p>このアイテムを買うには10アミーゴ必要です。</p>
      <a href="/chats">アミーゴ獲得方法はこちら<img src="amigo-icon.png" ></a>
      </div>`;
    popupArea.insertAdjacentHTML("afterend", HTML);
    return HTML
    });

  const submit = document.getElementById("submit");
  submit.addEventListener('click', (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/chats", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200){
        alert(`Unlucky... ${XHR.status}: ${XHR.statusText}`);
        return null;
      };
      const contentsArea = document.getElementById("contents_area");
      const formText = document.getElementById("form_text");
      contentsArea.insertAdjacentHTML("afterend", buildHTML(XHR));
      formText.value = "";
    };
  });

};
window.addEventListener('load', chat);