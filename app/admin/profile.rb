ActiveAdmin.register Profile do
  permit_params :photo, :fullname, :bio, :user, :activity, :circle_id, :organizer

  actions :all, except: [:destroy]

  controller do
    def scoped_collection
      super.includes(:user, :circle)
    end
  end

  index do
    selectable_column
    id_column
    column :fullname
    column :activity
    column :user
    column :circle
    column :organizer
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
      row :organizer
    end
  end

  filter :fullname
  filter :circle
  filter :organizer

  form do |f|
    f.inputs "Profile Details" do
      f.input :photo
      f.input :fullname
      f.input :bio
      f.input :activity
      f.input :circle
      f.input :organizer
    end
    f.actions
  end

end
