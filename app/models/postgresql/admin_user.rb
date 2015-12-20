class PostgreSQL::AdminUser < PostgreSQL::User
  default_scope { where(admin: true) }
end
