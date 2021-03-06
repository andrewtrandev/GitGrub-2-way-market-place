# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


for i in 1..1
    #making a variable that we can assign the User creations to, 
    #on the first loop a user with email 1@test.com will be created and a random lunch will be created and associated to them.
    user1=User.create(
        email: "1@test.com",
        password: "123456"
    )

    user2=User.create(
        email: "2@test.com",
        password: "123456"
    )
end

for i in 1..3
    user1.lunches.create(
        name:Faker::Food.dish,
        description:Faker::Food.description,
        price:Faker::Number.between(from: 1, to: 10),
        street:Faker::Address.street_name,
        suburb:Faker::Address.city, 
        state:Faker::Address.state,
        postcode:Faker::Number.between(from:1000, to:9999)
    )
    puts "created #{i} foods for 1@test.com"

    user2.lunches.create(
        name:Faker::Food.dish,
        description:Faker::Food.description,
        price:Faker::Number.between(from: 1, to: 10),
        street:Faker::Address.street_name,
        suburb:Faker::Address.city, 
        state:Faker::Address.state,
        postcode:Faker::Number.between(from:1000, to:9999)
    )
    puts "created #{i} foods for 2@test.com"

end

