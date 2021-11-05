const calendarPartial = () => {
  const calendarElements = document.querySelectorAll('.calendar-content');
  if (calendarElements) {
    calendarElements.forEach( calendarElement =>
    calendarElement.addEventListener('mouseenter', (e) => {
      const id = e.target.dataset.id
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
