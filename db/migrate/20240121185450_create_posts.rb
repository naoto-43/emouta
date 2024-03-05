class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :song_title, null: false  # 曲のタイトル
      t.text :lyricks, null: false    # 歌詞
      t.string :artist, null: false       # アーティスト名
      t.text :coment         # コメント
      t.string :link_to_music # 音楽へのリンク
cc
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
