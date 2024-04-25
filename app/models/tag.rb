class Tag < ApplicationRecord
  has_many :post_tags ,dependent: :destroy
  has_many :posts, through: :post_tags
  validates :name, presence:true, length:{maximum:12}

  def self.ransackable_attributes(auth_object = nil)
    %w[name]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
