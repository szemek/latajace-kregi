class AddVisibleFlagToCircles < ActiveRecord::Migration
  def change
    add_column :circles, :visible, :boolean, default: true
  end
end
