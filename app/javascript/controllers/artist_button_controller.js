import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { name: String }

  click() {
    console.log("Artist Name:", this.nameValue);
    // ここにクリックされたときの処理を追加
      console.log("fillQuery triggered");
      console.log("Artist Name:", artistName);
  }
}
