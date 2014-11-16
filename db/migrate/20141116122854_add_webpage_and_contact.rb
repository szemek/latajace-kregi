class AddWebpageAndContact < ActiveRecord::Migration
  def change
    add_column :heroines, :webpage, :string
    add_column :profiles, :webpage, :string
    add_column :organizers, :webpage, :string

    add_column :heroines, :contact, :string
    add_column :profiles, :contact, :string
    add_column :organizers, :contact, :string
  end
end
