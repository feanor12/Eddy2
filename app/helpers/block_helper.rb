module BlockHelper
  def block_to_partial(partial_name, options = {}, &block)
    if block_given?
      options.merge!(:body => capture(&block))
    end
    render(:partial => partial_name, :locals => options)
  end

  def boxed(title ,options={} , &block)
    block_to_partial('shared/box', options.merge(:title=>title), &block)
  end
end
