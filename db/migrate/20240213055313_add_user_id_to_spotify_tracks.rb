class AddUserIdToSpotifyTracks < ActiveRecord::Migration[7.1]
  def change
    add_reference :spotify_tracks, :user, null: false, foreign_key: true
  end
end
