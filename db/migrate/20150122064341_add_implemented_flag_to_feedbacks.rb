class AddImplementedFlagToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :implemented, :boolean, default: false
  end
end
