class CreateHeroines < ActiveRecord::Migration
  def change
    create_table :heroines do |t|
      t.string :photo
      t.string :fullname
      t.string :bio

      t.timestamps
    end
  end
end
