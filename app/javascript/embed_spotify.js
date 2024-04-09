document.addEventListener('turbo:load', function() {
  var linkInput = document.getElementById('link_to_music');
  var embedContainer = document.getElementById('spotify-embed-container');

  function extractSpotifyId(url) {
    var match = url.match(/(?:spotify:|https:\/\/[a-z]+\.spotify\.com\/(?:[^\/]+\/)?)(track|playlist)\/([a-zA-Z0-9]+)/);
    return match ? match[2] : null;
  }

  function updateSpotifyEmbed(url) {
    var spotifyId = extractSpotifyId(url);
    if (spotifyId) {
      var embedCode = `<iframe src="https://open.spotify.com/embed/track/${spotifyId}" width="100%" height="352px" style="border-radius: 15px;" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe>`;
      embedContainer.innerHTML = embedCode;
    } else {
      embedContainer.innerHTML = '';
    }
  }

  if (linkInput && embedContainer) {
    linkInput.addEventListener('input', function() {
      updateSpotifyEmbed(this.value);
    });

    updateSpotifyEmbed(linkInput.value);
  }
});
