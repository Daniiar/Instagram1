class PhotographiesController < ApplicationController

  before_filter :authenticate_user!, except: [:index]

  def index
    if user_signed_in?
      @photographies = current_user.photographies
    else
      @users = User.all
    end
  end

  def new
  	@photography = Photography.new
  end

  def create
  	@photography = Photography.new(photography_params)
  	if @photography.save
  		redirect_to photographies_path
  	else
  		render 'new'
  	end
  end

  def show
  	@photography = Photography.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all
  end

  def destroy
  	@photography = Photography.find(params[:id])
  	@photography.destroy

    redirect_to photographies_path
  end

  def lenta
    @users = User.all
    @photographies = Photography.all
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  def like
    @photography = Photography.find(params[:id])
    @photography.liked_by current_user
    redirect_to :back
  end

  def unlike
    @photography = Photography.find(params[:id])
    @photography.unliked_by current_user
    redirect_to :back
  end

  private

  def photography_params
  	params.require(:photography).permit(:name, :image, :user_id)
  end

end
