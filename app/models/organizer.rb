class Organizer < User
  default_scope { where(organizer: true) }
end
