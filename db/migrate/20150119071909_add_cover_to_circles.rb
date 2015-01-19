class AddCoverToCircles < ActiveRecord::Migration
  def change
    add_column :circles, :cover, :string
  end
end
