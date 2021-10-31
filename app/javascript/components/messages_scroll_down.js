const messagesScrollDown = () => {
  const messagesContainer = document.querySelector('.messages-container')
  if (messagesContainer) {
    messagesContainer.scrollTo(0, messagesContainer.scrollHeight)
  }
}

export { messagesScrollDown };
