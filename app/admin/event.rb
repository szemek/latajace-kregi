ActiveAdmin.register Event do
  permit_params :name, :description, :circle_id, :starting_at, :location

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :circle
    column :starting_at
    column :location
    column :created_at
    actions
  end

  filter :name
  filter :circle
  filter :location
  filter :created_at

  form do |f|
    f.inputs "Event Details" do
      f.input :name
      f.input :description
      f.input :circle
      f.input :starting_at
      f.input :location
    end
    f.actions
  end
end
