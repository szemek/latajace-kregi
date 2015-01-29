ActiveAdmin.register Tag do
  permit_params :name
  filter :name

  actions :all, except: [:destroy]
end
