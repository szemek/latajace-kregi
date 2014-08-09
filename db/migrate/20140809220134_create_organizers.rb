class CreateOrganizers < ActiveRecord::Migration
  def change
    create_table :organizers do |t|
      t.string :photo
      t.string :fullname
      t.string :bio
      t.string :activity
      t.integer :circle_id

      t.timestamps
    end
  end
end
