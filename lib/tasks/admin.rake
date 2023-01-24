namespace :admin do
  desc "Create admin user"
  task create: :environment do
    print "Enter email: "
    email = STDIN.gets.chomp
    print "Enter password: "
    password = STDIN.gets.chomp
    print "Enter password confirmation: "
    password_confirmation = STDIN.gets.chomp

    if password == password_confirmation
      User.create!(nickname: "admin", email: email, password: password, password_confirmation: password_confirmation, admin: true)
      puts "Admin user created"
    else
      puts "Passwords do not match"
    end
  end
end
