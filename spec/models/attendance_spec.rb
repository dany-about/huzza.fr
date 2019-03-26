require 'rails_helper'

RSpec.describe Attendance, type: :model do

  before(:each) do
    @attendance = FactoryBot.build(:attendance)
  end

  it "has a valid factory" do
    expect(build(:attendance)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@attendance).to be_a(Attendance)
    end
  end

  context "associations" do
    it { expect(@attendance).to belong_to(:attendee) }
  	it { expect(@attendance).to belong_to(:event) }
  end
end
