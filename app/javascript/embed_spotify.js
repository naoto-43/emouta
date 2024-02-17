document.addEventListener('turbo:load', function() {
  var linkInput = document.getElementById('link_to_music');
  var embedContainer = document.getElementById('spotify-embed-container');

  // Spotify IDを抽出する関数
  function extractSpotifyId(url) {
    var match = url.match(/(?:spotify:|https:\/\/[a-z]+\.spotify\.com\/)(track|playlist)\/([a-zA-Z0-9]+)/);
    return match ? match[2] : null;
  }

  // Spotifyの埋め込みを更新する関数
  function updateSpotifyEmbed(url) {
    var spotifyId = extractSpotifyId(url);
    if (spotifyId) {
      var embedCode = `<iframe src="https://open.spotify.com/embed/track/${spotifyId}" width="300" height="380" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe>`;
      embedContainer.innerHTML = embedCode;
    } else {
      embedContainer.innerHTML = '';
    }
  }

  if (linkInput && embedContainer) {
    // 要素が存在する場合のみ、イベントリスナーを追加
    linkInput.addEventListener('input', function() {
      updateSpotifyEmbed(this.value);
    });

    // ページロード時に既存のリンクをもとに埋め込みを表示
    updateSpotifyEmbed(linkInput.value);
  }
});
