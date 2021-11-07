const showMap = () => {
  const showMapButton = document.getElementById('show-map-button');
  if (showMapButton) {
    const map = document.querySelector('.map');
    const result = document.querySelector('.instrument-index-result')
    const showMapButtonInner = showMapButton.querySelector('i');
    showMapButton.addEventListener('click', () => {
      if (showMapButtonInner.classList.contains('fa-map-marked-alt')) {
        showMapButtonInner.classList = 'fas fa-arrow-right'
      } else {
        showMapButtonInner.classList = 'fas fa-map-marked-alt'
      }
      map.classList.toggle('hidden-map');
      result.classList.toggle('hidden-map-result');
    })

}
}

export { showMap };
