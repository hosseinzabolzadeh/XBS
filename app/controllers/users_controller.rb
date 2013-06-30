class UsersController < ApplicationController
 before_filter :signed_in_user, :only => [:index, :edit, :update, :apps]
 before_filter :correct_user, :only => [:edit, :update, :dashboard, :apps] 
 before_filter :admin_user, :only => :destroy

  def show
   @user=User.find(params[:id])
  end

  def dashboard
  end
    
  def destroy
   User.find(params[:id]).destroy
   flash[:success] = "User Destroyed"
   redirect_to users_path
  end

  def create
   @user = User.new(params[:user])
   if @user.save
    sign_in @user
    flash[:success] = "Welcome to the Sample App!"
    redirect_to @user
   else
    render 'new'
   end
  end

  def edit
  end
  
  def apps
   @user=User.find(params[:id])
   @public_apps=@user.appliances.find_all_by_activation(true)
   @private_apps=@user.appliances.find_all_by_activation(false)
  end
  
  def new
   @user=User.new
  end

  def update
    if @user.update_attributes(params[:user])
      #Handle Successful Update
      flash[:success] = "Profile Updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def index
   @users=User.paginate(:page => params[:page])
  end

 private

  def correct_user
   @user=User.find(params[:id])
   redirect_to(root_path) unless current_user?(@user)
  end
  
  def admin_user
   redirect_to(root_path) unless current_user.admin?
  end
end
