class BioAsText < ActiveRecord::Migration
  def up
    remove_column :profiles, :bio
    remove_column :heroines, :bio

    add_column :profiles, :bio, :text
    add_column :heroines, :bio, :text
  end

  def down
    remove_column :profiles, :bio
    remove_column :heroines, :bio

    add_column :profiles, :bio, :string
    add_column :heroines, :bio, :string
  end
end
