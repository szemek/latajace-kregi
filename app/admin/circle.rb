ActiveAdmin.register Circle do
  permit_params :name, :code, :position, :cover, :visible

  actions :all, except: [:destroy]

  controller do
    resources_configuration[:self][:finder] = :find_by_slug
  end

  index do
    selectable_column
    id_column
    column :name
    column :code
    column :position
    column :cover
    column :visible
    column :created_at
    actions
  end

  show do |circle|
    attributes_table do
      row :id
      row :name
      row :created_at
      row :updated_at
      row :slug
      row :code
      row :position
      row :color
      row :cover
      row :visible
    end

    panel t('admin.circle.users') do
      attributes_table_for(circle) do
        ul do
          circle.users.each do |user|
            li do
              a user.email, href: admin_user_path(user)
            end
          end
        end
      end
    end
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
      f.input :visible
    end
    f.actions
  end

end
