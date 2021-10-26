const priceCalculator = () => {
  const rentStart = document.querySelector("#range_start");
  const rentEnd = document.querySelector("#range_end");
  const priceButton = document.querySelector('#price-button');
  const numberOfDaysSpan = document.querySelector('#number-of-days');
  const plurilizeDay = document.querySelector('#plurilize');
  const dateDisplay = document.querySelector('#date-display');
  const pricePreview = document.querySelector("#price-preview")
  if (rentStart) {
    const pricePerDay = parseInt(document.querySelector('#price').dataset.pricePerDay, 10)
    rentStart.addEventListener('change', (e) => {
      if (rentEnd.value) {
        const startDateTime = new Date(rentStart.value).getTime() / (1000 * 60);
        const endDateTime = new Date(rentEnd.value).getTime() / (1000 * 60);
        const numberOfDays = (((endDateTime - startDateTime) / (60 * 24)) + 1);
        const calculatedPrice = (numberOfDays * pricePerDay);
        pricePreview.innerText = calculatedPrice;
        numberOfDaysSpan.innerText = numberOfDays;
        if (numberOfDays > 1) {
          plurilizeDay.innerText = 's'
        }
        if (numberOfDays > 1) {
          dateDisplay.innerText = `From ${rentStart.value} to ${rentEnd.value}`
        } else {
          dateDisplay.innerText = `The ${rentStart.value}`
        }
      }
    });
  };
}
export { priceCalculator }
