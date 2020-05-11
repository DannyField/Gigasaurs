# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Removing old entries"
# Job.delete.all

# puts "Creating new user"

# 1.times do
#     u = User.create(
#         name: 'Admin',
#         headline: 'I am the Admin',
#         current_job: 'Admin role',
#         about: 'Currently a full stack junior dev building this website',
#         skill: 'Cinematography, and Full Stack Dev',
#         location: 'Yarra Valley',
#         website: 'www.dannyfield.com',
#         admin: true,
#         password: 'password',
#         email: 'admin@mcn.com'
#     )
#     puts "New user: #{u.name} created"

5.times do
    j = Gig.create(
        title: Faker::Commerce.department,
        position_needed: "Full Stack Dev",
        description: "Hi all, we are looking for a full stack dev that knows how to code in Ruby, with some JS",
        looking_for: "For a full stack dev that knows Ruby on Rails",
        contact: Faker::FunnyName.two_word_name,
        desposit: 10000,
        due_date: nil,
        location: "Yarra Valley area",
        user_id: 1
    )
    puts "#{j.title} created by #{j.contact}!"
end

end
