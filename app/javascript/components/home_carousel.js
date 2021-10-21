const homeCarousel = () => {
  const slider = document.querySelector('.items');
  const items = document.querySelectorAll('.item')
  let isDown = false;
  let startX;
  let scrollLeft;

  slider.addEventListener('mousedown', (e) => {
    isDown = true;
    slider.classList.add('active');
    startX = e.pageX - slider.offsetLeft;
    scrollLeft = slider.scrollLeft;
  });

  slider.addEventListener('mouseleave', () => {
    isDown = false;
    slider.classList.remove('active');
  });

  slider.addEventListener('mouseup', () => {
    isDown = false;
    slider.classList.remove('active');
  });

  slider.addEventListener('mousemove', (e) => {
    if (!isDown) return;  // stop the fn from running
    e.preventDefault();
    const x = e.pageX - slider.offsetLeft;
    const walk = (x - startX);
    slider.scrollLeft = scrollLeft - walk;
  });

  // function addOpacity () {
  //   sliderProp = slider.getBoundingClientRect()
  //   items.forEach(item => {
  //     const itemCoords = item.getBoundingClientRect();
  //     const opacity = (Math.round((600 - itemCoords.x) / 120)) /10
  //     const opacityValue = (1 - opacity)
  //     const opacity2 = (Math.round((sliderProp.width - itemCoords.x) / ((sliderProp.width - 1500)/10))) / 10
  //     const opacityValue2 = (1 - opacity2)
  //     if (itemCoords.x < -200) {
  //       item.style.filter = `opacity(${opacityValue})`;
  //     }
  //     else if (itemCoords.x > 1300 && itemCoords.x < (sliderProp.width + 100)) {
  //       item.style.filter = `opacity(${opacity2})`;
  //       console.log(item)
  //       console.log(sliderProp.width)
  //       console.log(itemCoords.x)
  //     }  else {
  //       item.style.filter = ``;
  //     }
  //   })
  // }

  // slider.addEventListener('mousemove', addOpacity);
}

export { homeCarousel };
