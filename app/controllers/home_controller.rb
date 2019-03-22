class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def after_sign_up_path_for(resource)
		'dares#index'
  end
  
end
