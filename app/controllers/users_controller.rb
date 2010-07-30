class UsersController < ApplicationController
  filter_resource_access
  def new
    @user=User.new
  end

  def create
    @user = User.new(params[:user])
    @user.role = Role.find_by_name('user')
    if @user.save_without_session_maintenance
      @user.deliver_activation_instructions!
      flash[:notice]="Successfully created User"
      redirect_to root_path
    else
      flash[:notice]="Error at creating User"
      redirect_to new_user_path 
    end
  end

  def index 
    @users=User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to root_url
    else
      render :action=>:edit
    end
  end


  def destroy
    @user=User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
end
