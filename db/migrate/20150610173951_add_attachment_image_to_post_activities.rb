class AddAttachmentImageToPostActivities < ActiveRecord::Migration
  def self.up
    change_table :post_activities do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :post_activities, :image
  end
end
