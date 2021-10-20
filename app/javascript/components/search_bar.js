const moveSearchbar = () => {
  const searchBar = document.querySelector(".product-search")
  if (searchBar) {
  document.addEventListener('scroll', (scroll) => {
    if (window.scrollY >= 80) {
      searchBar.classList.add('scrolled')
    } else {
      searchBar.classList.remove('scrolled')
    };
  })
  }
};

export { moveSearchbar }
