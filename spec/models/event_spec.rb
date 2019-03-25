require 'rails_helper'

RSpec.describe Event, type: :model do

  before(:each) do
    @event = FactoryBot.build(:event)
  end

  it "has a valid factory" do
    expect(build(:event)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@event).to be_a(Event)
    end
    it "#start_date" do
      expect @event.start_date.class == Date
      expect @event.start_date > Time.now
    end
    it "#duration" do
      expect @event.duration.class == Integer
      expect @event.duration % 5 == 0
      expect(@event).to allow_value(5).for(:duration)
      expect(@event).to allow_value(10).for(:duration)
      expect(@event).to_not allow_value(5.5).for(:duration)
      expect(@event).to_not allow_value(-5).for(:duration)
      expect(@event).to_not allow_value(0).for(:duration)
    end
    it "#title" do
      expect @event.title.class == String
      expect @event.title.length >= 5 && 140 >= @event.title.length
      expect(@event).to allow_value('Peepoodo').for(:title)
      expect(@event).to_not allow_value('Jul').for(:title)  # Refouler Jul direct quand il essaie de rentrer dans la DB, le coquinou pourrait tout nous souiller.
      expect(@event).to_not allow_value('BG').for(:title) # Déso Félix :p
      expect(@event).to_not allow_value(nil).for(:title)
    end
    it "#description" do
      expect @event.description.class == String
      expect @event.description.length >= 20 && 1000 >= @event.description.length
      expect(@event).to allow_value("J'aime pas les étrangers").for(:description)
      expect(@event).to allow_value('12345678912345678912').for(:description) # String.length 20
      expect(@event).to_not allow_value('1234567891234567891').for(:description)  # String.length 19
      expect(@event).to_not allow_value(nil).for(:description)
    end
    it "#price" do
      expect @event.price.class == Integer
      expect @event.price >= 1 && 1000 >= @event.price
      expect(@event).to allow_value(1).for(:price)
      expect(@event).to allow_value(500).for(:price)
      expect(@event).to allow_value(1000).for(:price)
      expect(@event).to_not allow_value(1001).for(:price)
      expect(@event).to_not allow_value(nil).for(:price)
    end
    it "#location" do
      expect @event.location.class == String
      expect(@event).to allow_value('Bar le 1969').for(:location)
      expect(@event).to allow_value('Le grand théatre').for(:location)
      expect(@event).to_not allow_value(nil).for(:location)
    end
  end

  context "associations" do
  	it { expect(@event).to have_many(:attendances) }
  	it { expect(@event).to have_many(:attendees) }
  	it { expect(@event).to belong_to(:admin) }
  end
end
