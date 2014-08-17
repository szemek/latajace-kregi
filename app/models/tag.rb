class Tag < ActiveRecord::Base
  scope :for_term, -> (term) { where("name LIKE ?", "#{term}%") }
end
