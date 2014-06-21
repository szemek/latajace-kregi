# http://robots.thoughtbot.com/how-to-use-arguments-in-a-rake-task

namespace :admins do
  desc "add new admin"
  # usage: rake admins:add["admin@example.com","password"]
  task :add, [:email, :password] => [:environment] do |t, args|
    admin = Admin.new({
      email: args[:email],
      password: args[:password],
      password_confirmation: args[:password]
    })

    if admin.save
      puts "Success!"
    else
      puts "Something went wrong..."
      puts admin.errors.inspect
    end
  end

  desc "remove existing admin"
  task :remove, [:email] => [:environment] do |t, args|
    admin = Admin.find_by(email: args[:email])
    if admin
      admin.destroy
      puts "Admin removed!"
    else
      puts "Admin not found..."
    end
  end
end
