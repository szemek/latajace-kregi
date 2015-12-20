class PostgreSQL::Tag < ActiveRecord::Base
  has_many :taggings
  scope :for_term, -> (term) { where("name LIKE ?", "#{term}%") }
end
