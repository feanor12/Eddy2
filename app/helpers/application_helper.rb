module ApplicationHelper
  def yield_for(sym,default)
    output = content_for(sym)
    output = default if output.blank?
    output
  end

  def title(string)
    content_for :title do
      string
    end
  end

  def subnav(&block)
    content_for(:subnav,&block)
  end

  def new_link(controller_name,path="")
    if path.blank?
      link_to("Add",{:controller=>controller_name,:action=>'new'},:class=>"action_tag add_tag")if permitted_to?(:create,controller_name.to_sym)
    else
      link_to("Add",path,:class=>"action_tag add_tag")if permitted_to?(:create,controller_name.to_sym)
    end
  end

  def destroy_link(item,path,options={})
    link_to("Delete",path,options.merge(:method=>:delete,:confirm=>"Sicher?",:class=>"action_tag del_tag")) if permitted_to?(:destroy,item)
  end

  def edit_link(item,path,options={})
    link_to("Edit",path,options.merge(:class=>"action_tag edit_tag")) if permitted_to?(:update,item)
  end

  def clear()
    raw"<div style='clear:both'></div>"
  end

end
