ActiveAdmin.register Organizer do
  permit_params :photo, :fullname, :bio, :user, :activity, :circle_id

  actions :all, except: [:new, :destroy]

  index do
    selectable_column
    id_column
    column :fullname
    column :activity
    column :user
    column :circle
    column :created_at
    actions
  end

  show do |profile|
    attributes_table do
      row :photo do
        image_tag(profile.photo_url, size: '200x200')
      end
      row :fullname
      row :bio
      row :user
      row :activity
      row :circle
    end
  end

  filter :fullname
  filter :circle

  form do |f|
    f.inputs "Organizer Details" do
      f.input :photo
      f.input :fullname
      f.input :bio
      f.input :activity
      f.input :circle
    end
    f.actions
  end

end
