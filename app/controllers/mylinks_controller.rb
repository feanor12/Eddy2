class MylinksController < ApplicationController
  filter_resource_access
  def create
    @mylink = Mylink.new(params[:mylink])
    @mylink.user = current_user
    if @mylink.save
      redirect_to posts_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @mylink=Mylink.find(params[:id])
  end

  def update
    @mylink = Mylink.find(params[:id])
    if @mylink.update_attributes(params[:mylink])
      redirect_to posts_path
    else
      render :action=>:edit
    end
  end

  def destroy
    @mylink = Mylink.find(params[:id])
    @mylink.destroy
    respond_to do |format|
      format.html{redirect_to posts_path}
      format.js{render :action=>'destroy.js.erb'}
    end
  end

  def index
    @mylinks=current_user.mylinks
  end

  def new
    @mylink = Mylink.new
    @mylink.url="http://"
  end
end
