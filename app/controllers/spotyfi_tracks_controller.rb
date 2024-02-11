class SpotyfiTracksController < ApplicationController
  def new;end

  def create;end

  private

  def spotify_tracks_params
    params.require(:spotify_track).permit(:gene, :genre, :age, :fovorite_artist, :favorite_song)
  end
end
