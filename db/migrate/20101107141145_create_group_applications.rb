class CreateGroupApplications < ActiveRecord::Migration
  def self.up
    create_table :group_applications do |t|
      t.references :group
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :group_applications
  end
end
