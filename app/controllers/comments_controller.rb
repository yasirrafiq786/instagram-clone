class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)
    @picture = Picture.find(params[:picture_id])
    @user = current_user
    @comment.user = @user
    @comment.picture = @picture
    if @comment.save
      flash[:notice] = "Comment succesfully created"
      redirect_to root_path
    else
      flash[:alert] = "Unable to make new comment"
      redirect_to root_path
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      flash[:notice] = "Comment updated"
      redirect_to root_path
    else
      flash[:alert] = "Unable to update comment"
    end
  end

  def destroy
    if @comment.destroy
      flash[:notice] = "Succesfully Deleted"
      redirect_to root_path
    else
      flash[:alert] = "Unable to Delete"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
