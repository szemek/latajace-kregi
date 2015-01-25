class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :key
      t.string :value
    end
  end
end
