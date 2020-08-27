class PicturesController < ApplicationController
  def index
    @user = current_user
    @pictures = current_user.pictures
    @comment = Comment.new
    @comments = Comment.all.order(created_at: :desc)
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @user = current_user
    @picture.user = @user
    if @picture.save
      redirect_to root_path
    else
      flash[:alert] = "Unable to perform operation"
      render "new"
    end
  end

  private

  def picture_params
    params.require(:picture).permit(photos: [])
  end
end
