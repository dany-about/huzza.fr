require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = FactoryBot.build(:user)
  end

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
    end

    it "is a string for first_name" do
      expect @user.first_name.class == String
      expect(@user).to allow_value('Michael').for(:first_name)
      expect(@user).to_not allow_value(nil).for(:first_name)
    end

    it "is a string for last_name" do
      expect @user.last_name.class == String
      expect(@user).to allow_value('Kael').for(:last_name)
      expect(@user).to_not allow_value(nil).for(:last_name)
    end

    it "is a string for email" do
      expect @user.email.class == String
      expect(@user).to allow_value('peepoodo@foretmagique.sff').for(:email)
      expect(@user).to_not allow_value('bobbylapointe').for(:email)
      expect(@user).to_not allow_value(nil).for(:email)
    end
  end

  context "associations" do
  	# it { expect(@user).to have_many(:attendances) }
  	it { expect(@user).to have_many(:events) }
  	it { expect(@user).to have_many(:organized_events) }
    # it { expect(@user).to have_many(:attented_events) }
  end
end
