class AddDescriptionToDownload < ActiveRecord::Migration
  def self.up
    add_column :downloads, :description, :text
  end

  def self.down
    remove_column :downloads, :description
  end
end
