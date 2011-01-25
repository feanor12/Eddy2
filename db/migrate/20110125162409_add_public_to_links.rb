class AddPublicToLinks < ActiveRecord::Migration
  def self.up
    add_column :links,:public,:boolean,:null=>false,:default=>false
  end

  def self.down
    remove_column :links,:public
  end
end
