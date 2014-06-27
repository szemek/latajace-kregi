class AddCircleId < ActiveRecord::Migration
  def change
    add_column :heroines, :circle_id, :integer
    add_column :profiles, :circle_id, :integer
  end
end
