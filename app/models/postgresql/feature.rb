class PostgreSQL::Feature < ActiveRecord::Base
  def self.get(key)
    self.find_by_key(key).try(:value) || default_value
  end

  def self.set(key, value)
    self.find_or_create_by(key: key).update_attribute(:value, value)
  end

  private

  def self.default_value
    '||'
  end
end
