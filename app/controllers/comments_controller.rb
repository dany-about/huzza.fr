class CommentsController < ApplicationController
  respond_to :html, :js

  def create
    params[:type].constantize.find(params[:commentable_id]).comments.create!(user: current_user, content: params[:content])
  end

  def destroy
    if Comment.exists?(params[:id])
      Comment.find(params[:id]).destroy
    end
    respond_to do |format|
      format.js {render :create}
    end
  end

end
