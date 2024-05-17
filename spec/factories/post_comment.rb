FactoryBot.define do
  factory :post_comment do
    comment { Faker::Lorem.sentence }
    association :post
    association :user
  end
end
