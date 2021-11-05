const calendarPartial = () => {
  const calendarElements = document.querySelectorAll('.calendar-content');
  if (calendarElements) {
    calendarElements.forEach( calendarElement =>
    calendarElement.addEventListener('mouseenter', (e) => {
      const id = e.target.dataset.id
      const instru = e.target.dataset.name
      const owner = e.target.dataset.owner
      const brand = e.target.dataset.brand
      const startdate = e.target.dataset.startdate
      const enddate = e.target.dataset.enddate
      const user = e.target.dataset.user
      console.log(user)
      console.log(brand)
      console.log(owner)
      console.log(instru)
      console.log(startdate)
      console.log(enddate)
      const partials = document.querySelectorAll(`#calendar-partial-${id}`)
      partials.forEach( partial => {
        partial.classList.remove("hidden")
      })
    })
    )
    calendarElements.forEach( calendarElement =>
    calendarElement.addEventListener('mouseleave', (e) => {
      const id = e.target.dataset.id
      const partials = document.querySelectorAll(`#calendar-partial-${id}`)
      partials.forEach( partial => {
        partial.classList.add("hidden")
      })
    })
    )
  }
};

export { calendarPartial }
