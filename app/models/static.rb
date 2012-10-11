class Static < ActiveRecord::Base
 attr_accessible :title, :body
 def up(value=1)
    self.priority = self.priority + value
    save
  end

  def down(value=1)
    up(-value)
    save
  end

end
