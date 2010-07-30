class AddDownloadToLinks < ActiveRecord::Migration
  def self.up
    add_column :links, :download_id, :integer
  end

  def self.down
    remove_column :links, :download_id
  end
end
