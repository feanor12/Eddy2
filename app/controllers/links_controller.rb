class LinksController < ApplicationController
  def create
    @download = Download.find(params[:download_id])
    @link=@download.links.build(params[:link])
    if @link.save
      redirect_to [@download.lecture,@download]
    else
      redirect_to [@download.lecture,@download]
    end
  end

  def destroy
    @download = Download.find[params[:download_id]]
    @link = @download.links.find(params[:id])
    @link.destroy
    redirect_to [@download.lecture,@download]
  end

end
