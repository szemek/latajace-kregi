ActiveAdmin.register Event do
  permit_params :name,
    :description,
    :circle_id,
    :starting_at,
    :quantity,
    :location,
    :visible

  actions :all, except: [:destroy]

  index do
    selectable_column
    id_column
    column :name
    column :circle
    column :starting_at
    column :quantity
    column :location
    column :visible
    column :created_at
    actions
  end

  filter :name
  filter :circle
  filter :location
  filter :visible
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
      row :visible
    end

    panel t('admin.event.emails') do
      attributes_table_for event do
        row 'Going' do
          ul do
            event.rsvps.going.includes(:user).map(&:user).each do |user|
              li do
                a user.email, href: admin_user_path(user)
              end
            end
          end
        end

        row 'Waiting' do
          ul do
            event.rsvps.waiting.includes(:user).map(&:user).each do |user|
              li do
                a user.email, href: admin_user_path(user)
              end
            end
          end
        end
      end
    end

    panel t('admin.event.users') do
      attributes_table_for event do
        row 'Going' do
          table do
            event.rsvps.going.includes(:user).each do |rsvp|
              tr do
                td rsvp.user.fullname
                td rsvp.user.email
                td do
                  link_to 'Remove', admin_rsvp_path(rsvp), confirm: 'Are you sure?', method: :delete
                end
              end
            end
          end
        end

        row 'Waiting' do
          table do
            event.rsvps.waiting.includes(:user).each do |rsvp|
              tr do
                td rsvp.user.fullname
                td rsvp.user.email
                td do
                  link_to 'Remove', admin_rsvp_path(rsvp), confirm: 'Are you sure?', method: :delete
                end
              end
            end
          end
        end
      end
    end
  end


  form do |f|
    f.inputs "Event Details" do
      f.input :name
      f.input :description, as: :ckeditor
      f.input :circle
      f.input :starting_at
      f.input :quantity
      f.input :location
      f.input :visible
    end
    f.actions
  end
end
