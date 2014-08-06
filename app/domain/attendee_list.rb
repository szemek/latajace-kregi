class AttendeeList
  attr_accessor :event, :user, :rsvp

  def initialize(params)
    @event = params[:event]
    @user = params[:user]
    @rsvp = params[:rsvp]
  end

  def join
    rsvp = Rsvp.find_or_initialize_by(event: event, user: user)
    rsvp.assign_attributes(going: allow?)
    rsvp.save
  end

  def leave
    rsvp.try(:destroy)
  end

  private

  def allow?
    event.quantity > event.rsvps.going.count
  end
end
