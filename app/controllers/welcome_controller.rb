class WelcomeController < ApplicationController
  def index
  end

  def welcome
    @registered_applications = current_user.registered_applications
  end
end
