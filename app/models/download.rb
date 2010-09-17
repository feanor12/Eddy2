class Download < ActiveRecord::Base
  belongs_to :lecture
  has_many :links,:dependent=>:destroy
end
