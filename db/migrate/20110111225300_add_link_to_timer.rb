class AddLinkToTimer < ActiveRecord::Migration
  def self.up
    add_column :timers, :link, :string
  end

  def self.down
    remove_column :timers, :link
  end
end
