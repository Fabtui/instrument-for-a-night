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
import { previewImageOnFileSelect } from "../components/profile_pic_preview"
import { initFlatpickr } from "../plugins/flackpickr";
import { priceCalculator } from "../components/price_preview"
import { messagesScrollDown } from "../components/messages_scroll_down"
import { initConversationCable } from "../channels/conversation_channel"
// import { calendarPartial } from "../components/calendar_partial"
import { calendarDisplay } from "../components/calendar_display"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// External imports
import "bootstrap";

document.addEventListener('turbolinks:load', () => {
  moveSearchbar();
  showNavbar();
  photoDisplay();
  homeCarousel();
  searchButton();
  previewImageOnFileSelect();
  initFlatpickr();
  priceCalculator();
  messagesScrollDown();
  initConversationCable();
  // calendarPartial();
  calendarDisplay();
});
