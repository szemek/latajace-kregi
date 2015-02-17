class StatusController < ActionController::Base
  newrelic_ignore_enduser

  def check
    head(:ok)
  end
end
