class RemoveUrlFromDownload < ActiveRecord::Migration
  def self.up
    remove_column :downloads, :url
  end

  def self.down
    add_column :downloads, :url, :string
  end
end
