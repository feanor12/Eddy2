module PostsHelper
  def format_post(text)
    text=simple_format(auto_link(text))
    
    #youtube
    before='<iframe width="544" height="335" src="//www.youtube-nocookie.com/embed/'
    after='" frameborder="0" allowfullscreen></iframe>'
    text.gsub!('[YouTube]',before)
    text.gsub!('[/YouTube]',after)

    #MITvideo
    before='<iframe width="544" height="335" src="http://video.mit.edu/embed/'
    after='/" frameborder="0"></iframe>'
    text.gsub!('[MIT]',before)
    text.gsub!('[/MIT]',after)
    
    before='<script src="http://pastebin.com/embed_js.php?i='
    after='"></script>'
    text.gsub!('[PBin]',before)
    text.gsub!('[/PBin]',after)

    raw text
  end
end

