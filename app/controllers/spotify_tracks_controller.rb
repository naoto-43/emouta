class SpotifyTracksController < ApplicationController
  def new
    @spotify_track = SpotifyTrack.new 
  end

  def create
    @spotify_track = current_user.spotify_tracks.build(spotify_track_params) 
    if @spotify_track.save
      age_param = spotify_track_params[:age]
      genre_param = spotify_track_params[:genre]
      year_range = case age_param
      when 'upto_1979'
        '1900-1979'
      when 'the_1980s'
        '1980-1989'
      when 'the_1990s'
        '1990-1999'
      when 'the_2000s'
        '2000-2009'
      when 'the_2010s'
        '2010-2019'
      when 'from_2020'
        '2020-'
      else
        '' 
      end

      query = "genre:\"#{genre_param}\" year:#{year_range}"
      tracks = RSpotify::Track.search(query, limit: 5)
      tracks.each_with_index do |track, index|
        session[:track_links] ||= []
        session[:track_links] << track.external_urls['spotify']
        @track_links = session[:track_links] || []
      end
      
      redirect_to spotify_track_path(id: @spotify_track.id)
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
