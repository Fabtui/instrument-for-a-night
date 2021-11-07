import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

const initFlatpickr = () => {
  flatpickr(".datepicker", {});
  const rentForm = document.getElementById('rent-form-div');
  if (rentForm) {
    const rents = JSON.parse(rentForm.dataset.rents);
    flatpickr("#range_start", {
      plugins: [new rangePlugin({ input: "#range_end"})],
      minDate: new Date().fp_incr(+1),
      inline: true,
      dateFormat: "Y-m-d",
      "disable": rents,
    })
  }
};

export { initFlatpickr };
