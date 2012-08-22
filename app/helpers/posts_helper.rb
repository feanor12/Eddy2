module PostsHelper
  def format_post(text)
    text=simple_format(auto_link(text))
    
    #youtube
    before='<iframe title="YouTube video player" width="544" height="335" src="http://www.youtube.com/embed/'
    after='" frameborder="0" allowfullscreen></iframe>'
    text.gsub!('[YouTube]',before)
    text.gsub!('[/YouTube]',after)

    #MITvideo
    before='<iframe width="640" height="360" src="http://video.mit.edu/embed/'
    after='/" frameborder="0"></iframe>'
    text.gsub!('[MIT]',before)
    text.gsub!('[/MIT]',after)
    
    before='<script src="http://pastebin.com/embed_js.php?i='
    after='"></script>'
    text.gsub!('[PBin]',before)
    text.gsub!('[/PBin]',after)

    text
  end
end

