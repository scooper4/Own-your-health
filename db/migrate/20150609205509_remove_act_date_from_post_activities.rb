class RemoveActDateFromPostActivities < ActiveRecord::Migration
  def change
  	remove_column :post_activities, :act_date, :datetime
  end
end
