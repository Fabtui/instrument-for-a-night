const photoDisplay = () => {
  const container = document.querySelector('.photo_display_big');
  const thumbs = document.querySelectorAll('.photo_display_tiny');

  if (container) {
    function display(e) {
      const img = e.target;
      const imgClone = img.cloneNode(true)
      console.log(imgClone)
      container.replaceChild(imgClone, container.firstChild);
      console.log(container.firstChild)
    }

    thumbs.forEach(thumb => {
      thumb.addEventListener('click', display)
    });
  }
};

export { photoDisplay }
