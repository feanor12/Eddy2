module ApplicationHelper
  def yield_for(sym,default)
    output = content_for(sym)
    output = default if output.blank?
    output
  end

  def title(string)
    content_for :title do
      truncate(string, :length=>15)
    end
  end

  def subnav(&block)
    content_for(:subnav,&block) 
  end

end
