require 'rails_helper'

RSpec.describe "events/index.html.erb", type: :view do

  it "matches the Rails environment by using symbols for keys" do
    [:controller, :action].each { |k| expect(controller.request.path_parameters.keys).to include(k) }
  end

  it "has a request.fullpath that is defined" do
      expect(controller.request.fullpath).to eq root_path
  end
end
