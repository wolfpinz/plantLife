import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input" ]

  connect() {
    console.log("Hello from our first Stimulus controller")
  }

  toggleStyle() {
    this.element.classList.add("opacity-100")
  }
}
