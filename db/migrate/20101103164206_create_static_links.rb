class CreateStaticLinks < ActiveRecord::Migration
  def self.up
    create_table :static_links do |t|
      t.string :name
      t.string :url
      t.timestamps
    end
  end

  def self.down
    drop_table :static_links
  end
end
