class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.text :lyrics, null: false
      t.string :song_name, null: false
      t.string :artist, null: false
      t.text :era
      t.string :link_to_music
      t.integer :design, null: false

      t.timestamps
    end
  end
end
