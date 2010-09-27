class AddDocumentToDownload < ActiveRecord::Migration
  def self.up
    add_column :downloads, :document, :string
  end

  def self.down
    remove_column :downloads, :document
  end
end
