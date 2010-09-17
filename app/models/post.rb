class Post < ActiveRecord::Base
  has_many :comments,:dependent=>:destroy
  belongs_to :user
  validates_presence_of :title, :body, :user
  self.per_page = 5
end
