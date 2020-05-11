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

puts "Creating gigs"

5.times do
    g = Gig.create(
        title: Faker::Music::RockBand.name,
        venue: 'The Espy',
        location: '11 The Esplanade, St Kilda, VIC 3138',
        date: nil,
        start_time: nil,
        end_time: nil,
        gig_details: 'We join the stage at 8pm, rocking hard and kicking ass!',
        support: Faker::Music::RockBand.name,
        tickets_available: 100,
        cost: 4000,
        picture_upload: nil
    )
    puts "#{g.title} gig created and the support band is #{g.support}"
end

# title:
# venue:
# location:
# date: nil,
# start_time: nil,
# end_time: nil,
# gig_details: 'We join the stage at 8pm, rocking hard and kicking ass!',
# support: 'bands B',
# tickets_available: 100,
# cost: 4000,
# picture_upload: nil

# puts "#{g.title} gig created by #{j.contact}!"