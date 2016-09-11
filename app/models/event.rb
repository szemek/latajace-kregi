class Event < PostgreSQL::Event
  paginates_per 25
end
