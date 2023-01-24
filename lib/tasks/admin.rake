# frozen_string_literal: true

namespace :admin do
  desc "Create admin user"
  task create: :environment do
    print "Enter email: "
    email = $stdin.gets.chomp
    print "Enter password: "
    password = $stdin.gets.chomp
    print "Enter password confirmation: "
    password_confirmation = $stdin.gets.chomp

    if password == password_confirmation
      User.create!(nickname: "admin", email:, password:, password_confirmation:, admin: true)
      puts "Admin user created"
    else
      puts "Passwords do not match"
    end
  end
end
