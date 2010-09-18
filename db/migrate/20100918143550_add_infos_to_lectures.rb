class AddInfosToLectures < ActiveRecord::Migration
  def self.up
    add_column :lectures, :description, :string     
  end

  def self.down
    remove_column :lectures, :description, :string     
  end
end
