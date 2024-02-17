class SearchController < ApplicationController
  def artists
    query = params[:query]
    @artists = RSpotify::Artist.search(query, limit: 5) if query.present?
    respond_to do |format|
      format.turbo_stream
    end
  end
end
