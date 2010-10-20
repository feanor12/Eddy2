class AddSemesterToLectures < ActiveRecord::Migration
  def self.up
    add_column :lectures, :semester, :integer, :default=>0 
  end

  def self.down
    remove_column :lectures, :semester
  end
end
