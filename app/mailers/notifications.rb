class Notifications < ActionMailer::Base
  default from: 'kontakt@latajacekregi.pl'

  def going(rsvp)
    user = rsvp.user
    email = user.email

    @event = rsvp.event

    mail(to: email, subject: 'Latające kręgi: dołączyłaś do listy uczestniczek')
  end
end
