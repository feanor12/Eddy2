class DownloadsController < ApplicationController
  filter_resource_access
  filter_access_to :download
  before_filter :store_location,:only=>[:show]

  def download
    @download = Download.find(params[:download_id])
    if permitted_to?(:download,@download)
    root_path = File::join ::Rails.root.to_s, "public"
    send_file root_path + @download.document_url.to_s, :x_sendfile=>true, :type=>"application/octet-stream"
    else
      permission_denied
    end
  end

  def new
    @lecture = Lecture.find(params[:lecture_id])
    @download=@lecture.downloads.build
  end

  def create
    @lecture = Lecture.find(params[:lecture_id])
    @download=@lecture.downloads.build(params[:download])
    @download.user=current_user
    if @download.save
      redirect_to lecture_download_path(@lecture,@download)
    else
      render :action=>'new'
    end
  end

  def show
    @lecture = Lecture.find(params[:lecture_id])
    @download = @lecture.downloads.find(params[:id])
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
