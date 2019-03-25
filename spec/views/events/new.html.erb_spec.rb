require 'rails_helper'

RSpec.describe "events/new.html.erb", type: :view do

  it "has a request.fullpath that is defined" do
      expect(controller.request.fullpath).to eq new_event_path
  end
end
