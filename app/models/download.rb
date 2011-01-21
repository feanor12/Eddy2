class Download < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :user
  validates_presence_of :user
  validates_presence_of :lecture
  validates_presence_of :name
  mount_uploader :document, DocumentUploader
  #validates_presence_of :document

end
