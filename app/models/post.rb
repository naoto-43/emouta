class Post < ApplicationRecord
  belongs_to :user

  validates :lyricks, presence: true, length: { maximum: 65_535 }
  validates :song_title, presence: true, length: { maximum: 255 }
  validates :artist, presence: true, length: { maximum: 255 }
  validates :coment, length: { maximum: 65_535 }
  validates :link_to_music, length: { maximum: 255 }
  validates :design,  presence: true

  enum design: { red: 0, blue: 1, yellow: 2, green: 3 }
end
