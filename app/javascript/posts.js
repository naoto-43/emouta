document.addEventListener('turbo:load', function() {
  var linkInput = document.getElementById('link_to_music');
  var embedContainer = document.getElementById('spotify-embed-container');

  linkInput.addEventListener('input', function() {
    var url = this.value;
    var spotifyId = extractSpotifyId(url);
    
    if (spotifyId) {
      var embedCode = `<iframe src="https://open.spotify.com/embed/track/${spotifyId}" width="300" height="380" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe>`;
      embedContainer.innerHTML = embedCode;
    } else {
      embedContainer.innerHTML = '';
    }
  });

  function extractSpotifyId(url) {
    var match = url.match(/(?:spotify:|https:\/\/[a-z]+\.spotify\.com\/)(track|playlist)\/([a-zA-Z0-9]+)/);
    return match ? match[2] : null;
  }
});

