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
  
  users = User.all(:limit => 6)
  10.times do
   app_name = Faker::Lorem.words(1)
   app_des = Faker::Lorem.sentence(5)
   app_icon =  Faker::Lorem.words(1)
   users.each { |user| user.appliances.create!(:name => app_name, :description => app_des, :icon => app_icon, :activation => true ) }
  end
 end
end

