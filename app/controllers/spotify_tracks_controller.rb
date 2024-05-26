class SpotifyTracksController < ApplicationController
  def new
    # rspotifyで取得した楽曲名（ユーザーに表示する用）
    @track_query = Array.new(5, '')
    #  rspotifyで取得した楽曲のid（実際にrspotifyで関連を取得するのに必要）
    @seed_tracks = Array.new(5, '')
  end

  def create
    @track_query = params[:track_query].values.reject(&:blank?)
    @seed_tracks = params[:track_id].values.reject(&:blank?)

    if @seed_tracks.empty?
      flash.now[:danger] = t('.not_found')
      render :new, status: :unprocessable_entity
    else
      @recommendations = RSpotify::Recommendations.generate(limit: 10, seed_tracks: @seed_tracks)
      if @recommendations.tracks.empty?
        flash.now[:danger] = t('.no_recommendations')
        render :new, status: :unprocessable_entity
      else
        session[:track_urls] = @recommendations.tracks.map { |track| track.external_urls['spotify'] }
        session[:@track_query] = @track_query
        redirect_to spotify_track_result_path
      end
    end
  end

  def result
    @track_urls = session[:track_urls]
    @track_query = session[:@track_query]
  end

  def search
    @index = params[:index]
    @results = RSpotify::Track.search(params[:track_query], limit: 5)
  end
end
