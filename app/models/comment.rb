class Comment < ActiveRecord::Base
  belongs_to :post_activity
  belongs_to :user
end
