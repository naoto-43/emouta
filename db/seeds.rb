10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: 'password', # すべてのダミーユーザーに共通のパスワード
    password_confirmation: 'password'
  )

  2.times do
    Post.create!(
      song_title: Faker::Music.album, # 仮の曲のタイトル
      lyricks: Faker::Lorem.sentence(word_count: 100), # 仮の歌詞
      artist: Faker::Music.band, # 仮のアーティスト名
      coment: Faker::Lorem.paragraph, # 仮のコメント
      link_to_music: Faker::Internet.url, # 仮の音楽へのリンク
      design: rand(0..2), # デザインのパターン（例: 0, 1, 2）
      user_id: user.id # ユーザーIDの関連付け
    )
  end
end
