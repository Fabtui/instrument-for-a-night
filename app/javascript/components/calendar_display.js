const calendarDisplay = () => {
  const calendarElements = document.querySelectorAll('.calendar-content');
  const instrumentDisplay = document.querySelector('#instrument');
  const dateDisplay = document.querySelector('#date');
  const priceDisplay = document.querySelector('#price');
  console.log(calendarDisplay)
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
      const tomorrowDate = e.target.dataset.tomorrow;
      const user = e.target.dataset.user;
      if (rent === "rent") {
        instrumentDisplay.textContent = `You've rent the ${owner}'s `
      } else {
        instrumentDisplay.textContent = `${user} have rented your `
      }
      instrumentDisplay.insertAdjacentHTML('beforeend',`<a href="/instruments/${instrumentId}">${brand} ${instru}</a>`)
      dateDisplay.textContent = `From ${startDate} to ${endDate}`
      priceDisplay.textContent = `For ${price} €`
      if (tomorrowDate < startDate) {
        priceDisplay.insertAdjacentHTML('beforeend',`<hr><a class="btn btn-danger" data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/rents/${id}">Cancel</a>`)
      }
    })
    )
  }
};

export { calendarDisplay }

//
