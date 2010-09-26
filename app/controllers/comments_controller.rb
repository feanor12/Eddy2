class CommentsController < ApplicationController
  filter_resource_access
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.user=current_user
    if @comment.save
      flash[:notice]="You posted a comment"
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @post = Post.find(params[:post_id])
    respond_to do |format|
      format.html{ redirect_to post_path(params[:post_id])}
      format.js{render :action=>'destroy.js.erb'}
    end

  end
end
