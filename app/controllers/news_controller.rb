class NewsController < ApplicationController

  def index  #feed
    @network_news = current_user.news
    @friends_list = current_user.friends_list
  end

end
