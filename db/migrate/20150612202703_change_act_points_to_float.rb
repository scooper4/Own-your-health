class ChangeActPointsToFloat < ActiveRecord::Migration
  def change
  	change_column :post_activities, :act_points, :float
  end
end
