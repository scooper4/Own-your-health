class PostActivity < ActiveRecord::Base

  belongs_to :activity
  has_attached_file :image, :styles => { :large => "1000x1000", :medium => "300x300>", :thumb => "100x100>" }, 
  :default_url => "/images/:style/missing.png",
  :storage => :s3,
  :bucket  => ENV['S3_BUCKET_NAME'],
   
  :access_key_id => ENV['AWS_ACCESS_KEY_ID']
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
