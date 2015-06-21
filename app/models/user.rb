class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable, :omniauth_providers => [:facebook]


  has_many :post_activities
  has_many :comments       

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/



  def actual_points

  	post_activities.sum(:act_points).round(2)
  end
  
  def update_total_points
  	update(total_points: actual_points)
  end	

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.provider = auth.provider
    user.uid = auth.uid
    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name
    user.image = auth.info.image.gsub('http://','https://')
  end
end
  
end
