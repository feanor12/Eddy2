class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      #authlogic
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :perishable_token
      #roles
      t.integer :role_id

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
