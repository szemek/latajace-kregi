ActiveAdmin.register AdminUser do
  permit_params :email, :admin

  actions :all, except: [:new, :destroy]

  controller do
    def scoped_collection
      super.includes(:profile)
    end
  end

  index do
    selectable_column
    id_column
    column :email
    column :profile
    actions
  end

  filter :email

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :admin
    end
    f.actions
  end

end
