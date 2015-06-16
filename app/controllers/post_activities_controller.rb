class PostActivitiesController < ApplicationController

before_action :authenticate_user!, except: [:index, :show]
before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote]



	def index
     
  		@post_activities = PostActivity.paginate(:page => params[:page] ).order("created_at desc")
      @users = User.order("total_points desc")
      @users.find_each do |user|
        user.update_total_points
        
      end  
     
  	end
  
  def new
  		@post_activity = current_user.post_activities.build
  end	

  def create
      @post_activity = current_user.post_activities.build(activity_params)
      add_points
      if @post_activity.save
        redirect_to @post_activity
      else
        redirect_to new_post_activity_path
      end   
  end 
  
  def show
      
  end 
  def upvote
    @post_activity.upvote_by current_user
    redirect_to :back
  end 

  
  def edit
  end
  	
  def update
    if @post_activity.update(activity_params)
        add_points
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
  		params.require(:post_activity).permit(:description,:activity_id,:act_mins,:image,)
    end

    def find_post
      @post_activity = PostActivity.find(params[:id])
    end

    def add_points
      @post_activity.update_attribute(:act_points, (@post_activity.act_mins * @post_activity.activity.pts_per_min).round(2))
    end  

   

end
