import "@hotwired/turbo-rails";
import "@rails/ujs";
import "./controllers";
import 'flowbite';
// import "./design_selection";
import "./embed_spotify";
import "./header_adjustment";

document.addEventListener("turbo:load", function() {
  console.log("Turbo frame loaded");
});
