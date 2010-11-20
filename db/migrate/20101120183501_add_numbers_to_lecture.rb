class AddNumbersToLecture < ActiveRecord::Migration
  def self.up
    change_table :lectures do |t|
      t.integer :tug_corg
      t.integer :tug_clvnr
      t.remove :tuglink
    end
    
  end

  def self.down
    remove_column :lectures, :tug_corg
    remove_column :lectures, :tug_clvnr
  end
end
