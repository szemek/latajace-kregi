class AddPositionToCircles < ActiveRecord::Migration
  def change
    add_column :circles, :position, :integer
  end
end
