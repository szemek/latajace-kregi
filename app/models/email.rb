class Email
  include Mongoid::Document
  include Mongoid::Timestamps

  field :from_name, type: String
  field :from, type: String
  field :subject, type: String
  field :html_body, type: String
  field :text_body, type: String
end
