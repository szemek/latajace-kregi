class Organizer < Profile
  default_scope { where(organizer: true) }
end
