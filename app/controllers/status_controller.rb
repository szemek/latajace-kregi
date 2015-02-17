class StatusController < ActionController::Base
  def check
    head(:ok)
  end
end
