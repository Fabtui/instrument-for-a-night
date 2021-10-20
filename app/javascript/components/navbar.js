const showNavbar = () => {
  const navbar = document.querySelector(".navbar-lewagon")
  document.addEventListener('scroll', (scroll) => {
    if (window.scrollY >= 80) {
      navbar.style.backgroundColor = "white";
      navbar.style.boxShadow = "4px 4px 10px rgba(0, 0, 0, 0.452)";
    } else {
      navbar.style.backgroundColor = "";
      navbar.style.boxShadow = "";
    };
  })
};

export { showNavbar }
