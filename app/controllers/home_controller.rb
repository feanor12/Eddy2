class HomeController < ApplicationController
  def show
    @mylinks = current_user.mylinks
    @posts = Post.paginate(:page => params[:page], :order => 'created_at DESC')
    @downloads = Download.find(:all,:order=>'updated_at DESC',:limit=>5)
  end
end
