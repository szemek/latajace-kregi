class DropFeatures < ActiveRecord::Migration
  def up
    drop_table(:features)
  end

  def down
    create_table :features do |t|
      t.string :key
      t.string :value
    end
  end
end
