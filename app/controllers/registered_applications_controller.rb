class RegisteredApplicationsController < ApplicationController
  #only the user/creator/owner of the registered app should be able to see anything about a particular app.
  #need to define to use before_action :authorize_user
  
  #'users/id/registered_applications'
  def index 
    @registered_applications = RegisteredApplication.where.user_id(current_user.id)
  end 
  
   #'users/id/registered_applications/id'
  def show
    @registered_application = RegisteredApplication.find(params[:id])
    #or is it :url?
  end
  
  #'users/id/registered_applications/new'
  def new 
    @user = User.find(params[:user_id])
    @registered_application = RegisteredApplication.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @registered_application = @user.registered_applications.build(registered_application_params)
    @registered_application.user = current_user
    
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
    @registered_application = RegisteredApplication.find(params[:id])
  end
  
  def update
    @registered_application = RegisteredApplication.find(params[:id])
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
    
  end
  
  private
  
  def registered_application_params
  end
  
  def find_registered_application
    
  end
end
