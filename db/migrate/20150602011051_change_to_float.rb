class ChangeToFloat < ActiveRecord::Migration
  def change
    change_column :activities, :pts_per_min, :float
  end
end
