class User < ApplicationRecord
  has_many :likes
  has_many :posts, through: :likes
end
