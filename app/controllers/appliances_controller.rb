class AppliancesController < ApplicationController  
 before_filter :signed_in_user
 
 def new
   @appliance = Appliance.new 
 end

 def show
  @appliance = Appliance.find(params[:id])
 end

 def index
   @user=current_user
   @public_apps=current_user.appliances.find_all_by_activation(true)
   @private_apps=current_user.appliances.find_all_by_activation(false)
 end

 def create
  @appliance = current_user.appliances.build(params[:appliance])
  if @appliance.save
   flash[:success] = "Appliance Created"
   redirect_to root_path
  else
   render 'static_pages/home'
  end
 end
  
 def update
     @appliance= Appliance.find(params[:id])
     if @appliance.update_attributes(params[:appliance])
      #Handle Successful Update
      flash[:success] = "Appliance Updated"
      redirect_to user_appliances_path(current_user)
     else
       render 'edit'
     end  
 end

  def edit
   @user=User.find(params[:user_id])
   @appliance = @user.appliances.find(params[:id])
  end

  def destroy
   @appliance = Appliance.find(params[:id])
   @appliance.destroy
   redirect_to user_appliances_path
  end

end