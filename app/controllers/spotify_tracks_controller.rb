class SpotifyTracksController < ApplicationController
  def new
    @spotify_track = SpotifyTrack.new 
  end

  def create
    artist_name = params[:favorite_artist]
    track_name = params[:favorite_song]
    country_code = params[:country]

    artists = RSpotify::Artist.search(artist_name)
    tracks = RSpotify::Track.search(track_name)

    seed_artists = artists.first.id if artists.any?
    seed_tracks = tracks.first.id if tracks.any?

    @recommendations = RSpotify::Recommendations.generate(limit: 10, seed_artists: [seed_artists], seed_tracks: [seed_tracks], market: country_code)
    if @recommendations.save
      render :show
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def show
    @track_links = session[:track_links] || []
    session.delete(:track_links)
  end
  
  private

  def spotify_track_params
    params.require(:spotify_track).permit(:genre, :age, :favorite_artist, :favorite_song)
  end
end
