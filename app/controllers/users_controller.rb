class UsersController < ApplicationController
  filter_resource_access
  filter_access_to :promote,:index_mods

  def index_mods
    role=Role.find_by_name('mod')
    @users=User.where(['role_id = ?',role.id])
    unless @users
      redirect_to root_path
    end
  end

  def new
    @user=User.new
  end

  def create
    @user = User.new(params[:user])
    @user.role = Role.find_by_name('user')
    if @user.save_without_session_maintenance
      @user.deliver_activation_instructions!
      flash[:notice]="Email with activation code was send to you"
      redirect_to root_path
    else
      flash[:notice]="Error at creating User"
      render :action=>'new'
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

  def promote
    @user=User.find(params[:id])
    if @user.role.name=='mod'
      @user.role=Role.find_by_name('user')
    else
      @user.role=Role.find_by_name('mod')
    end
    @user.save!
    redirect_to users_path
  end
end
