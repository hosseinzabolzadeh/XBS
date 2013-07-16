class TemplatesController < ApplicationController
   
  def new
   @template = Template.new
  end
  
  def create
   @template = Template.new(params[:template])
   if @template.save
    flash[:success] = "Template was created successfully."
    redirect_to @template
   else
    render 'new'
   end
  end
  
  def show
   @template = Template.find(params[:id])
  end
  
  def edit
   @template = Template.find(params[:id])
  end

end
