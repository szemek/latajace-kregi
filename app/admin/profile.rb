ActiveAdmin.register Profile do
  permit_params :photo, :fullname, :bio, :user, :activity, :circle_id, :organizer,
    :webpage, :contact, :skill_ids => [], :interest_ids => []

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
      row :fullname
      row :photo do
        image_tag(profile.photo_url, size: '200x200')
      end
      row :bio
      row :user
      row :activity
      row :circle
      row 'Skills' do
         profile.skills.pluck(:name).join(', ')
      end
      row 'Interests' do
         profile.interests.pluck(:name).join(', ')
      end
      row :webpage
      row :contact
      row :organizer
    end
  end

  filter :fullname
  filter :circle
  filter :organizer

  form do |f|
    f.inputs "Profile Details" do
      f.input :fullname
      f.input :photo
      f.input :bio
      f.input :activity
      f.input :circle
      f.input :skills
      f.input :interests
      f.input :webpage
      f.input :contact
      f.input :organizer
    end
    f.actions
  end

end
