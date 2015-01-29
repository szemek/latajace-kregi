ActiveAdmin.register Feedback do
  permit_params :content, :implemented

  actions :all, except: [:destroy]
end
