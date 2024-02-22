class SearchController < ApplicationController
  def artists
    artist_query = params[:artist_query]
    @index = params[:index]
    @artists = RSpotify::Artist.search(artist_query, limit: 5) if artist_query.present?
    respond_to do |format|
      format.turbo_stream
    end
  end

  def tracks
    track_query = params[:track_query]
    @index = params[:index]
    @tracks = RSpotify::Artist.search(track_query, limit: 5) if track_query.present?
    respond_to do |format|
      format.turbo_stream
    end
  end
end
