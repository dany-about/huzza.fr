FactoryBot.define do
  factory :event do
    admin_id { FactoryBot.create(:user).id }
    start_date { Faker::Date.forward(rand(1..666)) }
    duration { rand(1..100) * 5 }
    title { Faker::DrWho.catch_phrase }
    description { Faker::DrWho.quote + Faker::HowIMetYourMother.quote }
    price { rand(1..1000) }
    location { Faker::HarryPotter.location }
  end
end
