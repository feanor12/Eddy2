class CreateStatics < ActiveRecord::Migration
  def self.up
    create_table :statics do |t|
      t.string  :title,:null=>false
      t.text  :body,:null=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :statics
  end
end
