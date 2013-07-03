#production.rb
set :user, "unicorn"
server "ec2-174-129-183-113.compute-1.amazonaws.com", :app, :web, :db, :primary => true
ssh_options[:keys] = ["#{ENV['HOME']}/.ssh/katsu.pem"]