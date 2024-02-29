import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"
export default class extends Controller {
  connect() {
    console.log("Form controller connected");
  }

  search(event) {
    event.preventDefault();
  
    const elementId = event.target.id;
    const queryValue = event.target.value;
    const index = event.target.dataset.index;
    let url;
  
    if (elementId.includes("artist")) {
      url = `search?artist_query=${queryValue}&index=${index}`;
    }
    else if (elementId.includes("track")) {
      url = `search?track_query=${queryValue}&index=${index}`;
    }
    
    console.log(url);
    const options = {
      headers: {
        'Accept': 'text/vnd.turbo-stream.html',
      }
    };
  
    get(url, options).then(response => {
      console.log(response);
    }).catch(error => console.log(error));
  }  

  fillQuery(event) {
    console.log("fillQuery triggered");
    const targetType = event.currentTarget.dataset.type; 
    const name = event.currentTarget.dataset[`${targetType}Name`];
    const index = event.currentTarget.dataset[`${targetType}Index`]; 
    console.log(targetType, name, index);
    console.log("Name:", name, "Index:", index, "Type:", targetType);
  
    if (targetType === 'artists') {
      const artistId = event.currentTarget.dataset.id; 
      document.querySelector(`#artist_query_${index}`).value = name;
      document.querySelector(`#artist_id_${index}`).value = artistId;
      console.log("Artist ID:", artistId); 
    } else if (targetType === 'tracks') {
      const trackId = event.currentTarget.dataset.id; 
      document.querySelector(`#track_query_${index}`).value = name;
      document.querySelector(`#track_id_${index}`).value = trackId;
      console.log("Track ID:", trackId);
    }

    this.clearSearchResults(targetType, index);
  }
  
  clearSearchResults(type, index) {
    const searchResultsContainer = document.querySelector(`#${type}_${index}`);
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
