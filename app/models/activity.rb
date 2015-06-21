class Activity < ActiveRecord::Base
	has_many :post_activities

def set_act_points
	activites.pts_per_min * post_activities.act_mins
end

def update_act_points
	update(act_points: set_act_points)	
	
end
end
