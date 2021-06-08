const buildHTML = (XHR) => {
  const chat = XHR.response.chat;
  const HTML = `<div class="main-chat-detail">${chat.content}</div>`;
  return HTML;
}

function chatIndex(){
  const $amigoSpace = $('.amigo-space');
  const $submit = $('.submit');
  $submit.on('click', (e) => {
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
      $amigoSpace.addClass('amigoicon');
    };
  });

};
window.addEventListener('load', chatIndex);