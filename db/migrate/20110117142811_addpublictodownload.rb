class Addpublictodownload < ActiveRecord::Migration
  def self.up
    add_column :downloads,:public,:boolean,:null=>false,:default=>false
  end

  def self.down
    remove_column :downloads,:public
  end
end
