namespace :db do
 desc "Fill database with sample data"
 task :populate => :environment do
  admin=User.create!(:first_name => "XBS", :last_name => "Admin", :email => "xbs_admin@xamin.ir", :password => "admin", :password_confirmation => "admin")
  admin.toggle!(:admin)
  99.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.first_name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(:first_name => first_name, :last_name => first_name, :email => email, :password => password, :password_confirmation => password)
  end
 end
end

