class CommentsController < ApplicationController
  def index
    @comments = Comment.includes(:user).order(id: "DESC")
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create

  end

  def edit

  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to affirmation_path(comment.user)
  end
end
