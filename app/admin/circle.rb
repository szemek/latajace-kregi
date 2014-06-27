ActiveAdmin.register Circle do
  permit_params :name, :code

  index do
    selectable_column
    id_column
    column :name
    column :code
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
    end
    f.actions
  end

end
