class AddUserToLecture < ActiveRecord::Migration
  def self.up
    add_column :lectures, :user_id, :integer
  end

  def self.down
    remove_column :lectures, :user_id
  end
end
