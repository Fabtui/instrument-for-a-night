const searchButton = () => {
  const searchButton = document.querySelector('#search');
  const placeDiv = document.querySelector('#search-place');
  if (searchButton) {
  searchButton.addEventListener('mouseenter', (event) => {
    placeDiv.classList.add('round-corners')
  })
  searchButton.addEventListener('mouseleave', (event) => {
    placeDiv.classList.remove('round-corners')
  })
}
}

export { searchButton };
