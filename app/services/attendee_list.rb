class AttendeeList
  attr_accessor :event, :user, :rsvp

  def initialize(params)
    @event = params[:event]
    @user = params[:user]
    @rsvp = params[:rsvp]
  end

  def join
    rsvp = Rsvp.find_or_initialize_by(event: event, user: user)
    if can_join?
      rsvp.going!
    else
      rsvp.waiting!
    end
  end

  def leave
    rsvp.not_going!
  end

  private

  def can_join?
    event.quantity > event.rsvps.going.count
  end
end
