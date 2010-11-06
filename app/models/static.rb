class Static < ActiveRecord::Base
 def up(value=1)
    self.priority = self.priority + value
    save
  end

  def down(value=1)
    up(-value)
    save
  end

end
