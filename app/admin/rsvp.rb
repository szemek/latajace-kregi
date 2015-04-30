ActiveAdmin.register Rsvp do
  menu false

  member_action :destroy, method: :delete do
    resource.destroy

    redirect_to admin_event_path(resource.event)
  end
end
