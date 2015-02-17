ActiveAdmin.register FAQ do
  permit_params :content

  actions :all, except: [:new, :edit, :destroy]

  collection_action :edit, method: :get do
  end

  action_item :edit do
    link_to "Edit FAQ", '/admin/faq/edit'
  end

  menu label: 'FAQ'

  controller do
    def resource
      FAQ.first_or_create
    end
  end

  index do
    column :content do
      raw resource.content
    end
    actions
  end

  show do |faq|
    attributes_table do
      row 'Content' do
         raw faq.content
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :content, as: :html_editor
    end

    f.actions
  end
end
