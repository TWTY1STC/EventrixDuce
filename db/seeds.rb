require 'faker'

#member = User.create(name: 'Member', email: 'member.example.com', password: 'password')
#app = RegisteredApplication.create(name: 'WikiType', url: 'http://wikitype.com', user_id: member.id)
#Event.create(name: 'Purchase', registered_application_id: app.id)

#create users
10.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password"
    )
end
users= User.all

#create registered applications
25.times do
  RegisteredApplication.create!(
    name: Faker::App.name,
    url: Faker::Internet.url,
    user: users.sample
    )
end
registered_applications = RegisteredApplication.all

#create events
75.times do
  Event.create!(
    name: Faker::Hacker.verb,
    registered_application: registered_applications.sample
    )
end
events = Event.all

puts "Seeding finished!"
puts "#{users.count} users created."
puts "#{registered_applications.count} applications registered."
puts "#{events.count} events created"
