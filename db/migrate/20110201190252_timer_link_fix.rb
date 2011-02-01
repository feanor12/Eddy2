class TimerLinkFix < ActiveRecord::Migration
  def self.up
    change_column :timers,:link,:string,:Null=>false,:default=>""
  end

  def self.down
    change_column :timer,:link,:string
  end
end
