class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @affirmation = Affirmation.find(params[:affirmation_id])
    @comment = @affirmation.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comments = @affirmation.comments.all.includes(:user).order(created_at: :desc)
    @comment.save
    render :create
  end

  def destroy
    comment = Comment.find(id: params[:id], affirmation_id: params[:affirmation_id])
    comment.destroy
    render :destroy
    redirect_to affirmation_path(comment.user)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :affirmation_id)
  end
end
