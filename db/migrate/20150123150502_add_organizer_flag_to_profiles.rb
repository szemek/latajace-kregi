class AddOrganizerFlagToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :organizer, :boolean, default: false
  end
end
