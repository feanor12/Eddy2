module PostsHelper
  def format_post(text)
    text=simple_format(auto_link(text))
    before='<iframe title="YouTube video player" width="550" height="335" src="http://www.youtube.com/embed/'
    after='" frameborder="0" allowfullscreen></iframe>'
    text.gsub!('[YouTube]',before)
    text.gsub!('[/YouTube]',after)
  end
end

