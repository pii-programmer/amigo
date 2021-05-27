function chat(){
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
      const contentsArea = document.getElementById("contents_area");
      const formText = document.getElementById("form_text");
      const chat = XHR.response.chat;
      const HTML = `<div class="chat-detail">${chat.content}</div>`;
      contentsArea.insertAdjacentHTML("afterend", HTML);
      formText.value = "";
    };
  });

};
window.addEventListener('load', chat);