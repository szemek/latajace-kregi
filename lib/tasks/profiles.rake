namespace :profiles do
  desc 'migrate profiles to users'
  task migrate: :environment do
    Profile.order(id: :desc).each.with_progress do |profile|
      user = profile.user

      user.photo = profile.read_attribute(:photo)
      user.fullname = profile.read_attribute(:fullname)
      user.activity = profile.read_attribute(:activity)
      user.circle_id = profile.read_attribute(:circle_id)
      user.bio = profile.read_attribute(:bio)
      user.webpage = profile.read_attribute(:webpage)
      user.contact = profile.read_attribute(:contact)
      user.organizer = profile.read_attribute(:organizer)

      user.save
    end
  end

  namespace :taggings do
    desc 'migrate profiles taggings to users'
    task migrate: :environment do
      profile_ids = Tagging.where(taggable_type: 'Profile').pluck(:taggable_id)
      profile_ids.each.with_progress do |profile_id|
        profile = Profile.find(profile_id)
        user_id = profile.user.id

        Tagging.where(taggable_type: 'Profile')
               .where(taggable_id: profile_id)
               .update_all({
                taggable_type: 'User',
                taggable_id: user_id
              })
      end
    end
  end
end
