class EventsController < ApplicationController
  
  def create
    @event = registered_application.events.build(event_params)
  end
  
  private
  
  def event_params
    params.require(:event).permit(:name)
  end
end