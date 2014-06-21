class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.integer :circle_id, null: false
      t.datetime :starting_at
      t.string :location

      t.timestamps
    end
  end
end
