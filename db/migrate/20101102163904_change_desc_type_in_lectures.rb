class ChangeDescTypeInLectures < ActiveRecord::Migration
  def self.up
    change_column :lectures,:description,:text
  end

  def self.down
    change_column :lectures,:description,:string
  end
end
