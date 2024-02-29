class SpotifyTracksController < ApplicationController
  def new
    @spotify_track = SpotifyTrack.new 
  end

  def create
    artist_names = params[:artist_query].values.reject(&:blank?)
    seed_artists = params[:artist_id].values.reject(&:blank?)
    track_names = params[:track_query].values.reject(&:blank?)
    seed_tracks= params[:track_id].values.reject(&:blank?)
  
    if seed_artists.empty? && seed_tracks.empty?
      flash.now[:alert] = "Artists not found. Please try again."
      render :new, status: :unprocessable_entity
    else
      @recommendations = RSpotify::Recommendations.generate(limit: 10, seed_artists: seed_artists, seed_tracks: seed_tracks)
      if @recommendations.tracks.empty?
        flash.now[:alert] = "No recommendations found. Please try a different artist."
        render :new, status: :unprocessable_entity
      else
        session[:track_urls] = @recommendations.tracks.map { |track| track.external_urls['spotify'] }
        session[:artist_names] = artist_names
        session[:track_names] = track_names
        redirect_to spotify_track_result_path
      end
    end
  end
  
  def result
    @track_urls = session[:track_urls]
    @artist_names = session[:artist_names] 
    @track_names = session[:track_names] 
  end

  def search
    @index = params[:index]
    
    if params[:artist_query].present?
      @results = RSpotify::Artist.search(params[:artist_query], limit: 5)
      @type = 'artists'
    elsif params[:track_query].present?
      @results = RSpotify::Track.search(params[:track_query], limit: 5)
      @type = 'tracks'
    end

    respond_to do |format|
      format.turbo_stream
    end
  end
  
  private

  def spotify_track_params
    params.require(:spotify_track).permit(:query)
  end
end
