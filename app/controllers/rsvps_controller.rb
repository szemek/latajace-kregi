class RsvpsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    AttendeeList.new(event: event, user: current_user).join

    redirect_to event
  end

  def destroy
    event = Event.find(params[:event_id])
    rsvp = current_user.rsvps.find(params[:id])
    AttendeeList.new(rsvp: rsvp).leave

    redirect_to event
  end
end
