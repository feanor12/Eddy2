class UnilinkNumbers < ActiveRecord::Migration
  def self.up
    change_table :lectures do |t|
      t.integer :uni_corg
      t.integer :uni_clvnr
      t.remove :unilink
    end
  end

  def self.down
    remove_column :lectures, :tug_corg
    remove_column :lectures, :tug_clvnr
  end
end
