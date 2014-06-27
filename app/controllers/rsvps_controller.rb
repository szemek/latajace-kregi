class RsvpsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    Rsvp.create(event: event, user: current_user, going: true)

    redirect_to event
  end

  def destroy
    event = Event.find(params[:event_id])
    rsvp = Rsvp.find(params[:id])
    rsvp.destroy

    redirect_to event
  end
end
