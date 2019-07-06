class CreateFAQ < ActiveRecord::Migration
  def change
    create_table :faq do |t|
      t.text :content
    end
  end
end
