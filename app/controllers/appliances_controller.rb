class AppliancesController < ApplicationController  
 before_filter :signed_in_user
 
 def new
   @user = User.find(params[:user_id])
   @appliance = @user.appliances.build
   @appliance.icon = "App.png"
   @templates = Template.all
   
   respond_to do |format|
    format.html { render 'new.html.erb' }
    format.js
   end
 end

 def show
  @appliance = Appliance.find(params[:id])
 end

 def index
   if (User.find(params[:user_id]) != current_user) #No need to read from database. Improve it by params[:user_id] != current_user.id
    redirect_to root_path
   end
   @user=current_user
   if !@user.admin?
    @public_apps=current_user.appliances.find_all_by_activation(true)
    @private_apps=current_user.appliances.find_all_by_activation(false)
   else
    @all_apps = Appliance.all
   end
 end

 def create
  @appliance = current_user.appliances.build(params[:appliance])
  if @appliance.save
   flash[:success] = "Appliance Created"
      redirect_to edit_user_appliance_path(current_user, @appliance)
  else
   render 'new'
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


  #Extra Actions used in studio ajax asynchronous connection
  def update_build_data
   @cpu = params[:cpu]
   @memory = params[:memory]
   @swap = params[:swap]
   @disk = params[:disk]
   #Update the Appliacne Json file, with these values.
   respond_to do |format|
    format.js
   end
  end

end
