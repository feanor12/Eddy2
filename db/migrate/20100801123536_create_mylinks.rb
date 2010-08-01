class CreateMylinks < ActiveRecord::Migration
  def self.up
    create_table :mylinks do |t|
      t.string :name
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :mylinks
  end
end
