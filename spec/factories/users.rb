FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Ethereum.address }
    description { Faker::DrWho.quote + Faker::HowIMetYourMother.quote }
    first_name { Faker::Superhero.prefix }
    last_name { Faker::BackToTheFuture.character }
  end
end
