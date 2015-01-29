class AdminUser < User
  default_scope { where(admin: true) }
end
