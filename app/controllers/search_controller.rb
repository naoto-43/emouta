class SearchController < ApplicationController
  def artists
    query = params[:query]
    @index = params[:index]
    @artists = RSpotify::Artist.search(query, limit: 5) if query.present?
    respond_to do |format|
      format.turbo_stream
    end
  end
end
