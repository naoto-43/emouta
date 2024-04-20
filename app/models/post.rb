class Post < ApplicationRecord
  has_many :post_comments, dependent: :destroy
  has_many :post_tags
  has_many :tags, through: :post_tags
  belongs_to :user
  
  validates :lyrics, presence: true, length: { maximum: 65_535 }
  validates :song_title, presence: true, length: { maximum: 255 }
  validates :artist, presence: true, length: { maximum: 255 }
  validates :link_to_music, length: { maximum: 255 }

  def split_id_from_spotify_url
    uri = URI.parse(link_to_music)
    path_segments = uri.path.split('/')
    id_index = path_segments.index { |s| s == "track" || s == "playlist" } + 1
    path_segments[id_index] if id_index.present? && path_segments.size > id_index
  rescue URI::InvalidURIError
    nil
  end
end
