class StatusController < ActionController::Base
  newrelic_ignore

  def check
    head(:ok)
  end
end
