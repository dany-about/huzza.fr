require 'rails_helper'

RSpec.describe ChargesController, type: :controller do


  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(response).to render_template("new")
    end
  end

  describe "GET #create" do
    it "redirects successfully" do
      get :create
      expect(response).to redirect_to(new_charge_path)
    end
  end

end
