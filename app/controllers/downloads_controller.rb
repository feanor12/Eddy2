class DownloadsController < ApplicationController
  filter_resource_access
  def new
    @lecture = Lecture.find(params[:lecture_id])
    @download=@lecture.downloads.build
  end
  def create
    @lecture = Lecture.find(params[:lecture_id])
    @download=@lecture.downloads.build(params[:download])
    if @download.save
      redirect_to lecture_download_path(@lecture,@download)
    else
      render :action=>'new'
    end
  end
  def show
    @lecture = Lecture.find(params[:lecture_id])
    @download = @lecture.downloads.find(params[:id])
    @link = Link.new
    respond_to do |format|
      format.html
      format.meta4
    end

  end

  def destroy
    @lecture = Lecture.find(params[:lecture_id])
    @download=@lecture.downloads.find(params[:id])
    @download.destroy
    redirect_to lecture_path(@lecture)
  end
end
