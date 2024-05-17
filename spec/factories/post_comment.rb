FactoryBot.define do
  factory :post_comment do
    comment { Faker::Lorem.sentence }
    association :user
    association :post
  end
end
