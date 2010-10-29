class AddUseridToDownload < ActiveRecord::Migration
  def self.up
    add_column :downloads,:user_id,:integer,:default=>1
  end

  def self.down
    remove_column :downloads,:user_id
  end
end
