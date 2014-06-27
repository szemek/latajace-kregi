class AddCodeToCircle < ActiveRecord::Migration
  def change
    add_column :circles, :code, :string
  end
end
