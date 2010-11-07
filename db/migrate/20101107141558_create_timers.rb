class CreateTimers < ActiveRecord::Migration
  def self.up
    create_table :timers do |t|
      t.references :group
      t.datetime :deadline
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :timers
  end
end
