class SearchController < ApplicationController
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
end
