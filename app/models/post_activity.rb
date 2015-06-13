class PostActivity < ActiveRecord::Base
  belongs_to :activity
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :user
  has_many :comments
  acts_as_votable
#Scope to search in between specific post activity dates? maybe to get act_points sum from specific date?
  scope :created_between, lambda {|start_date, end_date| where("created_at >= ? AND created_at <= ?", start_date, end_date )}

  
end
