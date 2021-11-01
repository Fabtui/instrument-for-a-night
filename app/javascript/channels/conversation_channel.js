import consumer from "./consumer";

const initConversationCable = () => {
  const conversationContainer = document.querySelector('.messages-container')
  if (conversationContainer) {
    const id = conversationContainer.dataset.conversationId;
    consumer.subscriptions.create({ channel: "ConversationChannel", id: id }, {  // ConversationChannel = nom de la class de conversation_channel.rb
      received(data) {
        conversationContainer.insertAdjacentHTML('beforeend', data);
      }
    });
  }
}

export { initConversationCable };
