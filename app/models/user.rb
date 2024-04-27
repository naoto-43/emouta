class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy 
  has_many :post_comments, dependent: :destroy
  has_many :spotify_tracks
  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true, uniqueness: true

  def own?(object)
    id == object.user_id
  end
end
