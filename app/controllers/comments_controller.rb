class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_comment, only: [ :edit, :update, :destroy]

  def index
  	@post_activity = PostActivity.find(params[:post_activity_id])
  	@comments = Comment.includes(:users)
  end

  def new
  	@post_activity = PostActivity.find(params[:post_activity_id])
  	@comment = @post_activity.comments.new
  	
  end

  def create
  	@post_activity = PostActivity.find(params[:post_activity_id])
  	@comment = @post_activity.comments.new(comment_params)
  	@comment.user = current_user
  	if @comment.save
  		redirect_to @post_activity
  	else
  		render 'new'	
  	end	
  end

  def show
    @comments = Comment.find(params[:post_activity_id])
  end  

  def edit
  end

  def update
  end

  def destroy
  	@comment.destroy
  end

  private
  	
  	def find_comment
  		@comment = Comment.find(params[:id])
  	end

  	def comment_params
  		params.require(:comment).permit(:content)
  	end	
  
end
