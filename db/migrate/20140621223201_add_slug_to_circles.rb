class AddSlugToCircles < ActiveRecord::Migration
  def change
    add_column :circles, :slug, :string, unique: true
  end
end
