class AttendeeList
  attr_accessor :event, :user, :rsvp

  def initialize(params)
    @event = params[:event]
    @user = params[:user]
    @rsvp = params[:rsvp]
  end

  def join
    Rsvp.create(event: event, user: user, going: allow?)
  end

  def leave
    rsvp.try(:destroy)
  end

  private

  def allow?
    event.quantity > event.rsvps.going.count
  end
end
