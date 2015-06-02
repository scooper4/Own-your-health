class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :pts_per_min

      t.timestamps null: false
    end
  end
end
