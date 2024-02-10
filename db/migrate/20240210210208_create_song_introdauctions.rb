class CreateSongIntrodauctions < ActiveRecord::Migration[7.1]
  def change
    create_table :song_introdauctions do |t|
      t.string :genre
      t.integer :age
      t.string :favorite_artist
      t.string :favorite_song

      t.timestamps
    end
  end
end
