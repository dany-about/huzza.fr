FactoryBot.define do
  factory :attendance do
    attendee_id { FactoryBot.create(:user).id }
    event_id { FactoryBot.create(:event).id }
    stripe_customer_id { Faker::Business.credit_card_number }
  end
end
