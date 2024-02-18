import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = ["query"]

  connect() {
    console.log("Form controller connected");
  }

  search(event) {
    event.preventDefault(); 

    const url = `${this.element.action}?query=${this.queryTarget.value}`;
    const options = {
      responseKind: "turbo-stream",
    };

    get(url, options).then(response => {
      console.log(response);
    }).catch(error => console.log(error));
  }

  fillQuery(event) {
    console.log("fillQuery triggered");
    const artistName = event.currentTarget.dataset.artistName;
    console.log("Artist Name:", artistName); // クリックされたアーティスト名をログに出力
    this.queryTarget.value = artistName;
  }
}
