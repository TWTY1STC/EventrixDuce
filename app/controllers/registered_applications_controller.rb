class RegisteredApplicationsController < ApplicationController
  before_action :set_registered_application, only: [:show, :edit, :update, :destroy]
  
  #'users/id/registered_applications'
  def index 
  end 
  
   #'users/id/registered_applications/id'
  def show
  end
  
  #'users/id/registered_applications/new'
  def new 
    @registered_application = RegisteredApplication.new
  end
  
  def create
    @registered_application = current_user.registered_applications.build(registered_application_params)
    
    if @registered_application.save
      flash[:notice] = "Application registered and saved."
      redirect_to [@registered_application.user, @registered_application]
    else
      flash.now[:alert] = "There was an error saving the application. Please try again."
      render :new
    end
  end
  
  #'users/id/registered_applications/id/edit'
  def edit
  end
  
  def update
    @registered_application.assign_attributes(registered_application_params)
    
    if @registered_application.save
      flash[:notice] = "Application updated and saved."
      redirect_to [@registered_application.user, @registered_application]
    else
      flash.now[:alert] = "There was an error saving the application. Please try again."
      render :new
    end
  end
  
  #'users/id/registered_applications/id/delete'
  def destroy
   if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.name}\" was deleted sucessfully."
      redirect_to user_registered_applications_path
    else
      flash.now[:alert] = "There was an error deleting the application"
      render :show
    end
  end
  
  private
  
  def registered_application_params
    params.require(:registered_application).permit(:name, :url)
  end
  
  def set_registered_application
    @registered_application = current_user.registered_applications.find(params[:id])
  end
 
end
