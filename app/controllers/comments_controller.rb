class CommentsController < ApplicationController
  respond_to :js

  def create
    params[:type].constantize.find(params[:commentable_id]).comments.create!(user: current_user, content: params[:content])
    render :index
  end

  def update
    Comment.find(params[:id]).update(content: params[:content])
    render :index
  end

  def destroy
    if Comment.exists?(params[:id])
      Comment.find(params[:id]).destroy
    end
    render :index
  end

end
