class AddTotalPointsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :total_points, :float
  end
end
