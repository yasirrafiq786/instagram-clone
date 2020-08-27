class CommentsController < ApplicationController
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

  def edit
    @comment = Comment.find(params[:id])
    @picture = Picture.find(params[:picture_id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Comment updated"
      redirect_to root_path
    else
      flash[:alert] = "Unable to update comment"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
