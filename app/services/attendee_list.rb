class AttendeeList
  attr_accessor :event, :user, :rsvp

  def initialize(params)
    @rsvp = params[:rsvp]
    @event = params[:event] || @rsvp.event
    @user = params[:user] || @rsvp.user
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

    next_from_waiting_list.try(:going!)
  end

  private

  def can_join?
    event.quantity > event.rsvps.going.count
  end

  def next_from_waiting_list
    event.rsvps.waiting.order(:updated_at).first
  end
end
