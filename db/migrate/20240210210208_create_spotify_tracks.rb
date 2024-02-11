class CreateSpotifyTracks < ActiveRecord::Migration[7.1]
  def change
    create_table :spotify_tracks do |t|
      t.string :genre
      t.integer :age
      t.string :favorite_artist
      t.string :favorite_song

      t.timestamps
    end
  end
end
