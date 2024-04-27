import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  timeout = null;

  search(event) {
    event.preventDefault();

    if (this.timeout) {
      clearTimeout(this.timeout);
    }

    this.timeout = setTimeout(() => {
      const elementId = event.target.id;
      const queryValue = event.target.value;
      const index = event.target.dataset.index;
      const url = `search?track_query=${queryValue}&index=${index}`;

      const options = {
        headers: {
          'Accept': 'text/vnd.turbo-stream.html',
        }
      };

      get(url, options).then(response => {
        console.log(response);
      }).catch(error => console.log(error));
    }, 600);
  }

  fillQuery(event) {
    console.log("fillQuery triggered");
    const name = event.currentTarget.dataset[`tracksName`];
    const index = event.currentTarget.dataset[`tracksIndex`]; 
    const trackId = event.currentTarget.dataset.id; 
    document.querySelector(`#track_query_${index}`).value = name;
    document.querySelector(`#track_id_${index}`).value = trackId;
    console.log("Track ID:", trackId);
    this.clearSearchResults(index);
  }
  
  clearSearchResults(index) {
    const searchResultsContainer = document.querySelector(`#tracks_${index}`);
    if (searchResultsContainer) {
      searchResultsContainer.innerHTML = '';
    }
  }

  submit(event) {
    console.log("submit");
    event.preventDefault();
  
    const url = this.element.getAttribute('data-sp-tracks-path');
    console.log(url);
    form.action = form.getAttribute('data-sp-tracks-path');
    
    form.submit();
  }
}
