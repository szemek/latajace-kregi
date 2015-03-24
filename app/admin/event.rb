ActiveAdmin.register Event do
  permit_params :name,
    :description,
    :circle_id,
    :starting_at,
    :quantity,
    :location

  actions :all, except: [:destroy]

  index do
    selectable_column
    id_column
    column :name
    column :circle
    column :starting_at
    column :quantity
    column :location
    column :created_at
    actions
  end

  filter :name
  filter :circle
  filter :location
  filter :created_at

  show do |event|
    attributes_table do
      row :name
      row :description do
         raw event.description
      end
      row :circle
      row :starting_at
      row :quantity
      row :location
    end

    panel t('admin.event.going') do
      table_for event.rsvps.going.includes(:user).map(&:user) do
        column :email
      end
    end

    panel t('admin.event.waiting') do
      table_for event.rsvps.waiting.includes(:user).map(&:user) do
        column :email
      end
    end
  end

  form do |f|
    f.inputs "Event Details" do
      f.input :name
      f.input :description, as: :html_editor
      f.input :circle
      f.input :starting_at
      f.input :quantity
      f.input :location
    end
    f.actions
  end
end
