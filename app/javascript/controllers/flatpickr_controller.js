import { Controller } from "@hotwired/stimulus"
// Import flatpickr function
import flatpickr from "flatpickr"
// The range plugin is also needed in order to use two inputs
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

export default class extends Controller {
  // retrieve the targets from the DOM
  static values = { dates: Object }
  static targets = ['startDateInput', 'endDateInput']
  // On controller's connection, call the flatpickr
  // function in order to build the calendars
  connect() {
    flatpickr(this.startDateInputTarget, {
      ...this.#parsedBookedDates(),
      mode: 'range',
      enableTime: true,
      minDate: "today",
      inline: true,
      "plugins": [new rangePlugin({ input: this.endDateInputTarget })]
      // more options available on the documentation!
    });
  }

  #parsedBookedDates() {
    return this.datesValue
  }
}
