class PostActivitiesController < ApplicationController

before_action :find_post, only: [:show, :edit, :update, :destroy]

	def index
  		@post_activities = PostActivity.includes(:activity).all
  	end
  
  def new
  		@post_activity = PostActivity.new
  end	

  def create
      @post_activity = PostActivity.new(activity_params)
      if @post_activity.save
        redirect_to @post_activity
      else
        redirect_to new_post_activity_path
      end   
  end 
  
  def show
      
  end 

  
  def edit
  end
  	
  def update
    if @post_activity.update(activity_params)
        redirect_to @post_activity
      else
        render 'form'
      end   

  end	

  def destroy
    @post_activity.destroy
    redirect_to post_activities_path
  end	

  private

  	def activity_params
  		params.require(:post_activity).permit(:description,:activity_id,:act_mins,:image)
    end

    def find_post
      @post_activity = PostActivity.find(params[:id])
    end

end
