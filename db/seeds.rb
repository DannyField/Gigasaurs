# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require_relative "data/listings"
# this was able to retrieve another seed file that had the listings of all the snakes

puts "//////////////////////////////////////////////////"
puts "Creating Bands"

random_num = rand(1..11)

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
        cost: 5000,
        picture_upload: nil,
        band_id: rand(1..11)
    )
    puts "#{g.title} gig created and the support band is #{g.support}"
end


puts "//////////////////////////////////////////////////"
puts "Creating Users"

7.times do
    u = User.create(
        name: Faker::FunnyName.two_word_name,
        profile_photo: nil,
        about: 'A random number was used to create the email',
        location: 'Melbourne',
        password: '123456',
        email: "test#{random_num}@gmail.com",
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
        admin: true,
        password: 'password',
        email: 'admin@gigasaurs.com'
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
