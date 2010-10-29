class CommentsController < ApplicationController
  filter_resource_access
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    @comment.user=current_user
    if @comment.save
      flash[:notice]="You posted a comment"
      redirect_to @commentable
    else
      redirect_to @commentable
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @commentable = find_commentable
    respond_to do |format|
      format.html{ redirect_to @commentable }
      format.js{render :action=>'destroy.js.erb'}
    end
  end

  private

  def find_commentable
    params.each do |name,value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end
