class Visit
  include Mongoid::Document
  include Mongoid::Timestamps

  field :remote_ip, type: String
  field :user_agent, type: String
end
