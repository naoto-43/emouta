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
        '' # 未指定またはその他の場合
      end

      # 変数を展開してクエリを作成する
      query = "genre:\"#{genre_param}\" year:#{year_range}"
      tracks = RSpotify::Track.search(query, limit: 5)
      tracks.each_with_index do |track, index|
        track_link = track.external_urls['spotify']
      end
      redirect_to show_spotify_track_path, success: t('defaults.message.created', item: SpotifyTrack.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def spotify_track_params
    params.require(:spotify_track).permit(:genre, :age, :favorite_artist, :favorite_song)
  end
end
