class Lecture < ActiveRecord::Base
  has_many :downloads
  belongs_to :user
end
