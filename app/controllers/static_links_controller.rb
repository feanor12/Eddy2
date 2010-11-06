class StaticLinksController < ApplicationController
  filter_resource_access


  def up
    @static_link = StaticLink.find(params[:id])
    @static_link.up
    redirect_to static_links_path
  end

  def down
    @static_link = StaticLink.find(params[:id])
    @static_link.down
    redirect_to static_links_path
  end


  # GET /static_links
  # GET /static_links.xml
  def index
    @static_links = StaticLink.order('priority DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @static_links }
    end
  end

  # GET /static_links/new
  # GET /static_links/new.xml
  def new
    @static_link = StaticLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @static_link }
    end
  end

  # GET /static_links/1/edit
  def edit
    @static_link = StaticLink.find(params[:id])
  end

  # POST /static_links
  # POST /static_links.xml
  def create
    @static_link = StaticLink.new(params[:static_link])

    respond_to do |format|
      if @static_link.save
        format.html { redirect_to(static_links_path, :notice => 'Static link was successfully created.') }
        format.xml  { render :xml => @static_link, :status => :created, :location => @static_link }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @static_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /static_links/1
  # PUT /static_links/1.xml
  def update
    @static_link = StaticLink.find(params[:id])

    respond_to do |format|
      if @static_link.update_attributes(params[:static_link])
        format.html { redirect_to(static_links_path, :notice => 'Static link was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @static_link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /static_links/1
  # DELETE /static_links/1.xml
  def destroy
    @static_link = StaticLink.find(params[:id])
    @static_link.destroy

    respond_to do |format|
      format.html { redirect_to(static_links_url) }
      format.xml  { head :ok }
    end
  end
end
