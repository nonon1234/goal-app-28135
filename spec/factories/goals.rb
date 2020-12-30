FactoryBot.define do
  factory :goal do
    Faker::Config.locale = 'ja'
    title { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    deadline { Faker::Date.between(from: '2021-01-01', to: '2024-12-31') }
    association :user
  end
end
