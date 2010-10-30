class Addmagictouser < ActiveRecord::Migration
  def self.up
    add_column :users,:last_request_at,:datetime
    add_column :users,:last_login_ip,:string
    add_column :users,:login_count,:integer
  end

  def self.down
    remove_column :users,:last_request_at
    remove_column :users,:last_login_ip
    remove_column :users,:login_count
  end
end
