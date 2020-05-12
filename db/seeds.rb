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

puts "//////////////////////////////////////////////////"
puts "Creating Bands"

11.times do
    b = Band.create(
        name: Faker::Music::RockBand.name,
        profile_picture: nil,
        about: 'We are a kick ass band that has played over 27 shows, since starting out.',
        website: nil
    )
    puts "Band #{b.name} profile page was created! Now go create some gigs"
end

puts "///////////////////////////////////////////////////"
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
        picture_upload: nil,
        band_id: 1
    )
    puts "#{g.title} gig created and the support band is #{g.support}"
end


puts "//////////////////////////////////////////////////"
puts "Creating Users"

7.times do
    u = User.create(
        name: Faker::FunnyName.two_word_name,
        profile_photo: nil,
        about: 'Just a simple music lover! Up the Irons!',
        location: 'Melbourne',
        admin: false
    )
    puts "#{u.name} was created. Welcome #{u.name}"
end

puts "//////////////////////////////////////////////////"
puts "Creating Admin"

1.times do
    u = User.create(
        name: 'Admin',
        profile_photo: nil,
        about: 'The admin of the site',
        location: 'Behind you!',
        admin: true
    )
    puts "The #{u.name} role was created. All hail the #{u.name}"
end




# USER
# :name
# :profile_photo
# :about
# :location
# :admin

# BAND
# :name
# :profile_picture
# :about
# :website

# GIG
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