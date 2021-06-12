import consumer from "./consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p class="main-chat-detail">${data.content.content}</p>`;
    const messages = document.getElementById('chats');
    const newMessage = document.getElementById('chat_content');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
