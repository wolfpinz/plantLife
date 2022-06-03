import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input" ]

  toggleStyle() {
    this.element.classList.add("opacity-100")
  }
}
