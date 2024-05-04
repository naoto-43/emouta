class RemoveSpotifyTracks < ActiveRecord::Migration[7.1]
  def up
    remove_foreign_key :spotify_tracks, :users
    drop_table :spotify_tracks
  end

  def down
    create_table :spotify_tracks do |t|
      t.integer :genre
      t.integer :age
      t.string :favorite_artist
      t.string :favorite_song
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
