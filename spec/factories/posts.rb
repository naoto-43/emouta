FactoryBot.define do
  factory :post do
    song_title { Faker::Music.album }
    lyrics { Faker::Lorem.sentence(word_count: 100) }
    artist { Faker::Music.band }
    link_to_music { Faker::Internet.url }
    story { Faker::Lorem.paragraph }
    association :user
  end
end
