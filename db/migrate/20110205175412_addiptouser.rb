class Addiptouser < ActiveRecord::Migration
  def self.up
    add_column :users,:current_login_ip,:string
  end

  def self.down
    remove_column :users,:current_login_ip
  end
end
