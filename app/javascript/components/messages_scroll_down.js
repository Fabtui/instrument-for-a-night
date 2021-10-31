const messagesScrollDown = () => {
  const messagesContainer = document.querySelector('.messages-container')
  const submitButton = document.querySelector('.message-form-button > input')
  if (messagesContainer) {
    messagesContainer.scrollTo(0, messagesContainer.scrollHeight)
    submitButton.addEventListener('click', () => {
      messagesContainer.scrollTo(0, messagesContainer.scrollHeight)
    })
  }
}

export { messagesScrollDown };
