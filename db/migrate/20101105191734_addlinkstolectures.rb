class Addlinkstolectures < ActiveRecord::Migration
  def self.up
    add_column :lectures,:unilink,:string,:null=>false,:default=>""
    add_column :lectures,:tuglink,:string,:null=>false,:default=>""
  end

  def self.down
    remove_column :lectures,:unilink
    remove_column :lectures,:tuglink
  end
end
