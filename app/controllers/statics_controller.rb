class StaticsController < ApplicationController
  filter_resource_access
  before_filter :store_location,:only=>[:show]

  def up
    @site=Static.find(params[:id])
    @site.up
    redirect_to statics_path
  end

  def down
    @site=Static.find(params[:id])
    @site.down
    redirect_to statics_path
  end

  def show
    @site = Static.find(params[:id])
    if @site
      render :action=>:show
    else
      redirect_to root_url
    end
  end

  def new
    @site = Static.new
  end

  def create
    @site = Static.new(params[:static])
    if @site.save
      redirect_to static_path(@site)
    else
      render :action=>:new
    end
  end

  def index
    @sites=Static.order('priority DESC')
  end

  def edit
    @site=Static.find(params[:id])
  end

  def update
    @site = Static.find(params[:id])
    if @site.update_attributes(params[:static])
      redirect_to static_path(@site)
    else
      render :action=>:edit
    end
  end

  def destroy
    @site = Static.find(params[:id])
    if @site.delete
     flash[:notice] = "Static destroyed"
    end
    redirect_to statics_path
  end
end
