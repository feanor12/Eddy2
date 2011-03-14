class CommentsController < ApplicationController
  filter_resource_access
  def create
    @commentable = parent_object
    @comment = @commentable.comments.build(params[:comment])
    @commentable.updated_at=Time.now
    @comment.user=current_user
    if @comment.save && @commentable.save
      flash[:notice]="You posted a comment"
    end
    redirect_to parent_url(@commentable)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @commentable = parent_object
    respond_to do |format|
      format.html{ redirect_to parent_url(@commentable) }
      format.js{render :action=>'destroy.js.erb'}
    end
  end

  private

  def parent_object
    case
      when params[:post_id] then Post.find_by_id(params[:post_id])
      when params[:announcement_id] then Announcement.find_by_id(params[:announcement_id])
      when params[:download_id] then Download.find_by_id(params[:download_id])
    end
  end

  def parent_url(parent)
    case
      when params[:post_id] then post_url(parent)
      when params[:announcement_id] then lecture_announcement_url(parent.lecture,parent)
      when params[:download_id] then lecture_download_url(parent.lecture,parent)
    end
  end

end
