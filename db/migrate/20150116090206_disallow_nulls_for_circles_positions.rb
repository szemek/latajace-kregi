class DisallowNullsForCirclesPositions < ActiveRecord::Migration
  def change
    change_column :circles, :position, :integer, null: false
  end
end
