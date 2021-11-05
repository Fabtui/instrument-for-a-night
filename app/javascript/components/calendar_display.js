const calendarDisplay = () => {
  const calendarElements = document.querySelectorAll('.calendar-content');
  const instrumentDisplay = document.querySelector('#instrument');
  const dateDisplay = document.querySelector('#date');
  const priceDisplay = document.querySelector('#price');
  if (calendarElements) {
    calendarElements.forEach( calendarElement =>
    calendarElement.addEventListener('click', (e) => {
      const rent = e.target.dataset.rent;
      const id = e.target.dataset.id;
      const instrumentId = e.target.dataset.instrumentid;
      const instru = e.target.dataset.name;
      const price = e.target.dataset.price;
      const owner = e.target.dataset.owner;
      const brand = e.target.dataset.brand;
      const startDate = e.target.dataset.startdate;
      const endDate = e.target.dataset.enddate;
      const user = e.target.dataset.user;
      if (rent === "rent") {
        instrumentDisplay.textContent = `You've rent the ${owner}'s `
        instrumentDisplay.insertAdjacentHTML('beforeend',`<a href="/instruments/${instrumentId}">${brand} ${instru}</a>`)
      } else {
        instrumentDisplay.textContent = `${user} have rented your ${brand} ${instru}`
      }
      dateDisplay.textContent = `From ${startDate} to ${endDate}`
      priceDisplay.textContent = `Total price: ${price} €`
    })
    )
  }
};

export { calendarDisplay }
