class WelcomeController < ApplicationController
  def index
  end

  def welcome
    if current_user
     @registered_applications = current_user.registered_applications
   end
  end
end
