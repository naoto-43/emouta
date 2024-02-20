document.addEventListener('DOMContentLoaded', function() {
  var form = document.getElementById('artist_search_form');
  form.addEventListener('submit', function(event) {
    event.preventDefault();
    var queryValue = document.getElementById('artist_query').value; 
    var redirectUrl = 'http://localhost:3000/spotify_tracks/result?query=' + encodeURIComponent(queryValue);
    window.location.href = redirectUrl; 
  });
});
