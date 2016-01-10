# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  address:              ENV['MAILER_SERVER'],
  port:                 587,
  domain:               'latajacekregi.pl',
  user_name:            ENV['MAILER_USERNAME'],
  password:             ENV['MAILER_PASSWORD'],
  authentication:       :plain,
  enable_starttls_auto: true
}
