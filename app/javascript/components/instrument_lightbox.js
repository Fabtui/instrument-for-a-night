//getting all required elements
const instrumentLightbox = () => {
  const gallery  = document.querySelectorAll(".image-lightbox");
  const previewBox = document.querySelector(".preview-box");
  const previewImg = previewBox.querySelector("img");
  const currentImg = previewBox.querySelector(".current-img");
  const totalImg = previewBox.querySelector(".total-img");
  const shadow = document.querySelector(".shadow");

  gallery.forEach( image => {
    image.addEventListener('click', () => {
      const imageURL = image.querySelector("img").src;
      previewImg.src = imageURL;
      previewBox.classList.add("show");
      shadow.style.display = "block";

      const closeIcon = previewBox.querySelector(".details-icon");
      closeIcon.addEventListener('click', () => {
        previewBox.classList.remove("show");
        shadow.style.display = "none";
        document.querySelector("body").style.overflow = "scroll";
      })
    })
  })
}

export { instrumentLightbox };
