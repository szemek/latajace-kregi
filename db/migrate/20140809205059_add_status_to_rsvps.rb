class AddStatusToRsvps < ActiveRecord::Migration
  def change
    add_column :rsvps, :status, :integer
  end
end
