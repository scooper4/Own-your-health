class PostActivity < ActiveRecord::Base

  belongs_to :activity
  has_attached_file :image,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
     :path => ":id_:filename"  # Defaults to ":filename"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :user
  has_many :comments
  acts_as_votable
#Scope to search in between specific post activity dates? maybe to get act_points sum from specific date?
  scope :created_between, lambda {|start_date, end_date| where("created_at >= ? AND created_at <= ?", start_date, end_date )}

  self.per_page = 5





  def post_points
  	activity.pts_per_min * act_mins
  end
  
  def update_act_points
  	update(act_points: post_points.round(2))
  end

  
  


end
