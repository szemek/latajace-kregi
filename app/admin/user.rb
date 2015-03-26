ActiveAdmin.register User do
  permit_params :email, :admin, :organizer

  actions :all, except: [:destroy]

  menu label: 'Users'

  index do
    selectable_column
    id_column
    column :fullname
    column :email
    column :circle
    column :organizer
    column :admin
    column :created_at
    actions
  end

  show do |user|
    attributes_table do
      row :id
      row :email
      row :admin
      row :organizer
    end

    panel 'Profile Details' do
      attributes_table_for user do
        row :fullname
        row :photo do
          image_tag(user.photo_url)
        end
        row :bio
        row :activity
        row :circle
        row 'Skills' do
           user.skills.pluck(:name).join(', ')
        end
        row 'Interests' do
           user.interests.pluck(:name).join(', ')
        end
        row :webpage
        row :contact
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

  filter :fullname
  filter :email
  filter :circle

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :admin
      f.input :organizer
    end
    f.actions
  end

end
