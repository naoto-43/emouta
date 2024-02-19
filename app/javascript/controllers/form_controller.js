import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = ["query"]

  connect() {
    console.log("Form controller connected");
  }
  
  // setupListeners() {
  //   console.log("Setting up listeners for form controller");
  //   document.querySelectorAll('#artists button[data-artist-name]').forEach(button => {
  //     button.removeEventListener('click', this.fillQueryBound); // fillQueryBoundを使用してリスナーを削除
  //     button.addEventListener('click', this.fillQueryBound); // fillQueryBoundを使用してリスナーを設定
  //   });
  // }

  search(event) {
    event.preventDefault(); 

    const url = `${this.element.action}?query=${this.queryTarget.value}`;
    console.log(url);
    const options = {
      responseKind: "turbo-stream",
    };
    console.log(options);

    get(url, options).then(response => {
      console.log(response);
    }).catch(error => console.log(error));
  }

  fillQuery(event) {
    console.log("fillQuery triggered");
    const artistName = event.currentTarget.dataset.artistName;
    console.log("Artist Name:", artistName);
    this.queryTarget.value = artistName;
  }
}
