const photoDisplay = () => {
  const container = document.querySelector('.photo_display_big');
  const thumbs = document.querySelectorAll('.photo_display_tiny');
  const bigPicture = document.querySelector('#big-picture')

  if (container) {
    function display(e) {
      while(container.firstChild) {
        container.removeChild(container.lastChild);
      }
      const img = e.target;
      const imgClone = img.cloneNode(true)
      container.appendChild(imgClone, container.firstChild);
    }

    thumbs.forEach(thumb => {
      thumb.addEventListener('click', display)
    });
  }
};

export { photoDisplay }
