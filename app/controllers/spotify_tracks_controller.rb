class SpotifyTracksController < ApplicationController
  def new
    @spotify_track = SpotifyTrack.new 
  end

  def create
    artist_names = params[:query].values 
    seed_artists = []
  
    artist_names.each do |artist_name|
      artists = RSpotify::Artist.search(artist_name)
  
      seed_artists << artists.first.id if artists.any?
      break if seed_artists.size >= 5 
    end
  
    if seed_artists.empty?
      flash.now[:alert] = "Artists not found. Please try again."
      render :new, status: :unprocessable_entity
    else
      @recommendations = RSpotify::Recommendations.generate(limit: 10, seed_artists: seed_artists)
      if @recommendations.tracks.empty?
        flash.now[:alert] = "No recommendations found. Please try a different artist."
        render :new, status: :unprocessable_entity
      else
        session[:track_urls] = @recommendations.tracks.map { |track| track.external_urls['spotify'] }
        session[:artist_names] = artist_names
        redirect_to spotify_track_result_path
      end
    end
  end
  
  
  def result
    @track_urls = session[:track_urls]
    @artist_names = session[:artist_names] 
  end
  
  private

  def spotify_track_params
    params.require(:spotify_track).permit(:query)
  end
end
