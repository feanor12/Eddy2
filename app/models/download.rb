class Download < ActiveRecord::Base
  belongs_to :lecture
  validates_presence_of :name
  mount_uploader :document, DocumentUploader
  #validates_presence_of :document
end
