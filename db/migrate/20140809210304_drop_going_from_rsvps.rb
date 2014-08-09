class DropGoingFromRsvps < ActiveRecord::Migration
  def change
    remove_column :rsvps, :going
  end
end
