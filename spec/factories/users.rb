FactoryBot.define do
  factory :user do
    Faker::Config.locale = 'ja'
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    employee_number { 1234 }
    division_id { 1 }
    position_id { 1 }
    password = Faker::Internet.password(min_length: 10)
    password { password }
    password_confirmation { password }
    email { Faker::Internet.free_email }
  end
end
