class CommentsController < ApplicationController
  respond_to :html, :js

  def create
    params[:type].constantize.find(params[:commentable_id]).comments.create!(user: current_user, content: params[:content])
  end

  def update

  end

  def destroy

  end

end
