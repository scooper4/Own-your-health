class DropFake < ActiveRecord::Migration
  def change
  	drop_table :fakes
  end
end
