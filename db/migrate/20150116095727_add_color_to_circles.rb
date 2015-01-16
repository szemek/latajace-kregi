class AddColorToCircles < ActiveRecord::Migration
  def change
    add_column :circles, :color, :string, default: '#ccc'
  end
end
