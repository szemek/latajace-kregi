ActiveAdmin.register Circle do
  permit_params :name, :code, :position, :cover

  index do
    selectable_column
    id_column
    column :name
    column :code
    column :position
    column :cover
    column :created_at
    actions
  end

  filter :name
  filter :code
  filter :created_at

  form do |f|
    f.inputs "Circle Details" do
      f.input :name
      f.input :code
      f.input :position
      f.input :cover
    end
    f.actions
  end

end
