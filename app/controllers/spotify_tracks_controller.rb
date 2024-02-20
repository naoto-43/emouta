class SpotifyTracksController < ApplicationController
  def new
    @spotify_track = SpotifyTrack.new 
  end

  def create
    artist_name = params[:query]
    artists = RSpotify::Artist.search(artist_name)

    if artists.any?
      seed_artists = artists.first.id
      @recommendations = RSpotify::Recommendations.generate(limit: 10, seed_artists: [seed_artists])
      if @recommendations.tracks.empty?
        flash.now[:alert] = "No recommendations found. Please try a different artist."
        render :new, status: :unprocessable_entity
      else
        session[:track_urls] = @recommendations.tracks.map { |track| track.external_urls['spotify'] }
        redirect_to spotify_track_result_path 
      end
    else
      flash.now[:alert] = "Artist not found. Please try again."
      render :new, status: :unprocessable_entity
    end
  end
  
  def result
    @track_urls = session[:track_urls]
  end
  
  private

  def spotify_track_params
    params.require(:spotify_track).permit(:query)
  end
end
