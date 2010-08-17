class Lecture < ActiveRecord::Base
  has_many :downloads
  has_many :announcements
  belongs_to :user
end
