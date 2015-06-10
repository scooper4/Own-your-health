class CreatePostActivities < ActiveRecord::Migration
  def change
    create_table :post_activities do |t|
      t.text :description
      t.datetime :act_date
      t.decimal :act_points
      t.references :activity, index: true, foreign_key: true
      t.integer :act_mins
      t.timestamps null: false
    end
  end
end
