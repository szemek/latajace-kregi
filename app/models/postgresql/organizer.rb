class PostgreSQL::Organizer < PostgreSQL::User
  default_scope { where(organizer: true) }
end
