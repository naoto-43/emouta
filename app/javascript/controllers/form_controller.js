import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"
export default class extends Controller {
  static targets = ["query"]

  connect() {
    console.log("Form controller connected");
  }

  search(event) {
    event.preventDefault();

    const query = event.target.value;
    const index = event.target.dataset.index;
  
    const url = `${this.element.action}?query=${query}&index=${index}`;
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
    const artistName = event.currentTarget.dataset.artistName;
    const index = event.currentTarget.dataset.artistIndex;
    console.log("Artist Name:", artistName, "Index:", index);
  
    document.querySelector(`#artist_query_${index}`).value = artistName;
    this.clearSearchResults(index);
  }

  clearSearchResults(index) {
    const searchResultsContainer = document.querySelector(`#artists_${index}`);
    if (searchResultsContainer) {
      searchResultsContainer.innerHTML = '';
    }
  }

  submit(event) {
    console.log("submit");
    event.preventDefault();
  
    const url = this.element.getAttribute('data-sp-tracks-path');
    console.log(url);
  
    let formData = new FormData(this.element);
  
    fetch(url, {
      method: 'POST',
      body: formData,
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
    })
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.text(); 
    })
    .then(data => {
      console.log(data);
    })
    .catch(error => {
      console.error('Error:', error);
    });
  }
}
