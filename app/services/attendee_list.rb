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

    event.reload

    first_from_waiting_list = waiting_list.first

    if can_join? && first_from_waiting_list
      first_from_waiting_list.going!
      Notifications.going(first_from_waiting_list).deliver
    end
  end

  private

  def can_join?
    event.quantity > event.rsvps.going.count
  end

  def waiting_list
    event.rsvps.waiting
  end
end
