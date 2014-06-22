class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :photo
      t.string :fullname
      t.string :bio
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
