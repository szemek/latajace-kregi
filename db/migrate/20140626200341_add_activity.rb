class AddActivity < ActiveRecord::Migration
  def change
    add_column :heroines, :activity, :string
    add_column :profiles, :activity, :string
  end
end
