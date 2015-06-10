class AddUserIdToPostActivity < ActiveRecord::Migration
  def change
  	add_column :post_activities, :user_id, :integer
  	add_index :post_activities, :user_id
  end
end
