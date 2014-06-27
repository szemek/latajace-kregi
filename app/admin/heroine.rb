ActiveAdmin.register Heroine do
  permit_params :photo, :fullname, :bio, :activity, :circle_id

  index do
    selectable_column
    id_column
    column :photo
    column :fullname
    column :bio
    column :activity
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
      row :activity
      row :circle
    end
  end

  filter :fullname

  form do |f|
    f.inputs "Heroine Details" do
      f.input :photo
      f.input :fullname
      f.input :bio
      f.input :activity
      f.input :circle
    end
    f.actions
  end

end
