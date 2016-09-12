class CommentsController < ApplicationController

  before_action :set_comment, only: [:edit, :update, :destroy]

  before_action :no_actions, only: [:edit, :update, :destroy]

  def create
  	@comment = Comment.new(comment_params)

  	if @comment.save
      redirect_to :back
  	end
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy

    redirect_to :back
  end

  def edit
  	# @comment = Comment.find(params[:id])
  end

  def update
  	# @comment = Comment.find(params[:id])
  	if @comment.update(comment_params) 

		  redirect_to photography_path(@comment.photography.id)
  	else
  		render 'edit'
  	end
  end

  private

  def comment_params
  	params.require(:comment).permit(:title, :photography_id, :user_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end


  def no_actions
    unless current_user == @comment.user
        unless current_user == @comment.photography.user
          
        redirect_to root_path
        end
    end
  end

end
