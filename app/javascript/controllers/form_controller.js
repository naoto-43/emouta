import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  timeout = null;

// text.fieldの入力をspotify_tracks#searchに渡す
  search(event) {
    event.preventDefault();

    if (this.timeout) {
      clearTimeout(this.timeout);
    }

    // 入力から0.6秒後にspotify_tracks#searchにデータを渡す
    this.timeout = setTimeout(() => {
      const elementId = event.target.id;
      const queryValue = event.target.value;
      const index = event.target.dataset.index;
      const url = `search?track_query=${queryValue}&index=${index}`;

      // turbo_stream形式のレスポンスを要求する
      const options = {
        headers: {
          'Accept': 'text/vnd.turbo-stream.html',
        }
      };

      // 非同期のHTTP GETリクエストを送信
      get(url, options).then(response => {
        console.log(response);
      }).catch(error => console.log(error));
    }, 600);
  }

// ユーザーが選択した楽曲のデータをtext_field,hidden_fieldに格納する
  fillQuery(event) {
    console.log("fillQuery triggered");
    // spotify_tracks/search.turbo_stream.erbの各値をセット
    const name = event.currentTarget.dataset[`tracksName`];
    const index = event.currentTarget.dataset[`tracksIndex`]; 
    const trackId = event.currentTarget.dataset.id; 
    document.querySelector(`#track_query_${index}`).value = name;
    document.querySelector(`#track_id_${index}`).value = trackId;
    console.log("Track ID:", trackId);
    this.clearSearchResults(index);
  }

// 楽曲候補を削除
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
