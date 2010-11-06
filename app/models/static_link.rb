class StaticLink < ActiveRecord::Base
  validates_format_of :url, :with=> /http:\/\/.+/
  validates_presence_of :url,:name 

  def up(value=1)
    self.priority = self.priority + value
    save
  end

  def down(value=1)
    up(-value)
    save
  end
end
