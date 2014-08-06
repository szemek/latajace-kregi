class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @rsvp = Rsvp.find_by(event: @event, user: current_user)
    @participants = User.where(id: @event.rsvps.going.pluck(:user_id)).includes(:profile)
    @waiting = User.where(id: @event.rsvps.waiting.pluck(:user_id)).includes(:profile)
  end
end
