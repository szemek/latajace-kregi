ActiveAdmin.register User do
  permit_params :email, :admin

  actions :all, except: [:destroy]

  menu label: 'Users'

  controller do
    def scoped_collection
      super.includes(:profile)
    end
  end

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :profile
    actions
  end

  show do |user|
    attributes_table do
      row :id
      row :email
      row :admin
      row :profile do
        user.profile
      end
    end

    panel 'Authentication Details' do
      attributes_table_for user do
        row :encrypted_password
        row :reset_password_token
        row :reset_password_sent_at
        row :remember_created_at
        row :sign_in_count
        row :current_sign_in_at
        row :last_sign_in_at
        row :current_sign_in_ip
        row :last_sign_in_ip
        row :created_at
        row :updated_at
      end
    end
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :admin
    end
    f.actions
  end

end
