const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-home');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY > (window.innerHeight - 862)) {
        navbar.classList.add('navbar-green');
      } else {
        navbar.classList.remove('navbar-green');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
