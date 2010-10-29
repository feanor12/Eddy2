class ChangeComment < ActiveRecord::Migration
  def self.up
    rename_column :comments,:post_id,:commentable_id
    add_column :comments,:commentable_type,:string,:default=>'Post'
  end

  def self.down
    rename_column :comments,:commentable_id,:post_id
    remove_column :comments,:commentable_type
  end
end
