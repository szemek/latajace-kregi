class SetQuantityDefaultForEvents < ActiveRecord::Migration
  def change
    change_column_default :events, :quantity, 20
  end
end
