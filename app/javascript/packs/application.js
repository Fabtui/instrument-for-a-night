// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import { showNavbar } from "../components/navbar"
import { moveSearchbar } from "../components/search_bar"
import { photoDisplay } from "../components/photo_display"
import { homeCarousel } from "../components/home_carousel"
import { searchButton } from "../components/search_button"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  moveSearchbar();
  showNavbar();
  photoDisplay();
  homeCarousel();
  searchButton();
  // Call your functions here, e.g:
  // initSelect2();
});
