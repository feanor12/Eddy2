class Addpriority < ActiveRecord::Migration
  def self.up
    add_column :static_links,:priority,:integer,:default=>0,:null=>false
    add_column :statics,:priority,:integer,:default=>0,:null=>false
  end

  def self.down
    remove_column :static_links,:priority
    remove_column :statics,:priority
  end
end
