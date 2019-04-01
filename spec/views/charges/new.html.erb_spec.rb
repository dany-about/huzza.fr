require 'rails_helper'

RSpec.describe "charges/new.html.erb", type: :view do

  it "has a request.fullpath that is defined" do
      expect(controller.request.fullpath).to eq new_charge_path
  end
end
