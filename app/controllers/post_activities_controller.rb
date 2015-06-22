class PostActivitiesController < ApplicationController
before_action :belongs_to_user, only: [:edit, :update, :destroy]
before_action :authenticate_user!, except: [:index, :show]
before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote]




	def index
     
  		@post_activities = PostActivity.paginate(:page => params[:page] ).order("created_at desc")
      @users = User.order("total_points desc")
      #update each workouts points
      @post_activities.each do |post|
        post.update_act_points
      end  
      #then update total points / leaderboard
      @users.find_each do |user|
      user.update_total_points  
      end  

     
  	end
  
  def new
  		@post_activity = current_user.post_activities.build
  end	

  def create
      @post_activity = current_user.post_activities.build(activity_params)
     
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
#redirects user to root page if they dont have access to edit post
    def belongs_to_user
      find_post
      if current_user.id != @post_activity.user_id 
        redirect_to :root
      else
        
      end  
      
    end

    

   

end
