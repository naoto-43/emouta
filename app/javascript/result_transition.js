document.addEventListener('DOMContentLoaded', function() {
  var form = document.getElementById('artist_search_form');
  form.addEventListener('submit', function(event) {
    event.preventDefault(); // フォームの送信を停止
    var queryValue = document.getElementById('artist_query').value; // クエリの値を取得
    // リダイレクト先のURLを設定
    var redirectUrl = 'http://localhost:3000/spotify_tracks/result?query=' + encodeURIComponent(queryValue);
    window.location.href = redirectUrl; // リダイレクトを実行
  });
});
