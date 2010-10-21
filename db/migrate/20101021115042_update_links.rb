class UpdateLinks < ActiveRecord::Migration
  def self.up
    add_column :links, :name ,:string
    add_column :links, :lecture_id, :integer
    remove_column :links, :download_id
  end

  def self.down
    remove_column :links, :name
    remove_column :links, :lecture_id
    add_column :links, :download_id, :integer
  end
end
