class PostsController < ApplicationController
  filter_resource_access
  respond_to :html, :xml

  def index
    @posts = Post.paginate(:page => params[:page], :order => 'created_at DESC',:include=>:comments)
    respond_to do |format|
      format.html
      format.rss
    end
    unless current_user
      @user_session = UserSession.new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    respond_with(@post,@comment)
    unless current_user
      @user_session = UserSession.new
    end
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
    @post = Post.find(params[:id])
    respond_with(@post)
  end

  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    flash[:notice]="Successfully created a Post" if @post.save
    respond_with(@post)
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    respond_with(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_with(@post)
  end
end
