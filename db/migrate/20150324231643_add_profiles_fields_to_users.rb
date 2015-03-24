class AddProfilesFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :photo, :string
    add_column :users, :fullname, :string
    add_column :users, :activity, :string
    add_column :users, :circle_id, :integer
    add_column :users, :bio, :text
    add_column :users, :webpage, :string
    add_column :users, :contact, :string
    add_column :users, :organizer, :boolean, default: false
  end
end
