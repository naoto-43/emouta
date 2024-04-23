class Post < ApplicationRecord
  has_many :post_comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
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

  def save_tags(tags)
    current_tags = self.tags.pluck(:name)
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete(Tag.find_by(name: old_name))
    end

    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(name: new_name)
      self.tags << post_tag unless self.tags.include?(post_tag)
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[song_title artist tag]
  end
end
