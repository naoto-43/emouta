class Post < ApplicationRecord
  belongs_to :user

  validates :lyricks, presence: true, length: { maximum: 65_535 }
  validates :song_title, presence: true, length: { maximum: 255 }
  validates :artist, presence: true, length: { maximum: 255 }
  validates :coment, length: { maximum: 65_535 }
  validates :link_to_music, length: { maximum: 255 }
  validates :design,  presence: true

  enum design: { red: 0, blue: 1, yellow: 2, green: 3 }

  def split_id_from_spotify_url
    # URLからクエリパラメータを除去し、必要なID部分のみを抽出
    uri = URI.parse(link_to_music)
    path_segments = uri.path.split('/')
    #"track"や"playlist"の後のセグメントをIDとして抽出
    id_index = path_segments.index { |s| s == "track" || s == "playlist" } + 1
    path_segments[id_index] if id_index.present? && path_segments.size > id_index
  rescue URI::InvalidURIError
    nil
  end
end
