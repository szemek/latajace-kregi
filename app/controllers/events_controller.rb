class EventsController < ApplicationController
  def show
    render :show, locals: { event: event, rsvp: rsvp, users: users }
  end

  private

  def event
    @event ||= Event.find(params[:id]).decorate
  end

  def rsvp
    @rsvp ||= Rsvp.find_or_initialize_by(event: event, user: current_user)
  end

  def users
    going = User.where(id: event.rsvps.going.pluck(:user_id))
    waiting = User.where(id: event.rsvps.waiting.pluck(:user_id))

    Hashie::Mash.new(going: going, waiting: waiting)
  end
end
