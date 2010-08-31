module BlockHelper
  def block_to_partial(partial_name, options = {}, &block)
    options.merge!(:body => capture(&block))
    render(:partial => partial_name, :locals => options)
  end

  def boxed(title ,options={} , &block)
    block_to_partial('shared/box', options.merge(:title=>title), &block)
  end
end
