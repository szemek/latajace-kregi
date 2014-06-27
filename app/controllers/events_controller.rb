class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @rsvp = Rsvp.find_by(event: @event, user: current_user)
    @participants = @event.users.includes(:profile)
  end
end
