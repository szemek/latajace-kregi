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
end
